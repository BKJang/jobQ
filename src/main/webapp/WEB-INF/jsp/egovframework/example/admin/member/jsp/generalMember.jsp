<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- Main bar -->
<div class="mainbar">
	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			회원 추가

			<!-- page meta -->
			<span class="page-meta">개인 회원</span>
		</h2>
		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right" style="text-align: right;">
			<a href="<c:url value="/admin/main.jobq" />"><i
				class="fa fa-home"></i>Home</a> <br /> 
				<span>회원 관리&nbsp;-&nbsp;회원 검색&nbsp;-&nbsp;<strong style="font-size: 18px;">개인 회원 추가</strong>
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
						<div class="pull-right"><strong>* 필수 입력 사항</strong></div>
						<form:form commandName="member" id="member-regist-form">
						
							<table class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								<tr>
									<td class="table-name" style="vertical-align: middle;">*아이디</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; width: 100%; display: inline-block;">
											<form:input path="id" cssClass="form-control" cssStyle="display : inline-block; width : 65%;" />
											<input type="button" class="btn btn-default" id="duplicate-id-btn" value="중복 검사" style="font-size:12px !important; width:60px; padding:6px 3px;">
										</div>
										<span id="id-error"></span>
									</td>

									<td class="table-name" style="vertical-align: middle;">*비밀번호</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; width: 100%; display: inline-block;">
											<form:password path="password" cssClass="form-control" cssStyle="width : 60%;" maxlength="15" />
										</div>
										<span id="password-error"></span>
									</td>
								</tr>
								<tr>
									<td class="table-name" style="vertical-align: middle;">*이름</td>
									<td width="35%">
										<div class="form-group" style="margin : 0px; width : 100%; display: inline-block;">
											<form:input path="name" cssClass="form-control" cssStyle="width : 60%;" maxlength="5" />
										</div>
										<span id="name-error"></span> 
									</td>
									
									<td class="table-name" style="vertical-align: middle;">*비밀번호 확인</td>
									<td width="35%">
										<div class="form-group" style="margin : 0px; width : 100%; display: inline-block;">
											<form:password path="confirmPassword" cssClass="form-control" cssStyle="width : 60%;" maxlength="15" />
										</div>
										<span id="confirm-password-error"></span>
									</td>
								</tr>
								
								<!-- 휴대폰 -->
								
								<tr>
									<td class="table-name" style="vertical-align: middle;">휴대폰</td>
									<td width="35%" style="border: solid 1px rgb(221, 221, 221);">
										<div>
											<div class="form-group" style="margin: 0px; display:inline-block;">
												<form:select path="phone.firstNumber" cssClass="form-control">
													<form:option value="010" label="010" />
													<form:option value="011" label="011" />
													<form:option value="018" label="018" />
													<form:option value="016" label="016" />
												</form:select>
											</div> <span> - </span>
	
											<div class="form-group" style="width: 20%; margin: 0px; display: inline-block;">
												<form:input path="phone.midNumber" cssClass="form-control" maxlength="4" />
											</div> <span> - </span>
										
											<div class="form-group" style="width: 20%; margin: 0px; display: inline-block;">
												<form:input path="phone.lastNumber" cssClass="form-control" maxlength="4" />
											</div>
										</div>
									</td>
									
									<td class="table-name" style="vertical-align: middle;">*성별</td>
									<td width="35%" style="vertical-align: middle;">
										<label class="radio-inline"> 
											<form:radiobutton path="sex" value="0" label="남자"/>
										</label> 
										<label class="radio-inline">
										 	<form:radiobutton path="sex" value="1" label="여자"/>
										</label> 
									</td>
								</tr>
								
								<!-- 휴대폰 끝 -->
								
								<!-- 이메일 -->
								
								<tr>
									<td class="table-name" style="vertical-align: middle;">*이메일</td>
									<td width="35%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="width: 15%; margin: 0px; display: inline-block;">
											<form:input path="email.emailId" cssClass="form-control" maxlength="15" />
										</div> <span> @ </span>
									
										<div class="form-group" style="width: 15%; margin: 0px; display: inline-block;">
											<form:input path="email.emailDomain" id="email-domain" cssClass="form-control" maxlength="12" />
										</div> 
										
										<div class="form-group" style="margin: 0px; display:inline-block;">
											<select class="form-control" id="select-email">
												<option selected>직접 입력</option>
												<option value="naver.com">naver.com</option>
												<option value="google.com">google.com</option>
												<option value="daum.com">daum.com</option>
												<option value="outlook.com">outlook.com</option>
											</select>
										</div>
									</td>
								</tr>
								
								<!-- 이메일 끝 -->
								
								<tr>
									<td class="table-name" style="vertical-align: middle;">*생년 월일</td>
									<td width="35%" colspan="3">
										<div class="form-group" style="margin: 0px; width: 20%; display: inline-block;">
											<form:input path="birthDate" id="hidden-date" cssStyle="display : none;"/>
											<input type="date" id="real-date" class="form-control" />
										</div> 
									</td>
								</tr>
								
								<tr>	
									<td class="table-name" style="vertical-align: middle;">홈페이지</td>
									<td width="35%" colspan="3">
										<div class="form-group" style="margin: 0px; width: 40%; display: inline-block;">
											<form:input path="homepage" cssClass="form-control" />
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
						
						</form:form>
					</div>
				</div>
				
				<div class="widget-foot" style="text-align:center; padding:4px 0px; background-color:#ffffff; border:0px;">
					<input type="button" class="btn btn-default" id="member-regist-btn" value="등록" />
					
					<button type="button" class="btn btn-default" id="member-regist-cancle-btn">취소</button>
				</div>
		</div>

		</div>
	</div>
	<!--/ Matter ends -->
</div>
<!--/ Mainbar ends -->
