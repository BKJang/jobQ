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
			<span class="page-meta">jobstory 수정 </span>
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
											<input type="text" class="form-control" value="dbsdy123"/>
										</div>
									</td>
									
									<!-- 아이디 끝 -->
									
									<!-- 이메일 -->
									
									<td class="table-name" style="vertical-align: middle;">담당자
										이메일</td>
									<td width="35%">
										<div class="form-group"
											style="margin: 0px; width: 60%; display: inline-block;">
											<input type="email" class="form-control" value="dbsdy1235@gmail.com" />
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
											<input type="date" class="form-control" value="2013-03-21"/>
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
													<option>선택하세요</option>
													<option value="보안" selected>보안 서비스</option>
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
											<input type="text" class="form-control" value="IP보안 사용방법은 어떻게 되나요?"/>
										</div>
									</td>
								</tr>

								<!-- 제목 끝 -->

								<!-- 내용 -->

								<tr>
									<td colspan="4">
										<textarea name="mailEditor" id="mailEditor" rows="10" cols="80">
											<p>1. 로그인 박스에 기본적으로 IP보안 ON으로 세팅되어 있어 로그인만 하시면 IP보안이 동작됩니다.</p>
										
											<p>2. 만약 IP보안을 원하지 않고 이전과 동일한 서비스를 이용하고 싶으신 회원님께서는 IP보안을 OFF 한 상태에서 로그인하시면 됩니다.</p>
										
											<p>3. 만약 한번 IP보안을 OFF한 컴퓨터에서는 30일간 OFF상태가 지속되어 이용하실 수 있습니다. 
												(단, 다른 컴퓨터를 이용하거나, 쿠키를 삭제할 경우에는 다시 IP보안은 ON상태로 변경됩니다.)
											</p>
										
											<p>4. IP보안이 동작중일 경우에는 회원님의 PC와 네트워크 환경에 따라 지속적으로 자동 로그아웃 될 수 있으며, 로그인이 불편하실 경우에는 로그인시 IP보안을 OFF한 후 이용하시면 됩니다.
												단, IP보안 서비스는 받으실 수 없습니다.
											</p>
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
						<button type="button" class="btn" id="jobstoryUpdateBtn">확인</button>
						<button type="button" class="btn" id="jobstoryUpdateCancelBtn">취소</button>
						
						<div class="pull-right">
							<button type="button" class="btn" id="jobstoryListBtn">리스트</button>
						</div>
					</div>
				</div>
			</div>


		</div>
	</div>
	<!--/ Matter ends -->
</div>
<!--/ Mainbar ends -->
