<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Main bar -->
<div class="mainbar">
	<!-- Page heading -->
	<div class="page-head">
		<!-- Page heading -->
		<h2 class="pull-left">
			이력서 수정
			<!-- page meta -->
			<span class="page-meta">개인 회원</span>
		</h2>
		<!-- Breadcrumb -->
		<div class="bread-crumb pull-right" style="text-align: right;">
			<a href="<c:url value="/admin/main.jobq" />"><i
				class="fa fa-home"></i>Home</a> <br /> <span>이력서 관리&nbsp;-&nbsp;<strong
				style="font-size: 18px;">이력서 수정</strong>
			</span>
		</div>
		<div class="clearfix"></div>
	</div>
	<!--/ Page heading ends -->

	<!-- Matter -->
	<div class="matter">
		<div class="container">
			<form id="resumeUpdateFrm">
				<div class="widget">
					<div class="widget-content" style="border: 0px solid #ffffff;">
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
									<td width="25%" style="border: solid 1px rgb(221, 221, 221); display:table-cell; vertical-align:middle;">
										<p>${resume.member.phone}</p>
									</td>
									
									<td class="table-name" style="vertical-align: middle;">희망 근무지</td>
									<td width="35%" style="border: solid 1px rgb(221, 221, 221); display:table-cell; vertical-align:middle;">
										<p>${resume.area}</p>
									</td>
								</tr>

								<tr>
									<td class="table-name" style="vertical-align: middle;">이메일</td>
									<td width="25%" style="border: solid 1px rgb(221, 221, 221); display:table-cell; vertical-align:middle;">
										<p>${resume.member.email}</p>
									</td>
									
									<td class="table-name" style="vertical-align: middle;">기술사항</td>
									<td width="35%" style="border: solid 1px rgb(221, 221, 221); display:table-cell; vertical-align:middle;">
										<p>${resume.skills}</p>
									</td>
								</tr>
							
							</table>
						</div>
					</div>
				</div>

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
				
				
				<!-- <div class="widget">
					<div class="widget-content" style="border: 0px solid #ffffff;">
						<div class="padd" style="padding: 15px; padding-top: 0px;">
							<h3>- 기본 정보</h3>
							<table class="table"
								style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								<tr>
									<td rowspan="4" class="table-name"><img
										src="http://via.placeholder.com/120x150" alt="" />
										<button type="button" class="btn"
											style="font-size: 10px !important; border: 1px solid #ccc !important;"
											id="imageBtn">파일 선택</button> <input type="file"
										style="display: none;" id="realImageBtn" accept="image/*" /></td>
									<td class="table-name" style="vertical-align: middle;">이력서
										제목</td>
									<td width="25%">
										<div class="form-group"
											style="margin: 0px; width: 80%; display: inline-block;">
											<input type="text" class="form-control" value="김철수 이력서" />
										</div>
									</td>

									<td class="table-name" style="vertical-align: middle;">성별</td>
									<td width="35%" style="vertical-align: middle;">
										<div class="form-group"
											style="margin: 0px; display: inline-block;">
											<label class="radio-inline"> <input type="radio"
												name="sex" checked>남자
											</label> <label class="radio-inline"> <input type="radio"
												name="sex">여자
											</label>
										</div>
									</td>
								</tr>
								<tr>
									<td class="table-name" style="vertical-align: middle;">이름</td>
									<td width="25%">
										<div class="form-group"
											style="margin: 0px; width: 80%; display: inline-block;">
											<input type="text" class="form-control" value="김철수" />
										</div>
									</td>

									<td class="table-name" style="vertical-align: middle;">생년
										월일</td>
									<td width="35%">
										<div class="form-group"
											style="margin: 0px; width: 60%; display: inline-block;">
											<input type="date" class="form-control" value="1993-01-01" />
										</div>
									</td>
								</tr>


								<tr>
									<td class="table-name" style="vertical-align: middle;">휴대폰</td>
									<td width="35%" colspan="3"
										style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group"
											style="margin: 0px; display: inline-block;">
											<select class="form-control">
												<option>선택하세요</option>
												<option value="010" selected>010</option>
												<option value="011">011</option>
												<option value="018">018</option>
												<option value="016">016</option>
											</select>
										</div> <span> - </span>

										<div class="form-group"
											style="width: 15%; margin: 0px; display: inline-block;">
											<input type="text" class="form-control" value="1234" />
										</div> <span> - </span>

										<div class="form-group"
											style="width: 15%; margin: 0px; display: inline-block;">
											<input type="text" class="form-control" value="5678" />
										</div>
									</td>
								</tr>


								<tr>
									<td class="table-name" style="vertical-align: middle;">이메일</td>
									<td width="35%" colspan="3"
										style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group"
											style="width: 20%; margin: 0px; display: inline-block;">
											<input type="email" class="form-control"
												value="kimchulsoo123" />
										</div> <span> @ </span>

										<div class="form-group"
											style="width: 15%; margin: 0px; display: inline-block;">
											<input type="text" class="form-control" value="gmail.com" />
										</div>

										<div class="form-group"
											style="margin: 0px; display: inline-block;">
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
									<td class="table-name" style="vertical-align: middle;">주소</td>
									<td width="35%" colspan="4"
										style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group"
											style="width: 20%; margin: 0px; display: inline-block;">
											<input type="text" id="zip-code" class="form-control"
												readOnly value="12345" />
										</div> <input type="button" id="addr-btn" class="btn"
										value="우편번호 검색" />

										<div class="form-group"
											style="margin: 0px; width: 60%; padding: 4px 0px;">
											<input type="text" id="road-address" class="form-control"
												readOnly value="서울특별시 강남구 " />
										</div>

										<div class="form-group"
											style="margin: 0px; width: 60%; padding: 4px 0px;">
											<input type="text" id="detail-address" class="form-control"
												readOnly value="한큐아파트 101동 1004호" />
										</div>
									</td>
								</tr>
							</table>

						</div>
					</div>
				</div>

				<div class="widget">
					<div class="widget-content" style="border: 0px solid #ffffff;">
						<div class="padd" style="padding: 15px; padding-top: 0px;">
							<h3>- 학력 사항</h3>
							<table id="school-table" class="table"
								style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								<tr>
									<th class="table-name"
										style="vertical-align: middle; width: 50%; border-right: 1px solid #ddd">재학
										기간</th>
									<th class="table-name"
										style="vertical-align: middle; width: 25%; border-right: 1px solid #ddd">학교명</th>
									<th class="table-name"
										style="vertical-align: middle; width: 25%;">구분</th>
								</tr>

								<tr align="center" data-form-filled="false">
									<td style="vertical-align: middle;">
										<div class="form-group"
											style="width: 40%; margin: 0px; display: inline-block;">
											<input type="date" class="form-control"
												id="school-start-year-0" name="school-start-year"
												value="2007-03-01" />
										</div> <span> ~ </span>

										<div class="form-group"
											style="width: 40%; margin: 0px; display: inline-block;">
											<input type="date" class="form-control"
												id="school-end-year-0" name="school-end-year"
												value="2010-02-17" />
										</div>
									</td>

									<td style="vertical-align: middle;">
										<div class="form-group"
											style="margin: 0px; display: inline-block; width: 70%;">
											<input type="text" class="form-control" id="school-name-0"
												name="school-name" value="수원고등학교" />
										</div>
									</td>

									<td style="vertical-align: middle;">
										<div class="form-group"
											style="margin: 0px; display: inline-block;">
											<select class="form-control" id="school-state-0"
												name="school-state">
												<option value="선택하세요.">선택하세요.</option>
												<option value="졸업" selected>졸업</option>
												<option value="고졸">고졸</option>
												<option value="전문대졸">전문대졸</option>
												<option value="4년제 대졸">4년제 대졸</option>
												<option value="4년제 대재">4년제 대재</option>
												<option value="대학원">대학원</option>
											</select>
										</div>
									</td>

								</tr>
							</table>
							<div class="pull-right">
								<span><strong id="school-register-btn"
									style="cursor: pointer;">학교 등록</strong></span>
							</div>
						</div>
					</div>
				</div>


				<div class="widget">
					<div class="widget-content" style="border: 0px solid #ffffff;">
						<div class="padd" style="padding: 0px 15px;">
							<h3>- 경력 사항</h3>
							<table id="careerTable" class="table"
								style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								<tr>
									<th class="table-name"
										style="vertical-align: middle; width: 45%; border-right: 1px solid #ddd">근무
										기간</th>
									<th class="table-name"
										style="vertical-align: middle; width: 25%; border-right: 1px solid #ddd">회사명</th>
									<th class="table-name"
										style="vertical-align: middle; width: 30%;">담당 업무</th>
								</tr>

								<tr align="center">
									<td style="vertical-align: middle;">
										<div class="form-group"
											style="width: 35%; margin: 0px; display: inline-block;">
											<input type="date" id="" class="form-control"
												value="2015-06-12" />
										</div> <span> ~ </span>

										<div class="form-group"
											style="width: 35%; margin: 0px; display: inline-block;">
											<input type="date" id="" class="form-control"
												value="2017-05-28" />
										</div>
									</td>
									<td style="vertical-align: middle;"><div
											class="form-group"
											style="margin: 0px; display: inline-block;">
											<input type="text" id="career-company-name-0"
												class="form-control" value="삼성 전자" />
										</div></td>
									<td style="vertical-align: middle;">
										<div class="form-group"
											style="margin: 0px; display: inline-block;">
											<input type="text" id="career-company-task-0"
												class="form-control" value="웹 프로그래머" />
										</div>
									</td>
								</tr>

							</table>
							</div>
							<div class="pull-right">
								<span><strong id="career-add-btn"
									style="cursor: pointer;">항목추가</strong></span>
							</div>
						</div>
						
						<div class="padd">
							<h3>- 자기 소개</h3>
							<table class="table"
								style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								<tr>
									<td class="table-name" style="vertical-align: middle;">자기
										소개</td>
								</tr>
								<tr>
									<td style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="margin: 0px;">
											<textarea class="form-control" rows="5" cols="80"
												id="resumeEditor">
												뽑아주신다면 정말 열심히 하겠습니다!!
											</textarea>
										</div>
									</td>
								</tr>
							</table>
						</div>
					</div>
					
					<div class="widget-foot"
						style="text-align: center; padding: 15px 0px; background-color: #ffffff; border: 0px;">
						<button type="button" class="btn" id="resumeUpdateBtn">수정</button>
						<button type="button" class="btn" id="resumeUpdateCancleBtn">취소</button>
					</div>
				</div> -->
			</form>
		</div>
	</div>
	<!--/ Matter ends -->
</div>
<!--/ Mainbar ends -->
