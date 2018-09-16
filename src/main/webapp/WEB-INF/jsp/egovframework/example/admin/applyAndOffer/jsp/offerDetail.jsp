<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Main bar -->
<div class="mainbar">
	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			면접 제의
			<!-- page meta -->
			<span class="page-meta">면접 제의 상세</span>
		</h2>
		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right" style="text-align:right;">
			<a href="<c:url value="/admin/main.jobq" />"><i class="fa fa-home"></i>Home</a>
			<br />
			<span>지원 및 제의 현황&nbsp;-&nbsp;제의 현황&nbsp;-&nbsp;<strong style="font-size:18px;">면접 제의 상세</strong></span>
		</div>
		<div class="clearfix"></div>
	</div>
	<!--/ Page heading ends -->

	<!-- Matter -->
	<div class="matter">
		<div class="container">
			<form id="resumeUpdateFrm">

				<!-- 기본 정보 -->
				<div class="widget">
					<div class="widget-content" style="border: 0px solid #ffffff;">
						
						<div class="padd" style="padding-top:0px;">
							<h4>- 기본 정보</h4>
							<table class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								<tr>
									<td rowspan="3" class="table-name">
										<img src="http://via.placeholder.com/120x150" alt="" />
									</td>
									
									<td class="table-name" style="vertical-align: middle;">회사명</td>
									<td width="35%" style="vertical-align: middle; display:table-cell;">
										<p>${offer.COMPANY_NAME}</p>
									</td>

									<td class="table-name" style="vertical-align: middle; display:table-cell;">담당자 아이디</td>
									<td width="25%" style="vertical-align: middle; display:table-cell;">
										<p>${offer.CORP_MEMBER_ID}</p>
									</td>
								</tr>
								<tr>
									<td class="table-name" style="vertical-align: middle;">담당자 연락처</td>
									<td width="35%" style="border: solid 1px rgb(221, 221, 221); display:table-cell; vertical-align:middle;">
										<p>${offer.PHONE}</p>
									</td>

									<td class="table-name" style="vertical-align: middle; display:table-cell;">작성일</td>
									<td width="35%" style="vertical-align: middle; display:table-cell;">
										<p>${offer.OFFER_DATE.toString().substring(0, 10)}</p>
									</td>
								</tr>

								<!-- 휴대폰 -->

								<tr>
									<td class="table-name" style="vertical-align: middle;">담당자 이메일</td>
									<td width="35%" style="border: solid 1px rgb(221, 221, 221); display:table-cell; vertical-align:middle;">
										<p>${offer.EMAIL}</p>
									</td>
									
									<td class="table-name" style="vertical-align: middle;">회원 아이디</td>
									<td width="35%" style="vertical-align: middle; display:table-cell;">
										<p>${offer.MEMBER_ID}</p>
									</td>
								</tr>

								<!-- 휴대폰 끝 -->

								<!-- 이메일 -->

								<%-- <tr>
									<td class="table-name" style="vertical-align: middle;">담당자 이메일</td>
									<td width="35%" colspan="3" style="border: solid 1px rgb(221, 221, 221); display:table-cell; vertical-align:middle;">
										<p>${offer.EMAIL}</p>
									</td>
								</tr> --%>

								<!-- 이메일 끝 -->
							</table>
						</div>
					</div>
				</div>


				<div class="widget">
					<div class="widget-content" style="border: 0px solid #ffffff;">
						<div class="padd" style="padding-bottom : 0px;">
							<h3>- 면접 제의</h3>
							<!-- 자기 소개 -->
							<table id="school-table" class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								<tr>
									<td class="table-name" colspan="5" style="vertical-align: middle;">면접 제의 내용</td>
								</tr>
								
								<tr>
									<td width="35%" colspan="5" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="width:100%; margin: 0px; display: inline-block;">
											<!-- Oracle에서 데이터를 Map으로 맵핑하면 컬럼에 대문자로 접근해야 한다. -->
											${offer.CONTENT}
										</div>
									</td>
								</tr>
						
								<!-- 자기 소개  끝 -->
							</table>	
						</div>
					</div>
					<div class="widget-foot" style="text-align: center; padding: 15px 0px; background-color: #ffffff; border: 0px;">
						<div class="pull-right" style="padding-right : 15px; ">
							<button type="button" class="btn btn-default" id="offer-list-btn">목록</button>
							<button type="button" class="btn btn-default" id="offer-delete-btn">삭제</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!--/ Matter ends -->
</div>
<!--/ Mainbar ends -->
