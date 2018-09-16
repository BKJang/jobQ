<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Main bar -->
<div class="mainbar">
	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			Q & A
			<!-- page meta -->
			<span class="page-meta detail-page">Q & A 상세 / 답글 / 삭제</span>
			<span class="page-meta update-page" style="display : none;">Q & A 답글</span>
		</h2>
		<div class="bread-crumb pull-right" style="text-align: right;">
			<a href="<c:url value="/admin/main" />"><i class="fa fa-home"></i>Home</a> <br /> 
				<span>고객 문의&nbsp;-&nbsp;Q & A&nbsp;-&nbsp;
					<strong class="detail-page" style="font-size: 18px;">Q & A 상세 페이지</strong>
					<strong class="update-page" style="font-size: 18px; display : none;">Q & A 답글 페이지</strong>
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
							<table class="table"
								style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								<tr>
									<td class="table-name detail-page" style="vertical-align: middle;">회원 아이디</td>
									<td class="table-name update-page" style="vertical-align: middle; display : none;">담당자 아이디</td>
									<td width="35%">
										<span class="detail-page">${qna.id}</span>
										<input type="text" name="id" id="id" class="form-control update-page" value="${sessionScope.login.id}" style="display : none; width : 50%;" readOnly />
									</td>
									
									<td class="table-name" style="vertical-align: middle;">작성일</td>
									<td width="35%">
										<span class="detail-page">${qna.regDate.toString().substring(0, 10)}</span>
										<input type="date" name="reg-date" id="reg-date" class="form-control update-page" value="${qna.regDate.toString().substring(0, 10)}" style="display : none; width : 50%;" readOnly/>
									</td>
								</tr>
								
								<tr class="detail-page">
									<td class="table-name" style="vertical-align: middle;">제목</td>
									<td colspan="3" width="35%" style="border: solid 1px rgb(221, 221, 221);">
										<span class="detail-page">${qna.title}</span>
										<input type="text" name="title" id="title" class="form-control update-page" value="${qna.title}" style="display : none;" />
									</td>
								</tr>
							</table>
						</form>
					</div>
					
					<div class="padd">
						<!-- 내용 -->
							<table class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse; padding-top:10px;">
								<tr>
									<td class="table-name" colspan="4" style="vertical-align: middle;">내용</td>
								</tr>
								<tr>
									<td colspan="4" style="border: solid 1px rgb(221, 221, 221);">
										<span class="detail-page">${qna.content}</span>
										<div class="update-page" style="display : none;">
											<textarea name="qna-reply-editor" id="qna-reply-editor" rows="10" cols="80">
												
											</textarea>
										</div>
									</td>
								</tr>
							
							<!-- 이전 페이지 -->	
								
							<c:if test="${qna.boardPage.prev eq 0 && qna.boardPage.next ne 0}">
								<tr class="detail-page">
									<td class="table-name" style="vertical-align: middle;">다음 글</td>
									<td width="80%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<a href="<c:url value='/admin/inquire/qna/detail/${prevAndNext[0].no}' />" style="opacity: 0.7;">${prevAndNext[0].title}</a>
									</td>
								</tr>
							</c:if>
								
							<c:if test="${qna.boardPage.prev ne 0 && qna.boardPage.next eq 0}">
								<tr class="detail-page">
									<td class="table-name" style="vertical-align: middle;">이전 글</td>
									<td width="80%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<a href="<c:url value='/admin/inquire/qna/detail/${prevAndNext[0].no}' />" style="opacity: 0.7;">${prevAndNext[0].title}</a>
									</td>
								</tr>								
							</c:if>	
								
							<c:if test="${qna.boardPage.prev ne 0 && qna.boardPage.next ne 0}">
								<tr class="detail-page">
									<td class="table-name" style="vertical-align: middle;">이전 글</td>
									<td width="80%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<a href="<c:url value='/admin/inquire/qna/detail/${prevAndNext[0].no}' />" style="opacity: 0.7;">${prevAndNext[0].title}</a>
									</td>
								</tr>
								<tr class="detail-page">
									<td class="table-name" style="vertical-align: middle;">다음 글</td>
									<td width="80%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
									<a href="<c:url value='/admin/inquire/qna/detail/${prevAndNext[1].no}' />" style="opacity: 0.7;">${prevAndNext[1].title}</a></td>
								</tr>
							</c:if>	
							
							<!-- 다음 페이지 -->
							
							</table>
						<!-- 내용 끝 -->
					</div>
				</div>
					
				<c:if test="${qna.replyId ne null}">
					<hr style="margin-left : 15px !important; margin-right : 15px !important; border : 2px solid #ddd;" />
					
					<div class="padd">
						<table class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
							<tr style="display : none;">
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							
							<tr>
								<td style="background-color : rgb(249, 249, 249); border-right : 0px;">
									<strong>답변 내용</strong>
								</td>
								<td align="right" colspan="3" style="background-color : rgb(249, 249, 249); border-left : 0px;">
									<strong>${qna.replyRegDate.toString().substring(0, 10)}</strong>
								</td>
							</tr>
							
							<tr>
								<td width="10%" align="center" style="background-color : rgb(249, 249, 249); height : 100%; vertical-align: middle;">
									<strong>내용</strong>
								</td>
								<td colspan="3" width="80%" >
									${qna.replyContent}
								</td>
							</tr>
						</table> 
					</div>
				</c:if>
				
				<c:if test="${qna.replyId eq null}">
				
				</c:if>				
				
				<div class="widget-foot" style="text-align: center; padding: 4px 0px; background-color: #ffffff; border: 0px;">
					<div class="padd" style="padding-top:0px;">
						
						<div class="pull-right">
							<button type="button" class="btn btn-default" id="qna-list-btn">리스트</button>
							
							<c:if test="${qna.replyId eq null}">
								<button type="button" class="btn btn-default detail-page" id="qna-reply-btn">답글</button>
							</c:if>								
							<c:if test="${qna.replyId ne null}">
				
							</c:if>	
							
							<button type="button" class="btn btn-default update-page" id="qna-reply-regist-btn" style="display : none;">등록</button>
							<button type="button" class="btn btn-default detail-page" id="qna-delete-btn">삭제</button>
						</div>
					</div>
				</div>
			</div>


		</div>
	</div>
	<!--/ Matter ends -->
</div>
<!--/ Mainbar ends -->
