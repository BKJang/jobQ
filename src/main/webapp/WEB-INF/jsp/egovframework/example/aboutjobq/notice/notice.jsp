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
<form id="noticeDetailFrm" name="noticeDetailFrm">
	<input type="hidden" id="noticeNumber" name="noticeNumber" />
</form>
<!--start wrapper-->
<section class="wrapper">
	<section class="page_head">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					
					<div class="page_title">
						<h2>Notice</h2>
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
							<span>공지 사항</span> <span class="bar_gray"> | </span><span
								class="total_top"><c:out value="${noticeCnt.totalTotCnt}" />건</span>
						</h4>
						
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
									
									<td>문의 내역이 없습니다.</td>
								</tr>	
							</tbody>
						</table>		
						</c:if>	
						<c:if test="${pagingCnt.totalTotCnt != 0}">	
						<table class="table table-striped table-hover" style="text-align : center;">
							<colgroup>
								
								<col width="*" />
								<col width="25%" />
								<col width="25%" />							
							</colgroup>
							<thead>
								<tr>
													
									<th>제목</th>
									<th>등록 날짜</th>
									<th>수정 날짜</th>
								</tr>
							</thead>							
							<tbody id="submitAppId">
								<c:forEach var="noticeList" items="${noticeList}">							
								<tr class="clickId">
								
									<td style="display:none;"><c:out value="${noticeList.nNumber}" /> </td>
									<td><a href="javascript:fnGoNoticeDetail(<c:out value='${noticeList.nNumber}'/>)"> 
											<strong><c:out value="${noticeList.nTitle}" /></strong>
									</a></td>
									
									<td><c:out value="${noticeList.nDateRegi}" /></td>
									<c:if test="${noticeList.nDateModi == null}">
										<td>미 수정</td>
									</c:if>
									<c:if test="${noticeList.nDateModi != null}">
										<td><c:out value="${noticeList.nDateModi}" /></td>
									</c:if>	
									
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
	
	$("#appFrm").attr("action", "notice.jobq");	
	
	$("#appFrm").attr("method", "post");

	$("#appFrm").submit();
}

function fnGoNoticeDetail(noticeNumber){
	
	$("#noticeNumber").val(noticeNumber);
	
	$("#noticeDetailFrm").attr("action", "noticeDetail.jobq");	
	
	$("#noticeDetailFrm").attr("method", "post");

	$("#noticeDetailFrm").submit();
}

$(".clickId").hover(function(){

		$(this).css("color", "WHITE");
		
		$(this).css("background-color", "#dcdcdc");
},

function(){
		
		$(this).css("color", "BLACK");
		
		$(this).css("background-color", "");
});



</script>


