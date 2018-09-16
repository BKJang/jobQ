<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Main bar -->
<div class="mainbar">
	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			회원 검색
			<!-- page meta -->
			<span class="page-meta">회원 검색 / 회원 삭제 / 회원 수정</span>
		</h2>
		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right" style="text-align:right;">
			<a href="<c:url value="/admin/main.jobq" />"><i class="fa fa-home"></i>Home</a>
			<br />
			<span>회원 관리 - <strong style="font-size:18px;">회원 검색</strong></span>	
		</div>
		<div class="clearfix"></div>
	</div>
	<!--/ Page heading ends -->

	<!-- Matter -->
	<div class="matter">
		<div class="container">
			<div class="widget">
				<div class="widget-content" style="border: 0px solid #ffffff;">
					<div class="padd" style="padding:0px 15px;">
						<form id="memberSearchFrm">
							<table class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								<tr>
									<td class="table-name" width="15%" style="vertical-align: middle;">조건 검색</td>
									<td width="85%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="margin: 0px; display: inline-block;">
											<select class="form-control" id="memberSearchSelect" data-jobq-select="coditionKey">
												<option selected>선택하세요.</option>
												<option value="name">이름</option>
												<option value="id">아이디</option>
												<option value="email">이메일</option>
												<option value="phone">휴대폰</option>
											</select>
										</div>

										<div class="form-group"
											style="width: 40%; margin: 0px; display: inline-block;">
											<input type="text" class="form-control" id="memberSearchInput" data-jobq-text="coditionValue"/>
											<input type="text" style="display:none;"/>
										</div> <input type="button" class="btn btn-default" value="검색" id="member-search-btn" />
									</td>
								</tr>

							</table>
							<!-- </div> -->

						</form>
					</div>
				</div>
			</div>

			<div class="widget" style="border:1px solid #ddd">
				<div class="widget-content" style="border:0px solid #ffffff;">
					<div class="padd" style="background-color:#f9f9f9;">
						<span><strong id="all-page-count"></strong>&nbsp;&nbsp;&nbsp;&nbsp;</span><span><strong id="search-page-count">검색된 회원수 : 0</strong></span>
						<div class="pull-right" style="display:inline-block">
							<button type="button" class="btn btn-default" id="excel-btn">엑셀 파일 저장</button>	
						</div>		
					</div>
					<div class="padd" style="background-color:#f9f9f9; padding:0px 15px;">
						
						<table id="memberManageTable"></table>
						<div id="memberManagePager"></div>
					</div>
				</div>
				
				<div class="widget-foot" style="border: 0px solid #ffffff;">
					<button type="button" class="btn btn-default" id="member-delete-btn">선택 삭제</button>
				
					<div class="pull-right">
						<button type="button" class="btn btn-default" id="member-add-btn">회원 추가</button>						
					</div>
					
				</div>
			</div>

		</div>
	</div>
	<!--/ Matter ends -->
</div>

<div class="modal fade" id="excel-version-select">
	<div class="modal-dialog" style="width:300px;">
		<div class="modal-content">
			
			<div class="modal-header">
				<h5>엑셀 버전 선택</h5>
			</div>
			
			<div class="modal-body" style="text-align:center;">
				<div class="padd">
					<form id="excel-form">
						<input type="hidden" name="memberIds" id="memberIds" />
						<input type="hidden" name="version" id="excel-version" />
						<button type="button" class="btn btn-default" id="excel2003-btn" data-dismiss="modal">excel 2003(.xls)</button>
						<button type="button" class="btn btn-default" id="excel2007-btn" data-dismiss="modal">excel 2007(.xlsx)</button>
					</form>	
				</div>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="select-member-modal">
	<div class="modal-dialog" style="width:300px;">
		<div class="modal-content">
			
			<div class="modal-header">
				<h5>회원 추가 선택</h5>
			</div>
			
			<div class="modal-body" style="text-align:center;">
				<div class="padd">
					<button type="button" class="btn btn-default member-register" data-dismiss="modal">일반 회원</button>
					<button type="button" class="btn btn-default member-register" data-dismiss="modal">기업 회원</button>
					<!-- <button type="button" class="btn btn-default member-register" data-dismiss="modal">관리자</button> -->
				</div>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>


