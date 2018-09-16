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
			<span class="page-meta">기업 회원</span>
		</h2>
		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right" style="text-align: right;">
			<a href="<c:url value="/admin/main.jobq" />"><i
				class="fa fa-home"></i>Home</a> <br /> 
				<span>회원 관리&nbsp;-&nbsp;회원 검색&nbsp;-&nbsp;<strong style="font-size: 18px;">기업 회원 상세</strong>
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
							<h3>- 개인 정보</h3>
							<table class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								
								<tr>
									<td class="table-name" style="vertical-align: middle;">담당자 아이디</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; width: 100%; display: inline-block;">
											<span>${companyMember.member.id}</span>
										</div>
									</td>

									<td class="table-name" style="vertical-align: middle;">담당자 이름</td>
									<td width="35%">
										<div class="form-group" style="margin : 0px; width : 100%; display: inline-block;">
											<span>${companyMember.member.name}</span>
										</div>
									</td>
								</tr>
								
								<tr>
									<td class="table-name" style="vertical-align: middle;">담당자 휴대폰</td>
									<td width="35%" style="border: solid 1px rgb(221, 221, 221);">
										<div>
											<div class="form-group" style="margin: 0px; display:inline-block;">
												<c:if test="${companyMember.member.phone ne null}">
													<span>${companyMember.member.phone.fullPhoneNumber}</span>
												</c:if>
												<c:if test="${companyMember.member.phone eq null}">
													<span>미입력</span>									
												</c:if>
											</div>
										</div>
									</td>
									
									<td class="table-name" style="vertical-align: middle;">담당자 이메일</td>
									<td width="35%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<span>${companyMember.member.email.fullEmail}</span>
									</td>
								</tr>
								
								<!-- 휴대폰 -->
								
								<tr>
									<td class="table-name" style="vertical-align: middle;">생년 월일</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; width: 30%; display: inline-block;">
											<span>${companyMember.member.birthDate}</span>
										</div> 
									</td>
									
									<td class="table-name" style="vertical-align: middle;">성별</td>
									<td width="35%" style="vertical-align: middle;">
										<c:choose>
											<c:when test="${companyMember.member.sex eq '1'}">
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
											<span>기업 회원</span>
										</div> 
									</td>
									<td class="table-name" style="vertical-align: middle;">등록일</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; width: 40%; display: inline-block;">
											<span>${companyMember.member.regDate}</span>
										</div> 
									</td>
								</tr>
								
							</table>
							
							
							
							<h3 style="padding-top : 20px;">- 기업 정보</h3>
							<table class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">

								<tr>
									<td class="table-name" style="vertical-align: middle;">대표자명</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; width: 100%; display: inline-block;">
											<span>${companyMember.bossName}</span>
										</div>
									</td>

									<td class="table-name" style="vertical-align: middle;">회사명</td>
									<td width="35%">
										<div class="form-group" style="margin : 0px; width : 100%; display: inline-block;">
											<span>${companyMember.companyName}</span>
										</div>
									</td>
								</tr>
								
								<tr>
									<td class="table-name" style="vertical-align: middle;">사업자 번호</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; width: 100%; display: inline-block;">
											<span>${companyMember.companyNumber.fullCompanyNumber}</span>
										</div>
									</td>

									<td class="table-name" style="vertical-align: middle;">직원수</td>
									<td width="35%">
										<div class="form-group" style="margin : 0px; width : 100%; display: inline-block;">
											<c:if test="${companyMember.companyMemberNumber ne null}">
												<span>${companyMember.companyMemberNumber}</span>
											</c:if>
											
											<c:if test="${companyMember.companyMemberNumber eq null}">
												<span>미입력</span>									
											</c:if>
										</div>
									</td>
								</tr>
								
								<tr>
									<td class="table-name" style="vertical-align: middle;">기업 형태</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; width: 100%; display: inline-block;">
											<c:if test="${companyMember.type ne null}">
												<span>${companyMember.type}</span>
											</c:if>
											
											<c:if test="${companyMember.type eq null}">
												<span>미입력</span>									
											</c:if>
										</div>
									</td>

									<td class="table-name" style="vertical-align: middle;">설립일</td>
									<td width="35%">
										<div class="form-group" style="margin : 0px; width : 100%; display: inline-block;">
											<c:if test="${companyMember.companyBirthDate ne null}">
												<span>${companyMember.companyBirthDate}</span>
											</c:if>
											
											<c:if test="${companyMember.companyBirthDate eq null}">
												<span>미입력</span>									
											</c:if>
										</div>
									</td>
								</tr>
								
								<tr>
									<td class="table-name" style="vertical-align: middle;">홈페이지</td>
									<td width="35%" colspan="3">
										<div class="form-group" style="margin: 0px; width: 40%; display: inline-block;">
											
											<c:if test="${companyMember.companyHomepage eq null}">
												<span>미등록</span>
											</c:if>
											
											<c:if test="${companyMember.companyHomepage ne null}">
												<span>${companyMember.companyHomepage}</span>
											</c:if>
										
										</div> 
									</td>
								</tr>
								
								<tr>
									<td class="table-name" style="vertical-align: middle;">회사 주소</td>
									<td width="35%" colspan="3">
										<div class="form-group" style="margin: 0px; width: 40%; display: inline-block;">
											
											<c:choose>
												<c:when test="${empty companyMember.companyAddr.zipCode}">
													<span>미등록</span>
												</c:when>
												<c:otherwise>
													<p>
														<strong>우편 번호 : </strong>
														<span>${companyMember.companyAddr.zipCode}</span>
													</p>
													
													<p>
														<strong>도로명 : </strong>
														<span>${companyMember.companyAddr.roadAddr}</span>
													</p>
													
													<p>
														<strong>상세 주소 : </strong>
														<span>${companyMember.companyAddr.detailAddr}</span>
													</p>
												</c:otherwise>
											</c:choose>
											
										</div> 
									</td>
								</tr>
								
								<tr>
									<td class="table-name" colspan="4" style="vertical-align: middle;">회사 소개</td>
								</tr>
								
								<tr>
									<td width="35%" colspan="4">
										<div class="form-group" style="margin: 0px; width: 40%; display: inline-block;">
											
											<c:choose>
												
												<c:when test="${empty companyMember.companyExplain}">
													<span>미등록</span>
												</c:when>
												
												<c:otherwise>
													<p>${companyMember.companyExplain}</p>
												</c:otherwise>
											
											</c:choose>
										
										</div> 
									</td>
								</tr>
								
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
