<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!--start wrapper-->
<section class="wrapper">
	<section class="page_head">
		<div class="container">
			<div class="row ">
				<div class="col-lg-12 col-md-12 col-sm-12">
					
					<div class="page_title">
						<h2>이력서 상세</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="content elements">
		<div class="container">
			<div class="row">

				<div class="col-lg-9 col-md-9 col-sm-9">
					<div class="promo_box">
						<div class="col-lg-12 col-sm-12">
							<div class="promo_content">
								<h3><c:out value="${mainResumeList['0'].title}" /></h3>

							</div>
						</div>

					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-9 col-md-9 col-lg-9 mt40">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="dividerHeading">
							<h4>
								<span>개인 정보</span>
							</h4>
						</div>
						<div class="col-lg-5 col-md-5 col-sm-5">
							<div id="ResumeBaseInfo" class="resumeView">
								<c:if test="${mainResumeList['0'].mainPic == null}">
								<div class="photoArea" style="text-align: center;">
									<span class="photo"> <img src="./images/img-style_man.jpg"
										alt="" class="center_img img-thumbnail" width="200" height="300">
									</span> <span> </span>

								</div>
							</c:if>
							
							<c:if test="${mainResumeList['0'].mainPic != null}">
								<div class="photoArea" style="text-align: center;">
									<span class="photo"> <img src="./${mainResumeList['0'].mainPic}"
										alt="" class="center_img img-thumbnail" width="200" height="300">
									</span> <span> </span>

								</div>
							</c:if>
							</div>
						</div>
						<div class="col-lg-7 col-md-7 col-sm-7">
							<div class="serviceBox_1 profile_top">
							<div class="service_icon">
								<i class="fa fa-street-view"></i>
								<h3><c:out value="${mainResumePersonList['0'].name}" /></h3>
								
								<c:if test="${mainResumePersonList['0'].sex == 0}">
								<span><font size="3px"> 남자/<c:out value="${mainResumePersonList['0'].birth}" /></font></span>
								</c:if>
								<c:if test="${mainResumePersonList['0'].sex == 1}">
								<span><font size="3px">여자/<c:out value="${mainResumePersonList['0'].birth}" /></font></span>
								</c:if>
								
							</div>
							<div class="service_icon">
								<i class="fa fa-mobile"></i>
								<h3>연락처</h3>
								<span><font size="3px"> <c:out value="${mainResumePersonList['0'].phone}" /></font></span>
							</div>

							<div class="service_icon">
								<i class="fa fa-envelope"></i>
								<h3>메일</h3>
								<span><font size="3px"> <c:out value="${mainResumePersonList['0'].email}" /></font></span>
							</div>
							<c:if test="${mainResumePersonList['0'].homepage != null}">
							<div class="service_icon">
								<i class="fa fa-cloud"></i>
								<h3>홈페이지</h3>
								<span><font size="3px"> <c:out value="${mainResumePersonList['0'].homepage}" /></font></span>
							</div>
							</c:if>
							<c:if test="${mainResumePersonList['0'].homepage == null}">
								<div class="service_icon">
									<i class="fa fa-cloud"></i>
									<h3>홈페이지</h3>
									<span><font size="3px" color="red"> 홈페이지가 없습니다.</font></span>
								</div>
							</c:if>
						</div>
						</div>
					</div>

					<div class="col-lg-12 col-md-12 col-sm-12 mt40">
						<div class="dividerHeading">
							<h4>
								<span></span>
							</h4>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-3">
							<div class="serviceBox_1">
								<div>
									<h4>최종학력</h4>
								</div>
								<div class="service_content">
									<p><c:out value="${mainResumeList['0'].lastAcademic}" /></p>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-3">
							<div class="serviceBox_1">
								<div>
									<h4>총 경력</h4>
								</div>
								<div class="service_content">
								<c:set var="career" value="0" />
								<c:forEach var="mainResumeCareerList" items="${mainResumeCareerList}">
									<c:set var="career" value="${career+mainResumeCareerList.careerMonth}" />
								</c:forEach>
								<c:if test="${career != 0}">
									<p><c:out value="${career}" />개월</p>
								</c:if>
								<c:if test="${career == 0}">
									<p>신입</p>
								</c:if>	
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-3 col-sm-3">
							<div class="serviceBox_1">
								<div>
									<h4>희망연봉</h4>
								</div>
								<div class="service_content">
									<p><c:out value="${mainResumeList['0'].salaryHope}" /> 만원</p>
								</div>
							</div>
						</div>

						<div class="col-lg-3 col-md-3 col-sm-3">
							<div class="serviceBox_1">
								<div>
									<h4>고용형태</h4>
								</div>
								<div class="service_content">
									<p><c:out value="${mainResumeList['0'].typeEmploy}" /></p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 mt40">
						<div class="dividerHeading">
							<h4>
								<span>희망 근무지</span><span></span>
							</h4>
						</div>
						<div>
							<ul class="clear keyword">
								<c:forEach items="${fn:split(mainResumeList['0'].areaName, ',') }" var="item">
    							<li>
									<button class="btn sbtn" type="button"><c:out value="${item}" /></button>
								</li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<c:if test="${mainResumeAcademicList['0'].academicName != null}">
					<div class="col-lg-12 col-md-12 col-sm-12 mt40">
						<div class="dividerHeading">
							<h4>
								<span>학력 사항</span>
							</h4>
						</div>
						<div id="ResumeBaseInfo2" class="resumeView">
							<div class="serviceBox_1">
								<div class="service_icon" style="text-align : center;">
								<c:forEach items="${mainResumeAcademicList}" var="mainResumeAcademicList">
									<div class="col-lg-4 col-md-4 col-sm-4">
										<h3><c:out value="${mainResumeAcademicList.academicDateEnter}" /> ~ 
										<c:out value="${mainResumeAcademicList.academicDateFinish}" />
										</h3>
									</div>
									<div class="col-lg-4 col-md-4 col-sm-4">
									<h3><c:out value="${mainResumeAcademicList.academicName}" /></h3>
									</div>
									<div class="col-lg-4 col-md-4 col-sm-4">
									<h3><c:out value="${mainResumeAcademicList.academicState}" /></h3>
									</div><br>
								</c:forEach>
								</div>
							</div>
						</div>
					</div>
					</c:if>
					<c:if test="${mainResumeCareerList['0'].careerName != null}">					
					<div class="col-lg-12 col-md-12 col-sm-12 mt40">
						<div class="dividerHeading">
							<h4>
								<span>경력 사항</span>
							</h4>
						</div>
						<div id="ResumeBaseInfo2" class="resumeView">
							<div class="serviceBox_1">
								<div class="service_icon" style="text-align : center;">
								<!-- <div class="col-lg-4 col-md-4 col-sm-4">
									<h3>기간</h3>
								</div>
								<div class="col-lg-2 col-md-2 col-sm-2">
									<h3>회사명</h3>
								</div>
								<div class="col-lg-2 col-md-2 col-sm-2">
									<h3>고용 형태</h3>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-4">
									<h3>담당 업무 및 참여 프로젝트</h3>
								</div> -->
								<c:forEach items="${mainResumeCareerList}" var="mainResumeCareerList">
								<div class="col-lg-4 col-md-4 col-sm-4">
									<h3><c:out value="${mainResumeCareerList.careerDateEnter}" />
									 ~ <c:out value="${mainResumeCareerList.careerDateFinish}" /></h3>
								</div>
								<div class="col-lg-2 col-md-2 col-sm-2">	 
									<h3><c:out value="${mainResumeCareerList.careerName}" /> </h3>
								</div>
								<div class="col-lg-2 col-md-2 col-sm-2">	
									<h3><c:out value="${mainResumeCareerList.careerRole}" /></h3>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-4">	
									<h3><c:out value="${mainResumeCareerList.careerWork}" /></h3>
								</div>
								<br>
								</c:forEach>
								</div>
							</div>
						</div>
					</div>
					</c:if>
					<div class="col-lg-12 col-md-12 col-sm-12 mt40">
						<div class="dividerHeading">
							<h4>
								<span>기술 사항</span>
							</h4>
						</div>
						<div>
							<ul class="clear keyword">
								<c:forEach items="${fn:split(mainResumeList['0'].skillName, ',') }" var="item">
    							<li>
									<button class="btn sbtn" type="button"><c:out value="${item}" /></button>
								</li>
								</c:forEach>
							</ul>
						</div>
					</div>

					<div class="col-lg-12 col-md-12 col-sm-12 mt40">
						<div class="dividerHeading">
							<h4>
								<span>자기소개</span>
							</h4>
						</div>
						<div id="ResumeBaseInfo2" class="resumeView">
							<div class="serviceBox_1">
								<div class="service_icon">
									<span><font size="3px"><c:out value="${mainResumeList['0'].content}" /></font></span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 mt40 text-center">
						<img src="images/confirmText.png"
							alt="위의 모든 기재사항은 사실과 다름없음을 확인합니다." />
						<p class="mt40">
							작성자 : <strong id="agrM_Name"><span><c:out value="${mainResumePersonList['0'].name}" /></span></strong>
						</p>
					</div>
				</div>
			</div>

			<!--Sidebar Widget-->
			<div class="col-lg-3 col-md-3 col-sm-3 mt40">
				<div class="sidebar">
					<!-- <div class="widget widget_search">
							<div class="site-search-area">
								<form method="get" id="site-searchform" action="#">
									<div>
										<input class="input-text" name="s" id="s" placeholder="검색어 입력..." type="text" />
										<input id="searchsubmit" value="Search" type="submit" />
									</div>
								</form>
							</div>
						</div> -->
						
					<c:if test="${sessionScope.member_type == 'c'}" > 
					<div class="widget widget_categories">
						<div class="widget_title">
							<h4>
								<span>개인 서비스</span>
							</h4>
						</div>
						
						<div class="col-md-12" id="popUp">
											
						<a class="btn btn-sm btn-social-linkedin" data-toggle="modal" id="largeModal">
							 면접 제의
						</a>
						<form id="offerFrm" name="offerFrm">
							<input type="hidden" id="resumeNumber" name="resumeNumber" value="<c:out value="${resumeNumber}" />"/>
							<input type="hidden" id="offerContent" name="offerContent" />
						</form>	
							<div class="col-lg-12 col-md-12 col-sm-12 layerPop">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close jqclose"
											data-dismiss="modal" aria-hidden="true">&times;</button>
										<h4 class="modal-title" id="myModalLabel">면접제의내용</h4>
									</div>
									<div class="clear modal-body">
										<textarea class="modal-title lengthCh" id="modalContent" maxlength="100"></textarea>
										<span style="float : right;">
										/100자
										</span><br><br>
										<h4 class="modal-title" id="myModalLabel">면접을 제의하겠습니까?</h4>
									</div>
									
									<div class="modal-footer">
										<button type="button" class="btn btn-default closes jqclose"
											data-dismiss="modal">Close</button>
										<button type="button" id="initOffer" class="btn btn-primary">적용</button>
									</div>
								</div>
							</div>
						
						</div>
					</div>
					</c:if>
				</div>
			</div>
		</div>
		
		<!-- //container[E]  -->
	</section>
</section>
<!--end wrapper-->

<script>
	$(document).ready(function() {

		$(".card_wrap > ul > li:odd").css("border-left", "1px solid #ccc");
		
		$(".sbtn").css("background-color", "#C94040");
		
		$(".layerPop").css("display", "none");

		$("#largeModal").click(
				function() {
					$(this).parents("#popUp").find(".layerPop").css(
							"display", "block");
				});
		$(".jqclose").click(function() {
			$(this).parents(".layerPop").css("display", "none");
		});
		
	});
	
	$("#initOffer").click(function() {
		
		alert("면접제의가 완료되었습니다!");
		
		$("#offerContent").val($("#modalContent").val());
		
		offer.pageSubmitFn('insertOffer');
		
	});
	
	/* 글자수 세기 */
	$(".lengthCh").keyup( function(){
		
		if ($(this).val().length > $(this).attr("maxlength")) {
			
			$(this).val().slice(0,-1);
			$(this).parent().children("span").text($(this).attr("maxlength") + "/" + $(this).attr("maxlength") + "자");
		}else{
			
			$(this).parent().children("span").text($(this).val().length + "/" + $(this).attr("maxlength") + "자");
		}
	});
	
	var offer = 
	{			
		pageSubmitFn : function(pageName) {				
			
			$("#pageName").val(pageName);
			
			$("#offerFrm").attr("action", pageName + ".jobq");	
			
			$("#offerFrm").attr("method", "post");
		
			$("#offerFrm").submit();
		}
	}

</script>

