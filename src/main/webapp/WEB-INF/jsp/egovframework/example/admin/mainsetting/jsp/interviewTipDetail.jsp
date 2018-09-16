<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Main bar -->
<div class="mainbar">
	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			면접 Tip 상세
			<span class="page-meta">면접 Tip 상세 / 수정 / 삭제</span>
		</h2>
		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right" style="text-align: right;">
			<a href="<c:url value="/admin/main.jobq" />"><i
				class="fa fa-home"></i>Home</a> <br /> <span>메인 관리&nbsp;-&nbsp;면접 Tip 관리&nbsp;-&nbsp;<strong style="font-size: 18px;">면접 Tip 상세</strong>
			</span>
		</div>
		<div class="clearfix"></div>
	</div>
	<!--/ Page heading ends -->

	<!-- Matter -->
	<div class="matter">
		<div class="container">

			<div class="widget">
				<div class="widget-content" style="border: 0px solid #ffffff;">
					<div class="padd" style="padding: 0px 15px;">
						
						<form>
							<table class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								
								<tr>
									<td class="table-name" style="vertical-align: middle;">작성자</td>
									<td width="35%">
										<span>${interview.id}</span>
									</td>

									<td class="table-name" style="vertical-align: middle;">작성일</td>
									<td width="35%" style="border: solid 1px rgb(221, 221, 221);">
										<span>${interview.regDate.toString().substring(0, 10)}</span>
									</td>
								</tr>
								
							</table>
						</form>
						
					</div>
					
					<div class="padd">
							<table class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse; padding-top:10px;">
								<tr>
									<td class="table-name" colspan="4" style="vertical-align: middle;">내용</td>
								</tr>
								<tr>
									<td colspan="4" style="border: solid 1px rgb(221, 221, 221);">
											${interview.content}
									</td>
								</tr>
							
							<c:if test="${interview.boardPage.prev eq 0 && interview.boardPage.next ne 0}">
								<tr>
									<td class="table-name" style="vertical-align: middle;">다음 글</td>
									<td width="80%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
									<a href="<c:url value='/admin/mainsetting/interview/detail/${interview.boardPage.next}' />" style="opacity: 0.7;">${preNextContent[0].content}</a></td>
								</tr>
							</c:if>
							
							<c:if test="${interview.boardPage.prev ne 0 && interview.boardPage.next eq 0}">
								<tr>
									<td class="table-name" style="vertical-align: middle;">이전 글</td>
									<td width="80%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
									<a href="<c:url value='/admin/mainsetting/interview/detail/${interview.boardPage.prev}' />" style="opacity: 0.7;">${preNextContent[0].content}</a></td>
								</tr>
							</c:if>
							
							
							<c:if test="${interview.boardPage.prev ne 0 && interview.boardPage.next ne 0}">
								<tr>
									<td class="table-name" style="vertical-align: middle;">이전 글</td>
									<td width="80%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<a href="<c:url value='/admin/mainsetting/interview/detail/${interview.boardPage.prev}' />" style="opacity: 0.7;">${preNextContent[0].content}</a>
									</td>
								</tr>
								<tr>
									<td class="table-name" style="vertical-align: middle;">다음 글</td>
									<td width="80%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
									<a href="<c:url value='/admin/mainsetting/interview/detail/${interview.boardPage.next}' />" style="opacity: 0.7;">${preNextContent[1].content}</a></td>
								</tr>
							</c:if>
							</table>
					</div>
				</div>

				<div class="widget-foot" style="text-align: center; padding: 4px 0px; background-color: #ffffff; border: 0px;">
					<div class="padd" style="padding-top:0px;">
						
						<div class="pull-right">
							<button type="button" class="btn btn-default" id="interview-list-btn">리스트</button>
							<button type="button" class="btn btn-default" id="interview-update-btn">수정</button>
							<button type="button" class="btn btn-default" id="interview-delete-btn">삭제</button>
						</div>
					</div>
				</div>
			</div>


		</div>
	</div>
	<!--/ Matter ends -->
</div>
<!--/ Mainbar ends -->
