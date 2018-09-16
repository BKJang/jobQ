<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Mainbar -->
<div class="mainbar">
	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			Home
			<!-- page meta -->
			<span class="page-meta">job Q / admin</span>
		</h2>

		<div class="clearfix"></div>
	</div>
	<!--/ Page heading ends -->
	<!-- Matter -->
	<div class="matter">
		<div class="container">
			<!-- Dashboard Graph starts -->
			<div class="row">
				<div class="col-md-8">
					<!-- Widget -->
					<div class="widget wgray">
						<!-- Widget head -->
						<div class="widget-head">
							<div class="pull-left">공고 및 이력서 현황</div>
							<div class="widget-icons pull-right">
								<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
								<a href="#" class="wclose"><i class="fa fa-times"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>
						<!-- Widget content -->
						<div class="widget-content">
							<div class="padd">

								<div id="line-chart" style="height : 220px;"></div>

							</div>
						</div>
						<!-- Widget ends -->

					</div>
				</div>

				<div class="col-md-4">
					<div class=" widget wnavy">
						<div class="widget-head">
							<div class="pull-left">사이트 현황</div>
							<div class="widget-icons pull-right">
								<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
								<a href="#" class="wclose"><i class="fa fa-times"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="widget-content">
							<table class="table  table-bordered ">
								<tr>
									<td>전체 회원수</td>
									<td>${siteCurrentState.ALL_MEMBERS}</td>
								</tr>
								<tr>
									<td>사이트 개설일</td>
									<td>2013-02-17</td>
								</tr>
								<tr>
									<td>고객 문의</td>
									<td>${siteCurrentState.ALL_QNAS}</td>
								</tr>
								<tr>
									<td>채용 공고글</td>
									<td>${siteCurrentState.ALL_EMPLOYS}</td>
								</tr>
								<tr>
									<td>총 이력서 개수</td>
									<td>${siteCurrentState.ALL_RESUMES}</td>
								</tr>
								<tr>
									<td>이번달 신규가입</td>
									<td>${siteCurrentState.NEW_MEMBERS}</td>
								</tr>
								<tr>
									<td>회사 주소</td>
									<td>서울 홍대입구 1번 출구 한큐</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-md-4">
					<div class="widget wblue">
						<div class="widget-head">
							<div class="pull-left">저번달 대비 상세 현황</div>
							<div class="widget-icons pull-right">
								<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
								<a href="#" class="wclose"><i class="fa fa-times"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>
						<div class="widget-content">
							<div class="padd">

								<div class="row" style="padding-bottom: 10px;">
									<div class="col-md-6 col-xs-6" style="text-align: center">
										<span>저번달 대비 지원 및 제의</span>
										<div class="epc easy-pie-chart-1" data-percent="3">
											<span class="percent"></span>
										</div>
									</div>
									<div class="col-md-6 col-xs-6">
										<span>저번달 대비 방문자 </span>
										<div class="epc easy-pie-chart-2" data-percent="-12">
											<span class="percent"></span>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6 col-xs-6" style="text-align: center">
										<span>저번달 대비 고객문의 </span>
										<div class="epc easy-pie-chart-3" data-percent="22">
											<span class="percent"></span>
										</div>
									</div>
									<div class="col-md-6 col-xs-6">
										<span>저번달 대비 회원가입 </span>
										<div class="epc easy-pie-chart-4" data-percent="8">
											<span class="percent"></span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- <div class="widget-foot"></div> -->
					</div>
				</div>

				<div class="col-md-8">
					<div class="widget wred">
						<div class="widget-head">
							<div class="pull-left">공지 사항</div>
							<div class="widget-icons pull-right">
								<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
								<a href="#" class="wclose"><i class="fa fa-times"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>

						<div class="widget-content">
							<div class="padd">
								<ul class="nav nav-tabs" role="tablist" id="myTab">
									<li role="presentation" class="active">
										<a href="#member" aria-controls="member" role="tab" data-toggle="tab">회원 관리</a>
									</li>

									<li role="presentation">
										<a href="#employ" aria-controls="employ" role="tab" data-toggle="tab">채용 정보 관리</a>
									</li>

									<li role="presentation">
										<a href="#apply-and-offer" aria-controls="apply-and-offer" role="tab" data-toggle="tab">지원 및 현황 관리</a>
									</li>
									
									<li role="presentation">
										<a href="#resume" aria-controls="resume" role="tab" data-toggle="tab">이력서 관리</a>
									</li>
									
									<li role="presentation">
										<a href="#board" aria-controls="board" role="tab" data-toggle="tab">게시판 관리</a>
									</li>
									
									<li role="presentation">
										<a href="#inquire" aria-controls="inquire" role="tab" data-toggle="tab">고객 문의</a>
									</li>
								</ul>

								<div class="tab-content">
									<div role="tabpanel" class="tab-pane active" id="member">
										<jsp:include page="member-tab.jsp" flush="false" />
									</div>
									
									<div role="tabpanel" class="tab-pane" id="employ">
										<jsp:include page="employ-tab.jsp" flush="false" />
									</div>
									
									<div role="tabpanel" class="tab-pane" id="apply-and-offer">
										<jsp:include page="applyAndOffer-tab.jsp" flush="false" />
									</div>
									
									<div role="tabpanel" class="tab-pane" id="resume">
										<jsp:include page="resume-tab.jsp" flush="false" />
									</div>
									
									<div role="tabpanel" class="tab-pane" id="board">
										<jsp:include page="board-tab.jsp" flush="false" />
									</div>
									
									<div role="tabpanel" class="tab-pane" id="inquire">
										<jsp:include page="inquire-tab.jsp" flush="false" />
									</div>
								</div>
							</div>
						</div>
						<div class="widget-foot" style="text-align: center;">
							<a href="javascript:goList()">View More</a>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<!--/ Matter ends -->
</div>
<!--/ Mainbar ends -->
