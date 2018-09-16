<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!-- Main bar -->
<div class="mainbar">

	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			F A Q
			<!-- page meta -->
			<span class="page-meta">F A Q 문의 / 수정 / 등록 / 삭제</span>
		</h2>
		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right" style="text-align:right;">
			<a href="<c:url value="/admin/main.jobq" />"><i class="fa fa-home"></i> Home</a>
			<br />
			<span>고객 문의&nbsp;-&nbsp;<strong style="font-size:18px;">F&nbsp;A&nbsp;Q</strong></span>
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
							<table class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								<tr>
									<td class="table-name" width="15%" style="vertical-align: middle;">조건 검색</td>
									<td width="50%">
										<div class="form-group" style="margin: 0px; width:20%; display: inline-block;">
											<select class="form-control" data-jobq-select="coditionKey">
												<option selected>선택하세요.</option>
												<option value="subject">카테고리</option>
												<option value="title">제목</option>
												<option value="content">내용</option>
											</select>
										</div>
										
										<div class="form-group" style="margin: 0px; width:50%; display: inline-block;">
											<input type="text" class="form-control" data-jobq-text="coditionValue" />
										</div> 
										
										<input type="button" class="btn btn-default" id="faq-search-btn" value="검색" />
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
