<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   
<!-- Javascript files -->
	
<script>
		var logo = {
			thumbnail :{
				showThumbnail : function(){
					$('#thumbnail').css('visibility', 'visible');
				},
				hideThumbnail : function(){
					$('#thumbnail').css('visibility', 'hidden');
				},
				$thumbnailCancelBtn:$('#thumbnail-cancel-btn')
			},
			fileUpload : {
				formData : new FormData(),					
				init : function(){
					this.formData.delete('file');
					this.formData.delete('logoChangeBtn');
				}
			},
			$updateBtn : $('#logo-update-btn')
		};
		
		/* 파일 업로드 헬퍼 */
	
		logo.fileUpload.checkImageType = function(file){
			var imgPattern = /jpg|gif|png|jpeg|tiff|bmp/i;
			
			return file.type.toLowerCase().match(imgPattern);
		}
		
		logo.fileUpload.createThumbnail = function(file){
			var reader = new FileReader();
			if(!this.checkImageType(file)){
				alert('이미지 타입만 가능합니다.');
				
				return ;
			}				
			
			reader.readAsDataURL(file);
		
			reader.onload = function(){
				logo.thumbnail.showThumbnail();
				$('#virtualFileInput').val(file.name);
			
				$('#filename').text(file.name);
				$('#thumbnail-image').attr('src', reader.result);
			}	
		};
		
		logo.fileUpload.upload = function(file){
			logo.fileUpload.formData.append('file', file);
		};
		
		logo.fileUpload.remove = function(key){
			logo.fileUpload.formData.delete(key);
		};
		
		/* 파일 업로드 헬퍼 */
	
		$(document).ready(function(){
			logo.thumbnail.hideThumbnail();
	
			/* 드랍존 이벤트 */
			
			$('#drop-zone').on('dragenter dragover', function(event){
				event.preventDefault();
			});	
			
			$('#drop-zone').on('drop', function(event){
				event.preventDefault();
				
				var files = event.originalEvent.dataTransfer.files;
				var file = files[0];
				
				logo.fileUpload.createThumbnail(file);
				
				logo.fileUpload.remove("file");
				logo.fileUpload.upload(file);
			});
			
			/* 드랍존 이벤트 끝 */
		});
		
		/* 파일 선택시 드랍존으로 파일 추가 */
		
		$('#realFileInput').on('change', function(event){
				var reader = new FileReader();
				var file = event.originalEvent.srcElement.files[0];

				logo.fileUpload.createThumbnail(file);
				
				logo.fileUpload.remove("file");
				logo.fileUpload.upload(file);
		});
		
		/* 파일 선택시 드랍존으로 파일 추가 끝 */
		
		/* 파일 찾기 버튼 */
		
		$('#virtualFileBtn').on('click', function(e){
			$('#realFileInput').click();
		});
		
		/* 파일 찾기 버튼 */
		
		/* 썸네일 삭제 버튼 */
		
		logo.thumbnail.$thumbnailCancelBtn.on('click', function(e){
			logo.thumbnail.hideThumbnail();
			$('#thumbnail-image').attr('src', '');
		
			$('#virtualFileInput').val('');
		});
		
		/* 썸네일 삭제 버튼 끝 */
		
		/* 파일 업로드 */
		
		$('#logo-update-btn').on('click', function(){
			if($('#thumbnail-image').attr('src') == ''){
				alert('로고를 선택해야 합니다.');
				return ;					
			}
			
			if(!confirm('메인 로고를 변경하시겠습니까?'))
				return ;
			
			logo.fileUpload.formData.append('mainLogoUse', 'Y');
			
			$.ajax({
				url:'<c:url value="/admin/mainsetting/logo" />',
				type:'post',
				data:logo.fileUpload.formData,
				dataType:'text',
				processData:false,
				contentType:false,
				success:function(data){
					alert('로고가 변경되었습니다.');
					$('#main-logo').attr('src', '<c:url value="/admin/mainsetting/logo/mainlogo" />?timestamp=' + new Date().getTime());
					
					logo.fileUpload.init();
					logo.thumbnail.$thumbnailCancelBtn.trigger('click');
				}
			});
		});
		
		/* 파일 업로드 끝 */
		
		/* 파일 업로드 초기화 버튼 */
		
		$('#logo-reset-btn').on('click', function(e){
			logo.thumbnail.$thumbnailCancelBtn.trigger('click');
		});
		
		/* 파일 업로드 초기화 버튼 끝 */
		
		$('#logo-list-btn').on('click', function(e){
			var logolistX = (window.screen.width / 2) - (600 / 2);
			var logolistY = (window.screen.height / 2) - (400 / 2);
			
			// 실질적으로 top옵션보다는 screenY옵션이 팝업창의 위치를 지정하는것 같다.
			window.open('<c:url value="/admin/mainsetting/logo/logolist" />', 'logo-list', 'width=600, height=400, left=' + logolistX + ', top=' + 100 + ', screenX=' + logolistX + ', screenY=' + 50);		
		});
		
	</script>
