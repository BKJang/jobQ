<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Main bar -->
<div class="mainbar">

	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			메인 공고 관리
			<!-- page meta -->
			<span class="page-meta">공고 검색 / 공고 수정 / 공고 삭제</span>
		</h2>


		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right" style="text-align: right;">
			<a href="<c:url value="/admin/main.jobq" />"><i
				class="fa fa-home"></i>Home</a> <br /> <span>메인 관리&nbsp;
				&#45;&nbsp;<strong style="font-size: 18px;">메인 공고 관리</strong>
			</span>
		</div>

		<div class="clearfix"></div>

	</div>
	<!-- Page heading ends -->


	<!-- Matter -->

	<div class="matter">
		<div class="container">
			<div class="widget">
				<div class="widget-content" style="border: 0px solid #ffffff;">
					<div class="padd" style="padding-top: 0px;">
						<form id="main-annocement-frm">
							<table class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								<tr>
									<td class="table-name" style="vertical-align: middle;">구분</td>
									<td width="35%" colspan=3>
										<div class="form-group" style="margin: 0px; width: 80%; display: inline-block;">
											<label class="checkbox-inline">
												<input type="checkbox" name="hotState" data-jobq-checkbox="notice_state" value="핫">핫 공고
											</label> 
											
											<label class="checkbox-inline">
												<input type="checkbox" name="specialState" data-jobq-checkbox="notice_state" value="스폐셜">스폐셜 공고
											</label> 
											
											<label class="checkbox-inline">
												<input type="checkbox" name="noState" data-jobq-checkbox="notice_state" value="미등록">미등록 공고
											</label>
										</div>
									</td>

								</tr>
								<tr>
									<td class="table-name" style="vertical-align: middle;">회사명</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; width: 60%; display: inline-block;">
											<input type="text" name="companyName" data-jobq-text="companyName" class="form-control" />
										</div>
									</td>

									<td class="table-name" style="vertical-align: middle;">담당자 아이디</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; width: 60%; display: inline-block;">
											<input type="text" name="chargeId" class="form-control" data-jobq-text="id" id="id" />
										</div> 
										<button type="button" class="btn btn-default" id="announcementSearchBtn">검색</button>
									</td>
								</tr>
							</table>

						</form>
					</div>
				</div>
			</div>


			<div class="widget" style="border: 1px solid #ddd">
				<div class="widget-content" style="border: 0px solid #ffffff;">
					<div class="padd" style="background-color: #f9f9f9;">
						<span><strong id="all-page-count">총 메인 공고 수 : </strong>&nbsp;&nbsp;&nbsp;&nbsp;</span><span><strong id="search-page-count">검색된 메인 공고 수 : 0</strong></span>
					</div>
					<div class="padd"
						style="background-color: #f9f9f9; padding: 0px 15px;">

						<table id="announcementTable"></table>
						<div id="announcementPager"></div>
					</div>
				</div>

				<div class="widget-foot" style="border: 0px solid #ffffff;">
					<button type="button" class="btn btn-default announcementDeleteBtn">선택 삭제</button>

					<div class="pull-right">
						<button type="button" class="btn btn-default" id="announcement-update-Btn">선택 공고 수정</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/ Matter ends -->

</div>
<!-- Mainbar ends -->

<div class="modal fade special-hot-confirm">
	<div class="modal-dialog" style="width: 500px;">
		<div class="modal-content">

			<div class="modal-header">
				<h5>메인 공고 선택</h5>
			</div>

			<div class="modal-body" style="text-align: center;">
				<div class="padd">
					<button type="button" class="btn btn-default" data-dismiss="modal" id="hotAnnouncementBtn">HOT 채용 공고</button>
					<button type="button" class="btn btn-default" data-dismiss="modal" id="specialAnnouncementBtn">스폐셜 채용 공고</button>
					<button type="button" class="btn btn-default" data-dismiss="modal" id="noStateAnnouncementBtn">미등록 공고</button>
				</div>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>