<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- Main bar -->
<div class="mainbar">
	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			구인 공고 추가
		</h2>
		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right" style="text-align: right;">
			<a href="<c:url value="/admin/main.jobq" />">
				<i class="fa fa-home"></i> Home</a> <br /> 
				<span><strong style="font-size: 18px;">구인 공고 추가</strong></span>
		</div>
		<div class="clearfix"></div>
	</div>
	<!--/ Page heading ends -->

	<!-- Matter -->
	<div class="matter">
		<div class="container">
			<div class="widget">
				<div class="widget-content" style="border: 0px solid #ffffff;">
					<!-- 스프링 form태그의 action속성에 c:url을 쓸 수 없는거 같다. -->
	
					<form:form commandName="employ" id="employ-form">
					<div class="padd" style="padding: 0px 15px;">
							<div class="pull-right"><strong>* 필수 입력 사항</strong></div>
							<table class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								<tr>
									<td class="table-name" style="vertical-align: middle;">*업체명</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; width: 50%; display: inline-block;">
											<form:input path="companyName" cssClass="form-control"/>
										</div>
									</td>

									<td class="table-name" style="vertical-align: middle;">고용 형태</td>
									<td width="35%" style="vertical-align: middle; display: table-cell;">
										<div class="form-group" style="margin: 0px;">
											<label class="radio-inline"> 
												<input type="radio" name="logo-radio" value="base" checked>정규직
											</label> 
											
											<label class="radio-inline"> 
												<input type="radio" name="logo-radio" value="change">계약직
											</label> 
											
											<label class="radio-inline"> 
												<input type="radio"name="logo-radio" value="change">인턴직
											</label> 
											
											<label class="radio-inline"> 
												<input type="radio" name="logo-radio" value="change">파견직
											</label>
										</div>
									</td>
								</tr>
								
								<tr>
									<td class="table-name" style="vertical-align: middle;">*공고 제목</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; width: 60%; display: inline-block;">
											<form:input path="title" cssClass="form-control"/>
										</div>
									</td>

									<td class="table-name" style="vertical-align: middle;">경력</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; display: inline-block;">
											<select class="form-control">
												<option value="010" selected>신입</option>
												<option value="011">1년</option>
												<option value="018">2년</option>
												<option value="011">3년</option>
												<option value="011">4년</option>
												<option value="011">5년</option>
												<option value="011">6년</option>
												<option value="011">7년</option>
												<option value="011">8년</option>
												<option value="011">9년</option>
												<option value="011">10년 이상</option>
											</select>
										</div>
										
										<div class="form-group" style="margin: 0px; display: inline-block; padding-left: 8px;">
											<label class="checkbox-inline">
												<input type="checkbox" value="">무관
											</label>
										</div>
									</td>
								</tr>

								<tr>
									<td class="table-name" style="vertical-align: middle;">*모집 직종</td>
									<td width="35%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="margin: 0px; display: inline-block;">
											<select class="form-control">
												<option value="010" selected>선택하세요.</option>
												<option value="011">JAVA</option>
												<option value="018">C</option>
												<option value="011">C++</option>
												<option value="011">C#</option>
												<option value="011">Python</option>
												<option value="011">Scala</option>
												<option value="011">R</option>
												<option value="011">JavaScript</option>
												<option value="011">PHP</option>
												<option value="011">SQL</option>
											</select>
										</div>
									</td>
								</tr>

								<tr>
									<td class="table-name" style="vertical-align: middle;">모집 인원</td>
									<td width="35%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="margin: 0px; display: inline-block; width: 10%;">
											<form:input path="employNumber" cssClass="form-control"/>
										</div>
									</td>
								</tr>

								<tr>
									<td class="table-name" style="vertical-align: middle;">학력</td>
									<td width="35%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="margin: 0px; display: inline-block;">
											<select class="form-control">
												<option value="010">중학교 졸업</option>
												<option value="011">고등학교 졸업</option>
												<option value="018">대학(2~3년제) 졸업</option>
												<option value="011" selected>대학(4년제) 졸업</option>
												<option value="011">대학원(석사)</option>
												<option value="011">대학원(박사)</option>
											</select>
										</div>

										<div class="form-group" style="margin: 0px; display: inline-block; padding-left: 8px;">
											<label class="checkbox-inline">
												<input type="checkbox" value="">무관
											</label>
										</div>
									</td>
								</tr>

								<tr>
									<td class="table-name" style="vertical-align: middle;">급여</td>
									<td width="35%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="margin: 0px; display: inline-block;">
											<select class="form-control">
												<option value="010">시급</option>
												<option value="011">주급</option>
												<option value="018">일급</option>
												<option value="011" selected>월급</option>
												<option value="011">연봉</option>
												<option value="011">협의</option>
											</select>
										</div>

										<div class="form-group" style="margin: 0px; display: inline-block; width: 15%;">
											<input type="text" class="form-control" />
										</div>

										<div class="form-group" style="margin: 0px; display: inline-block; padding-left: 8px;">
											<label class="checkbox-inline">
												<input type="checkbox" value="">회사 내규에 따름
											</label>
										</div>
									</td>
								</tr>

								<tr>
									<td class="table-name" style="vertical-align: middle;">선택 사항 입력</td>
									<td colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="margin: 0px; display: inline-block; padding-left: 8px;">
											<label class="checkbox-inline">
												<input type="checkbox" value="">4대 보험
											</label>
										</div>

										<div class="form-group" style="margin: 0px; display: inline-block; padding-left: 8px;">
											<label class="checkbox-inline">
												<input type="checkbox" value="">식비(식사)지원
											</label>
										</div>

										<div class="form-group" style="margin: 0px; display: inline-block; padding-left: 8px;">
											<label class="checkbox-inline">
												<input type="checkbox" value="">주휴 수당
											</label>
										</div>
									</td>
								</tr>

								<tr>
									<td class="table-name" style="vertical-align: middle;">모집 마감일</td>
									<td width="35%" colspan="3">
										<div class="form-group" style="margin: 0px; width: 20%; display: inline-block;">
											<input type="date" id="real-employ-date" class="form-control" />
											<form:hidden path="closeDate" id="hidden-employ-date"/>
										</div>
									</td>
								</tr>

								<tr>
									<td class="table-name" style="vertical-align: middle;">담당자명</td>
									<td width="35%" colspan="3">
										<div class="form-group" style="margin: 0px; width: 15%; display: inline-block;">
											<form:input path="member.id" cssClass="form-control"/>
										</div>
									</td>
								</tr>

								<tr>
									<td class="table-name" style="vertical-align: middle;">담당자 이메일</td>
									<td width="35%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="width: 15%; margin: 0px; display: inline-block;">
											<form:input path="member.email.emailId" cssClass="form-control"/>
										</div> <span> @ </span>

										<div class="form-group" style="width: 15%; margin: 0px; display: inline-block;">
											<form:input path="member.email.emailDomain" cssClass="form-control"/>
										</div>

										<div class="form-group" style="margin: 0px; display: inline-block;">
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
									<td class="table-name" style="vertical-align: middle;">담당자 연락처</td>
									<td width="35%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="margin: 0px; display: inline-block;">
											<form:select path="member.phone.firstNumber" cssClass="form-control">
												<form:option value="010" label="010" />
												<form:option value="011" label="011" />
												<form:option value="018" label="018" />
												<form:option value="016" label="016" />
											</form:select>
										</div> <span> - </span>

										<div class="form-group" style="width: 8%; margin: 0px; display: inline-block;">
											<form:input path="member.phone.midNumber" cssClass="form-control"/>
										</div> <span> - </span>

										<div class="form-group" style="width: 8%; margin: 0px; display: inline-block;">
											<form:input path="member.phone.lastNumber" cssClass="form-control"/>
										</div>
									</td>
								</tr>

								<!-- 주소 -->

								<tr>
									<td class="table-name" style="vertical-align: middle;">회사 주소</td>
									<td width="35%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="width: 20%; margin: 0px; display: inline-block;">
											<form:input path="address.zipCode" cssClass="form-control" readonly="true" />
										</div> 
										<input type="button" id="addr-btn" class="btn" value="우편번호 검색" />

										<div class="form-group" style="margin: 0px; width: 60%; padding: 4px 0px;">
											<form:input path="address.roadAddr" cssClass="form-control" readonly="true" />
										</div>

										<div class="form-group" style="margin: 0px; width: 60%; padding: 4px 0px;">
											<form:input path="address.detailAddr" cssClass="form-control" readonly="true" />
										</div>
									</td>
								</tr>

								<!-- 주소 끝 -->

							</table>
						
					</div>

					<div class="padd" style="padding: 0px 15px;">
						<table class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
							<tr>
								<td class="table-name" colspan="5" style="vertical-align: middle;">모집 내용</td>
							</tr>

							<tr>
								<td colspan="5" style="border: solid 1px rgb(221, 221, 221);">
									<div class="form-group" style="margin: 0px;">
										<textarea rows="5" cols="80" id="employ-regist-editor" ></textarea>
										<form:hidden path="content" id="hidden-employ-content" />
									</div>
								</td>
							</tr>
						</table>
					</div>
				</form:form>
				</div>
				
				<div class="widget-foot" style="text-align: center; padding: 4px 0px; background-color: #ffffff; border: 0px;">
					<button type="button" class="btn btn-default" id="employ-add-btn">등록</button>
					<button type="button" class="btn btn-default" id="memberAddCancleBtn">취소</button>
				</div>
			</div>


		</div>
	</div>
	<!--/ Matter ends -->
</div>
<!--/ Mainbar ends -->
