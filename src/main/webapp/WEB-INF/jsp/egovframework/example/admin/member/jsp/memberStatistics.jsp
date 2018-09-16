<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Main bar -->
<div class="mainbar">
	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			통계 현황
			<!-- page meta -->
			<span class="page-meta">구직 현황 / 회원 현황</span>
		</h2>
		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right" style="text-align:right;">
			<a href="<c:url value="/admin/main.jobq" />"><i
				class="fa fa-home"></i> Home</a>
				<br />
			<span>회원 관리&nbsp;-&nbsp;<strong style="font-size:18px;">회원 통계</strong></span>	
		</div>
		<div class="clearfix"></div>
	</div>
	<!--/ Page heading ends -->

	<!-- Matter -->
	<div class="matter">
		<div class="container">
			<div class="row">
				<div class="col-md-8">

					<!-- Line Chart -->
					<div class="widget wlightblue">

						<div class="widget-head">
							<div class="pull-left">구직 현황</div>
							<div class="widget-icons pull-right">
								<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
								<a href="#" class="wclose"><i class="fa fa-times"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>

						<div class="widget-content">
							<div class="padd">
								<div id="lineChart"></div>
							</div>
						</div>


					</div>
				</div>

				<!-- Line chart End -->

				<!-- Dounut chart -->
					
				<div class="col-md-4">
					<div class="widget wmiddleblue">

						<div class="widget-head">
							<div class="pull-left">구직 현황 - 나이(이번 달)</div>
							<div class="widget-icons pull-right">
								<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
								<a href="#" class="wclose"><i class="fa fa-times"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>


						<div class="widget-content">
							<div class="padd">
								<div style="width:100%; height: 300px;" id="donutChart"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- Dounut Chart End-->
			
			<!-- Bar Chart -->
			
			<div class="row">
				<div class="col-md-12">
					<div class="widget wblue">

						<div class="widget-head">
							<div class="pull-left">구직 현황 - 성별</div>
							<div class="widget-icons pull-right">
								<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
								<a href="#" class="wclose"><i class="fa fa-times"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>

						<div class="widget-content">
							<div class="padd">
								<div id="barChart" style="width:100%"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- Bar Chart End -->

			<!-- Area Chart -->			
			
			<div class="row">
				<div class="col-md-12">
					<div class="widget wnavy">

						<div class="widget-head">
							<div class="pull-left">회원 현황</div>
							<div class="widget-icons pull-right">
								<a href="#" class="wminimize"><i class="fa fa-chevron-up"></i></a>
								<a href="#" class="wclose"><i class="fa fa-times"></i></a>
							</div>
							<div class="clearfix"></div>
						</div>

						<div class="widget-content">
							<div class="padd">
								<div id="areaChart"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- Area Chart End -->
		</div>
	</div>
</div>
<!--/ Matter ends -->
