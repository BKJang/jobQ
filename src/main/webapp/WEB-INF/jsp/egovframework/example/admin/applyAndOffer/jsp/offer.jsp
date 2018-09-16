<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!-- Main bar -->
<div class="mainbar">

	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			제의 현황
			<!-- page meta -->
			<span class="page-meta">면접 제의 검색</span>
		</h2>
		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right" style="text-align:right;">
			<a href="<c:url value="/admin/main.jobq" />"><i class="fa fa-home"></i>Home</a>
			<br />
			<span>지원 및 제의 현황&nbsp;-&nbsp;<strong style="font-size:18px;">제의 현황</strong></span>
		</div>
		<div class="clearfix"></div>
	</div>
	<!--/ Page heading ends -->



	<!-- Matter -->
	<div class="matter">
		<div class="container">
			<div class="widget" style="margin-bottom:0px;">
				<div class="widget-content" style="border: 0px solid #ffffff;">
					<div class="padd" style="padding:0px 15px;">
						<form>
							<table class="table"
								style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								<tr>
									<td class="table-name" width="15%"
										style="vertical-align: middle;">조건 검색</td>
									<td width="85%">
										<div class="form-group" style="margin: 0px; display: inline-block;">
											<select class="form-control" data-jobq-select="coditionKey">
												<option selected>선택하세요.</option>
												<option value="id">담당자 아이디</option>
												<option value="resumeTitle">이력서 제목</option>
												<option value="offerTitle">면접 제의 제목</option>
												<option value="offerContent">면접 제의 내용</option>
												<option value="companyName">회사명</option>
											</select>
										</div>
										
										<div class="form-group" style="margin: 0px; width:35%; display: inline-block;">
											<input type="text" class="form-control" data-jobq-text="coditionValue"/>
										</div> 
										
										<input type="button" class="btn btn-default" id="offer-search-btn" value="검색" />
									</td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12">
					<div class="widget">
						<div class="widget-content" style="border:0px;">
							<div class="padd">
								<table id="faqTable" class="row-border hover stripe" style="width:100%"></table>
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
