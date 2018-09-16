<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Main bar -->
<div class="mainbar">
	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			JobStory 
			<!-- page meta -->
			<span class="page-meta">jobstory 추가 </span>
		</h2>
		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right" style="text-align:right;">
			<a href="<c:url value="/admin/main.jobq" />"><i class="fa fa-home"></i> Home</a>
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
					<div class="padd" style="padding: 0px 15px;">
						<form style="margin-bottom:0px;">
							<table class="table"
								style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								<tr>
									<!-- 아이디 -->
								
									<td class="table-name" style="vertical-align: middle;">담당자
										아이디</td>
									<td width="35%">
										<div class="form-group"
											style="margin: 0px; width: 60%; display: inline-block;">
											<input type="text" class="form-control" />
										</div>
									</td>
									
									<!-- 아이디 끝 -->
									
									<!-- 이메일 -->
									
									<td class="table-name" style="vertical-align: middle;">담당자
										이메일</td>
									<td width="35%">
										<div class="form-group"
											style="margin: 0px; width: 60%; display: inline-block;">
											<input type="email" class="form-control" />
										</div>
									</td>
									
									<!-- 이메일 끝 -->
								</tr>
								<tr>
									<!-- 작성일 -->
								
									<td class="table-name" style="vertical-align: middle;">작성일</td>
									<td width="35%">
										<div class="form-group"
											style="margin: 0px; width: 60%; display: inline-block;">
											<input type="date" class="form-control" />
										</div>
									</td>

									<!-- 작성일 끝 -->

									<!-- 카테고리 -->	

									<td class="table-name" style="vertical-align: middle;">카테
										고리</td>
									<td width="35%">
										<div class="form-group"
											style="margin: 0px; width: 60%; display: inline-block;">
											<div class="form-group"
												style="margin: 0px; display: inline-block;">
												<!-- 보안 서비스 -->
												<select class="form-control" >
													<option selected>선택하세요</option>
													<option value="보안">보안 서비스</option>
													<option value="회원">회원가입·로그인</option>
													<option value="채용">채용 구직</option>
												</select>
											</div>
										</div>
									</td>
									
									<!-- 카테고리 끝-->
								</tr>



								<!-- 제목 -->

								<tr>
									<td class="table-name" style="vertical-align: middle;">제목</td>
									<td width="35%" colspan="3"
										style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group"
											style="width: 60%; margin: 0px; display: inline-block;">
											<input type="text" class="form-control" />
										</div>
									</td>
								</tr>

								<!-- 제목 끝 -->

								<!-- 내용 -->

								<tr>
									<td colspan="4">
										<textarea name="mailEditor" id="mailEditor" rows="10" cols="80">
											
										</textarea>
									</td>
								</tr>
								
								<!-- 내용 끝 -->
							</table>
						</form>
						
					</div>
				</div>

				<div class="widget-foot"
					style="text-align: center; padding: 4px 0px; background-color: #ffffff; border: 0px;">
					<div class="padd" style="padding-top: 0px;">
						<button type="button" class="btn" id="jobstoryUpdateBtn">등록</button>
						<button type="button" class="btn" id="jobstoryUpdateCancelBtn">취소</button>
					</div>
				</div>
			</div>


		</div>
	</div>
	<!--/ Matter ends -->
</div>
<!--/ Mainbar ends -->
