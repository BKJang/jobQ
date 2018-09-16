<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Main bar -->
<div class="mainbar">
	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			구인 공고 관리
			<!-- page meta -->
			<span class="page-meta">구인 공고 검색 / 구인 공고 수정 / 구인 공고 삭제 </span>
		</h2>
		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right" style="text-align:right;">
			<a href="<c:url value="/admin/main.jobq" />"><i class="fa fa-home"></i>
				Home</a>
			<br />
			<span><strong style="font-size:18px;">구인 공고 관리</strong></span>	
		</div>
		<div class="clearfix"></div>
	</div>
	<!--/ Page heading ends -->

	<!-- Matter -->
	<div class="matter">
		<div class="container">
			<div class="widget">
				<div class="widget-content" style="border: 0px solid #ffffff;">
					<div class="padd" style="padding-top: 0px;">
						<form>
							<table class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								
								<tr>
									<td class="table-name" width="10%" style="vertical-align: middle; width : 8%">채용 기간</td>
									<td width="35%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="width: 40%; margin: 0px; display: inline-block;">
											<input type="date" class="form-control" data-jobq-date="startDate"/>
										</div> <span> ~ </span>

										<div class="form-group" style="width: 40%; margin: 0px; display: inline-block;">
											<input type="date" class="form-control" data-jobq-date="endDate"/>
										</div>
									</td>
								</tr>
								
								<tr>
									<td class="table-name" width="10%" style="vertical-align: middle; width : 8%">직종</td>
									<td width="35%" colspan="3">
										<div class="form-group" style="margin:0px; display:inline-block;">
										<c:forEach var="mainData" items="${mainDatas}">
											<c:if test="${mainData.type eq 'skill'}">
												<label class="checkbox-inline">
													<input type="checkbox" name="skill" data-jobq-checkbox="skill" value='${mainData.data}'>${mainData.data}
												</label>
											</c:if>
										</c:forEach>
										</div>
									</td>
								</tr>
								
								<tr>
									<td class="table-name" style="vertical-align: middle; width : 8%">지역</td>
									<td width="35%" colspan="3">
										<div class="form-group" style="margin: 0px; display:inline-block;">
										<c:forEach var="mainData" items="${mainDatas}">	
											<c:if test="${mainData.type eq 'area'}">
												<label class="checkbox-inline">
													<input type="checkbox" name="area" data-jobq-checkbox="area" value='${mainData.data}'>${mainData.data}
												</label>
											</c:if>
										</c:forEach>
										</div>
									</td>
								</tr>
								
								
								<tr>
									<td class="table-name" width="10%" style="vertical-align: middle; width : 8%">조건 검색</td>
									<td width="35%" colspan="3">
										<div class="form-group" style="margin: 0px; display: inline-block;">
											<select class="form-control" data-jobq-select="coditionKey">
												<option selected>선택하세요.</option>
												<option value="id">아이디</option>
												<option value="title">채용 제목</option>
												<option value="companyName">업체명</option>
											</select>
										</div>
										
										<div class="form-group" style="margin: 0px; width: 25%; display: inline-block;">
											<input type="text" class="form-control" data-jobq-text="coditionValue"/>
										</div> 
										
										<input type="button" class="btn btn-default" value="검색" id="employ-search-btn"/>
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
						<span><strong id="all-page-count"></strong>&nbsp;&nbsp;&nbsp;&nbsp;</span><span><strong id="search-page-count">검색된
							구인 공고 수 : 0</strong></span>
						<div class="pull-right" style="display:inline-block">
						<!-- <button type="button" class="btn btn-default" id="employAddBtn">구인 공고 추가</button> -->	
					</div>	
					</div>
					<div class="padd" style="background-color:#f9f9f9; padding:0px 15px;">
						<table id="employTable"></table>
						<div id="employPager"></div>
					</div>
				</div>
				
				<div class="widget-foot" style="border: 0px solid #ffffff;">
					<button type="button" class="btn btn-default employDeleteBtn">선택 삭제</button>
				</div>
			</div>

		</div>
	</div>
	<!--/ Matter ends -->
</div>
<!--/ Mainbar ends -->
