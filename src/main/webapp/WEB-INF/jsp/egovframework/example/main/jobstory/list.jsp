<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">

 var storyList = {
		 
		 jobstoryDetailFn : function(pageName, storyNum) {
			 
			 $("#pageName").val(pageName);
			 $("#storyNum").val(storyNum);
				
			 $("#frm_story").attr("action", pageName + ".jobq");
			 $("#frm_story").submit();
			 
		 },  regiLoginCheck : function() {
			 	var member_id = "${sessionScope.member_id}";
				 
				 if(member_id == "") {
					 
					 alert("로그인 하세요")
					 
					 location.href="login.jobq";
				 } else{
					 
					 location.href="jobstoryRegister.jobq";
				 
			 }
		 }
		 
		 
 };
 
 function fnGoPaging(page){

		$("#page").val(page);
		
		$("#appFrm").attr("action", "mainJobstory.jobq");	
		
		$("#appFrm").attr("method", "post");

		$("#appFrm").submit();
	}

 
</script>

<form id="appFrm" name="appFrm">
	<input type="hidden" id="page" name="page" />
</form>
<form id="frm_story" name="frm_story" method="get">
	<input type="hidden" id="pageName" name="pageName" /> <input
		type="hidden" id="signTrgNo" name="signTrgNo" /> <input type="hidden"
		id="storyNum" name="storyNum" />
</form>


<!--start wrapper-->
<section class="wrapper">
	<section class="page_head">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<nav id="breadcrumbs">
						<ul>
							<li><a href="#"
								onclick="javascript:left.pageSubmitFn('mainJobstory')">JOB
									STORY</a></li>
						</ul>
					</nav>
					<div class="page_title">
						<h2>JOB STORY</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="content elements">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<div class="row">

						<div class="col-sm-12 col-md-12 col-sm-12 clear mt40">
							<h5 class="hd5">
								<i class="fa fa-quote-left"></i> <span class="hd5_txt">JOB
									STORY</span> <i class="fa fa-quote-right"></i>
							</h5>
							
						<div class="col-sm-12 mrgb-30 btnArea">
							
						<a href="#fakelink" id="btnWrite" class="btn btn-sm btn-social-linkedin" onclick="javascript:storyList.regiLoginCheck()">
						글쓰기 </a>



						</div>
							
						</div>
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="storyWrap">
								<ul>
									<c:forEach var="storyList" items="${storyList}">
										<li class="clear">
										
										<%-- <c:if test= "${storyList.image != null}">         						
										<a href="#" class="thumb" onclick="javascript:storyList.jobstoryDetailFn('jobstoryDetail', ${storyList.number} )">
											<img src="<c:out value="${storyList.image}" />" alt="">
										</a> 
										</c:if> --%>

											<dl style="width : 100%">
												<dt>
												<c:if test= "${storyList.image != null}">         						
													<a href="#" class="thumb" onclick="javascript:storyList.jobstoryDetailFn('jobstoryDetail', ${storyList.number} )">
														<img src="<c:out value="${storyList.image}" />" alt="">
													</a> 
													</c:if>
													<a href="#" onclick="javascript:storyList.jobstoryDetailFn('jobstoryDetail', ${storyList.number} )">
														<c:out value="${storyList.title}" />
												</dt>
												<dd class="story_txt" style="width : 100%">

													<c:out value="${storyList.content}" />
													</a>
												</dd>

												<dd class="last clear">
													<span class="name"><c:out value="${storyList.id}" />
														| <span><c:out value="${storyList.date}" /></span>
													</span> 
													<span class="clickCount">조회수 
														<c:out value="${storyList.hits}" /> | <span>댓글수 <c:out
																value="${storyList.commentsCNT}" /></span></span>
												</dd>
											</dl>

										</li>
									</c:forEach>
								</ul>

							</div>

						</div>



						<div class="col-sm-12">
							<div
								class="dataTables_paginate paging_simple_numbers text-center"
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
		</div>
		<!-- //container[E]  -->
	</section>
</section>
<!--end wrapper-->