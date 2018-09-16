<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Main bar -->
<div class="mainbar">
	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			지원 현황
			<!-- page meta -->
			<span class="page-meta">면접 지원 수정</span>
		</h2>
		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right" style="text-align:right;">
			<a href="<c:url value="/admin/main.jobq" />"><i class="fa fa-home"></i>Home</a>
			<br />
			<span>지원 및 제의 현황&nbsp;-&nbsp;<strong style="font-size:18px;">지원 현황</strong></span>
		</div>
		<div class="clearfix"></div>
	</div>
	<!--/ Page heading ends -->

	<!-- Matter -->
	<div class="matter">
		<div class="container">

				<!-- 기본 정보 -->
				<div class="widget">
					<div class="widget-content" style="border: 0px solid #ffffff;">
						<div class="padd" style="padding-top:0px;">
							<h4>- 지원 정보</h4>
							<table class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								<tr>
									<td class="table-name" style="vertical-align: middle;">상태</td>
									<td width="80">
										<div class="form-group" style="margin: 0px; width:20%; display: inline-block;">
											<p>${state}</p>
										</div>								
									</td>
								</tr>
							</table>
						</div>
						
						<div class="padd" style="padding-top:0px;">
							<h4>- 기본 정보</h4>
							<table class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								<tr>
									<td rowspan="4" class="table-name">
										<c:choose>
											<c:when test="${resume.mainPic ne null}">
												<img src="/sample/${resume.mainPic}" width="120" height="150"/>
											</c:when>
											<c:otherwise>
												<img src="http://via.placeholder.com/120x150" alt="" />												
											</c:otherwise>
										</c:choose>
									</td>
									<td class="table-name" style="vertical-align: middle;">이력서 제목</td>
									<td width="25%" style="display:table-cell; vertical-align:middle;">
											<p>${resume.title}</p>
									</td>

									<td class="table-name" style="vertical-align: middle;">성별</td>
									<td width="35%" style="vertical-align: middle;">
										<c:choose>
											<c:when test="${resume.member.sex eq '1'}">
												<p>여자</p>
											</c:when>
											<c:otherwise>
												<p>남자</p>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								
								<tr>
									<td class="table-name" style="vertical-align: middle;">이름</td>
									<td width="25%" style="display:table-cell; vertical-align:middle;">
										<p>${resume.member.name}</p>
									</td>

									<td class="table-name" style="vertical-align: middle;">생년 월일</td>
									<td width="35%" style="display:table-cell; vertical-align:middle;">
										<p>${resume.member.birthDate}</p>
									</td>
								</tr>

								<tr>
									<td class="table-name" style="vertical-align: middle;">휴대폰</td>
									<td width="35%" colspan="3" style="border: solid 1px rgb(221, 221, 221); display:table-cell; vertical-align:middle;">
										<p>${resume.member.phone}</p>
									</td>
								</tr>

								<tr>
									<td class="table-name" style="vertical-align: middle;">이메일</td>
									<td width="35%" colspan="3" style="border: solid 1px rgb(221, 221, 221); display:table-cell; vertical-align:middle;">
										<p>${resume.member.email}</p>
									</td>
								</tr>
							
							</table>
						</div>
					</div>
				</div>

				<!-- 학력 사항 -->
				<div class="widget">
					<div class="widget-content" style="border: 0px solid #ffffff;">
						<div class="padd" style="padding: 15px; padding-top: 0px;">
							<h3>- 학력 사항</h3>
							<table id="school-table" class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								<tr>
									<th class="table-name" style="vertical-align: middle; width: 50%; border-right: 1px solid #ddd">재학 기간</th>
									<th class="table-name"style="vertical-align: middle; width: 25%; border-right: 1px solid #ddd">학교명</th>
									<th class="table-name" style="vertical-align: middle; width: 25%;">구분</th>
								</tr>
								
								<c:choose>
									<c:when test="${empty resume.academics}">
										<tr align="center" data-form-filled="false">
											<td align="center" colspan="3" style="vertical-align: middle;">
												<strong>미입력</strong>										
											</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="academic" items="${resume.academics}">
											<tr align="center" data-form-filled="false">
												<td style="vertical-align: middle;">
													<p>${academic.enterDate} ~ ${academic.finishedDate}</p>										
												</td>
												
												<td style="vertical-align: middle;">
													<p>${academic.schoolName}</p>
												</td>
												
												<td style="vertical-align: middle;">
													<p>${academic.state}</p>
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
								
							</table>
						</div>
					</div>
				</div>


				<!-- 경력 사항 -->
				<div class="widget">
					<div class="widget-content" style="border: 0px solid #ffffff;">
						<div class="padd" style="padding: 0px 15px;">
							<h3>- 경력 사항</h3>
							<table id="careerTable" class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								<tr>
									<th class="table-name" style="vertical-align: middle; width: 45%; border-right: 1px solid #ddd">근무 기간</th>
									<th class="table-name" style="vertical-align: middle; width: 25%; border-right: 1px solid #ddd">회사명</th>
									<th class="table-name" style="vertical-align: middle; width: 30%;">담당 업무</th>
								</tr>
								
								<!-- empty와 null은 엄연히 다르다. empty는 컬렉션 관련 빈값들 처리할 때 사용. -->
								<c:choose>
									<c:when test="${empty resume.careers}">
										<tr align="center" data-form-filled="false">
											<td align="center" colspan="3" style="vertical-align: middle;">
												<strong>미입력</strong>										
											</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="career" items="${resume.careers}">
											<tr align="center" data-form-filled="false">
												<td style="vertical-align: middle;">
													<p>${career.enterDate} ~ ${career.finishedDate}</p>										
												</td>
												
												<td style="vertical-align: middle;">
													<p>${career.companyName}</p>
												</td>
												
												<td style="vertical-align: middle;">
													<p>${career.role}</p>
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>

							</table>
						</div>
						
						<div class="padd">
							<h3>- 자기 소개</h3>
							<table id="school-table" class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								<tr>
									<td class="table-name" colspan="5" style="vertical-align: middle;">자기 소개서</td>
								</tr>
								
								<tr>
									<td width="35%" colspan="5" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="width:100%; margin: 0px; display: inline-block;">
											${resume.content}
										</div>
									</td>
								</tr>
						
							</table>	
						</div>
					</div>
					<div class="widget-foot" style="text-align: center; padding: 15px 0px; background-color: #ffffff; border: 0px; padding-top : 0px;">
							<div class="pull-right" style="padding-right : 15px;">
								<button type="button" class="btn btn-default" id="apply-list-btn">목록</button>
								<button type="button" class="btn btn-default" id="apply-delete-btn">삭제</button>
						</div>
					</div>
				</div>
		</div>
	</div>
	<!--/ Matter ends -->
</div>
<!--/ Mainbar ends -->
