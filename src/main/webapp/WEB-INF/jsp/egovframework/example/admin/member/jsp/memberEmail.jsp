<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Main bar -->
<div class="mainbar">
	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			회원 메일 발송
			<!-- page meta -->
			<span class="page-meta">개인 회원 메일 발송 / 단체 회원 메일 발송</span>
		</h2>
		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right" style="text-align: right;">
			<a href="<c:url value="/admin/main.jobq" />"><i
				class="fa fa-home"></i> Home</a> <br /> <span>회원 관리&nbsp;-&nbsp;<strong
				style="font-size: 18px;">회원 메일 발송</strong></span>
		</div>
		<div class="clearfix"></div>
	</div>
	<!--/ Page heading ends -->

	<!-- Matter -->
	<div class="matter">
		<div class="container">
			<div class="widget" style="margin-bottom:0px;">
				<div class="widget-content" style="border: 0px solid #ffffff;">
					<div class="padd" style="padding: 0px 15px;">
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

										<div class="form-group" style="width: 40%; margin: 0px; display: inline-block;">
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
		
			<div class="widget" style="border: 1px solid #ddd">
				<div class="widget-content" style="border: 0px solid #ffffff;">
					<div class="padd" style="background-color: #f9f9f9;">
						<span><strong id="all-page-count"></strong>&nbsp;&nbsp;&nbsp;&nbsp;</span><span><strong id="search-page-count">검색한 회원수 : 0</strong></span>
					</div>
					
					<div class="padd" style="background-color: #f9f9f9; padding: 0px 15px;">
						<table id="member-email-table"></table>
						<div id="member-email-pager"></div>
					</div>
				</div>

				<div class="widget-foot" style="border: 0px solid #ffffff;">
					<button type="button" class="btn btn-default member-select-btn">추가</button>
				</div>
			</div>
			
			<div class="widget">
				<div class="widget-content" style="border: 0px solid #ffffff;">
					<div class="padd" style="padding-top: 0px;">
						<form id="memberSearchFrm">
							<table class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								<tr>
									<td class="table-name" width="15%" style="vertical-align: middle;">수신자</td>
									<td width="85%" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="width: 30%; margin: 0px; display: inline-block;">
											<input type="text" class="form-control" id="member-addressee-list" readOnly style="text-align:right;"/>
										</div> <input type="button" class="btn btn-default" id="member-addressee-reset-btn" value="초기화"/>
									</td>
								</tr>
								
								<!-- 분할 발송 끝 -->
								
								<!-- 제목 -->
								
								<tr>
									<td class="table-name" width="15%" style="vertical-align: middle;">제목</td>
									<td width="85%" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="width: 50%; margin: 0px; display: inline-block;">
											<input type="text" class="form-control" id="member-email-title" />
										</div>
									</td>
								</tr>
								
								<!-- 제목 끝 -->
								
								<!-- 메일 내용 -->
																	
								<tr>
									<td class="table-name" width="15%" style="vertical-align: middle;">내용</td>
									<td width="85%" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style=" margin: 0px; display: inline-block;">
											<select class="form-control" id="member-email-subject-select">
												<option value="선택"selected> - 메일 폼 선택 - </option>
												<option value="회원가입"> [ 회원 가입시 ] </option>
												<option value="아이디찾기"> [ 아이디 찾기 ] </option>
												<option value="비밀번호찾기"> [ 비밀번호 찾기 ] </option>
												<option value="회원탈퇴"> [ 회원 탈퇴시 ] </option>
											</select>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2" align="center">
										<textarea name="mail-editor" id="mail-editor" rows="10" cols="80"></textarea>
									</td>
								</tr>
							</table>
							<!-- </div> -->
							
						</form>
						<div style="text-align:center;">
							<button type="button" class="btn btn-default" id="email-send-btn"><strong>발송</strong></button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/ Matter ends -->
</div>
<!--/ Mainbar ends -->
