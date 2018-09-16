<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- Main bar -->
<div class="mainbar">
	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			회원 상세

			<!-- page meta -->
			<span class="page-meta">개인 회원</span>
		</h2>
		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right" style="text-align: right;">
			<a href="<c:url value="/admin/main.jobq" />"><i
				class="fa fa-home"></i>Home</a> <br /> 
				<span>회원 관리&nbsp;-&nbsp;회원 검색&nbsp;-&nbsp;<strong style="font-size: 18px;">개인 회원 상세</strong>
			</span>
		</div>
		<div class="clearfix"></div>
	</div>
	<!--/ Page heading ends -->
					
	<!-- Matter -->
	<div class="matter">
		<div class="container">
			<div class="widget">
				<div class="widget-content" style="border: 0px solid #ffffff;">
					<div class="padd" style="padding:0px 15px;">
						
							<table class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								<tr>
									<td class="table-name" style="vertical-align: middle;">아이디</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; width: 100%; display: inline-block;">
											<span>${member.id}</span>
											<%-- <form:input path="id" cssClass="form-control" cssStyle="display : inline-block; width : 65%;" />
											<input type="button" class="btn" id="duplicate-id-btn" value="중복 검사" style="font-size:12px !important; width:60px; padding:6px 3px;"> --%>
										</div>
									</td>

									<td class="table-name" style="vertical-align: middle;">이름</td>
									<td width="35%">
										<div class="form-group" style="margin : 0px; width : 100%; display: inline-block;">
											<span>${member.name}</span>
										</div>
									</td>
								</tr>
								<tr>
									<td class="table-name" style="vertical-align: middle;">휴대폰</td>
									<td width="35%" style="border: solid 1px rgb(221, 221, 221);">
										<div>
											<div class="form-group" style="margin: 0px; display:inline-block;">
												<span>${member.phone.fullPhoneNumber}</span>
											</div>
										</div>
									</td>
									
									<td class="table-name" style="vertical-align: middle;">이메일</td>
									<td width="35%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<c:if test="${member.email ne null}">
											<span>${member.email.fullEmail}</span>
										</c:if>
										<c:if test="${member.email eq nul}">
											<span>미입력</span>									
										</c:if>
									</td>
								</tr>
								
								<!-- 휴대폰 -->
								
								<tr>
									<td class="table-name" style="vertical-align: middle;">생년 월일</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; width: 30%; display: inline-block;">
											<span>${member.birthDate}</span>
										</div> 
									</td>
									
									<td class="table-name" style="vertical-align: middle;">성별</td>
									<td width="35%" style="vertical-align: middle;">
										<c:choose>
											<c:when test="${member.sex eq '1'}">
												<span>여자</span>
											</c:when>
											<c:otherwise>
												<span>남자</span>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								
								<!-- 휴대폰 끝 -->
								
								<tr>	
									<td class="table-name" style="vertical-align: middle;">구분</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; width: 40%; display: inline-block;">
											<span>일반 회원</span>
										</div> 
									</td>
									<td class="table-name" style="vertical-align: middle;">등록일</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; width: 40%; display: inline-block;">
											<span>${member.regDate}</span>
										</div> 
									</td>
								</tr>
								
								<tr>
									<td class="table-name" style="vertical-align: middle;">홈페이지</td>
									<td width="35%" colspan="3">
										<div class="form-group" style="margin: 0px; width: 40%; display: inline-block;">
											<c:if test="${member.homepage eq null}">
												<span>미등록</span>
											</c:if>
											<c:if test="${member.homepage ne null}">
												<span>${member.homepage}</span>
											</c:if>
										</div> 
									</td>
								</tr>
								
								<!-- 관리자 메모 -->
								
								<!-- <tr>
									<td class="table-name" style="vertical-align: middle;">관리자 메모</td>
									<td width="35%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="width: 70%; margin: 0px; display: inline-block;">
											<textarea class="form-control" rows="5" cols="80" id="comment"></textarea>
										</div>
									</td>
								</tr> -->
								
								<!-- 관리자 메모 끝 -->
							</table>
							<!-- </div> -->
						
						
					</div>
				</div>
				
				<div class="widget-foot" style="text-align:center; padding:4px 0px; background-color:#ffffff; border:0px;">
					<div class="pull-right" style="padding-right : 15px;">
						<input type="button" class="btn btn-default" id="member-list-btn" value="리스트" />
						<button type="button" class="btn btn-default" id="member-delete-btn">삭제</button>
					</div>
				</div>
		</div>

		</div>
	</div>
	<!--/ Matter ends -->
</div>
<!--/ Mainbar ends -->
