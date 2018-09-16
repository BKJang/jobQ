<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' />
	<title>로고 리스트</title>
	
	<!-- Bootstrap CSS -->
	<link href="/sample/admin/css/bootstrap/bootstrap.min.css" rel="stylesheet">

	<!-- Font awesome CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />	

	<style>
		
		/* 갤러리 메인 */
		div.image_gallery{
			width : 100%;
		 	/* background-color : rgb(249, 249, 249); */
			padding : 20px;
		}
		
		/* 로딩 이미지 */
		div.image_gallery div.image_container{
			width : 100%;
			height : 300px;
			position : relative;
			background-color : rgb(249, 249, 249);
		}
		
		/* 로딩 이미지 출력 영역 */
		div.image_gallery div.image_container #image_canvas{
			position : absolute;
			width : 100%;
			height : 100%;
		} 
		
		/* 로고 변경, 삭제 버튼 */
		div.image_gallery div.logo_manage_btn {
			position : absolute;
			width : 100%;
			height : 100%;
		}
		
		div.image_gallery div.logo_manage_btn #logo_update_btn{
			position : absolute;
			bottom : 0;
			right : 0;
			z-index : 9999;
		}
		
		div.image_gallery div.logo_manage_btn #logo_delete_btn{
			position : absolute;
			bottom : 0;
			right : 66px;
			z-index : 9999;
		}
		
		/* 이미지 메뉴 이전, 다음 버튼 */
		div.image_gallery div.image_container #image_menu{
			position : absolute;
			width : 100%;
			height : 100%;
			visibility : visible;
		}
		
		div.image_gallery div.image_container #image_menu #prev_image{
			position : absolute;	/* #prev_image는 부모인  #image_menu를 기준으로 자리를 잡는다.*/
			left : 0;
			top : 50%;
			margin-left : 10px;
			cursor : pointer;
			z-index : 1;
		}
		
		div.image_gallery div.image_container #image_menu #next_image{
			position : absolute;	/* #next_image는 부모인  #image_menu를 기준으로 자리를 잡는다.*/
			right : 0;
			top : 50%;
			margin-right : 10px;
			cursor : pointer;
			z-index : 1;		
		}
		
		/* 이미지가 로딩될 때 나타나게 되는 로딩 패널 */
		div.image_gallery div.image_container #loading_panel{
			position : absolute;
			width : 100%;
			height : 100%;
			line-height : 300px;	/* line-height은 상위요소와 똑같은 높이를 줘야 수직정렬이 된다. */
			text-align : center;
			vertical-align : middle;
		}
		
		/* 이미지 썸네일 및 페이지 메뉴가 위치하는 컨테이너 */
		div.image_gallery div.page_container{
			width : 100%;
			margin-top : 5px;
			background-color : rgb(249, 249, 249);
		}
		
		/* 이미지 썸네일이 담길 영역 */
		div.image_gallery div.page_container .thumb_container{
			position : relative;
			height : 66px;
			overflow : hidden;	/* 컨테이너 요소에 범위를 범어가는 것들을 모두 지워버린다. */
			margin-left : 16px;	/* 본인이 margin-left를 당하는게 아니라, 자식인 thumb-cursor가 margin-left를 적용당한다. */
		}
		
		div.image_gallery div.page_container .thumb_container #thumb_list{
			position : absolute;
			/* text-align : center; */
		}
		
		/* 하나의 썸네일 이미지는 64 * 50 */
		div.image_gallery div.page_container .thumb_container #thumb_list img{
			width : 64px;
			height : 50px;
			float : left;
			margin-top : 8px;
			margin-bottom : 8px;
			margin-right : 11px;
		}
		
		/* 썸네일 커서 */
		div.image_gallery div.page_container .thumb_container #thumb_list #thumb_cursor{
			position : absolute;
			top : 0;
			width : 64px;
			height : 50px;
			margin-top : 8px;
			margin-bottom : 8px;
			border : 2px solid #4B4B4B;
		}
		
		/* 페이지 메뉴 */
		div.image_gallery div.page_container .page_menu{
			text-align : center;
			line-height : 18px;
			vertical-align : middle;
		}
		
		div.image_gallery div.page_container .page_menu #prev_page{
			margin-right : 5px;
			cursor : pointer;
		}
		
		div.image_gallery div.page_container .page_menu #next_page{
			margin-left : 5px;
			cursor : pointer;
		}
	</style>
</head>
<body>
	<div class="image_gallery">
		
		<div class="image_container">
			<div id="image_canvas">
				<img src="http://via.placeholder.com/350x150" alt="준비중..." />
			</div>
			
			<div class="logo_manage_btn">
				<button class="btn btn-default btn-xs" id="logo_update_btn" >로고 변경</button>
				<button class="btn btn-default btn-xs" id="logo_delete_btn" >로고 삭제</button>
			</div>
			
			<div id="image_menu" style="visibility : hidden;">
				<i id="prev_image" class="fa fa-arrow-left fa-2x"></i>
				<i id="next_image" class="fa fa-arrow-right fa-2x"></i>
			</div>
			
			<div id="loading_panel">
				<img src="" alt="준비중..." />
			</div>
		</div>
		
		<div class="page_container">
		
			<div class="thumb_container">
				<div id="thumb_list">
					<div id="thumb_cursor"></div>	<!--  지금 현재 썸네일 총 16개 -->
					<c:forEach var="logoPath" items="${logoList}">
						<img src='<c:url value="/admin/mainsetting/logo/mainlogo?logoPath=${logoPath}" />' alt="" />
					</c:forEach>
				</div>
			</div>
			<div class="page_menu">
				<i id="prev_page" class="fa fa-arrow-circle-left"></i>
				<span id="page_info"></span>
				<i id="next_page" class="fa fa-arrow-circle-right"></i>
			</div>
		</div>		
	</div>

<!-- jQuery -->
<script src="/sample/admin/js/jquery.js"></script>

<!-- Bootstrap JS -->
<script src="/sample/admin/js/bootstrap.min.js"></script>

<!-- Respond JS for IE8 -->
<script src="/sample/admin/js/respond.min.js"></script>

<!-- HTML5 Support for IE -->
<script src="/sample/admin/js/html5shiv.js"></script>

<script>
	var NUMBER_PER_PAGE = 7;
	
	$(document).ready(function(){
		var currentPageIndex = 1;
		var $thumbs = $('#thumb_list img');
		var pageLength = Math.ceil($thumbs.size() / NUMBER_PER_PAGE);
		var $pageInfo = $('#page_info');
		var $thumbList = $('#thumb_list');
		var $imageCanvas = $('#image_canvas');
		var $imageLoadingPanel = $('#loading_panel');
		var $imageContainer = $('div.image_container');
		var imageContainerWidth = $imageContainer.width();
		var imageContainerHeight = $imageContainer.height();
		var $thumbCursor = $('#thumb_cursor');
		var $imageMenu = $('#image_menu');
		var activeThumbIndex = -1;
		
		$pageInfo.html('page : ' + currentPageIndex + ' / ' + pageLength);
		
		$('#prev_page').on('click', function(){
			if(currentPageIndex == 1)
				return ;	// page가 1이라면, 그 이전 페이지로 갈 수 없다.
				
			$pageInfo.html('page : ' + --currentPageIndex + ' / ' + pageLength);
			$thumbList.animate({top : -((currentPageIndex-1) * 66)}, 300);		
		});
		
		$('#next_page').on('click', function(){
			if(currentPageIndex < pageLength){
				$pageInfo.html('page : ' + ++currentPageIndex + ' / ' + pageLength);
				$thumbList.animate({top : -((currentPageIndex-1) * 66)}, 300);
			}
		});
		
		$thumbs.on('click', function(){
			var imageLoader = new Image();	// 이 자체가 하나의 <img>태그이다.
			var currentThumbIndex = $thumbs.index($(this));
			activeThumbIndex = currentThumbIndex;
			
			showLoadingPanel(true);
			$imageCanvas.empty();
			
			imageLoader.src = this.src;
			imageLoader.addEventListener('load', function(){
				showLoadingPanel(false);
				
				updateImageCanvas(imageLoader);
				moveThumbCursor(currentThumbIndex);
			});
			
		});
		
		function showLoadingPanel(isShow){
			if(isShow)
				$imageLoadingPanel.css('visibility', 'visible');
			else
				$imageLoadingPanel.css('visibility', 'hidden');
		};
		
		// 이미지 업데이트
		function updateImageCanvas(image){
			var sizeInfo = getImageResizingInfo(image.width, image.height);
			
			$imageCanvas.stop();
			$imageCanvas.animate(sizeInfo, 200, function(){
				var $image = $(image);
				$image.css({
					opacity : 0,
					width : sizeInfo.width,
					height : sizeInfo.height
				});
				
				$imageCanvas.append($image);
				$image.animate({opacity : 1}, 300);
			});
		};
		
		function getImageResizingInfo(originalImageWidth, originalImageHeight){
			var newImageSizeInfo = {
				width : 0,
				height : 0,
				top : 0,
				left : 0
			};
			
			if(imageContainerWidth > originalImageWidth && imageContainerHeight > originalImageHeight){
				newImageSizeInfo.width = originalImageWidth;
				newImageSizeInfo.height = originalImageHeight;
			}else{
				var tempWidth = imageContainerWidth / originalImageWidth;
				var tempHeight = imageContainerHeight / originalImageHeight;
				
				// 너비와 높이중에 작은 값을 기준으로 하고 새로운 이미지 사이즈를 구한다.
				if(tempHeight <= tempWidth){
					newImageSizeInfo.height = imageContainerHeight;
					newImageSizeInfo.width = getImageWidth(newImageSizeInfo.height, originalImageWidth, originalImageHeight);
				}else{
					newImageSizeInfo.width = imageContainerWidth;
					newImageSizeInfo.height = getImageHeight(newImageSizeInfo.width, originalImageWidth, originalImageHeight);
				}
			}
			
			// 이미지를 가운데로 정렬한다.
			newImageSizeInfo.left = Math.floor(( imageContainerWidth - newImageSizeInfo.width ) / 2);
			newImageSizeInfo.top = Math.floor(( imageContainerHeight - newImageSizeInfo.height ) / 2);
			
			return newImageSizeInfo;
		};
		
		function getImageWidth(newImageHeight, originalImageWidth, originalImageHeight){
			return Math.floor((newImageHeight * originalImageWidth) / originalImageHeight);
		};
		
		function getImageHeight(newImageWidth, originalImageWidth, originalImageHeight){
			return Math.floor((newImageWidth * originalImageHeight) / originalImageWidth);
		};
		
		function moveThumbCursor(index){
			var $thumb = $thumbs.eq(index);
			
			$thumbCursor.stop();
			$thumbCursor.css({
				opacity : 0,
				left : $thumb.position().left,
				top : $thumb.position().top
			});
			
			$thumbCursor.animate({opacity : 1}, 300);
		};
		
		function activateImageMenu(isAcitve){
			$imageMenu.stop();
			if(isAcitve){
				$imageMenu.css({'visibility' : 'visible'});
				$imageMenu.animate({opacity : 1}, 300);
			}else{
				$imageMenu.animate({opacity : 0}, 300, function(){
					$imageMenu.css({'visibility' : 'hidden'});
				});
			}
		};
		
		$imageContainer.on('mouseenter', function(){
			activateImageMenu(true);
		});
		
		$imageContainer.on('mouseleave', function(){
			activateImageMenu(false);
		});
		
		function initLoadImage(index){
			var firstImage = $thumbs.first();
			
			firstImage.trigger('click');
		};
		
		initLoadImage(0);	// loadImage()를 여기에 위치해야 제대로 동작한다.
	
		$('#prev_image').on('click', function(e){
			var thumb;
			
			if(activeThumbIndex == 0){
				return ;	
			}else if(activeThumbIndex % NUMBER_PER_PAGE == 0 && activeThumbIndex != 0){
				$('#prev_page').trigger('click');
			}
			
			if(activeThumbIndex != -1){
				thumb = $thumbs[--activeThumbIndex];
				
				$(thumb).trigger('click');			
			}else if(activeThumbIndex == -1){
				return ;
			}
			
		});
		
		$('#next_image').on('click', function(e){
			var thumb;
			
			if(($thumbs.length - 1) != activeThumbIndex){
				thumb = $thumbs[++activeThumbIndex];
				
				$(thumb).trigger('click');
			}
			
			if(activeThumbIndex % NUMBER_PER_PAGE == 0){
				$('#next_page').trigger('click');
			}
			
		});
		
		$('#logo_update_btn').on('click', function(){
			 var logoPath = $thumbs[activeThumbIndex].src;
			 
			 if(!confirm('메인 로고를 변경하시겠습니까?'))
					return ;
			 
			 $.ajax({
				url      : '<c:url value="/admin/mainsetting/logo" />',
				type     : 'PATCH',
				headers  : {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'PATCH'
				},
				data     : JSON.stringify(logoPath.substring(logoPath.indexOf('=/') + 1)),
				dataType : 'text',
				success  : function(result){
					if(result == 'LOGO_UPDATE_SUCCESS'){
						alert('로고가 변경되었습니다.');
						
						// 이미지에 현재 시간 날짜를 보내서 작동하게 한다.
						// 크롬은 src가 바뀌더라도 그전과 같은 로딩하지 않는다.
						// src가 바꿔야 크롬은 로딩을 하므로, 현재 시간을 같이 보내서 계속 바뀌게 한다.
						opener.document.getElementById('main-logo').src = '<c:url value="/admin/mainsetting/logo/mainlogo" />?timestamp=' + new Date().getTime();
						self.close();
					}
				}
			 });
		});
		
		$('#logo_delete_btn').on('click', function(){
			var logoPath = $thumbs[activeThumbIndex].src;
			
			console.log(logoPath.substring(logoPath.indexOf('s_') + 1));
			if(!confirm('선택된 로고를 삭제하시겠습니까?'))
					return ;
			
			$.ajax({
				url      : '<c:url value="/admin/mainsetting/logo" />',
				type     : 'DELETE',
				headers  : {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'DELETE'
				},
				data     : JSON.stringify(logoPath.substring(logoPath.indexOf('=/') + 1)),
				dataType : 'text',
				success  : function(result){
					if(result == 'LOGO_DELETE_SUCCESS'){
						alert('로고가 삭제되었습니다.');
						
						window.location.reload();
						// 이미지에 현재 시간 날짜를 보내서 작동하게 한다.
						// 크롬은 src가 바뀌더라도 그전과 같은 로딩하지 않는다.
						// src가 바꿔야 크롬은 로딩을 하므로, 현재 시간을 같이 보내서 계속 바뀌게 한다.
						// opener.document.getElementById('main-logo').src = '<c:url value="/admin/mainsetting/logo/mainlogo" />?timestamp=' + new Date().getTime();
						// self.close();
					}
				}
			 });
		});
	});	
	
</script>

</body>
</html>