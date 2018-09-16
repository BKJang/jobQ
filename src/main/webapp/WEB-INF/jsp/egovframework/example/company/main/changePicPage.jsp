<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="css/company/imageSlider.css">

<section class="wrapper">
	<section class="page_head">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="page_title">
						<h2>회사 내 사진 변경</h2>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="content elements">
		<div class="container">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12" style="padding-right: 30px">
						<span id="allDelBtn" class="btn btn-danger" style="float: right">전체 삭제</span>
						<span id="submitBtn" class="btn btn-default" style="float: right">지금 보이는 대로 저장 하기</span>
					</div>
					<hr>
					<form method="post" id="frm_pic" name="frm_pic" action="insertMultiPic.jobq">
						<input id="guBun" name="guBun" type="hidden" value="${param.guBun}">
						<input id="gonggoNum" name="gonggoNum" type="hidden" value="${param.gonggoNum}">
						<input id="pic_num" type=hidden>
						<div class="col-lg-12 col-md-12 col-sm-12">
							
							
							<c:if test="${fn:length(picList) eq 0}">
								<c:forEach begin="1" end="5" var="i">
									<div class="col-lg-4 col-md-4 col-sm-6">
										<figure class="touching effect-bubba" style="width:100%; height:100%;"> 
											<!-- 로고 보여주는 공간 -->
											<img id="logo_pic_${i}" src="images/nullPic.png" class="img-responsive" style="width:100%; height:100%;">
											<!-- 로고 파일 업로드 버튼 --> 
											<input id="logoUpdateBtn" type="file" style="display: none" >
											<figcaption class="item-description" onclick="javascript:clickUploadBtn()">
												<input type="hidden" value="${i}">
											</figcaption>
										</figure>
									</div>
									<input id="pic_${i}" name="pic_${i}" type="hidden" value="">
								</c:forEach>
							</c:if>
							<c:if test="${fn:length(picList) ne 0}">
								<c:set var="i" value="1"/>
								<c:forEach varStatus="status" var="picList" items="${picList}">
									<div class="col-lg-4 col-md-4 col-sm-6">
										<figure class="touching effect-bubba" style="width:100%; height:100%;"> 
											
											<c:if test="${picList.picRoute ne null}">
												<!-- 로고 보여주는 공간 --> 
												<img id="logo_pic_${picList.cgpicId}" src="./${picList.picRoute}" class="img-responsive" >
											</c:if>
											<c:if test="${picList.picRoute eq null}">
												<!-- 로고 보여주는 공간 -->
												<img id="logo_pic_${picList.cgpicId}" src="images/nullPic.png" class="img-responsive"style="width:100%; height:100%;" >
											</c:if>
											<!-- 로고 파일 업로드 버튼 --> 
											
											<input id="logoUpdateBtn" type="file" style="display: none" >
											
											<figcaption class="item-description" onclick="javascript:clickUploadBtn()">
												<input type="hidden" value="${picList.cgpicId}">
											</figcaption>
											<a class="btn btn-danger item-description" href="#" style="float: right; display: none">
												<i class="fa fa-times " aria-hidden="true" ></i>
											</a>
										</figure>
									</div>
									<input id="pic_${picList.cgpicId}" name="pic_${i}" class="all_pic" type=hidden value="${picList.picRoute}">
									<c:set var="i" value="${i + 1}"/>
								</c:forEach>
							</c:if>
						</div>
					</form>
					<script>
						$("img").css("width", "100%");
						$("img").css("height", "200px");
					</script>
				</div>
			</div>
		</div>
	</section>
</section>

<script type="text/javascript">

	$(document).ready(function() {
		
		if ("${checkSave}" == 'save') {
			
			opener.parent.location.reload();
			window.close();
		}
		
		$("figcaption").mouseover(function(){
			
			$(this).prev('a').show();
		});
		
		$("figcaption").mouseout(function(){
			
			$(this).prev('a').hide();
		});
		
		$("a").click(function(){
			
			alert("클릭됨");
		});
		
		$(".item-description").click(function(){
			
			$("#pic_num").val($(this).children().val());
		});
		
		$("#logoUpdateBtn").change(function(){
			var formData = new FormData();
			
			formData.append("fileUp",$("#logoUpdateBtn")[0].files[0]);
			 
	        $.ajax({
	            type : 'post',
	            url : 'multi_pic_upload.jobq',
	            data : formData,
	            processData : false, 
	            contentType : false,
	            success : function(result) {
	            	var jsonRes = JSON.parse(result); 
	            	$("#logo_pic_" + $("#pic_num").val()).attr("src", "./"+jsonRes);
	            	$("#pic_" + $("#pic_num").val()).val(jsonRes);
	            	$("#logo_pic_" + $("#pic_num").val()).css("width", "100%");
	            	$("#logo_pic_" + $("#pic_num").val()).css("height", "200px");
	            	$("#logoUpdateBtn").val("");
	            },
	            error : function(error) {
	                alert("파일 업로드에 실패하였습니다.");
	                console.log(error);
	                console.log(error.status);
	            }
	        });
		});
		
		$("#submitBtn").click(function(){
			
			$("#frm_pic").submit();
			alert("저장되었습니다.");
		});
		
		$("#allDelBtn").click(function(){
			
			if (confirm("모든항목을 삭제 할까요?")) {
				$("img").attr("src","images/nullPic.png");
				$(".all_pic").val("");
			}else{
				return false;
			}
		});
		
		
	}); 
	
	
	
	
	/* 로고 파일 업로드 열기 */
	function clickUploadBtn(){
		
		$("#logoUpdateBtn").trigger("click");
	};
	
</script>
