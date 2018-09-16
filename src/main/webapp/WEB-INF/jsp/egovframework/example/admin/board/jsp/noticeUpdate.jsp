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
			<span class="page-meta">공지 사항 수정</span>
		</h2>
		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right" style="text-align:right;">
			<a href="<c:url value="/admin/main.jobq" />"><i class="fa fa-home"></i> Home</a>
			<br />
			<span>게시판 관리&nbsp;-&nbsp;<strong style="font-size:18px;">공지 사항</strong></span>
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
									<td class="table-name" style="vertical-align: middle;">제목</td>
									<td width="35%" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="width: 100%; margin: 0px; display: inline-block;">
											<input type="text" class="form-control" value="jobQ 서버 점검 안내"/>
										</div>
									</td>
								
									<!-- 작성일 -->
								
									<td class="table-name" style="vertical-align: middle;">작성일</td>
									<td width="35%">
										<div class="form-group"
											style="margin: 0px; width: 60%; display: inline-block;">
											<input type="date" class="form-control" value="2013-03-21"/>
										</div>
									</td>
								</tr>

								<!-- 내용 -->

								<tr>
									<td colspan="4">
										<textarea name="mailEditor" id="mailEditor" rows="10" cols="80">
											<p>안녕하세요. jobQ 운영자 입니다.</p> 

											<p>일부 기업에서 우정사업본부의 명칭 및 우체국택배 BI 등을 무단으로 사용하여 우체국 정규직 직원(우체국 소포 배달원, 택배원 등)을 채용하는 것처럼 허위 공고를 게재하고 있습니다.</p> 

											<p>국가기관인 우정사업본부에서는 우체국소포 배달원을 직접 모집하지 않습니다. 우체국 사칭 공고에 주의하시기 바랍니다.</p> 

											<p>jobQ는 위와 같은 모집공고가 올라오지 않도록 필터링 하고 있으며 관련 공고를 발견하실 경우 [불법/허위/과장/오류 신고] 기능을 이용하시거나 고객센터(helpdesk@jobQ.co.kr / ☎ 1588-1234)로 신고해주시기 바랍니다.</p> 

											<p>감사합니다.</p>
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
						<button type="button" class="btn" id="noticeUpdateBtn">확인</button>
						<button type="button" class="btn" id="noticeUpdateCancelBtn">취소</button>
						
						<div class="pull-right">
							<button type="button" class="btn" id="noticeListBtn">리스트</button>
						</div>
					</div>
				</div>
			</div>


		</div>
	</div>
	<!--/ Matter ends -->
</div>
<!--/ Mainbar ends -->
