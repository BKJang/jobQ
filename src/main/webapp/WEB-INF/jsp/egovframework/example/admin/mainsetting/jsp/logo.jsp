<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Main bar -->
<div class="mainbar">

	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			로고 관리
			<!-- page meta -->
			<span class="page-meta">로그 변경 / 확인 / 삭제</span>
		</h2>


		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right" style="text-align:right;">
			<a href="<c:url value="/admin/main" />"><i class="fa fa-home"></i>Home</a>
			<br />
			<span>메인 관리&nbsp;	&#45;&nbsp;<strong style="font-size:18px;">로고 관리</strong></span>
		</div>

		<div class="clearfix"></div>

	</div>
	<!-- Page heading ends -->



	<!-- Matter -->

	<div class="matter">
		<div class="container">

			<div class="row">
				<div class="col-md-12">
					<div class="widget">
						<div class="widget-content" style="border:0px;">
							<!-- <form id="logoFrm"> -->
								<div class="padd" style="padding-top: 0px;">
									<h3>로고 설정</h3>
									<div class="resposive-table">
										<table class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
											<tr>
												<td class="table-name" style="vertical-align: middle;"><strong>현재 로고</strong></td>
												<td width="85%">
													<div style="width : 160px; height : 80px; vertical-align: middle; display:table-cell">
														<img id="main-logo" src="<c:url value='/admin/mainsetting/logo/mainlogo' />" alt="준비중..." class="img-rounded img-responsive" width="220" height="auto"/>
													</div>
												</td>
												
											</tr>
											<tr>
												<td class="table-name" style="vertical-align: middle;">
													<strong>로고 업로드</strong>
												</td>
												
												<td width="85%">
													<div class="form-group" style="margin: 0px; width: 30%; display:inline-block;">
														<input type="text" class="form-control" id="virtualFileInput" readOnly />
													</div>
													<button type="button" class="btn btn-default" id="virtualFileBtn" style="margin-top:-1px;">파일 찾기</button>
													
													<input type="file" style="display:none;" id="realFileInput" name="fileInput" accept="image/*"/>
													<div id="drop-zone" style="border:1px solid #ddd; width:40%; height:200px; margin-top:5px; text-align:center; display:table-cell; vertical-align:middle;">
														<div id="thumbnail" style="margin:0 auto; width:150px; border:solid 1px rgb(221, 221, 221);">
															<img id="thumbnail-image" src="" alt="준비중..." width="150" />
															<span id="filename"></span><i id="thumbnail-cancel-btn" class="fa fa-times" style="padding:0px 5px; cursor:pointer;"></i>
														</div>
													</div>
												</td>
											</tr>
										</table>
									</div>
									<div class="button-group" style="text-align:center; margin-top:5px;">
										<button type="button" class="btn btn-lg btn-default" id="logo-update-btn">로고 변경</button>
										<button type="reset" class="btn btn-lg btn-default" id="logo-reset-btn">초기화</button>
										
										<div class="pull-right">
											<button type="button" class="btn btn-lg btn-default" id="logo-list-btn">로고 리스트</button>
										</div>
									</div>
								</div>
							<!-- </form> -->
						</div>
					</div>
				</div>
			</div>

			


		</div>
	</div>

	<!-- Matter ends -->

</div>
<!--/ Mainbar ends -->
