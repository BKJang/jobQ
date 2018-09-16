<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--start wrapper-->
<section class="wrapper">
	<form id="delFrm" name="delFrm" method="POST">
		<input type="hidden" id="resumeNumber" name="resumeNumber" value="<c:out value="${personResumeList['0'].resumeNumber}" />">	
	</form>
	<section class="page_head">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					
					<div class="page_title">
						<h2>이력서</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="content elements">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<div class="col-lg-9 col-md-9 col-sm-9">
						<div class="promo_box">
							<div class="col-lg-12 col-sm-12">
								<div class="promo_content">
									<h3><c:out value="${personResumeList['0'].title}" /></h3>
								</div>
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
								<c:if test="${personResumeList['0'].mainPic == null}">
								<div class="photoArea" style="text-align: center;">
									<span class="photo" style=""> <img src="./images/img-style_man.jpg"
										alt="" class="center_img img-thumbnail" width="200" height="300">
									</span> <span> </span>

								</div>
							</c:if>
							
							<c:if test="${personResumeList['0'].mainPic != null}">
								<div class="photoArea" style="text-align: center;">
									<span class="photo"> <img src="./${personResumeList['0'].mainPic}"
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
								<h3><c:out value="${personList['0'].name}" /></h3>
								
								<c:if test="${personList['0'].sex == 0}">
								<span><font size="3px"> 남자/<c:out value="${personList['0'].birth}" /></font></span>
								</c:if>
								<c:if test="${personList['0'].sex == 1}">
								<span><font size="3px">여자/<c:out value="${personList['0'].birth}" /></font></span>
								</c:if>
								
							</div>
							<div class="service_icon">
								<i class="fa fa-mobile"></i>
								<h3>연락처</h3>
								<span><font size="3px"> <c:out value="${personList['0'].phone}" /></font></span>
							</div>

							<div class="service_icon">
								<i class="fa fa-envelope"></i>
								<h3>메일</h3>
								<span><font size="3px"> <c:out value="${personList['0'].email}" /></font></span>
							</div>
							<c:if test="${personList['0'].homepage != null}">
							<div class="service_icon">
								<i class="fa fa-cloud"></i>
								<h3>홈페이지</h3>
								<span><font size="3px"> <c:out value="${personList['0'].homepage}" /></font></span>
							</div>
							</c:if>
							
							<c:if test="${personList['0'].homepage == null}">
								<div class="service_icon">
									<i class="fa fa-cloud"></i>
									<h3>홈페이지</h3>
									<span><font size="3px" color="red"> 홈페이지를 등록해주세요.</font></span>
								</div>
							</c:if>
						</div>
					
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 mt40" style="text-align : center;">
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
									<p><c:out value="${personResumeList['0'].lastAcademic}" /></p>
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
								<c:forEach var="personCareerList" items="${personCareerList}">
									<c:set var="career" value="${career+personCareerList.careerMonth}" />
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
									<p><c:out value="${personResumeList['0'].salaryHope}" /> 만원</p>
								</div>
							</div>
						</div>

						<div class="col-lg-3 col-md-3 col-sm-3">
							<div class="serviceBox_1">
								<div>
									<h4>고용형태</h4>
								</div>
								<div class="service_content">
									<p><c:out value="${personResumeList['0'].typeEmploy}" /></p>
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
								<c:forEach items="${fn:split(personResumeList['0'].areaName, ',') }" var="item">
    							<li>
									<button class="btn sbtn" type="button"><c:out value="${item}" /></button>
								</li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<c:if test="${personAcademicList['0'].academicName != null}">
					<div class="col-lg-12 col-md-12 col-sm-12 mt40">
						<div class="dividerHeading">
							<h4>
								<span>학력 사항</span>
							</h4>
						</div>
						<div id="ResumeBaseInfo2" class="resumeView">
							<div class="serviceBox_1">
								<div class="service_icon" style="text-align : center;">
								<c:forEach items="${personAcademicList}" var="personAcademicList">
									<div class="col-lg-4 col-md-4 col-sm-4">
										<h3><c:out value="${personAcademicList.academicDateEnter}" /> ~ 
										<c:out value="${personAcademicList.academicDateFinish}" />
										</h3>
									</div>
									<div class="col-lg-4 col-md-4 col-sm-4">
									<h3><c:out value="${personAcademicList.academicName}" /></h3>
									</div>
									<div class="col-lg-4 col-md-4 col-sm-4">
									<h3><c:out value="${personAcademicList.academicState}" /></h3>
									</div><br>
								</c:forEach>
								</div>
							</div>
						</div>
					</div>
					</c:if>
					<c:if test="${personCareerList['0'].careerName != null}">					
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
								<c:forEach items="${personCareerList}" var="personCareerList">
								<div class="col-lg-4 col-md-4 col-sm-4">
									<h3><c:out value="${personCareerList.careerDateEnter}" />
									 ~ <c:out value="${personCareerList.careerDateFinish}" /></h3>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-4">	 
									<h3><c:out value="${personCareerList.careerName}" /> </h3>
								</div>
								<div class="col-lg-4 col-md-4 col-sm-4">	
									<h3><c:out value="${personCareerList.careerWork}" /></h3>
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
							<c:forEach items="${fn:split(personResumeList['0'].skillName, ',') }" var="item">
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
									<span><font size="3px">${personResumeList['0'].content}</font></span>
								</div>
							</div>
						</div>
					</div>					
					<div class="col-lg-12 col-md-12 col-sm-12 mt40 text-center">
						<img src="images/confirmText.png" alt="위의 모든 기재사항은 사실과 다름없음을 확인합니다." />
						<p class="mt40">
							작성자 : <strong id="agrM_Name"><span><c:out value="${personList['0'].name}" /></span></strong>
						</p>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 mt40 text-center">
						<a class="btn btn-sm btn-social-linkedin"
							onclick="javascript:left.pageSubmitFn('personResumeModify')">
							<i class="fa fa-check"></i> 이력서 수정
						</a>
						
						<a onclick="javascript:del.pageSubmitFn('personResumeDelete')"
						class="btn btn-sm btn-warning"> <i class="fa fa-times"></i>이력서 삭제
						</a>
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

					<div class="widget widget_categories">
						<div class="widget_title">
							<h4>
								<span>개인 서비스</span>
							</h4>
						</div>
						<c:if test="${personResumeList['0'].reOpen == 'Y'}">
						<div class="col-lg-12 col-md-12 col-sm-12 clear" id="popUp">
							
								<button class="btn btn-default btn-lg"
									id="largeModal" >비공개 처리</button>
							

							<div class="col-lg-12 col-md-12 col-sm-12 layerPop">
								<div class="modal-content">
									<div class="clear modal-head">
										<h4 class="modal-header" id="myModalLabel">현재 이력서를 비공개하시겠습니까?</h4>
									</div>
									<div class="clear modal-body">										
										<h4 class="modal-title" id="myModalLabel">이력서를 비공개하면 인재정보에서 비공개 처리 됩니다.</h4>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default closes jqclose"
											data-dismiss="modal">Close</button>
										<button type="button" class="btn btn-primary" id="closeResume">적용</button>
									</div>
								</div>
							</div>
						</div>
						</c:if>
						<c:if test="${personResumeList['0'].reOpen == 'N'}">
						<div class="col-lg-12 col-md-12 col-sm-12 clear" id="popUp">
							
								<button class="btn btn-default btn-lg"
									id="largeModal" >공개 처리</button>
							

							<div class="col-lg-12 col-md-12 col-sm-12 layerPop">
								<div class="modal-content">
									<div class="clear modal-head">
										<h4 class="modal-header" id="myModalLabel">현재 이력서를 공개하시겠습니까?</h4>
									</div>
									<div class="clear modal-body">										
										<h4 class="modal-title" id="myModalLabel">이력서를 공개하면 인재정보에 공개 처리 됩니다.</h4>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default closes jqclose"
											data-dismiss="modal">Close</button>
										<button type="button" class="btn btn-primary" id="openResume">적용</button>
									</div>
								</div>
							</div>
						</div>
						</c:if>
					<!-- <div class="col-md-12">
						<a class="btn btn-sm btn-social-linkedin"
							onclick="javascript:left.pageSubmitFn('personResumeModify')">
							<i class="fa fa-check"></i> 이력서 수정
						</a>
						
						<a onclick="javascript:del.pageSubmitFn('personResumeDelete')"
						class="btn btn-sm btn-warning"> <i class="fa fa-times"></i>이력서 삭제
						</a>
					</div> -->
					<br />
					<br /> <br /> <br /> <br />
					<!-- <div class="col-md-12" style="margin-top: 10px;">
						<a href="pers	onResumeRegister.jobq"><input
							class="btn btn-default btn-lg" type="submit" size="12"
							value="이력서 등록 (임시 버튼)" /></a>
					</div> -->
				</div>
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
		
		$(".layerPop").css("display", "none");
		
		$(".sbtn").css("background-color", "#C94040");
		
		$("#largeModal").click(
				function() {
					$(this).parents("#popUp").find(".layerPop").css(
							"display", "block");
				});
		$(".jqclose").click(function() {
			$(this).parents(".layerPop").css("display", "none");
		});
	});
	
	$("#closeResume").click(function(){
		open.pageSubmitFn("closeResume");
	});
	
	$("#openResume").click(function(){
		open.pageSubmitFn("openResume");
	});
	
	/* 이력서 삭제하기 */
	var del = 
	{	pageSubmitFn : function(pageName) {	
			if(confirm("이력서 삭제시 되돌리 수 없습니다. 정말 삭제하시겠습니까?") == true){
				
				$("#pageName").val(pageName);
				
				$("#delFrm").attr("action", pageName + ".jobq");	
			
				$("#delFrm").submit();
			}
			else{
				return;
			}
		}
		
	}
	
	var open = 
	{	pageSubmitFn : function(pageName) {	
			
				
				$("#pageName").val(pageName);
				
				$("#delFrm").attr("action", pageName + ".jobq");	
			
				$("#delFrm").submit();
			
		}
		
	}
</script>

