<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Main bar -->
<div class="mainbar">
	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			이력서 관리
			<!-- page meta -->
			<span class="page-meta">이력서 확인 / 이력서 수정 / 이력서 삭제 </span>
		</h2>
		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right" style="text-align: right;">
			<a href="<c:url value="/admin/main.jobq" />"><i
				class="fa fa-home"></i>Home</a> <br /> <span><strong
				style="font-size: 18px;">이력서 관리</strong></span>
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
							<table class="table"
								style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								<tr>
									<td class="table-name" style="vertical-align: middle;">등록일</td>
									<td width="35%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										
										<div class="form-group" style="width : 30%; margin: 0px; display: inline-block;">
											<input type="date" class="form-control" id="startDate" data-jobq-date="startDate" />
										</div> <span> ~ </span>

										<div class="form-group" style="width : 30%; margin: 0px; display: inline-block;">
											<input type="date" class="form-control" id="endDate" data-jobq-date="endDate" />
										</div>
										
									</td>
								</tr>
								
									<tr>
										<td class="table-name" style="vertical-align: middle;">직종</td>
										<td width="35%" colspan="3">
											<div class="form-group" style="margin:0px; display:inline-block;">
											<c:forEach var="mainData" items="${mainDatas}">
												<c:if test="${mainData.type eq 'skill' }">
													<label class="checkbox-inline">
														<input type="checkbox" name="skill" data-jobq-checkbox="skill" value='${mainData.data}'>${mainData.data}
													</label>
												</c:if>
											</c:forEach>
											</div>
										</td>
									</tr>
								
									<tr>
										<td class="table-name" style="vertical-align: middle;">지역</td>
										<td width="35%" colspan="3">
											<div class="form-group" style="margin: 0px; display:inline-block;">
											<c:forEach var="mainData" items="${mainDatas}">	
												<c:if test="${mainData.type eq 'area' }">
													<label class="checkbox-inline">
														<input type="checkbox" name="area" data-jobq-checkbox="area" value='${mainData.data}'>${mainData.data}
													</label>
												</c:if>
											</c:forEach>
											</div>
										</td>
									</tr>			
								
								<tr>
									<td class="table-name" style="vertical-align: middle;">최종 학력</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; display:inline-block;">
											<select class="form-control" id="level" data-jobq-select="level" >
												<option selected>선택하세요.</option>
												<option value="고졸">고졸</option>
												<option value="전문대재">전문대재</option>
												<option value="4년제 대재">4년제 대재</option>
												<option value="전문대졸">전문대졸</option>
												<option value="4년제 대졸">4년제 대졸</option>
												<option value="대학원">대학원</option>
											</select>
										</div>
									</td>
									
									<td class="table-name" style="vertical-align: middle;">아이디</td>
									<td width="35%">
										
										<div class="form-group" style="margin: 0px; width: 60%; display: inline-block;">
											<input type="text" class="form-control" id="id" data-jobq-text="id" />
											<input type="text" class="form-control" style="display : none;" />	
										</div>
										
										<input type="button" class="btn btn-default" value="검색" id="resume-search-btn"/>
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
						<span><strong id="all-page-count"></strong>&nbsp;&nbsp;&nbsp;&nbsp;</span><span><strong>검색된
								이력서 수 : 0</strong></span>
					</div>
					<div class="padd" style="background-color: #f9f9f9; padding: 0px 15px;">
						<table id="resumeTable"></table>
						<div id="resumePager"></div>
					</div>
				</div>

				<div class="widget-foot" style="border: 0px solid #ffffff;">
					<button type="button" class="btn btn-default resume-delete-btn">선택 삭제</button>
				</div>
			</div>

		</div>
	</div>
	<!--/ Matter ends -->
</div>
<!--/ Mainbar ends -->
