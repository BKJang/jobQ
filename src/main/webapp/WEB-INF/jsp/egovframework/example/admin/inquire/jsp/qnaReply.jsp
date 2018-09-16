<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Main bar -->
<div class="mainbar">
	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			댓글 추가 <span class="page-meta">Q & A 댓글 추가</span>
		</h2>
		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right" style="text-align: right;">
			<a href="<c:url value="/admin/main.jobq" />"><i
				class="fa fa-home"></i>Home</a> <br /> <span>고객 문의&nbsp;-&nbsp;Q
				& A&nbsp;-&nbsp;<strong style="font-size: 18px;">댓글 추가</strong>
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
									<td class="table-name" style="vertical-align: middle;">회원
										아이디</td>
									<td width="35%">
										<div class="form-group"
											style="margin: 0px; width: 60%; display: inline-block;">
											<input type="email" class="form-control" value="dbsdy123"
												readOnly />
										</div>
									</td>

									<td class="table-name" style="vertical-align: middle;">회원
										이메일</td>
									<td width="35%">
										<div class="form-group"
											style="margin: 0px; width: 60%; display: inline-block;">
											<input type="email" class="form-control"
												value="dbsdy1235@xxxxxxx.com" readOnly />
										</div>
									</td>
								</tr>
								<tr>
									<td class="table-name" style="vertical-align: middle;">제목</td>
									<td width="35%" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group"
											style="width: 60%; margin: 0px; display: inline-block;">
											<input type="text" class="form-control"
												value="IP보안 사용방법이 어떻게 되나요?" readOnly />
										</div>
									</td>

									<td class="table-name" style="vertical-align: middle;">작성일</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; width: 60%; display: inline-block;">
											<input type="date" class="form-control" value="2017-07-27" readOnly />
										</div>
									</td>

								</tr>

								<!-- 휴대폰 -->

							</table>
							<!-- 휴대폰 끝 -->
						</form>
					</div>

					<div class="padd">
						<!-- 내용 -->
						<table class="table"
							style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse; padding-top: 10px;">
							<tr>
								<td class="table-name" colspan="4"
									style="vertical-align: middle;">내용</td>
							</tr>
							<tr>
								<td colspan="4" style="border: solid 1px rgb(221, 221, 221);">
									<div class="form-group" style="margin: 0px;">
										<textarea name="contentEditor" id="contentEditor" rows="10"
											cols="80">
											</textarea>
									</div>
								</td>
							</tr>
						</table>
						<!-- 내용 끝 -->
					</div>
				</div>

				<div class="widget-foot"
					style="text-align: center; padding: 4px 0px; background-color: #ffffff; border: 0px;">
					<div class="padd" style="padding-top: 0px;">
						<button type="button" class="btn" id="faqUpdateBtn">등록</button>
						<button type="button" class="btn" id="faqUpdateCancelBtn">취소</button>

						<div class="pull-right">
							<button type="button" class="btn" id="faqListBtn">리스트</button>
						</div>
					</div>
				</div>
			</div>


		</div>
	</div>
	<!--/ Matter ends -->
</div>
<!--/ Mainbar ends -->
