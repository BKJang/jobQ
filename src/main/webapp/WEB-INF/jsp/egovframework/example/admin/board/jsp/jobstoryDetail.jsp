<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Main bar -->
<div class="mainbar">
	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			JobStory 
			<span class="page-meta">jobstory 상세 / 삭제</span>
		</h2>
		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right" style="text-align:right;">
			<a href="<c:url value="/admin/main" />"><i class="fa fa-home"></i> Home</a>
			<br />
			<span>게시판 관리&nbsp;-&nbsp;<strong style="font-size:18px;">잡 스토리 관리</strong></span>
		</div>
		<div class="clearfix"></div>
	</div>
	<!--/ Page heading ends -->

	<!-- Matter -->
	<div class="matter">
		<div class="container">

			<div class="widget">
				<div class="widget-content" style="border: 0px solid #ffffff;">
					<div class="padd" style="padding: 0px 15px; padding-bottom : 15px;">
							<table class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								<tr>
									<td class="table-name" style="vertical-align: middle;">아이디</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; width: 60%; display: inline-block;">
											${jobstory.id}
										</div>
									</td>

									<td class="table-name" style="vertical-align: middle;">작성일</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; width: 60%; display: inline-block;">
											${jobstory.regDate.toString().substring(0, 10)}
										</div>
									</td>
								</tr>
								<tr>
									<td class="table-name" style="vertical-align: middle;">제목</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; width: 60%; display: inline-block;">
											${jobstory.title}
										</div>
									</td>

									<td class="table-name" style="vertical-align: middle;">조회수</td>
									<td width="35%" style="vertical-align: middle;">
										<div class="form-group" style="margin: 0px; width: 60%; display: inline-block;">
											<div class="form-group" style="margin: 0px; display: inline-block;">
												${jobstory.hits}
											</div>
										</div>
									</td>
								</tr>

								<!-- 내용 -->

								<tr>
									<td colspan="4">
										${jobstory.content}										
									</td>
								</tr>
								
							<!-- 이전 페이지 -->
							<c:if test="${jobstory.boardPage.prev eq 0 && jobstory.boardPage.next ne 0}">
							<tr>
								<td class="table-name" style="vertical-align: middle;">다음 글</td>
								<td width="80%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
									<a href="<c:url value='/admin/board/jobstory/detail/${prevAndNext[0].no}' />" style="opacity: 0.7;">${prevAndNext[0].title}</a>
								</td>
							</tr>
							</c:if>
								
							<c:if test="${jobstory.boardPage.prev ne 0 && jobstory.boardPage.next eq 0}">
								<tr>
								<td class="table-name" style="vertical-align: middle;">이전 글</td>
								<td width="80%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
									<a href="<c:url value='/admin/board/jobstory/detail/${prevAndNext[0].no}' />" style="opacity: 0.7;">${prevAndNext[0].title}</a>
								</td>
							</tr>								
							</c:if>	
								
							<c:if test="${jobstory.boardPage.prev ne 0 && jobstory.boardPage.next ne 0}">
							<tr>
								<td class="table-name" style="vertical-align: middle;">이전 글</td>
								<td width="80%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
									<a href="<c:url value='/admin/board/jobstory/detail/${prevAndNext[0].no}' />" style="opacity: 0.7;">${prevAndNext[0].title}</a>
								</td>
							</tr>
							<tr>
								<td class="table-name" style="vertical-align: middle;">다음 글</td>
								<td width="80%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
								<a href="<c:url value='/admin/board/jobstory/detail/${prevAndNext[1].no}' />" style="opacity: 0.7;">${prevAndNext[1].title}</a></td>
							</tr>
							</c:if>	
								
							<!-- 다음 페이지 끝 -->
							</table>
					</div>
				</div>
				
				<hr style="margin-left : 15px !important; margin-right : 15px !important; border : 3px solid #ddd;" />
				
				<div class="padd">
					<table class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								<tr style="display : none;">
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								
								<tr>
									<td colspan="4" style="background-color : rgb(249, 249, 249);">
										<c:choose>
											<c:when test="${jobstory.reply.size() == 0}">
												<strong>댓글이 없습니다.</strong>
											</c:when>
											<c:otherwise>
												<strong>댓글 ${jobstory.reply.size()}</strong>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								
								<c:forEach var="reply" items="${jobstory.reply}">
									<tr>
										<td width="10%" align="center" style="background-color : rgb(249, 249, 249); height : 100%; vertical-align: middle;">
											<strong class="reply-id" style="cursor : pointer;">${reply.id}</strong>
										</td>
										<td colspan="2" width="74%" >
											<c:out value='${reply.content}' escapeXml="false" /><strong class="reply-delete-btn" style="cursor : pointer;" data-reply-no="${reply.replyNo}"> [댓글 삭제] </strong>
										</td>
										<td width="16%" align="center" style="background-color : rgb(249, 249, 249); height : 100%; vertical-align: middle;">
											<strong>${reply.regDate.toString().substring(0, 19)}</strong>
										</td>
									</tr>
								</c:forEach>
							</table>
				</div>
				
				<hr style="margin-left : 15px !important; margin-right : 15px !important; border : 3px solid #ddd;" />
				
				<div class="widget-foot" style="text-align: center; padding: 4px 0px; background-color: #ffffff; border: 0px;">
					<div class="padd" style="padding-top: 0px;">
						<form action="<c:url value="/admin/board/jobstory/reply" />" method="post">
							<input type="hidden" name="boardNo" value="${jobstory.no}" />
							
							<table class="table" style="border: solid 0px #ddd; border-collapse: collapse;">
								<tr style="display : none;">
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td colspan="4" style="border : solid 0px white;" align="left">
										<div class="pull-left" >
											<span>아이디 : </span><input type="text" class="form-control" name="id" value="${sessionScope.login.id}" readOnly style="width : 60%; display : inline-block;"/>
										</div>
									</td>
								</tr>
								
								<tr style="border : solid 1px #ddd;">
									<td colspan="3" width="90%" style="background-color : rgb(249, 249, 249);">
										<textarea id="reply-content" name="content" rows="4" style="width : 100%;"></textarea>
									</td>
									
									<td width="10%" style="background-color : rgb(249, 249, 249); height : 100%; vertical-align: middle;">
										<button type="submit" id="jobstory-reply-btn" class="btn btn-default" style="width:100%; height : 72px;">등록</button>
									</td>
								</tr>
							</table>
						</form>
					</div>
					
					<div class="pull-right">
						<button type="button" class="btn btn-default" id="jobstory-list-btn">리스트</button>
						<button type="button" class="btn btn-default" id="jobstory-delete-btn">삭제</button>
					</div>
				</div>
			</div>


		</div>
	</div>
	<!--/ Matter ends -->
</div>
<!--/ Mainbar ends -->
