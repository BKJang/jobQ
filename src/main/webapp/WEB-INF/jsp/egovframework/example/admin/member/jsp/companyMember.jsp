<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- Main bar -->
<div class="mainbar">
	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			회원 추가
			<!-- page meta -->
			<span class="page-meta">기업 회원</span>
		</h2>
		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right" style="text-align: right;">
			<a href="<c:url value="/admin/main.jobq" />"><i
				class="fa fa-home"></i>Home </a> <br /> 
				<span>회원 관리&nbsp;-&nbsp;회원 검색&nbsp;-&nbsp;<strong style="font-size: 18px;">기업 회원 추가</strong>
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
					<div class="padd" style="padding: 0px 15px;">
						<div class="pull-right"><strong>* 필수 입력 사항</strong></div>
						
						<form:form commandName="companyMember" id="company_member_regist_form" > 
							<table class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								<tr>
									<td class="table-name" style="vertical-align: middle;">*아이디</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; width: 100%; display: inline-block;">
											<form:input path="member.id" cssClass="form-control" id="id" cssStyle="display : inline-block; width : 65%;" />
											<input type="button" class="btn" id="duplicate-id-btn" value="중복 검사" style="font-size:12px !important; width:60px; padding:6px 3px;">
										</div>
										<span id="id-error"></span> 
									</td>

									<td class="table-name" style="vertical-align: middle;">*비밀번호</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; width: 60%; display: inline-block;">
											<form:password path="member.password" cssClass="form-control" id="member_password" />
										</div>
									</td>
								</tr>
								<tr>
									<td class="table-name" style="vertical-align: middle;">*대표자명</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; width: 60%; display: inline-block;">
											<form:input path="bossName" cssClass="form-control" id="boss_name" />
										</div>
									</td>

									<td class="table-name" style="vertical-align: middle;">*비밀번호 확인</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; width: 60%; display: inline-block;">
											<form:password path="member.confirmPassword" cssClass="form-control" id="member_confirmPassword" />
										</div>
									</td>
								</tr>
								
								<tr>
									<td class="table-name" style="vertical-align: middle;">*담당자 이름</td>
									<td width="35%" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="width: 50%; margin: 0px; display: inline-block;">
											<form:input path="member.name" cssClass="form-control" id="member_name" />
										</div>
									</td>
									
									<td class="table-name" style="vertical-align: middle;">*성별</td>
									<td width="35%" style="vertical-align: middle;">
										<label class="radio-inline"> 
											<form:radiobutton path="member.sex" value="0" label="남자"/>
										</label> 
										<label class="radio-inline">
										 	<form:radiobutton path="member.sex" value="1" label="여자"/>
										</label> 
									</td>
								</tr>
								
								<tr>
									<td class="table-name" style="vertical-align: middle;">담당자 연락처</td>
									<td width="35%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="margin: 0px; display:inline-block;">
											<form:select path="member.phone.firstNumber" cssClass="form-control">
												<form:option value="010" label="010" />
												<form:option value="011" label="011" />
												<form:option value="018" label="018" />
												<form:option value="016" label="016" />
											</form:select>
										</div> <span> - </span>

										<div class="form-group" style="width: 8%; margin: 0px; display: inline-block;">
											<form:input path="member.phone.midNumber" cssClass="form-control"  />
										</div> <span> - </span>
									
										<div class="form-group" style="width: 8%; margin: 0px; display: inline-block;">
											<form:input path="member.phone.lastNumber" cssClass="form-control" />
										</div>
									</td>
								</tr>
								
								<tr>
									<td class="table-name" style="vertical-align: middle;">*담당자 이메일</td>
									<td width="35%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="width: 15%; margin: 0px; display: inline-block;">
											<form:input path="member.email.emailId" cssClass="form-control"/>
										</div> <span> @ </span>
									
										<div class="form-group" style="width: 15%; margin: 0px; display: inline-block;">
											<form:input path="member.email.emailDomain" id="email-domain" cssClass="form-control" />
										</div> 
										
										<div class="form-group" style="margin: 0px; display:inline-block;">
											<select class="form-control" id="selectEmail">
												<option selected>직접 입력</option>
												<option value="naver.com">naver.com</option>
												<option value="google.com">google.com</option>
												<option value="daum.com">daum.com</option>
												<option value="outlook.com">outlook.com</option>
											</select>
										</div>
									</td>
								</tr>
								
								<tr>
									<td class="table-name" style="vertical-align: middle;">*생년 월일</td>
									<td width="35%" colspan="3">
										<div class="form-group" style="margin: 0px; width: 20%; display: inline-block;">
											<form:input path="member.birthDate" id="hidden-date" cssStyle="display : none;"/>
											<input type="date" id="real-date" class="form-control" />
										</div> 
									</td>
								</tr>
								
								<tr>
									<td class="table-name" style="vertical-align: middle;">*회사명</td>
									<td width="35%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="width: 30%; margin: 0px; display: inline-block;">
											<form:input path="companyName" cssClass="form-control" />
										</div>
									</td>
								</tr>

								<tr>
									<td class="table-name" style="vertical-align: middle;">*사업자 번호</td>
									<td colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="margin: 0px; display: inline-block; width: 8%;">
											<form:input path="companyNumber.firstCompanyNumber" cssClass="form-control" />
										</div> <span> - </span>

										<div class="form-group" style="width: 6%; margin: 0px; display: inline-block;">
											<form:input path="companyNumber.midCompanyNumber" cssClass="form-control" />
										</div> <span> - </span>

										<div class="form-group" style="width: 12%; margin: 0px; display: inline-block;">
											<form:input path="companyNumber.lastCompanyNumber" cssClass="form-control" />
										</div>
									</td>
								</tr>


								<tr>
									<td class="table-name" style="vertical-align: middle;">기업형태</td>
									<td width="35%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="width: 20%; margin: 0px; display: inline-block;">
											<form:select path="type" cssClass="form-control">
												<form:option value="대기업" label="대기업" />
												<form:option value="중소 기업" label="중소 기업" />
												<form:option value="소기업" label="소기업" />
												<form:option value="정부/공공 기관" label="정부/공공 기관" />
											</form:select>
										</div>
									</td>
								</tr>


								<tr>
									<td class="table-name" style="vertical-align: middle;">설립일</td>
									<td width="35%" colspan="3">
										<div class="form-group" style="margin: 0px; width: 20%; display: inline-block;">
											<input type="date" class="form-control" id="company_birth_date_input" />
											<form:hidden path="companyBirthDate" id="hidden_company_birth_date_input"/>
										</div>
									</td>
								</tr>

								<tr>
									<td class="table-name" style="vertical-align: middle;">직원수</td>
									<td width="35%" colspan="3">
										<div class="form-group"style="margin: 0px; width: 15%; display: inline-block;">
											<form:input path="companyMemberNumber" cssClass="form-control" id="company_member_number" />
										</div>
									</td>
								</tr>

								<tr>
									<td class="table-name" style="vertical-align: middle;">홈페이지</td>
									<td width="35%" colspan="3">
										<div class="form-group" style="margin: 0px; width: 40%; display: inline-block;">
											<form:input path="companyHomepage" cssClass="form-control" />
										</div>
									</td>
								</tr>

								<!-- 주소 -->

								<tr>
									<td class="table-name" style="vertical-align: middle;">*회사 주소</td>
									<td width="35%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="width: 20%; margin: 0px; display: inline-block;">
											<form:input path="companyAddr.zipCode" cssClass="form-control" id="zip-code" readonly="true" />
										</div> 
										<input type="button" id="addr-btn" class="btn" value="우편번호 검색" />

										<div class="form-group" style="margin: 0px; width: 60%; padding: 4px 0px;">
											<form:input path="companyAddr.roadAddr" cssClass="form-control" id="road-address" readonly="true" />
										</div>

										<div class="form-group" style="margin: 0px; width: 60%; padding: 4px 0px;">
											<form:input path="companyAddr.detailAddr" cssClass="form-control" id="detail-address" readonly="true" />
										</div>
									</td>
								</tr>

								<!-- 주소 끝 -->

								<!-- 관리자 메모 -->

								<tr>
									<td class="table-name" style="vertical-align: middle;">*사업 내용</td>
									<td width="35%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="width: 70%; margin: 0px; display: inline-block;">
											<form:textarea path="companyExplain" cssClass="form-control" rows="5" cols="80" id="comment" />
										</div>
									</td>
								</tr>

								<!-- 관리자 메모 끝 -->
							</table>
							<!-- </div> -->
						</form:form>
					</div>
				</div>

				<div class="widget-foot" style="text-align: center; padding: 4px 0px; background-color: #ffffff; border: 0px;">
					<button type="button" class="btn btn-default" id="company_member_regist_btn">등록</button>
					<button type="button" class="btn btn-default" id="memberAddCancleBtn">취소</button>
				</div>
			</div>


		</div>
	</div>
	<!--/ Matter ends -->
</div>
<!--/ Mainbar ends -->
