<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<form id="resumeFrm" name="resumeFrm" method="POST">	
	<input type="hidden" id="resume_detail"  name="resume_detail"/> 
	<input type="hidden" id="signTrgNo" name="signTrgNo" />
</form>	
<form id="pagingFrm" name="pagingFrm">
	<input type="hidden" id="page" name="page" />
	<input type="hidden" id="keyword" name="keyword" />
</form>


<!--start wrapper-->
<section class="wrapper">	
	<section class="page_head">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					
					<div class="page_title">
						<h2>인재정보</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="content elements">		
		<div class="container">	
			<div class="row">
				<!--Sidebar Widget-->
				<div class="col-lg-2 col-md-2 col-sm-2">
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
								<h4><span>직종상세</span></h4>
								</div>
							
							<ul class="arrows_list list_style">
							<li class="skillList" style="cursor : pointer" value="" >
								전체
							</li>
							<c:forEach items="${mainResumeSkillList}" var="mainResumeSkillList">
								<li class="skillList" value="<c:out value="${mainResumeSkillList.skillName}" />" style="cursor : pointer" >
									<c:out value="${mainResumeSkillList.skillName}" />
								</li>
							</c:forEach>
								<!-- <li><a href="#"> JAVA (10)</a></li>
								<li><a href="#"> PHP (25)</a></li>
								<li><a href="#"> MySQL (29)</a></li>
								<li><a href="#"> SQL (19)</a></li>
								<li><a href="#"> jsp(38)</a></li>
								<li><a href="#"> xml (33)</a></li>
								<li><a href="#"> C# (10)</a></li>
								<li><a href="#"> C++ (25)</a></li>
								<li><a href="#"> 아이폰 (29)</a></li>
								<li><a href="#"> 안드로이드 (19)</a></li>
								<li><a href="#"> .NET (38)</a></li>
								<li><a href="#"> VisualC++ (33)</a></li>
								<li><a href="#"> Unix (10)</a></li>
								<li><a href="#"> Python (25)</a></li>
								<li><a href="#"> VisualBasic (29)</a></li>
								<li><a href="#"> 증강현실 (19)</a></li>
								<li><a href="#"> 서버관리자 (38)</a></li>
								<li><a href="#"> 시스템운영 (33)</a></li> -->
							</ul>
						</div>						
					</div>
				</div>

				<div class="col-xs-12 col-sm-10 col-md-10 col-lg-10">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="dividerHeading">
								<h4>
									<span>인재정보</span>
									<span class="bar_gray"> | 
			                   </span><span class="total_top"><c:out value="${pagingCnt.totalTotCnt}" />건</span>
								</h4>
							</div>
						</div>
					</div>
					<!-- <div class="col-sm-12 col-md-12 col-sm-12 clear">
				            <select class="form-control list_count_fr">
							  <option>10개씩</option>
							  <option>20개씩</option>
							  <option>50개씩</option>							  
							</select>
						</div> -->
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="card_wrap" style="border: 0px;">
							<ul class="listResult clear">
								<c:forEach items="${pagingList}" var="pagingList">
									<li id="resumeNumber" class="resumeNumber"
										value="<c:out value="${pagingList.resumeNumber}" />"
										style="border: 1px solid #ccc;"><a href="#">
											<div class="card">
												<dl class="clear">
													<dt class="photo">
													<c:if test="${pagingList.mainPic == null}">
														<img class="img-circle img-responsive"
															src="./images/img-style_man.jpg" alt="" 
															width="300" height="400">
													</c:if>
													<c:if test="${pagingList.mainPic != null}">		
														<img src="./${pagingList.mainPic}"
															class="img-circle img-responsive" alt=""
															width="300" height="400">
													</c:if>		
													</dt>
													<dd class="infoWrap">
														<ul>
															<li class="info1"><strong class="name"><c:out
																		value="${pagingList.name}" /></strong> <span><c:if
																		test="${pagingList.sex == 0}">(남
			                							</c:if> <c:if test="${pagingList.sex == 1}">
			                							(여
			                							</c:if>, <c:out value="${pagingList.birth}" />세)</span></li>
															<c:set var="title_sub_before" value="${pagingList.title}" />
															<c:if test="${fn:length(title_sub_before)>= 20}">
																<c:set var="title_sub"
																	value="${fn:substring(title_sub_before, 0, 20)}" />
																<li class="info2"><strong><c:out
																			value="${title_sub}" />...</strong></li>
															</c:if>
															<c:if test="${fn:length(title_sub_before) <20}">
																<li class="info2"><strong><c:out
																			value="${title_sub_before}" /></strong></li>
															</c:if>
															<li class="info3"><c:out
																	value="${pagingList.typeEmploy}" /> 희망</li>
															<%-- <c:forEach items="${mainCareer}" var="mainCareer">	
			                								<c:set var="career" value="${career+mainCareer.careerMonth}" />
			                								<c:if test="${career != 0}">
			                							<li class="info3">경력 <c:out value="${career}" />개월</li>
			                							</c:if>
			                							<c:if test="${career == 0}">
			                							<li class="info3">신입</li>
			                							</c:if>
			                							</c:forEach> --%>
														</ul>
													</dd>
												</dl>
												<p class="job_list">
													<c:set var="skill_sub_before"
														value="${pagingList.skillName}" />
													<c:if test="${fn:length(skill_sub_before)>= 30}">
														<c:set var="skill_sub"
															value="${fn:substring(skill_sub_before, 0, 30)}" />
														<c:out value="${skill_sub}" />...
			                				</c:if>
													<c:if test="${fn:length(skill_sub_before) <30}">
														<c:out value="${skill_sub_before}" />
													</c:if>
												</p>
												<div class="card_footWrap clear">
													<div class="area_schedule">
														<span class="area"><c:out
																value="${pagingList.areaName}" /></span> / <span
															class="work_time"><c:out
																value="${pagingList.lastAcademic}" /></span>
													</div>
													<!-- <span class="upload_time">10분전</span> -->
												</div>
											</div>
									</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="dataTables_paginate paging_simple_numbers text-center"
							id="example2_paginate">
							<ul class="pagination">
								<c:if test="${resMap.pageGroup > 1}">
									<li><a
										href="javascript:fnGoPaging(<c:out value='${resMap.prePage}'/>)">Previous</a></li>
								</c:if>

								<c:forEach var="i" begin="${resMap.startPage}"
									end="${resMap.endPage > resMap.totalPage ? resMap.totalPage : resMap.endPage}">

									<c:choose>
										<c:when test="${resMap.page eq i}">
											<li class="active"><a
												href="javascript:fnGoPaging(${i});">${i}</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="javascript:fnGoPaging(${i});">${i}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<c:if test="${resMap.nextPage <= resMap.totalPage}">
									<li><a
										href="javascript:fnGoPaging(<c:out value='${resMap.nextPage}'/>)">Next</a></li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>						
		</div>
		<!-- //container[E]  -->
	</section>
</section>
<!--end wrapper-->

<script type="text/javascript">
	$(document).ready(function(){
		
		//alert("${keyword}");
		
		$(".card_wrap > ul > li:odd").css("border-left","1px solid #ccc");	
		
		$("#keyword").val($(".selected").text());
		
		$("[value='${keyword}']").addClass("selected", true);
		
		$(".selected").css("background-color","#3498db");
		
		$(".selected").css("color", "WHITE");
		
		$(".skillList").css("font-weight", "bold");
		
	});

$(".resumeNumber").hover(function(){
	$(this).css("background-color", "#dcdcdc");
},

function(){
	$(this).css("background-color", "WHITE");
});	

$(".skillList").hover(function(){

	if($(this).hasClass("selected")== false){
		var text = $(this).text().trim()
		
		$(this).css("color", "WHITE");
		
		$(this).css("background-color", "#dcdcdc");
	}
},

function(){
	if($(this).hasClass("selected")== false){
		
		$(this).css("color", "BLACK");
		
		$(this).css("background-color", "");
	}
});

$(".resumeNumber").click(function(){
	var memberId = "<%=session.getAttribute("member_id")%>";
		//alert($(this).val());
		//alert(memberId != null);
		//alert(memberId);

		if (memberId == "null") {
			alert("로그인을 먼저 해주세요");
			left.pageSubmitFn('login');
		}

		if (memberId != "null") {
			$("#resume_detail").val($(this).val());
			resume.pageSubmitFn('resumeDetail');
		}

	});

	$(".skillList").click(function() {

		$(".skillList").prop("selected", false);

		$(".skillList").removeClass("selected");

		$(".skillList").css("background-color", "");
		
		$(".skillList").css("color", "black");

		$(this).addClass("selected", true);

		$(".selected").css("background-color", "#3498db");

		fnGoPaging(1);

		//alert($(".selected").text().trim());

	});

	var resume = {
		pageSubmitFn : function(pageName) {

			$("#pageName").val(pageName);

			$("#resumeFrm").attr("action", pageName + ".jobq");

			$("#resumeFrm").submit();
		}
	}

	function fnGoPaging(page) {

		//location.href = "http://localhost:8080/sample/noPaging.do?page=" + page;
		if($(".selected").text().trim() == "전체"){
			
			$("#page").val(page);

			$("#pagingFrm").attr("action", "paging.jobq");

			$("#pagingFrm").attr("method", "post");

			$("#pagingFrm").submit();
			
		}else{
			
			$("#keyword").val($(".selected").text().trim());

			$("#page").val(page);

			$("#pagingFrm").attr("action", "paging.jobq");

			$("#pagingFrm").attr("method", "post");

			$("#pagingFrm").submit();
		}
	}
</script>


