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
			<span class="page-meta">공지 사항 추가</span>
		</h2>
		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right" style="text-align:right;">
			<a href="<c:url value="/admin/main.jobq" />"><i class="fa fa-home"></i> Home</a>
			<br />
			<span>게시판 관리&nbsp;-&nbsp;<strong style="font-size:18px;">공지 사항 추가</strong></span>
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
							<table class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								<tr>
									<td class="table-name" style="vertical-align: middle;">담당자 아이디</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; width: 60%; display: inline-block;">
											<input type="text" name="id" id="id" class="form-control" value="${sessionScope.login.id}" readOnly/>
										</div>
									</td>
									
									<td class="table-name" style="vertical-align: middle;">작성일</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; width: 60%; display: inline-block;">
											<input type="date" name="reg-date" id="reg-date" class="form-control" readOnly/>
										</div>
									</td>
								</tr>
								<tr>
									<td class="table-name" style="vertical-align: middle;">제목</td>
									<td colspan="3" width="35%" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="width: 30%; margin: 0px; display: inline-block;">
											<input type="text" name="title" id="title" class="form-control" />
										</div>
									</td>
								</tr>

								<!-- 내용 -->

								<tr>
									<td colspan="4">
										<textarea name="" id="notice-regist-editor" rows="10" cols="80"></textarea>
									</td>
								</tr>
								
								<!-- 내용 끝 -->
							</table>
						</form>
						
					</div>
				</div>

				<div class="widget-foot" style="text-align: center; padding: 4px 0px; background-color: #ffffff; border: 0px;">
					<div class="padd" style="padding-top : 0px;">
						<button type="button" class="btn btn-default" id="notice-regist-btn">등록</button>
						<button type="button" class="btn btn-default" id="notice-cancle-btn">취소</button>
					</div>
				</div>
			</div>


		</div>
	</div>
	<!--/ Matter ends -->
</div>
<!--/ Mainbar ends -->
