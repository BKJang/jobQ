<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style type="text/css">
	th{
		text-align : center;
	}
</style>

<form id="appFrm" name="appFrm">
	<input type="hidden" id="page" name="page" />
</form>
<form id="submitFrm" name="submitFrm">
	<input type="hidden" id="appId" name="appId" />
</form>
<form id="jobDetailFrm" name="jobDetailFrm">
	<input type="hidden" id="gonggoID" name="gonggoID" />
</form>
<!--start wrapper-->
<section class="wrapper">
	<section class="page_head">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					
					<div class="page_title">
						<h2>지원 현황</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="content elements">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="dividerHeading">
						<h4>
							<span>나의 지원현황</span> <span class="bar_gray"> | </span><span
								class="total_top"><c:out value="${pagingCnt.totalTotCnt}" />건</span>
						</h4>
						<c:if test="${pagingCnt.totalTotCnt != 0}">
						<span style="float: right">
						 	<button class="btn btn-primary" id="deleteBtn">삭제</button>
						</span>
						<span style="float: right"> 
							<button class="btn btn-danger" id="cancelBtn">지원취소</button>	
						</span>
						</c:if>
					</div>
				</div>
			</div>
			<!--Sidebar Widget-->
			
			<div class="sidebar">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 tbl_vertical">
						<p>
						<form id="jobNumFrm" name="jobNumFrm">
						<c:if test="${pagingCnt.totalTotCnt == 0}">
						<table class="table table-striped table-hover" style="text-align : center;">
							<tbody>
							<colgroup>
								<col width="100%" />							
							</colgroup>							
							<tbody id="submitAppId">
								
								<tr class="clickId">
									
									<td>나의 지원 내역이 없습니다.</td>
								</tr>	
							</tbody>
						</table>		
						</c:if>	
						<c:if test="${pagingCnt.totalTotCnt != 0}">	
						<table class="table table-striped table-hover" style="text-align : center;">
							<colgroup>
								<col width="*" />
								<col width="20%" />
								<col width="20%" />
								<col width="10%" />
								<col width="10%" />
								<col width="10%" />
							</colgroup>
							<thead>
								<tr>
									<th>기업명</th>
									<th>모집 제목</th>
									<th>지원일</th>
									<th>공고마감일</th>
									<th>모집인원수</th>
									<th>합격여부</th>
									<th>지원취소여부</th>
								</tr>
							</thead>							
							<tbody id="submitAppId">								
								<c:forEach var="pagingList" items="${pagingList}">							
								<tr class="clickId">
								
									<td style="display:none;"><c:out value="${pagingList.appId}" /> </td>
									<td><strong><c:out value="${pagingList.name}" /></strong></td>
									<td><a href="javascript:fnGoJobDetail(<c:out value='${pagingList.jobNumber}'/>)"> 
											<strong><c:out value="${pagingList.title}" /></strong>
									</a></td>
									<td><c:out value="${pagingList.dateApply}" /></td>
									<td><c:out value="${pagingList.dateClose}" /></td>
									<td><c:out value="${pagingList.numberEmploy}" />명</td>
									<td>
									<c:if test="${pagingList.state == 0}">
									미정
									</c:if>
									<c:if test="${pagingList.state == 1}">
									<font color="blue">합격</font>
									</c:if>
									<c:if test="${pagingList.state == 2}">
									<font color="red">불합격</font>
									</c:if>
									</td>
									<td>
									<c:if test="${pagingList.cancel == 0}">
									<font color="blue">지원완료</font>
									</c:if>
									<c:if test="${pagingList.cancel == 1}">
									<font color="red">지원취소</font>
									</c:if>
									</td>
								</tr>
								</c:forEach>							
							</tbody>							
						</table>
						</c:if>
						</form>
						
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
<script type="text/javascript">

function fnGoPaging(page){

	$("#page").val(page);
	
	$("#appFrm").attr("action", "personApplication.jobq");	
	
	$("#appFrm").attr("method", "post");

	$("#appFrm").submit();
}

function fnGoJobDetail(jobNumber){
	
	$("#gonggoID").val(jobNumber);
	
	$("#jobDetailFrm").attr("action", "jobDetail.jobq");	
	
	$("#jobDetailFrm").attr("method", "post");

	$("#jobDetailFrm").submit();
}

$(".clickId").click(function(){
	if (!$(this).hasClass("selected")) {
		
		$(this).css("background-color", "GRAY");
		$(this).css("color", "white");
		$(this).addClass("selected");
	}else{
	
		$(this).css("background-color", "");
		$(this).css("color", "black");
		$(this).removeClass("selected");
	}
});

$("#deleteBtn").click(function(){
	if(confirm("지원 현황 삭제시 합격 및 지원이 취소됩니다. 정말 삭제하시겠습니까?") == true){
		app.pageSubmitFn("deleteApplication");
	}else{
		return;
	}
	
});

$("#cancelBtn").click(function(){
	
	app.pageSubmitFn("cancelApplication");
})

var app = {
	pageSubmitFn : function(pageName){
		
		$("#submitAppId").children().each(function(){
			
			if ($(this).hasClass("selected")) {
				//alert($(this).children("td:eq(0)").text());
				if ($("#appId").val() != '') {
					
					$("#appId").val($("#appId").val() + ","); 
				}
				$("#appId").val($("#appId").val() + $(this).children("td:eq(0)").text());
			}
			
		});

		$("#submitFrm").attr("action", pageName + ".jobq");	
		
		$("#submitFrm").attr("method", "post");

		$("#submitFrm").submit();
	}
}

</script>


