<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style type="text/css">
.buttonWrap {
	position: relative;
	overflow: hidden;
	cursor: default;
	width: 100%;
	height: 100%;
}

.buttonWrap input {position：absolute;
	margin-left: -10px;
	filter: alpha(opacity = 0);
	opacity: 0;
	-moz-opacity: 0;
	cursor: pointer;
	width: 100%;
	height: 100%;
}

.overlay
{
padding-right:5px;
position: absolute;
margin-right: 3px;
margin-top: 15px;
float : right;
}
</style>

<form id="qnaFrm" name="qnaFrm">
	<input type="hidden" id="qnaNumber" name="qnaNumber" />
</form>
<!--start wrapper-->
<section class="wrapper">

	<section class="page_head">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					
					<div class="page_title">
						<h2>마이페이지</h2>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="content elements">
		<div class="container">
			<div class="container">
				<div class="row">
					<div class="col-sm-3 col-md-3 col-lg-3">
						<div class="widget_title">
							<h4>
							
								<span class="favicon_wrap"> 
								<strong>
								<span><c:out value="${personMainList['0'].name}" /></span>
								
								</strong> <!-- 사진 담겨있는 페이지로 이동 -->
								
									 <!-- 회원정보 수정으로 --> <!-- 회원 이름 -->
								</span>
							
							</h4>
						</div>
						<c:if test="${personMainList['0'].mainPic == null}">
						<div
							style="width: 100%; height: 100%; position: static; left: 0px; top: 0px; transform: translate3d(0px, 0px, 0px);">
							<figure class="touching effect-bubba" style="text-align: center;">

								<img id="imagePic" src="./images/img-style_man.jpg" class="img-responsive"
									width="200" height="300">

								<!-- 로고 파일 업로드 버튼 -->
								<input id="imageUpdateBtn" type="file" style="display: none">
								<figcaption class="item-description" onclick="javascript:clickUploadBtn1()">
								
								</figcaption>
							</figure>	
						</div>
						</c:if>
						<c:if test="${personMainList['0'].mainPic != null}">
						<div
							style="width: 100%; height: 100%; position: static; left: 0px; top: 0px; transform: translate3d(0px, 0px, 0px);">
							<figure class="touching effect-bubba" style="text-align: center;">

								<img id="imagePic" src="./${personMainList['0'].mainPic}" class="img-responsive" width="200" height="300">

								<!-- 로고 파일 업로드 버튼 -->
								<input id="imageUpdateBtn" type="file" style="display: none">
								<figcaption class="item-description imgDel" onclick="javascript:clickUploadBtn()">
								
								</figcaption>
							</figure>	
							<div class="col-lg-12 col-md-12 col-sm-12 layerPop" id="layerPop">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close jqclose"
											data-dismiss="modal" aria-hidden="true">&times;</button>
										<h4 class="modal-title" id="myModalLabel">사진 수정 및 삭제</h4>
									</div>									
									<div class="modal-footer">
										<button type="button" id="modifyImg" class="btn btn-primary">사진 수정</button>
										<button type="button" id="deleteImg" class="btn btn-danger">사진 삭제</button>
									</div>
								</div>
							</div>
						</div>
						</c:if>
					</div>
					<div class="col-sm-5 col-md-5 col-lg-5">
						<div class="widget_title">
							<h4>
								<span class="favicon_wrap"> <strong>개인 정보</strong>
								</span>
							</h4>
						</div>

					
						<div class="serviceBox_1 profile_top">
							<div class="service_icon">
								<i class="fa fa-street-view"></i>
								<h3><c:out value="${personMainList['0'].name}" /></h3>
								
								<c:if test="${personMainList['0'].sex == 0}">
								<span><font size="3px">남자/<c:out value="${personMainList['0'].birth}" /></font></span>
								</c:if>
								<c:if test="${personMainList['0'].sex == 1}">
								<span><font size="3px">여자/<c:out value="${personMainList['0'].birth}" /></font></span>
								</c:if>
								
							</div>
							<div class="service_icon" id="person">
								<i class="fa fa-street-view"></i>
								<h3>아이디</h3>
								<span><font size="3px"> <c:out value="${personMainList['0'].id}" /></font></span>
							</div>
							<div class="service_icon">
								<i class="fa fa-mobile"></i>
								<h3>연락처</h3>
								<span><font size="3px"> <c:out value="${personMainList['0'].phone}" /></font></span>
							</div>

							<div class="service_icon">
								<i class="fa fa-envelope"></i>
								<h3>메일</h3>
								<span><font size="3px"> <c:out value="${personMainList['0'].email}" /></font></span>
							</div>
							<c:if test="${personMainList['0'].homepage != null}">
								<div class="service_icon">
									<i class="fa fa-cloud"></i>
									<h3>홈페이지</h3>
									<span><font size="3px"> <c:out value="${personMainList['0'].homepage}" /></font></span>
								</div>
							</c:if>
							<c:if test="${personMainList['0'].homepage == null}">
								<div class="service_icon">
									<i class="fa fa-cloud"></i>
									<h3>홈페이지</h3>
									<span><font size="3px" color="red"> 홈페이지를 등록해주세요.</font></span>
								</div>
							</c:if>
						</div>
					</div>

					<div class="col-sm-2 col-md-2 col-lg-4">
						<div class="widget_title">
							<h4>
								<span class="favicon_wrap"> <strong>나의 이력서</strong> 
								
								</span>
							</h4>
						</div>
						<div class="widget_content">						
							<c:if test="${personMainList['0'].reDelete == 'Y' && personMainList['0'].title != null}">
							<ul class="links">
								<li id="personId">
									<a class="announce" href="#" onclick="javascript:left.pageSubmitFn('personResume')">
								<c:set var="title_sub_before" value="${personMainList['0'].title}" />
									<c:if test="${fn:length(title_sub_before)>= 25}">
									<c:set var="title_sub" value="${fn:substring(title_sub_before, 0, 25)}" />
										<font color="black">
										<c:out value="${title_sub}" />...
										</font>
										
									</c:if>
									<c:if test="${fn:length(title_sub_before) <25}">
										<font color="black">
										<c:out value="${title_sub_before}" />
										</font>
									</c:if>
								</a>
								</li>
								<c:set var="content_sub_before" value="${personMainList['0'].content}" />
								<c:set var="content_sub_before2" value="${fn:replace(content_sub_before,'<br>',' ')}" />
									<c:if test="${fn:length(content_sub_before2)>= 100}">
										<c:set var="content_sub" value="${fn:substring(content_sub_before2, 0, 100)}" />
										<span><c:out value="${content_sub}" />...</span>
									</c:if>
									<c:if test="${fn:length(content_sub_before2) <100}">
										<span>${content_sub_before2}</span>
									</c:if>
								<!-- 아마 디비 테이블에 간략한 내용에 대한 콜룸을 추가해야 할듯? -->
							</ul>
							</c:if>
							<c:if test="${personMainList['0'].reDelete == 'N' || personMainList['0'].title == null}">
								<a href="personResumeRegister.jobq">
								<span>이력서를 등록해주세요!!</span>
								</a>
							</c:if>
						</div>
					</div>
					<div><p /></div>
					<div class="col-sm-2 col-md-2 col-lg-4" style="overflow: hidden">
						<div class="widget_title">
							<h4>
								<span class="favicon_wrap"> <strong>나의 문의 내역</strong> 
								
								</span>
							</h4>
						</div>
						<div class="widget_content">						
							
							<ul class="links">
							<c:if test="${personQnAList['0'].qNumber != null && fn:length(personQnAList)>5}">
							
								<c:forEach var="i" begin="1" end="5">
									<li id="qNumber" class="qNumber" value="<c:out value="${personQnAList[i].qNumber}" />" >
										
										<c:if test="${personQnAList[i].qReplyDate == null}">	
										<a href="#">
											<font color="black">
												<c:out value="${personQnAList[i].qTitle}" />
											</font>
										</a>	
										</c:if>
										<c:if test="${personQnAList[i].qReplyDate != null}">	
										<a href="#">
											<font color="green">
												<c:out value="${personQnAList[i].qTitle}" />
											</font>
										</a>	
										</c:if>		
										
									</li>
								</c:forEach>
								 <font style="text-aling:center;"><a href="goQnAList.jobq">문의 내역 더보기</a></font>
							</c:if>
							<c:if test="${personQnAList['0'].qNumber != null && fn:length(personQnAList)<=5}">
								<c:forEach var="personQnAList" items="${personQnAList}">
									<li id="qNumber" class="qNumber" value="<c:out value="${personQnAList.qNumber}" />" >
										
										<c:if test="${personQnAList.qReplyDate == null}">	
										<a href="#">
											<font color="black">
												<c:out value="${personQnAList.qTitle}" />
											</font>
										</a>	
										</c:if>
										<c:if test="${personQnAList.qReplyDate != null}">	
										<a href="#">
											<font color="green">
												<c:out value="${personQnAList.qTitle}" />
											</font>
										</a>	
										</c:if>		
										
									</li>
								</c:forEach>	
							</c:if>
							</ul>
							<c:if test="${personQnAList['0'].qNumber == null}">
								<span>문의 내역이 없습니다.</span>
							</c:if>
						</div>
					</div>
				</div>


				<div class="row sub_content">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="dividerHeading">
							<h4>
								<span>대쉬보드</span>
							</h4>

						</div>
					</div>
					<div class="mrgb-50 clearfix"></div>
					<div class="pricingBlock theme-color-pt">

						<!-- 게시중 공고 -->

						<div class="col-lg-3 col-md-3 col-sm-3">
						<c:if test="${personMainList['0'].reDelete == 'N' || personMainList['0'].title == null}">
							<a href="personResumeRegister.jobq">
								<div class="pricingTable">
								
									<div class="pricingTable-header">
										<span class="heading">이력서 등록</span> <span class="price-value"></span>
									</div>
									<div class="pricingContent">
										<ul>
											<li><i class="fa fa-file-text-o fa-3x"></i></li>
											<li class="font_siz"><strong> 이력서</strong>를 등록해주세요</li>
										</ul>
									</div>
									<div class="pricingTable-sign-up">
										<span class="btn btn-block btn-default">이력서 등록</span>
										<!-- 이력서 관리로 링크 -->
									</div>	
								</div>
							</a>
						</c:if>
						<c:if test="${personMainList['0'].reDelete == 'Y' && personMainList['0'].title != null}">
							<a class="announce" href="#" onclick="javascript:left.pageSubmitFn('personResume')">
								<div class="pricingTable">
								
									<div class="pricingTable-header">
										<span class="heading">이력서 관리</span> <span class="price-value"></span>
									</div>
									<div class="pricingContent">
										<ul>
											<li><i class="fa fa-file-text-o fa-3x"></i></li>
											<li class="font_siz"><strong> 이력서</strong>를 관리하세요</li>
										</ul>
									</div>
									<div class="pricingTable-sign-up">
										<span class="btn btn-block btn-default">이력서 관리</span>
										<!-- 이력서 관리로 링크 -->
									</div>	
								</div>
							</a>
						</c:if>
						</div>



						<!-- 미열람 지원자 -->

						<div class="col-lg-3 col-md-3 col-sm-3">
						
							<a class="applicant" href="#" onclick="javascript:left.pageSubmitFn('personApplication')">
								<div class="pricingTable">
									<div class="pricingTable-header">
										<span class="heading">나의 지원 현황</span> <span
											class="price-value"></span>
									</div>
									<div class="pricingContent">
										<ul>
											<li><i class="fa fa-users fa-3x"></i></li>
											<li class="font_siz"><strong><c:out value="${countOfApplication['0'].countOfApplication}" /></strong> 건</li>
										</ul>
									</div>
									<div class="pricingTable-sign-up">
										<span class="btn btn-block btn-default">지원 현황 관리</span>
									</div>
								</div>
							</a>
						
						<%-- <c:if test="${personMainList['0'].title == null}">
							<a href="personResumeRegister.jobq">
								<div class="pricingTable">
									<div class="pricingTable-header">
										<span class="heading">나의 지원 현황</span> <span
											class="price-value"></span>
									</div>
									<div class="pricingContent">
										<ul>
											<li><i class="fa fa-users fa-3x"></i></li>
											<li class="font_siz"><strong> 이력서</strong>를 먼저 등록해주세요</li>
										</ul>
									</div>
									<div class="pricingTable-sign-up">
										<span class="btn btn-block btn-default">JOBQ</span>
									</div>
								</div>
							</a>
						</c:if> --%>
						</div>



						<!-- 면접제의 신청인원 -->

						<div class="col-lg-3 col-md-3 col-sm-3">
						
							<a class="suggest" href="#"
								onclick="javascript:left.pageSubmitFn('personOffer')">
								<div class="pricingTable">
									<div class="pricingTable-header">
										<span class="heading">면접 제의</span> <span class="price-value"><span
											class="mo"></span></span>
									</div>
									<div class="pricingContent">
										<ul>
											<li><i class="fa fa-child fa-3x"></i></li>
											<li class="font_siz"><strong><c:out value="${countOfOffer['0'].countOfOffer}" /></strong> 건</li>
										</ul>
									</div>
									<div class="pricingTable-sign-up">
										<span class="btn btn-block btn-default">면접제의 관리</span>
									</div>
								</div>
							</a>
						
						<%-- <c:if test="${personMainList['0'].title == null}">
							<a href="personResumeRegister.jobq">
								<div class="pricingTable">
									<div class="pricingTable-header">
										<span class="heading">면접 제의</span> <span class="price-value"><span
											class="mo"></span></span>
									</div>
									<div class="pricingContent">
										<ul>
											<li><i class="fa fa-child fa-3x"></i></li>
											<li class="font_siz"><strong>이력서</strong>를 먼저 등록해주세요</li>
										</ul>
									</div>
									<div class="pricingTable-sign-up">
										<span class="btn btn-block btn-default">JOBQ</span>
									</div>
								</div>
							</a>
						</c:if> --%>
						</div>



						<!-- 회원 수정 -->

						<div class="col-lg-3 col-md-3 col-sm-3">
							<a href="edit_person.jobq">
								<div class="pricingTable" >
								<!-- onclick="javascript:left.pageSubmitFn('edit_person')" -->
									<div class="pricingTable-header">
										<span class="heading">회원수정</span> <span class="price-value"><span
											class="mo"></span></span>
									</div>
									<div class="pricingContent">
										<ul>
											<li><i class="fa fa-cog fa-spin fa-3x fa-fw"></i>
											<li class="font_siz"><strong> 회원정보</strong> 수정하러 가기</li>
										</ul>
									</div>
									<div class="pricingTable-sign-up">
										<span class="btn btn-block btn-default">회원정보 수정</span>
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</section>
<!--end wrapper-->

<script type="text/javascript">
	
	function clickUploadBtn1(){
	
		$("#imageUpdateBtn").trigger("click");
	};
	
	//로고 파일 업로드 열기
	function clickUploadBtn(){
		
		$(".layerPop").css("display", "block");
	};	
	
	$("#modifyImg").click(function(){
		$("#imageUpdateBtn").trigger("click");
	});
	
	$("#deleteImg").click(function(){
		var formData = "C:/eGovFrameDev-3.5.1-64bit/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/jobQ_v0.01/${personMainList['0'].mainPic}";
		//alert(formData);
		$.ajax({
            type : 'post',
            url : 'mainPicDelete.jobq',
            data : {"formData" : formData},
            success : function(result) {
            	$("#imagePic").attr("src", "./images/img-style_man.jpg");
            	location.reload();
            },
            error : function(error) {
                alert("파일 삭제에 실패하였습니다.");
                console.log(error);
                console.log(error.status);
            }
        });
	});
	
	
	$(document).ready(function() {
		//모달 안띄우기
		$(".layerPop").css("display", "none");
		
		//모달창 끄기
		$(".jqclose").click(function(){
			$(".layerPop").css("display", "none");
			
		});
	
		/* 로고사진 업데이트 ajax구현 */
		$("#imageUpdateBtn").change(function(){
			var formData = new FormData();
			var file = $(this)[0].files[0];
			//alert(file.name);
			
			var ext = file.name.slice(file.name.lastIndexOf(".") + 1).toLowerCase();
			
			if (!(file.name == "gif" || ext == "jpg" || ext == "png")) {
		        alert("이미지파일 (.jpg, .png, .gif ) 만 업로드 가능합니다.");
		        return false;
		    }
			
			formData.append("fileUp", file);
			
	        $.ajax({
	            type : 'post',
	            url : 'mainPicUpload.jobq',
	            data : formData,
	            processData : false, 
	            contentType : false,
	            success : function(result) {
	            	var jsonRes = JSON.parse(result); 
	            	$("#imagePic").attr("src", "./"+jsonRes);
	            	$(".layerPop").css("display", "none");
	            	location.reload();
	            },
	            error : function(error) {
	                alert("파일 업로드에 실패하였습니다.");
	                console.log(error);
	                console.log(error.status);
	            }
	        });
		});
	});	
	
	var qna = {
			pageSubmitFn : function(pageName){
				
				$("#qnaFrm").attr("action", pageName + ".jobq");	
				
				$("#qnaFrm").attr("method", "post");

				$("#qnaFrm").submit();
			}
	}
	
	$(".qNumber").click(function(){
		
		$("#qnaNumber").val($(this).val());
		
		qna.pageSubmitFn("QnADetail");
		
	});
	
</script>