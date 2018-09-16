
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style type="text/css">
.buttonWrap {
	position: relative;
	overflow: hidden;
	cursor: default;
	width: 100%;
	height: 100%;
}

.buttonWrap input {position：absolute;
	margin-left: -10px;
	filter: alpha(opacity = 0);
	opacity: 0;
	-moz-opacity: 0;
	cursor: pointer;
	width: 100%;
	height: 100%;
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

</style>
<!--start wrapper-->
<section class="wrapper">
	<form id="modiFrm" action="" method="POST">
	<input type="hidden" id="resumeNumber" name="resumeNumber" value="<c:out value="${personResumeList['0'].resumeNumber}" />">	
	<section class="page_head">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					
					<div class="page_title">
						<h2>이력서</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="content elements">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="promo_box">
								<div class="col-lg-12 col-sm-12">
									<div class="promo_content">
										<input type="text" class="form-control lengthCh" id="title"	name="title" placeholder="제목을 입력해주세요."  maxlength="42"
										style="text-align: center; font-size: 20px; font-weight: bold" value="<c:out value="${personResumeList['0'].title}" />" 
										autofocus>
										<span style="float : right;">
										<c:choose>
											<c:when test="${fn:length(personResumeList['0'].title) > 0}">
												<c:out value="${fn:length(personResumeList['0'].title)}"></c:out>
											</c:when>
										</c:choose>
										/42자</span>
									</div>
									
								</div>
							</div>
						</div>
				</div>
			</div>


			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt40">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="dividerHeading">
							<h4>
								<span>개인 정보</span>
							</h4>
						</div>
						<div class="col-lg-5 col-md-5 col-sm-5">
							<div id="ResumeBaseInfo" class="resumeView">
								<c:if test="${personResumeList['0'].mainPic == null}">
								<div class="photoArea" style="text-align: center;">
									<span class="photo"> <img src="./images/img-style_man.jpg"
										alt="" class="center_img img-thumbnail" width="200" height="300">
									</span> <span> </span>

								</div>
							</c:if>
							
							<c:if test="${personResumeList['0'].mainPic != null}">
								<div class="photoArea" style="text-align: center;">
									<span class="photo"> <img src="./${personResumeList['0'].mainPic}"
										alt="" class="center_img img-thumbnail" width="200" height="300">
									</span> <span> </span>

								</div>
							</c:if>
							</div>
						</div>
						<div class="col-lg-7 col-md-7 col-sm-7">
							<div class="serviceBox_1 profile_top">
								<div class="service_icon">
									<i class="fa fa-street-view"></i>
									<h3>
										<c:out value="${personList['0'].name}" />
									</h3>

									<c:if test="${personList['0'].sex == 0}">
										<span><font size="3px"> 남자/<c:out
													value="${personList['0'].birth}" /></font></span>
									</c:if>
									<c:if test="${personList['0'].sex == 1}">
										<span><font size="3px">여자/<c:out
													value="${personList['0'].birth}" /></font></span>
									</c:if>
								</div>
								
								<div class="service_icon">
									<i class="fa fa-mobile"></i>
									<h3>연락처</h3>
									<span><font size="3px"> <c:out
												value="${personList['0'].phone}" /></font></span>
								</div>
								
								<div class="service_icon">
									<i class="fa fa-envelope"></i>
									<h3>메일</h3>
									<span><font size="3px"> <c:out
												value="${personList['0'].email}" /></font></span>
								</div>
								<c:if test="${personList['0'].homepage != null}">
								<div class="service_icon">
									<i class="fa fa-cloud"></i>
									<h3>홈페이지</h3>
									<span><font size="3px"> <c:out value="${personList['0'].homepage}" /></font></span>
								</div>
								</c:if>
								<c:if test="${personList['0'].homepage == null}">
								<div class="service_icon">
									<i class="fa fa-cloud"></i>
									<h3>홈페이지</h3>
									<span><font size="3px" color="red"> 홈페이지를 등록해주세요.</font></span>
								</div>
							</c:if>
							</div>
						</div>
					</div>

					<div class="col-lg-12 col-md-12 col-sm-12 mt40">
							<div class="dividerHeading">
								<h4>
									<span></span>
								</h4>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4">
								<div class="serviceBox_1">
									<div>
										<h4>*최종학력</h4>
									</div>
									<div class="service_content">
										<select name="lastAcademic">
											<option value="고졸" <c:if test="${personResumeList['0'].lastAcademic eq '고졸'}" >selected</c:if>>고졸</option>
								 			<option value="전문대재" <c:if test="${personResumeList['0'].lastAcademic eq '전문대재'}" >selected</c:if>>전문대재</option>
											<option value="4년제 대재" <c:if test="${personResumeList['0'].lastAcademic eq '4년제 대재'}" >selected</c:if>>4년제 대재</option>
											<option value="전문대졸" <c:if test="${personResumeList['0'].lastAcademic eq '전문대졸'}" >selected</c:if>>전문대졸</option>
											<option value="4년제 대졸" <c:if test="${personResumeList['0'].lastAcademic eq '4년제 대졸'}" >selected</c:if>>4년제 대졸</option>
											<option value="대학원" <c:if test="${personResumeList['0'].lastAcademic eq '대학원'}" >selected</c:if>>대학원</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4">
								<div class="serviceBox_1">
									<div>
										<h4>*희망연봉</h4>
									</div>
									<div class="service_content">
										<p>
											<input name="money" id="money" type="number" size="15"
												max="99999" maxlength="5" oninput="maxLengthCheck(this)" value="<c:out value="${personResumeList['0'].salaryHope}" />">
												<span>만원</span>
										</p>
									</div>
								</div>
							</div>

							<div class="col-lg-4 col-md-4 col-sm-4">
								<div class="serviceBox_1">
									<div>
										<h4>*고용형태</h4>
									</div>
									<div class="service_content">
										<select name="jobType">
											<option value="정규직" <c:if test="${personResumeList['0'].typeEmploy eq '정규직'}" >selected</c:if>>정규직</option>
											<option value="계약직" <c:if test="${personResumeList['0'].typeEmploy eq '계약직'}" >selected</c:if>>계약직</option>
											<option value="파견직" <c:if test="${personResumeList['0'].typeEmploy eq '파견직'}" >selected</c:if>>파견직</option>
											<option value="인턴직" <c:if test="${personResumeList['0'].typeEmploy eq '인턴직'}" >selected</c:if>>인턴직</option>
										</select>
									</div>
								</div>
							</div>
						</div>
					<div class="col-lg-12 col-md-12 col-sm-12 mt40">
						<div class="dividerHeading">
							<h4>
								<span>*희망 근무지</span><span></span>
							</h4>
						</div>
						<div>
							<input id="areaList" name="areaList" type="hidden" class="" value="">
								<ul class="clear keyword" id="recruitUcc">
									<c:forEach items="${personResumeAreaList}"
										var="personResumeAreaList">
										<li>
											<button class="btn sbtn area bttn" type="button">
												<c:out value="${personResumeAreaList.areaName}" />
											</button>
										</li>
									</c:forEach>
								</ul>
							</div>
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="dividerHeading">
								<h4>
									<span>학력 사항</span>
								</h4>
							</div>
							<table id="academicTable" class="table"
								style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								<tr>
									<th class="table-name"
										style="vertical-align: middle; width: 50%; border-right: 1px solid #ddd">재학
										기간</th>
									<th class="table-name"
										style="vertical-align: middle; width: 20%; border-right: 1px solid #ddd">학교명</th>
									<th class="table-name"
										style="vertical-align: middle; width: 20%;">상태</th>
									<th class="table-name"
										style="vertical-align: middle; width: 10%;"></th>	
								</tr>
								<c:if test="${personAcademicList['0'].academicName == null}">
								<c:set var="i" value="1" />
								
									<tr align="center" id="acadmic">
									<td style="vertical-align: middle;">
										<div class="form-group"
											style="width: 40%; margin: 0px; display: inline-block;">
											<input type="date" class="form-control" name="a_inAcademicDate_1"/>
										</div> <span> ~ </span>

										<div class="form-group"
											style="width: 40%; margin: 0px; display: inline-block;">
											<input type="date" class="form-control" name="a_outAcademicDate_1"/>
										</div>
									</td>
									<td style="vertical-align: middle;"><div
											class="form-group"
											style="margin: 0px; display: inline-block;">
											<input type="text" class="form-control checkcha" name="a_academicName_1" maxLength="20"/>
										</div></td>
									<td style="vertical-align: middle;">
										<div class="form-group"
											style="margin: 0px; display: inline-block;">
											<select class="form-control" name="a_lastAcademicType_1">
												<option value="고졸" selected>고졸</option>
												<option value="전문대재">전문대재</option>
												<option value="4년제대재">4년제 대제</option>
												<option value="전문대졸">전문대졸</option>
												<option value="4년제대졸">4년제 대졸</option>
												<option value="대학원">대학원</option>
											</select>
										</div>
									</td>
									<td style="vertical-align: middle;">
										<div class="form-group">
											<span class = "deleteAcaBtn" style="font-weight : bold; color : red; cursor : pointer;">X</span>
										</div>
									</td>
								</tr>
								<c:set var="i" value="${i+1}" />
								
								</c:if>
								<c:if test="${personAcademicList['0'].academicName != null}">
								<c:set var="i" value="1" />
								<c:forEach var="personAcademicList" items="${personAcademicList}">
									<tr align="center" id="acadmic">
									<td style="vertical-align: middle;">
										<div class="form-group"
											style="width: 40%; margin: 0px; display: inline-block;">
											<input type="date" class="form-control" name="a_inAcademicDate_${i}" 
											value="${personAcademicList.academicDateEnter}"/>
										</div> <span> ~ </span>

										<div class="form-group"
											style="width: 40%; margin: 0px; display: inline-block;">
											<input type="date" class="form-control" name="a_outAcademicDate_${i}" 
											value="${personAcademicList.academicDateFinish}"/>
										</div>
									</td>
									<td style="vertical-align: middle;"><div
											class="form-group"
											style="margin: 0px; display: inline-block;">
											<input type="text" class="form-control checkcha" name="a_academicName_${i}" 
											value="${personAcademicList.academicName}" maxLength="20"/>
										</div></td>
									<td style="vertical-align: middle;">
										<div class="form-group"
											style="margin: 0px; display: inline-block;">
											<select class="form-control" name="a_lastAcademicType_${i}">
												<option value="고졸" <c:if test="${personAcademicList.academicState eq '고졸'}" >selected</c:if>>고졸</option>
												<option value="전문대졸" <c:if test="${personAcademicList.academicState eq '전문대졸'}" >selected</c:if>>전문대재</option>
												<option value="4년제대재" <c:if test="${personAcademicList.academicState eq '4년제대재'}" >selected</c:if>>4년제 대재</option>
										 		<option value="전문대졸" <c:if test="${personAcademicList.academicState eq '전문대졸'}" >selected</c:if>>전문대졸</option>
												<option value="4년제대졸" <c:if test="${personAcademicList.academicState eq '4년제대졸'}" >selected</c:if>>4년제 대졸</option>
												<option value="대학원" <c:if test="${personAcademicList.academicState eq '대학원'}" >selected</c:if>>대학원</option>
											</select>
										</div>
									</td>
									<td style="vertical-align: middle;">
										<div class="form-group">
											<span class = "deleteAcaBtn" style="font-weight : bold; color : red; cursor : pointer;">X</span>
										</div>
									</td>
								</tr>
								<c:set var="i" value="${i+1}" />
								</c:forEach>
								</c:if>

							</table>
							<!-- </div> -->
							<div class="pull-right">
								<span><strong id="AcademicAddBtn"
									style="cursor: pointer;">항목추가</strong></span>
							</div>
						</div>
						<div class="col-lg-12 col-md-12 col-sm-12">

							<div class="dividerHeading">
								<h4>
									<span>경력 사항</span><span></span>
								</h4>
							</div>
							<table id="careerTable" class="table"
								style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								<tr>
									<th class="table-name"
										style="vertical-align: middle; width: 50%; border-right: 1px solid #ddd">근무
										기간</th>
									<th class="table-name"
										style="vertical-align: middle; width: 20%; border-right: 1px solid #ddd">회사명</th>
									<th class="table-name"
										style="vertical-align: middle; width: 20%;">담당 업무</th>
									<th class="table-name"
										style="vertical-align: middle; width: 10%;"></th>	
								</tr>
								<c:if test="${personCareerList['0'].careerName == null}">
								<c:set var="j" value="1" />
								
								<tr align="center">
									<td style="vertical-align: middle;">
										<div class="form-group"
											style="width: 40%; margin: 0px; display: inline-block;">
											<input type="date" class="form-control" name="c_inCareerDate_1"/>
										</div> <span> ~ </span>

										<div class="form-group"
											style="width: 40%; margin: 0px; display: inline-block;">
											<input type="date" class="form-control" name="c_outCareerDate_1"/>
										</div>
									</td>
									<td style="vertical-align: middle;"><div
											class="form-group"
											style="margin: 0px; display: inline-block;">
											<input type="text" class="form-control checkcha" name="c_companyName_1" maxLength="20"/>
										</div></td>
									<td style="vertical-align: middle;">
										<div class="form-group"
											style="margin: 0px; display: inline-block;">
											<input type="text" class="form-control" name="c_careerName_1" maxLength="20"/>
										</div>
									</td>
									<td style="vertical-align: middle;">
										<div class="form-group">
											<span class = "deleteCarBtn" style="font-weight : bold; color : red; cursor : pointer;">X</span>
										</div>
									</td>
								</tr>
								<c:set var="j" value="${j+1}" />
								
								</c:if>
								<c:if test="${personCareerList['0'].careerName != null}">
								<c:set var="j" value="1" />
								<c:forEach var="personCareerList" items="${personCareerList}">
									<tr align="center">
									<td style="vertical-align: middle;">
										<div class="form-group"
											style="width: 40%; margin: 0px; display: inline-block;">
											<input type="date" class="form-control" name="c_inCareerDate_${j}"
											value="${personCareerList.careerDateEnter}"/>
										</div> <span> ~ </span>

										<div class="form-group"
											style="width: 40%; margin: 0px; display: inline-block;">
											<input type="date" class="form-control" name="c_outCareerDate_${j}"
											value="${personCareerList.careerDateFinish}"/>
										</div>
									</td>
									<td style="vertical-align: middle;"><div
											class="form-group"
											style="margin: 0px; display: inline-block;">
											<input type="text" class="form-control checkcha" name="c_companyName_${j}" 
											value="${personCareerList.careerName}" maxLength="20"/>
										</div></td>
									<td style="vertical-align: middle;">
										<div class="form-group"
											style="margin: 0px; display: inline-block;">
											<input type="text" class="form-control" name="c_careerName_${j}" 
											value="${personCareerList.careerWork}" maxLength="20"/>
										</div>
									</td>
									<td style="vertical-align: middle;">
										<div class="form-group">
											<span class = "deleteCarBtn" style="font-weight : bold; color : red; cursor : pointer;">X</span>
										</div>
									</td>
								</tr>
								<c:set var="j" value="${j+1}" />
								</c:forEach>
								</c:if>
								
							</table>
							<!-- </div> -->
							<div class="pull-right">
								<span><strong id="careerAddBtn" style="cursor: pointer;">항목추가</strong></span>
							</div>
						</div>


					<div class="col-lg-12 col-md-12 col-sm-12 mt40">
						<div class="dividerHeading">
							<h4>
								<span>*기술 사항</span>
							</h4>
						</div>
						<div>						
							<input id="skillList" name="skillList" type="hidden" class=""
								value="">
							<ul class="clear keyword" id="recruitOcc">
								<c:forEach items="${personResumeSkillList}"
									var="personResumeSkillList">
									<li>
										<button id="${personResumeSkillList.skillName}"class="btn sbtn skill bttn2" type="button">
											<c:out value="${personResumeSkillList.skillName}" />
										</button>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>

					<div class="col-lg-12 col-md-12 col-sm-12 mt40">
						<div class="dividerHeading">
							<h4>
								<span>*자기소개</span>
							</h4>
						</div>
						<div id="ResumeBaseInfo2" class="resumeView">
							<div class="serviceBox_1">
								<div class="service_icon">
									<div class="form-group">
										<textarea class="form-control lengthCh" rows="5" id="comment" name="comment"
											maxLength="1000" placeholder="1000자 이내로 작성해주세요!"> </textarea>
											<span style="float : right;">
												<c:choose>
													<c:when test="${fn:length(personResumeList['0'].content) > 0}">
														<c:out value="${fn:length(personResumeList['0'].content)}"></c:out>
													</c:when>
												</c:choose>
										/1000자</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<p class="rsAgree" style="margin-bottom: 40px; text-align: center;">
						<br> <br> <img src="images/confirmText.png"
							alt="위의 모든 기재사항은 사실과 다름없음을 확인합니다."><br> <br> 작성자
						: <strong><span id="agrM_Name"><c:out value="${personList['0'].name}" /> </span></strong>

					</p>
				</div>
				<div class="col-md-12" style="text-align: center;">
					<a class="btn btn-sm btn-social-linkedin"
						onclick="javascript:modi.pageSubmitFn('personResumeDataInsert')">
						<i class="fa fa-check"></i> 수정
					</a> 
					<a onclick="javascript:left.pageSubmitFn('personMain')"
						class="btn btn-sm btn-warning"> <i class="fa fa-times"></i>취소
					</a>
				</div>

			</div>
		</div>

	</section>
</form>
</section>
<!--end wrapper-->

<script>

$(document).ready(function() {
	
	var value = "${personResumeList['0'].content}";
	
	$("#comment").val(value.replace(/<br>/g, "\n"));
	/* 기술사항 띄우기 */
	var skillList1 = "${personResumeList['0'].skillName}".split(",");	
	var ind = 0;
	
	$(".skill").each(function(){
		
		for ( var index in skillList1) {
			
			//alert($(this).text() == skillList1[index]);
			//alert(index);
			if ($.trim($(this).text()) == skillList1[index]) {
				
				$(this).css("background-color", "#C94040");
				$(this).addClass("selected");
				ind = index;
			}
		}
	});
	
	/* 희망근무지 띄우기 */
	var areaList1 = "${personResumeList['0'].areaName}".split(",");	
	var ind = 0;
	
	$(".area").each(function(){
		
		for ( var index in areaList1) {
			
			if ($.trim($(this).text()) == areaList1[index]) {
				
				$(this).css("background-color", "#C94040");
				$(this).addClass("selected");
				ind = index;
			}
		}
	});
	
	/* 경력사항 추가  */
	$(".card_wrap > ul > li:odd").css("border-left", "1px solid #ccc");
	var i="${i}";
	var j="${j}";
	var companyName = "companyName";
	$('#careerAddBtn').on('click', function(e){
		
		var companyName = "companyName" + j; 
		var $newCareerRow = $('<tr align="center"></tr>');
		$newCareerRow.append('<td></td><td></td><td></td><td></td>').children().css("vertical-align", "middle");
		$newCareerRow.find('td:first-child').append('<div></div><div></div>').children().
			css({'width':'40%', 'margin':'0px', 'display':'inline-block'});
		
		$newCareerRow.find('td:not(:first-child)').append('<div></div>').children().
			css({'margin':'0px', 'display':'inline-block'});
		
		$newCareerRow.find('td:first-child').children().eq(0).append('<input type="date" class="form-control" name="c_inCareerDate_'+ j +'">');
		$newCareerRow.find('td:first-child').children().eq(1).append('<input type="date" class="form-control" name="c_outCareerDate_'+ j +'">');
		$newCareerRow.find('td:eq(1)').children().append('<input type="text" class="form-control checkcha" name="c_companyName_'+ j +'">');
		$newCareerRow.find('td:eq(2)').children().append('<input type="text" class="form-control checkcha" name="c_careerName_'+ j +'">');
		$newCareerRow.find('td:eq(3)').children().append('<span class="deleteCarBtn" style="font-weight : bold; color : red; cursor : pointer;">X</span>');


		// $newCareerRow.find('td:not(:first-child)').children('div:nth-child(2)').append('<i class="fa fa-minus-circle"></i>');
		
		$newCareerRow.find('td:first-child').children('div:first-child').after('<span> ~ </span>');
		
		$('#careerTable').append($newCareerRow);
		j++;
	});
	/* 학력사항 추가 */
	$('#AcademicAddBtn').on('click', function(e){
		
		var $newAcademicRow = $('<tr align="center"  id="acadmic"></tr>');
		var $newAcademicRow2 = $('<select class="form-control" name="a_lastAcademicType_'+i+'">'
				+'<option value="고졸" selected>고졸</option>'
				+'<option value="전문대재">전문대재</option>'
				+'<option value="4년제대재">4년제 대제</option>'
				+'<option value="졸업예정">전문대졸</option>'
				+'<option value="4년제대졸">4년제 대졸</option>'
				+'<option value="대학원">대학원</option>'
			+'</select>');
		$newAcademicRow.append('<td></td><td></td><td></td><td></td>').children().css("vertical-align", "middle");
		$newAcademicRow.find('td:first-child').append('<div></div><div></div>').children().
			css({'width':'40%', 'margin':'0px', 'display':'inline-block'});
		
		$newAcademicRow.find('td:not(:first-child)').append('<div></div>').children().
		css({'margin':'0px', 'display':'inline-block'});
		
		$newAcademicRow.find('td:first-child').children().eq(0).append('<input type="date" class="form-control" name="a_inAcademicDate_'+i+'">');
		$newAcademicRow.find('td:first-child').children().eq(1).append('<input type="date" class="form-control" name="a_outAcademicDate_'+i+'">');
		$newAcademicRow.find('td:eq(1)').children().append('<input type="text" class="form-control checkcha" name="a_academicName_'+i+'">');
		$newAcademicRow.find('td:eq(2)').children().append($newAcademicRow2);
		$newAcademicRow.find('td:eq(3)').children().append('<span class="deleteAcaBtn" style="font-weight : bold; color : red; cursor : pointer;">X</span>');
		//$newCareerRow.find('td:not(:first-child)').children('div:nth-child(2)').append('<i class="fa fa-minus-circle"></i>');
		
		$newAcademicRow.find('td:first-child').children('div:first-child').after('<span> ~ </span>');
		
		$('#academicTable').append($newAcademicRow);
		i++;
	});
	
	/* 학력사항 로우 한 개 삭제*/
	/* $(".deleteAcaBtn").click(function(){
		var value = $(this).parent().parent().parent();
		value.css("display", "none");
		
		value.children('td:first-child').children().eq(0).children().val("");
		value.children('td:first-child').children().eq(2).children().val("");
		value.children('td:eq(1)').children().children().val("");
		value.children('td:eq(2)').children().children().val("");
		
	}); */
	
	/* 경력사항 로우 한 개 삭제*/
	/* $(".deleteCarBtn").click(function(){
		var value = $(this).parent().parent().parent();
		value.css("display", "none");
		
		value.children('td:first-child').children().eq(0).children().val("");
		value.children('td:first-child').children().eq(2).children().val("");
		value.children('td:eq(1)').children().children().val("");
		value.children('td:eq(2)').children().children().val("");
		
	}); */
	
});

$(document).on('click', '.checkcha', function(){

	$(this).attr("maxLength", "20");
	
});

$(document).on('click','.deleteAcaBtn', function(){

	var value = $(this).parent().parent().parent();
	value.css("display", "none");
	
	value.children('td:first-child').children().eq(0).children().val("");
	value.children('td:first-child').children().eq(2).children().val("");
	value.children('td:eq(1)').children().children().val("");
	value.children('td:eq(2)').children().children().val("");
	
});

$(document).on('click', '.deleteCarBtn', function(){

	var value = $(this).parent().parent().parent();
	value.css("display", "none");
	
	value.children('td:first-child').children().eq(0).children().val("");
	value.children('td:first-child').children().eq(2).children().val("");
	value.children('td:eq(1)').children().children().val("");
	value.children('td:eq(2)').children().children().val("");
	
});


$(".hidden").val($(this).next().val());

/* 버튼 누르면 선택유지 */
$(".sbtn, .defaultSave").click(function(){
	
	if (!$(this).hasClass("selected")) {
		
		$(this).css("background-color", "#C94040");
		$(this).addClass("selected");
	}else{
		
		$(this).css("background-color", "");
		$(this).removeClass("selected");
	}
});
/* 글자수 세기 */
$(".lengthCh").keyup( function(){
	
	if ($(this).val().length > $(this).attr("maxlength")) {
		
		$(this).val().slice(0,-1);
		$(this).parent().children("span").text($(this).attr("maxlength") + "/" + $(this).attr("maxlength") + "자");
	}else{
		
		$(this).parent().children("span").text($(this).val().length + "/" + $(this).attr("maxlength") + "자");
	}
});

/* 연봉 길이 체크 */
function maxLengthCheck(object){
	if(object.value.length > object.maxLength){
		object.value = object.value.slice(0,object.maxLength);
	}
}

/* 등록하기 유효성검사 */
var modi = 
{	
		
	isKorean : function(val) {
	   	if (!/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|\s]/.test(val)) {
	           return false;
	       } else {
	           return true;
	       }
	},
	
	
	pageSubmitFn : function(pageName) {
		
		var bool=false;
		
		if ($("#title").val() == '') {
			
			$("#title").focus();
			
			alert("제목을 입력해주세요");
			
			return bool=false;
		}else if(($("#money").val() == '')) {
			
			$("#money").focus();
			
			alert("급여를 입력해주세요");
			
			return bool = false;
		}else if (!$(".bttn").hasClass("selected")) {
			
			$("#money").focus();
			
			alert("희망근무지를 최소 1개 이상 선택해주세요");
			
			return bool = false;
		}else if (!$(".bttn2").hasClass("selected")) {
			
			$("#money").focus();
			
			alert("기술사항을 최소 1개 이상 선택해주세요");
			
			return bool = false;
		}else if (($("#comment").val() == '')) {
			
			$("#comment").focus();
			
			alert("자기소개 내용을 입력해주세요");
			
			return bool = false;
			
		}else
			bool=true;
		
		if (bool == true){
			
			/* 기술 */
			$("#recruitOcc").children().each(function(){

				if ($(this).children().hasClass("selected")) {
					
					if ($("#skillList").val() != '') {
						
						$("#skillList").val($("#skillList").val() + ","); 
					}
						
					$("#skillList").val($("#skillList").val() + $(this).children().text().trim());
				}
			});
			/* 지역 */
			$("#recruitUcc").children().each(function(){

				if ($(this).children().hasClass("selected")) {
					
					if ($("#areaList").val() != '') {
						
						$("#areaList").val($("#areaList").val() + ","); 
					}
						
					$("#areaList").val($("#areaList").val() + $(this).children().text().trim());
				}
			});
			
			$("#pageName").val(pageName);
		
			$("#modiFrm").attr("action", pageName + ".jobq");	
	
			$("#modiFrm").submit();
		}
	}
}
</script>


