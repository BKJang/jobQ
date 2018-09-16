<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Main bar -->
<div class="mainbar">
	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			구인 공고 상세
			<!-- page meta -->
			<span class="page-meta">구인 공고 상세 / 수정</span>
		</h2>
		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right" style="text-align: right;">
			<a href="<c:url value="/admin/main.jobq" />">
				<i class="fa fa-home"></i> Home</a> <br /> 
				<span><strong style="font-size: 18px;">구인 공고 상세</strong></span>
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
						<form>
							<table class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								<tr>
									<td class="table-name" style="vertical-align: middle;">업체명</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; width: 50%; display: inline-block;">
											<input type="text" class="form-control" value="${employ.companyName}" />
										</div>
									</td>

									<td class="table-name" style="vertical-align: middle;">고용 형태</td>
									<td width="35%" style="vertical-align: middle; display: table-cell;">
										<div class="form-group" style="margin: 0px;" id="type-employ">
											<label class="radio-inline"> 
												<input type="radio" name="type-employ-radio" value="base" checked>정규직
											</label> 
											
											<label class="radio-inline"> 
												<input type="radio" name="type-employ-radio" value="change">계약직
											</label> 
											
											<label class="radio-inline"> 
												<input type="radio" name="type-employ-radio" value="change">인턴직
											</label> 
											
											<label class="radio-inline"> 
												<input type="radio" name="type-employ-radio" value="change">파견직
											</label>
										</div>
									</td>
								</tr>
								<tr>
									<td class="table-name" style="vertical-align: middle;">공고 제목</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; width: 80%; display: inline-block;">
											<input type="text" class="form-control" value="${employ.title}"/>
										</div>
									</td>

									<td class="table-name" style="vertical-align: middle;">경력</td>
									<td width="35%">
										<label class="radio-inline"> 
												<input type="radio" class="employ-career-btn" name="career-employ-radio" value="신입" id="employ-career-beginner"/>신입
										</label> 
										
										<label class="radio-inline"> 
												<input type="radio" class="employ-career-btn" name="career-employ-radio" value="경력" id="employ-career" />경력
										</label> 	
										<div class="form-group" style="margin: 0px; display: inline-block;">
											<select class="form-control" id="employ-career-select" disabled>
												<option value="선택하세요" selected>선태하세요.</option>
												<option value="0">연차무관</option>
												<option value="1">1년 이상</option>
												<option value="2">2년 이상</option>
												<option value="3">3년 이상</option>
												<option value="4">4년 이상</option>
												<option value="5">5년 이상</option>
												<option value="6">6년 이상</option>
												<option value="7">7년 이상</option>
												<option value="8">8년 이상</option>
												<option value="9">9년 이상</option>
												<option value="10">10년 이상</option>
											</select>
										</div>
										
										<div class="form-group" style="margin: 0px; display: inline-block; padding-left: 8px;">
											<label class="radio-inline"> 
												<input type="radio" class="employ-career-btn" name="career-employ-radio" value="무관" id="employ-career-none"/>무관
											</label> 
										</div>
									</td>
								</tr>

								<tr>
									<td class="table-name" style="vertical-align: middle;">모집 직종</td>
									<td width="35%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="margin: 0px; display: inline-block;">
											<c:forEach var="skill" items="${skills}">
												<label class="checkbox-inline">
													<input type="checkbox" class="employ-skill" data-employ-skill="${skill}" name="skill" value='${skill}'>${skill}
												</label>
											</c:forEach>
										</div>
									</td>
								</tr>

								<tr>
									<td class="table-name" style="vertical-align: middle;">모집 인원</td>
									<td width="80%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="margin: 0px; display: inline-block; width: 10%;">
											<input type="text" class="form-control" width="10%" value="${employ.employNumber}" />
										</div>
										
										<div class="form-group" style="margin: 0px; display: inline-block; width: 30%;">
											<span>명</span>
										</div>
									</td>
								</tr>

								<tr>
									<td class="table-name" style="vertical-align: middle;">학력</td>
									<td width="35%" colspan="3"style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="margin: 0px; display: inline-block;">
											<select class="form-control" id="employ-academic">
												<option value="중학교">중학교 졸업 이상</option>
												<option value="고등학교">고등학교 졸업 이상</option>
												<option value="대학(2년/3년)">대학(2/3년제)졸업 이상</option>
												<option value="대학(4년)">대학(4년)졸업 이상</option>
												<option value="석사">석사 졸업 이상</option>
												<option value="박사">박사 졸업 이상</option>
												<option value="무관">학력무관</option>
											</select>
										</div>
									</td>
								</tr>

								<tr>
									<td class="table-name" style="vertical-align: middle;">급여</td>
									<td width="35%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="margin: 0px; display: inline-block;">
											<select class="form-control" id="employ-salary-type">
												<option value="시급">시급</option>
												<option value="일급">일급</option>
												<option value="주급">주급</option>
												<option value="월급">월급</option>
												<option value="연봉">연봉</option>
												<option value="건별">건별</option>
											</select>
										</div>

										<div class="form-group" style="margin: 0px; display: inline-block; width: 15%;">
											<input type="text" class="form-control" id="employ-salary-money" value=""/>
										</div>

										<div class="form-group" style="margin: 0px; display: inline-block; padding-left: 8px;">
											<label class="checkbox-inline">
												<input type="checkbox" value="">회사 내규에 따름
											</label>
										</div>
									</td>
								</tr>

								<tr>
									<td class="table-name" style="vertical-align: middle;">모집 마감일</td>
									<td width="35%" colspan="3">
										<div class="form-group" style="margin: 0px; width: 20%; display: inline-block;">
											<input type="date" class="form-control" value="${employ.closeDate}"/>
										</div>
									</td>
								</tr>

								<tr>
									<td class="table-name" style="vertical-align: middle;">담당자 명</td>
									<td width="35%" colspan="3">
										<div class="form-group" style="margin: 0px; width: 15%; display: inline-block;">
											<input type="text" class="form-control" value="${employ.member.id}" />
										</div>
									</td>
								</tr>

								<tr>
									<td class="table-name" style="vertical-align: middle;">담당자 이메일</td>
									<td width="35%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="width: 15%; margin: 0px; display: inline-block;">
											<input type="email" class="form-control" id="emailId" value="${employ.member.email.emailId}" />
										</div> <span> @ </span>

										<div class="form-group" style="width: 15%; margin: 0px; display: inline-block;">
											<input type="text" class="form-control" id="emailDomain" value="${employ.member.email.emailDomain}" />
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
											<select class="form-control">
												<option value="010" selected>010</option>
												<option value="011">011</option>
												<option value="018">018</option>
												<option value="016">016</option>
											</select>
										</div> <span> - </span>

										<div class="form-group" style="width: 8%; margin: 0px; display: inline-block;">
											<input type="text" class="form-control" value="${employ.member.phone.midNumber}" />
										</div> <span> - </span>

										<div class="form-group" style="width: 8%; margin: 0px; display: inline-block;">
											<input type="text" class="form-control" value="${employ.member.phone.lastNumber}" />
										</div>
									</td>
								</tr>

								<!-- 주소 -->

								<tr>
									<td class="table-name" style="vertical-align: middle;">회사 주소</td>
									<td width="35%" colspan="3" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="width: 20%; margin: 0px; display: inline-block;">
											<input type="text" class="form-control" id="zip-code" readOnly value="${employ.address.zipCode}" />
										</div> 
										<input type="button" id="addr-btn" class="btn" value="우편번호 검색" />

										<div class="form-group" style="margin: 0px; width: 60%; padding: 4px 0px;">
											<input type="text" class="form-control" id="road-address" readOnly value="${employ.address.roadAddr}" />
										</div>

										<div class="form-group" style="margin: 0px; width: 60%; padding: 4px 0px;">
											<input type="text" class="form-control" id="detail-address" readOnly value="${employ.address.detailAddr}" />
										</div>
									</td>
								</tr>

								<!-- 주소 끝 -->

							</table>
						</form>
					</div>

					<div class="padd" style="padding: 0px 15px;">
						<table class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
							<tr>
								<td class="table-name" colspan="5" style="vertical-align: middle;">모집 내용</td>
							</tr>


							<tr>
								<td colspan="5" style="border: solid 1px rgb(221, 221, 221);">
									<div class="form-group" style="margin: 0px;">
										<textarea class="form-control" rows="5" cols="80" id="employ-editor">
												${employ.content}
										</textarea>
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>

				<div class="widget-foot"
					style="text-align: center; padding: 4px 0px; background-color: #ffffff; border: 0px;">
					<button type="button" class="btn btn-default">수정</button>
					<button type="button" class="btn btn-default" id="employ-update-btn">취소</button>
				</div>
			</div>


		</div>
	</div>
	<!--/ Matter ends -->
</div>
<!--/ Mainbar ends -->
