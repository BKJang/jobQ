<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Main bar -->
<div class="mainbar">
	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			F A Q 상세
		</h2>
		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right" style="text-align: right;">
			<a href="<c:url value="/admin/main.jobq" />"><i
				class="fa fa-home"></i>Home</a> <br /> <span>고객 문의&nbsp;-&nbsp;F
				A Q&nbsp;-&nbsp;<strong style="font-size: 18px;">F A Q 상세</strong>
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
									<td class="table-name" style="vertical-align: middle;">카테 고리</td>
									<td width="35%">
										<span class="detail-page">${faq.subject}</span>
										<input type="text" name="subject" id="subject" class="form-control update-page" value="${faq.subject}" style="display : none;"/>
									</td>

									<td class="table-name" style="vertical-align: middle;">작성일</td>
									<td width="35%">
										<span class="detail-page">${faq.regDate.toString().substring(0, 10)}</span>
										<input type="date" name="reg-date" id="reg-date" class="form-control update-page" value="${faq.regDate.toString().substring(0, 10)}" style="display : none;" readOnly/>
									</td>

								</tr>

								<!-- 휴대폰 -->

								<tr>
									<td class="table-name" style="vertical-align: middle;">제목</td>
									<td width="35%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<span class="detail-page">${faq.title}</span>
										<input type="text" name="title" id="title" class="form-control update-page" value="${faq.title}" style="display : none;" />
									</td>
								</tr>
							</table>
								<!-- 휴대폰 끝 -->
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
										<span class="detail-page">${faq.content}</span>
										<div class="update-page" style="display : none;">
											<textarea name="faq-update-editor" id="faq-update-editor" rows="10" cols="80">
												${faq.content}
											</textarea>
										</div>
									</td>
								</tr>
							
							<!-- 이전 페이지 -->	
								
							<c:if test="${faq.boardPage.prev eq 0 && faq.boardPage.next ne 0}">
							<tr class="detail-page">
								<td class="table-name" style="vertical-align: middle;">다음 글</td>
								<td width="80%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
									<a href="<c:url value='/admin/inquire/faq/detail/${prevAndNext[0].no}' />" style="opacity: 0.7;">${prevAndNext[0].title}</a>
								</td>
							</tr>
							</c:if>
								
							<c:if test="${faq.boardPage.prev ne 0 && faq.boardPage.next eq 0}">
							<tr class="detail-page">
								<td class="table-name" style="vertical-align: middle;">이전 글</td>
								<td width="80%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
									<a href="<c:url value='/admin/inquire/faq/detail/${prevAndNext[0].no}' />" style="opacity: 0.7;">${prevAndNext[0].title}</a>
								</td>
							</tr>								
							</c:if>	
								
							<c:if test="${faq.boardPage.prev ne 0 && faq.boardPage.next ne 0}">
							<tr class="detail-page">
								<td class="table-name" style="vertical-align: middle;">이전 글</td>
								<td width="80%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
									<a href="<c:url value='/admin/inquire/faq/detail/${prevAndNext[0].no}' />" style="opacity: 0.7;">${prevAndNext[0].title}</a>
								</td>
							</tr>
							<tr class="detail-page">
								<td class="table-name" style="vertical-align: middle;">다음 글</td>
								<td width="80%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
								<a href="<c:url value='/admin/inquire/faq/detail/${prevAndNext[1].no}' />" style="opacity: 0.7;">${prevAndNext[1].title}</a></td>
							</tr>
							</c:if>	
							
							<!-- 다음 페이지 -->
							
							</table>
						<!-- 내용 끝 -->
					</div>
				</div>

				<div class="widget-foot" style="text-align: center; padding: 4px 0px; background-color: #ffffff; border: 0px;">
					<div class="padd" style="padding-top:0px;">
						
						<div class="pull-right">
							<button type="button" class="btn btn-default" id="faq-list-btn">리스트</button>
							<button type="button" class="btn btn-default detail-page" id="faq-update-btn">수정</button>
							<button type="button" class="btn btn-default update-page" id="faq-update-regist-btn" style="display : none;">확인</button>
							<button type="button" class="btn btn-default detail-page" id="faq-delete-btn">삭제</button>
						</div>
					</div>
				</div>
			</div>


		</div>
	</div>
	<!--/ Matter ends -->
</div>
<!--/ Mainbar ends -->
