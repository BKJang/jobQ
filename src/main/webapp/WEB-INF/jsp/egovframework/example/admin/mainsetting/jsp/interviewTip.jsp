<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Main bar -->
<div class="mainbar">

	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			면접 TIP 관리
			<!-- page meta -->
			<span class="page-meta">면접 TIP 검색 /수정 / 삭제</span>
		</h2>


		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right" style="text-align: right;">
			<a href="<c:url value="/admin/main.jobq" />"><i
				class="fa fa-home"></i>Home</a> <br /> <span>메인 관리&nbsp;
				&#45;&nbsp;<strong style="font-size: 18px;">면접 TIP 관리</strong>
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
					<div class="padd" style="padding:0px 15px;">
						<form>
							<table class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								<tr>
									<td class="table-name" width="10%" style="vertical-align: middle;">등록 일시</td>
									<td width="90%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="width:25%; margin: 0px; display: inline-block;">
											<input type="date" class="form-control" data-jobq-date="startDate"/>
										</div> <span> ~ </span>

										<div class="form-group" style="width:25%; margin: 0px; display: inline-block;">
											<input type="date" class="form-control" data-jobq-date="endDate"/>
										</div>
									</td>
								</tr>
								
								<tr>
									<td class="table-name" style="vertical-align: middle;">구분</td>
									<td width="35%" style="vertical-align: middle;">
										<div class="form-group" style="margin: 0px; width: 80%; display: inline-block;">
											<label class="checkbox-inline">
												<input type="checkbox" name="Y" data-jobq-checkbox="interview_use" value="Y">사용중
											</label> 
											
											<label class="checkbox-inline">
												<input type="checkbox" name="N" data-jobq-checkbox="interview_use" value="N">사용 않함
											</label> 
										</div>
									</td>
								
									<td class="table-name" width="10%" style="vertical-align: middle;">내용 검색</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; width:35%; display: inline-block;">
											<input type="text" class="form-control" data-jobq-text="coditionValue"/>
											<input type="text" style="display : none;"/>
										</div> 
										
										<input type="button" class="btn btn-default" id="interview-search-btn" value="검색" />
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
						<span><strong id="all-page-count"></strong>&nbsp;&nbsp;&nbsp;&nbsp;</span><span><strong id="search-page-count">검색된  면접 TIP 개수 : 0</strong></span>
					</div>
					<div class="padd" style="background-color: #f9f9f9; padding: 0px 15px;">

						<table id="interview-table"></table>
						<div id="interview-pager"></div>
					</div>
				</div>

				<div class="widget-foot" style="border: 0px solid #ffffff;">
					<button type="button" class="btn btn-default interview-delete-btn">선택 삭제</button>
					
					
					<div class="pull-right">
						<button type="button" class="btn btn-default" id="interview-add-btn">면접 TIP 추가</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/ Matter ends -->

</div>
<!-- Mainbar ends -->

<div class="modal fade realTime-hot-confirm">
	<div class="modal-dialog" style="width: 300px;">
		<div class="modal-content">

			<div class="modal-header">
				<h5>메인 공고 선택</h5>
			</div>

			<div class="modal-body" style="text-align: center;">
				<div class="padd">
					<button type="button" class="btn btn-default" id="hotAnnouncementBtn">HOT 채용 공고</button>
					<button type="button" class="btn btn-default" id="realAnnouncementBtn">실시간 채용 공고</button>
				</div>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>