<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Main bar -->
<div class="mainbar">
	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			공지 사항
			<!-- page meta -->
			<span class="page-meta">공지 사항 검색 / 추가 / 수정 / 삭제</span>
		</h2>
		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right" style="text-align:right;">
			<a href="<c:url value="/admin/main.jobq" />"><i class="fa fa-home"></i> Home</a>
			<br />
			<span>게시판 관리&nbsp;-&nbsp;<strong style="font-size:18px;">공지 사항</strong></span>
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
						<form style="margin-bottom:0px;">
							<table class="table"
								style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								<tr>
									<td class="table-name" style="vertical-align: middle;">담당자 아이디</td>
									<td width="35%" style="vertical-align: middle;">
										<div class="form-group" style="margin: 0px; width: 60%; display: inline-block;">
											<span class="detail-page">${notice.id}</span>
											<input type="text" name="id" id="id" class="form-control update-page" value="${notice.id}" style="display : none;" readOnly/>
										</div>
									</td>

									<td class="table-name" style="vertical-align: middle;">작성일</td>
									<td width="35%" style="vertical-align: middle;">
										<div class="form-group" style="margin: 0px; width: 60%; display: inline-block;">
											<span class="detail-page">${notice.regDate.toString().substring(0, 10)}</span>
											<input type="date" name="reg-date" id="reg-date" class="form-control update-page" value="${notice.regDate.toString().substring(0, 10)}" style="display : none;" readOnly/>
										</div>
									</td>
								</tr>
								<tr>
									<td class="table-name" style="vertical-align: middle;">제목</td>
									<td colspan="3" width="35%" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="width: 100%; margin: 0px; display: inline-block;">
											<span class="detail-page">${notice.title}</span>
											<input type="text" name="title" id="title" class="form-control update-page" value="${notice.title}" style="display : none;" />
										</div>
									</td>
								</tr>

								<tr>
									<td colspan="4">
										<span class="detail-page">${notice.content}</span>
										<div class="update-page" style="display : none;">
											<textarea name="notice-update-editor" id="notice-update-editor" rows="10" cols="80">
												${notice.content}
											</textarea>
										</div>
									</td>
								</tr>
								
							<!-- 이전 페이지 -->	
								
							<c:if test="${notice.boardPage.prev eq 0 && notice.boardPage.next ne 0}">
							<tr class="detail-page">
								<td class="table-name" style="vertical-align: middle;">다음 글</td>
								<td width="80%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
									<a href="<c:url value='/admin/board/notice/detail/${prevAndNext[0].no}' />" style="opacity: 0.7;">${prevAndNext[0].title}</a>
								</td>
							</tr>
							</c:if>
								
							<c:if test="${notice.boardPage.prev ne 0 && notice.boardPage.next eq 0}">
							<tr class="detail-page">
								<td class="table-name" style="vertical-align: middle;">이전 글</td>
								<td width="80%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
									<a href="<c:url value='/admin/board/notice/detail/${prevAndNext[0].no}' />" style="opacity: 0.7;">${prevAndNext[0].title}</a>
								</td>
							</tr>								
							</c:if>	
								
							<c:if test="${notice.boardPage.prev ne 0 && notice.boardPage.next ne 0}">
							<tr class="detail-page">
								<td class="table-name" style="vertical-align: middle;">이전 글</td>
								<td width="80%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
									<a href="<c:url value='/admin/board/notice/detail/${prevAndNext[0].no}' />" style="opacity: 0.7;">${prevAndNext[0].title}</a>
								</td>
							</tr>
							<tr class="detail-page">
								<td class="table-name" style="vertical-align: middle;">다음 글</td>
								<td width="80%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
								<a href="<c:url value='/admin/board/notice/detail/${prevAndNext[1].no}' />" style="opacity: 0.7;">${prevAndNext[1].title}</a></td>
							</tr>
							</c:if>	
							
							<!-- 다음 페이지 -->
							
							</table>
						</form>
						
					</div>
				</div>

				<div class="widget-foot" style="text-align: center; padding: 4px 0px; background-color: #ffffff; border: 0px;">
					<div class="padd" style="padding-top: 0px;">
					
						<div class="pull-right">
							<button type="button" class="btn btn-default" id="notice-list-btn">리스트</button>
							<button type="button" class="btn btn-default detail-page" id="notice-update-btn">수정</button>
							<button type="button" class="btn btn-default update-page" id="notice-update-regist-btn" style="display : none;">확인</button>
							<button type="button" class="btn btn-default detail-page" id="notice-delete-btn">삭제</button>
						</div>
					</div>
				</div>
			</div>


		</div>
	</div>
	<!--/ Matter ends -->
</div>
<!--/ Mainbar ends -->
