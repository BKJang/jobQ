<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 데이트 피커 적용 -->
<link href="dist/css/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="dist/js/datepicker.min.js"></script>
<script src="dist/js/i18n/datepicker.ko.js" charset='utf-8'></script>

<!-- ckEditor 적용 -->
<script src="js/ckeditor/ckeditor.js"></script>

<!-- services 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a55bbfb4a575a3da392b25bf76df0d7&libraries=services"></script>

<form id="deleteFrm" action="" method="POST">
	<input type="hidden" value="" id="gonggoNum" name="gonggoNum">
	<input type="hidden" value="" id="pageName" name="pageName">
	<input type="hidden" value="1" id="moveType" name="moveType">
</form>

<style>

.bulit{
	font-size: 14px;
	text-align: center;
}

.btn{
	font-weight: bold;
	
}

input, select{
	font-weight: bold;
	text-align: center;
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

</style>
<!--start wrapper-->
<section class="wrapper">
	
	<form id="regiFrm" action="" method="POST" enctype="multipart/form-data">
	<input type="hidden" value="${editGonggo['0'].jobNumber}" id="jobNumber" name="jobNumber">
		<input type="hidden" name="where" id="where" value="">
		<section class="page_head">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="page_title">
							<h2>공고 등록</h2>
						</div>
					</div>
				</div>
			</div>
		</section>
		<section class="content elements">
			<div class="container">
				<div class="row">
					<div class="col-lg-10 col-lg-offset-1">

						<!-- 제목란 시작 -->
						<div class="col-sm-12 col-md-12 col-sm-12 clear mt40">
							<h5 class="hd5">
								<i class="fa fa-quote-left"></i> 
									<span class="hd5_txt">제목란</span>
								<i class="fa fa-quote-right"></i>
							</h5>
							
							<span class="tbl_noti">* 필수 입력 사항 입니다.</span>
							
							<div class="col-lg-12 col-md-12 col-sm-12">
							
								<div class="storyWrap">

									<input type="text" class="form-control lengthCh" style="font-size: 20px"id="title"	name="title" placeholder="제목을 입력해주세요."  maxlength='42'
										 value="${editGonggo['0'].title}">
									<span style="float: right">
										<c:choose>
											<c:when test="${fn:length(editGonggo['0'].title) > 0}">
												<c:out value="${fn:length(editGonggo['0'].title)}"></c:out>
											</c:when>
											<c:otherwise>
												0
											</c:otherwise>
										</c:choose>
									/ 42자</span>
								</div>
							</div>
						</div>
						
						<!-- 제목란 끝 -->
						<div class="col-sm-12 col-md-12 col-sm-12 clear mt40">
							<h5 class="hd5">
								<i class="fa fa-quote-left"></i><span class="hd5_txt">근무 정보</span> <i class="fa fa-quote-right"></i>
							</h5>
							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="storyWrap">
									<!-- 근무 정보 시작 -->

									<table class="tbl_write">
										<colgroup>
											<col width="25%" />
											<col width="*" />
										</colgroup>
										<tbody>
											<tr>
												<th>
													<span class="bulit">* 근무지 회사</span>
												</th>
												<td>
													<c:set var="nameWp" value="${editGonggo['0'].nameWp}" />
													<input type="text" class="form-control lengthCh" id="comName" placeholder="근무지 회사를 적어주세요." name="comName" maxlength="10" value='<c:out value="${nameWp}"/>'> 
													<span style="float: right">
														<c:choose>
															<c:when test="${fn:length(nameWp) > 0}">
																<c:out value="${fn:length(nameWp)}"></c:out>
															</c:when>
															<c:otherwise>
																0
															</c:otherwise>
														</c:choose>
													/ 10자</span>
												</td>
											</tr>
											<tr>
												<th>
													<span class="bulit"> 로고 / 근무처 사진</span> 
												</th>
												<td>
													<!-- 새로추가 -->
													<ul>
														<li>
															<div class="form-group" style="margin: 0px; width: 85%; display: inline-block;">
																
																<!-- 로고사진 업로드 -->
																<input type="text" class="form-control"	id="virtualFileInput" readOnly />
															</div>
 
															<button type="button" class="btn btn-social-linkedin" id="virtualFileBtn">파일 찾기</button> 
															<input type="file" style="display: none;"id="realFileInput" name="fileInput" > 
															<input type="hidden" id="deaultLogo" name="deaultLogo" value="${editGonggo['0'].imageLogo}${cmList[0].mainpic}">
															
															
															<div id="drop-zone"	style="border: 1px solid #ddd; width: 10%; height: 300px; margin-top: 5px; text-align: center; display: table-cell; vertical-align: middle;">
																<div id="thumbnail"	style="margin: 0 auto; width: 80%; border: solid 1px rgb(221, 221, 221);">
																	<img id="thumbnail-image" src="./${editGonggo['0'].imageLogo}${cmList[0].mainpic}" alt="준비중 입니다." width="100%" /> 
																	<span id="filename"></span>
																	<i id="thumbnail-cancel-btn" class="fa fa-times" style="padding: 0px 5px; cursor: pointer;"></i>
																</div>
															</div>
														</li>
														
														
														<!-- 회사 내 사진 최대 6개 구현 이중팝업으로 하자 이건 -->
														<li>
															<div class="widget_title">
																<h4>
																	근무처 사진
																	<span id="defaultBtn" class="btn btn-default" style="float: right">사진 가져오기</span>
																	<c:choose>
																		<c:when test="${fn:length(editGonggo['0'].title) > 0}">
																			<span id="newdefaultBtn" class="btn btn-default" style="float: right" onclick="changeGonggoPic()">공고 사진 변경하기</span>											
																		</c:when>
																		<c:otherwise>
																			<span id="newdefaultBtn" class="btn btn-default" style="float: right" onclick="changePic()">사진 변경하기</span>
																		</c:otherwise>
																	</c:choose>
																</h4>
															</div>
															
															<!-- 썸네일 구현 최대 사진 갯수는 6개-->
															<div id="gallery" class="col-sm-12 col-md-12 col-lg-12" style="display: none">
																<c:forEach begin="0" end="5" var="i">
																	<c:if test="${comPicList[i].picRoute ne null}">
																		<!-- 로고 보여주는 공간 --> 
																			<input type="hidden" class="defaultPicText" value="${comPicList[i].picRoute}">
																			<img src="${comPicList[i].picRoute}" class="comPicDetail img-responsive col-sm-4 col-md-4 col-lg-4" width="200px" height="00px">
																	</c:if>
																</c:forEach>
																<c:forEach begin="0" end="5" var="i">
																	<c:if test="${multiPicList[i].picRoute ne null}">
																		<!-- 로고 보여주는 공간 --> 
																			<input type="hidden" class="defaultPicText" value="${multiPicList[i].picRoute}">
																			<img src="${multiPicList[i].picRoute}" class="comPicDetail img-responsive col-sm-4 col-md-4 col-lg-4" width="200px" height="00px">
																	</c:if>
																</c:forEach>  
																	<script>
																		$(".comPicDetail").css("width", "180px");
																		$(".comPicDetail").css("height", "100px");
																	</script>
															</div>
															
															
															<c:choose>
																<c:when test="${editGonggo['0'].jobNumber eq null}">
																	<input type="hidden" id="submitPic_1" name="submitPic_1" value="">
																	<input type="hidden" id="submitPic_2" name="submitPic_2" value="">
																	<input type="hidden" id="submitPic_3" name="submitPic_3" value="">
																	<input type="hidden" id="submitPic_4" name="submitPic_4" value="">
																	<input type="hidden" id="submitPic_5" name="submitPic_5" value="">
																</c:when>
																<c:otherwise>
																	<input type="hidden" id="submitPic_1" name="submitPic_1" value="${multiPicList[0].picRoute}">
																	<input type="hidden" id="submitPic_2" name="submitPic_2" value="${multiPicList[1].picRoute}">
																	<input type="hidden" id="submitPic_3" name="submitPic_3" value="${multiPicList[2].picRoute}">
																	<input type="hidden" id="submitPic_4" name="submitPic_4" value="${multiPicList[3].picRoute}">
																	<input type="hidden" id="submitPic_5" name="submitPic_5" value="${multiPicList[4].picRoute}">
																</c:otherwise>
															</c:choose>
															
														</li>
													</ul>
												</td>
											</tr>
										
											<!-- 주소입력 -->
											<tr>
												<th>
													<span class="bulit">* 근무지 주소</span> 
												</th>
												<td>
													<ul class="addressArea">
													 
														<!-- 도로명 주소 -->
														<li>
															<input type="text" class="form-control address fl" id="full_address" 
															name="full_address" placeholder="검색으로 찾아주세요" onclick="jusoSearch();" 
															 value="${editGonggo['0'].addressWp2}${cmList[0].add2}" style="width:75%;" readonly>
															
															<a class="btn btn-social-linkedin" onclick="jusoSearch()"> 
																<i class="fa fa-check"></i>도로명 주소찾기
															</a> 
															<input type="text" class="form-control address3" id="address3" name="address3" placeholder="(필수 사항) 상세주소를  꼭 꼭 입력해 주세요" 
															style="width: 100%; margin-top: 10px; font-size: 13px; text-align: left" value="${editGonggo['0'].addressWp3}${cmList[0].add3}">
														</li>
													</ul>
														<!-- 우편번호와 Area, 위도 경도 -->
														<input type="hidden" id="postNum" name="postNum" value="${editGonggo['0'].addressWp1}${cmList[0].postnum}">
														<input type="hidden" id="chooseAdd1" name="chooseAdd1" value="${editGonggo['0'].area}">
														<input type="hidden" id="mapLat" name="mapLat" value="${editGonggo['0'].lat}"> 
														<input type="hidden" id="mapLng" name="mapLng" value="${editGonggo['0'].lng}">
												</td> 
											</tr>
											<!-- 모집마감일 -->
											<tr>
												<th><span class="calen">*</span>모집 마감일</th>
												<td><input type='text' id="dp" name="dp" class="datepicker_here" 
													data-language='ko' data-position="right top" value="${fn:substring(editGonggo['0'].dateClose, 0, 10)}" readonly="readonly"/>
											</tr>
										</tbody> 
									</table>
								</div>
							</div>


							<!-- 모집내용 -->
							<div class="col-sm-12 col-md-12 col-sm-12 clear mt40">
								<h5 class="hd5">
									<i class="fa fa-quote-left"></i><span class="hd5_txt">모집내용
									</span> <i class="fa fa-quote-right"></i>
								</h5>
							</div>
							<!-- 공고 명 -->
							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="storyWrap">

									<!-- 공고 내용 -->
									<table class="tbl_write">
										<colgroup>
											<col width="25%" />
											<col width="*" />
										</colgroup>
										<tbody>
											<!-- 모집직종 -->
											<tr>
												<th>
													<span class="bulit">* 모집직종</span><br><br>
													<div class="pull-right">
														<input type="text" class="form-control " id="newRecruit"
															placeholder="직접입력(최대 5개)" maxlength="10" onkeypress="javascript:career.enterFunction(event)"
															style="height: 30px"> 
														<strong id="career-add-btn" style="font-size:12px; cursor: pointer; float: right">항목추가</strong>
													</div>
												</th>
												<td> 
													<div>
														<input id="skillList" name="skillList" type="hidden" class="" value="">
														<ul id="recruitOcc" class="clear keyword typ2">
															<c:forEach items="${skillList}" var="skillList" varStatus="status">
																<li>
																	<button id="${skillList.skill}" class="btn sbtn skill" type="button">
																		<span>
																			<c:out value="${skillList.skill}" />
																		</span>
																	</button>
																</li>
															</c:forEach>
														</ul>
														
													</div>
												</td>
											</tr>

											<!-- 고용형태 -->
											<tr>
												<th>
													<span class="bulit">* 고용형태</span>
												</th>
												<td>
													<div>
														<input type="hidden" id="type_em" name="type_em" value="${editGonggo['0'].typeEmploy}">
														<ul class="clear keyword typ2">
															<li>
																<c:forEach var="name" items="정규직,계약직,파견직,인턴직,병역특례,위촉직(프리랜서)" varStatus="status">
																	<c:choose>
																		<c:when test="${editGonggo['0'].typeEmploy eq name}">
																			<button class="btn employType selected" type="button" style="font-weight: bold; background: #C94040">${name}</button>
																		</c:when>
																		<c:otherwise>
																			<button class="btn employType" type="button" style="font-weight: bold;">${name}</button>
																		</c:otherwise>
																	</c:choose>
																</c:forEach>
															</li>
														</ul>
													</div>
												</td>
											</tr>
											<tr> 
												<th>
													<span class="bulit">* 모집인원</span>
												</th>
												<td>
													<input type="text" class="form-control ipt1 fl"	id="usr" name="usr" style="height: 35px" value="${editGonggo['0'].numberEmploy}"> 
													<span class="ipt_txt fl" style="width: 30px; font-size: 16px; font-weight: bold" >명</span>
													<div>
														<ul class="clear keyword typ2 fl">
															<c:choose>
																<c:when test="${editGonggo['0'].numberEmploy eq 1}">
																	<li>
																		<button class="btn hNum selected" type="button" value="1" style="background: #C94040">1명</button>
																	</li>
																</c:when>
																<c:otherwise>
																	<li>
																		<button class="btn hNum" type="button" value="1">1명</button>
																	</li>	
																</c:otherwise>
															</c:choose>
															
															<c:choose>
																<c:when test="${editGonggo['0'].numberEmploy eq '0'}">
																	<li>
																		<button class="btn hNum selected" type="button" value="0" style="background: #C94040">0명(10명 미만)</button>
																	</li>
																</c:when>
																<c:otherwise>
																	<li>
																		<button class="btn hNum" type="button" value="0">0명(10명 미만)</button>
																	</li>
																</c:otherwise>
															</c:choose>
															
															<c:choose>
																<c:when test="${editGonggo['0'].numberEmploy eq '00'}">
																	<li>
																		<button class="btn hNum selected" type="button" value="00" style="background: #C94040">00명(100명 미만)</button>
																	</li>
																</c:when>
																<c:otherwise>
																	<li>
																		<button class="btn hNum" type="button" value="00">00명(100명 미만)</button>
																	</li>	
																</c:otherwise>
															</c:choose>
														</ul>
													</div>
												</td>
											</tr>
											<!-- 경력란 -->
											<tr>
												<th>
													<span class="bulit">* 경력</span>
												</th>
												<td>
													<div class="announce clear">
														
														<!-- 경력 담는 히든 -->
														<input type="hidden" id="careerCH" name="careerCH" value="${editGonggo['0'].career}">
														
														<c:set var="carName" value="${fn:substring(editGonggo['0'].career, 0, 2)}"></c:set>
														
														<label class="radio-inline">
															<input type="radio" class="chk_info" name="chk_info" value="신입" id="cnew" checked><span style="font-size: 14px; font-weight: bold">신입</span> 
														</label>
														
														<div class="selBx">
															<c:choose>
																<c:when test="${carName eq '경력'}">
																	<label class="radio-inline">
																		<input type="radio" class="chk_info" name="chk_info" value="경력" id="ccareer" checked><span style="font-size: 14px; font-weight: bold">경력</span>
																	</label> 
																	<select class="form-control ipt_sel" id="careerSelect">
																		
																		<c:forEach var="index" varStatus="status" begin="0" end="10">
																			<c:choose>
																				<c:when test="${fn:substring(editGonggo['0'].career, 3, fn:length(editGonggo['0'].career)) eq '경력'}">
																					<c:if test="${index eq 0}">
																						<option class="${index}" value="${index}" selected>연차무관</option>
																					</c:if>
																					<c:if test="${index ne 0}">
																						<option class="${index}" value="${index}" selected>${index}년 이상</option>
																					</c:if>
																				</c:when>
																				<c:otherwise>
																					<c:if test="${index eq 0}">
																						<option class="${index}" value="${index}">연차무관</option>
																					</c:if>
																					<c:if test="${index ne 0}">
																						<option class="${index}" value="${index}">${index}년 이상</option>
																					</c:if>
																				</c:otherwise>
																			</c:choose>
																		</c:forEach>
																	</select>
																</c:when>
																
																<c:otherwise>
																	<label class="radio-inline">
																		<input type="radio" class="chk_info" name="chk_info" value="경력" id="ccareer"><span style="font-size: 14px; font-weight: bold">경력</span>
																	</label> 
																	<select class="form-control ipt_sel" id="careerSelect" disabled>
																		<option class="0" value="0">연차무관</option>
																		<c:forEach var="index" varStatus="status" begin="1" end="10">
																		
																			<option class="${index}" value="${index}">${index}년 이상</option>
																		</c:forEach>
																	</select>
																</c:otherwise>
															</c:choose>
														</div>
														
														
														<label class="radio-inline">
														<c:choose>
															<c:when test="${carName eq '무관'}">
																<input type="radio" class="chk_info" name="chk_info"value="무관" id="cno" checked>
															</c:when>
															<c:otherwise>
																<input type="radio" class="chk_info" name="chk_info"value="무관" id="cno">
															</c:otherwise>
														</c:choose>
														<span style="font-size: 14px; font-weight: bold">무관</span></label>
													</div>
												</td>
											</tr>

										</tbody>
									</table>
								</div>
							</div>

							<!-- //수정,삭제,등록 [E] -->

							<!-- 근로조건 -->
							<div class="col-sm-12 col-md-12 col-sm-12 clear mt40">
								<h5 class="hd5">
									<i class="fa fa-quote-left"></i> <span class="hd5_txt">근로조건
									</span> <i class="fa fa-quote-right"></i>
								</h5>
							</div>

							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="storyWrap">
									<table class="tbl_write">
										<colgroup>
											<col width="25%" />
											<col width="*" />
										</colgroup>
										<tbody>

											<!-- 학력 -->
											<tr>
												<th>
													<span class="bulit">* 학력</span>
												</th>
												<td>
													<select id="academic" name="academic" class="selectpicker form-control select1">
														<c:set var="academic" value="${editGonggo['0'].academic}"></c:set>
														<c:forEach var="academicName" items="중학교,고등학교,대학(2년/3년),대학(4년),석사,박사,무관" varStatus="status">
															<c:choose>
														       	<c:when test="${academic eq academicName}">
														       		<c:choose>
														       			<c:when test="${academicName eq '무관'}">
																			<option value="${academicName}" selected>학력무관</option>
																		</c:when>
																		<c:otherwise>
																			<option value="${academicName}" selected>${academicName} 졸업 이상</option>
																		</c:otherwise>
																	</c:choose>
													       		</c:when>	
													       		<c:otherwise>
													       			<c:choose>
														       			<c:when test="${academicName eq '무관'}">
																			<option value="${academicName}">학력무관</option>
																		</c:when>
																		<c:otherwise>
																			<option value="${academicName}">${academicName} 졸업 이상</option>
																		</c:otherwise>
																	</c:choose>
													       		</c:otherwise>
													       </c:choose>
														</c:forEach>
													</select>
												</td>
											</tr>

											<!-- 급여 -->
											<tr>
												<th><span class="bulit">* 급여(최대 입력치 : 100억)</span></th>
												<td>
													<input type="hidden" id="number_em" name="number_em">
													
													<c:choose>
														<c:when test="${fn:substring(editGonggo['0'].salary,0,2) eq '회사'}">
															<select id="money1" name="money1" class="form-control select1 typ2 fl moneyR" disabled>
																<c:forEach var="name" items="시급,일급,주급,월급,연봉,건별" varStatus="status" >
																	<option value="${name}"><c:out value = "${name}"/></option>
															    </c:forEach>
															</select>
															<span class="iptBx" style="width: 157px"> 
															 	<input type="number" class="form-control ipt1 fl moneyR" id="money2" name="money2" min="0" max="10000000000" style="height: 40px" disabled>
															 	<label for="money">원</label>
															</span> 
															<span class="iptBx"> 
																<input type="checkbox" class="form-control"	id="money_rule" name="money_rule" checked>
																<label for="money_rule">회사내규에 따름</label> 
															</span>
														</c:when>
														<c:otherwise>
															<select id="money1" name="money1" class="form-control select1 typ2 fl moneyR">
																<c:forEach var="name" items="시급,일급,주급,월급,연봉,건별" varStatus="status">
																		<c:choose>
																			<c:when test="${fn:substring(editGonggo['0'].salary,0,2) eq name}">
																				<option value="${name}" selected><c:out value = "${name}"/></option>
																			</c:when>
																			<c:otherwise>
																				<option value="${name}"><c:out value = "${name}"/></option>
																			</c:otherwise>
																		</c:choose>
																</c:forEach>
															</select>
															<span class="iptBx" style="width: 190px">  
															 	<input id="money2" name="money2"  type="number" value="${fn:substring(editGonggo['0'].salary,2,fn:length(editGonggo['0'].salary))}" class="form-control ipt1 fl moneyR" min="0" max="10000000000" style="width: 150px; height: 40px">
															 	
															 	<label for="money">원</label>
															</span> 
															<span class="iptBx"> 
																<input type="checkbox" class="form-control"	id="money_rule" name="money_rule">
																<label for="money_rule">회사내규에 따름</label> 
															</span>
															</c:otherwise>
														</c:choose>
													<span class="iptBx"> 
														<label id="moneyHan" style="color:red"></label>
													</span>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>

							<%-- <!-- 모집마감일 -->
							<div class="col-sm-12 col-md-12 col-sm-12 clear mt40">
								<h5 class="hd5">
									<i class="fa fa-quote-left"></i><span class="hd5_txt">모집마감일
									</span> <i class="fa fa-quote-right"></i>
								</h5>
							</div>
							<!-- 모집마감일 -->
							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="storyWrap">


									<table class="tbl_write">
										<colgroup>
											<col width="25%" />
											<col width="*" />
										</colgroup>
										<tbody>
											<!-- 모집마감일 -->
											<tr>
												<th><span class="calen">*</span>모집 마감일</th>
												<td><input type='text' id="dp" name="dp" class="datepicker_here"
													data-language='ko' data-position="right top" value="${fn:substring(editGonggo['0'].dateClose, 0, 10)}"/>
											</tr>

										</tbody>
									</table>
								</div>
							</div> --%>



							<!-- 담당자 정보 -->
							<div class="col-sm-12 col-md-12 col-sm-12 clear mt40">
								<h5 class="hd5">
									<i class="fa fa-quote-left"></i> <span class="hd5_txt">담당자
										정보 </span> <i class="fa fa-quote-right"></i>
								</h5>
								<div id="cmChange" class="btn btn-sm btn-social-linkedin fr defaultSave">
									<i class="fa fa-check"></i> 기본 담당자정보 변경합니다.
									<!-- 채용담당자 정보를 저장합니다. -->
								</div>
								<input id="cmCkeck" name="cmCkeck"type="checkbox" style="display: none">


							</div>

							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="storyWrap">
									<table class="tbl_write">
										<colgroup>
											<col width="25%" />
											<col width="*" />
										</colgroup>
										<tbody>
											<!-- 담당자명 -->
											<tr>
												<th>
													<span class="bulit">* 담당자명</span> 
												</th>
												<td>
													<input type="text" class="form-control ipt_txt" id="cmName" name="cmName"maxlength="12" value="${editGonggo['0'].nameCm}${cmList[0].name}">
												</td>
											</tr>

											<!-- 이메일 -->
											<tr>
												<th>
													<span class="bulit">* 이메일</span>
												</th>
												<td>
													<input type="text" class="form-control ipt_txt"
														id="cmEmail" name="cmEmail" placeholder="abc@naver.com" style="width: 250px" value="${editGonggo['0'].emailCm}${cmList[0].email}"> 
													<span id="emailError" style="color: red; display: none">유효하지	않은 이메일 형식 입니다.</span>
												</td>
											</tr>

											<!-- 연락처 -->
											<tr>
												<th><span class="bulit">*</span>연락처</th>
												<td>
													<select class="form-control numList"
														style="width: 100px" id="phoneNum1">
														<c:forEach var="phone1" items="010,011,016,017,018,019,02,031,032,033,041,042" varStatus="status">
															<c:choose>
																<c:when test="${fn:substring(editGonggo['0'].phoneCm,0,3) eq phone1 or fn:substring(cmList['0'].phone,0,3) eq phone1}">
																	<option value="${phone1}" selected>${phone1}</option>
																</c:when>
																<c:otherwise>
																	<option value="${phone1}">${phone1}</option>
																</c:otherwise>	
															</c:choose>
															
														</c:forEach>
													</select> - 
													
													
													<c:choose>
														<c:when test="${fn:length(editGonggo['0'].phoneCm) eq 13}">
															<c:set var="phoneNum2" value="${fn:substring(editGonggo['0'].phoneCm, 4, 8)}" />
															<c:set var="phoneNum3" value="${fn:substring(editGonggo['0'].phoneCm, 9, 14)}" />
														</c:when>
														<c:otherwise>
															<c:set var="phoneNum2" value="${fn:substring(editGonggo['0'].phoneCm, 4, 7)}" />
															<c:set var="phoneNum3" value="${fn:substring(editGonggo['0'].phoneCm, 8, 13)}" />
														</c:otherwise>
													</c:choose> 
													
													<c:choose>
														<c:when test="${fn:length(cmList['0'].phone) eq 13}">
															<c:set var="phoneNum2cm" value="${fn:substring(cmList['0'].phone, 4, 8)}" />
															<c:set var="phoneNum3cm" value="${fn:substring(cmList['0'].phone, 9, 14)}" />
														</c:when>
														<c:otherwise>
															<c:set var="phoneNum2cm" value="${fn:substring(cmList['0'].phone, 4, 7)}" />
															<c:set var="phoneNum3cm" value="${fn:substring(cmList['0'].phone, 8, 13)}" />
														</c:otherwise>
													</c:choose>
													<span class="numBx"> 
														<input type="text"	class="form-control" style="width: 115px; height: 40px"
															maxlength="4" id="phoneNum2" value="${phoneNum2}${phoneNum2cm}">
													</span> - 
													<span class="numBx"> 
														<input type="text"	maxlength="4" class="form-control" style="width: 113px; height: 40px" 
														id="phoneNum3" value="${phoneNum3}${phoneNum3cm}">
													</span>
														<input type="hidden" id="cmPhone" name="cmPhone">
												</td>
												
											</tr>
										</tbody>
									</table>
								</div>
							</div>

							<!-- 메인 내용란 -->
							<div class="col-sm-12 col-md-12 col-sm-12 clear mt40">
								<h5 class="hd5">
									<i class="fa fa-quote-left"></i> 
									<span class="hd5_txt">메인 내용 </span> <i class="fa fa-quote-right"></i>
								</h5>
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="storyWrap">


									<table class="tbl_write">
										<colgroup>
											<col width="25%" />
											<col width="*" />
										</colgroup>
										<tbody>
											<!-- 내용, 첨부파일 -->
											<tr>
												<!-- <th><span class="bulit">*</span> 내용</th> -->
												<td colspan="2">
													<textarea name="detailContents" id="detailContents" rows="15" >${editGonggo['0'].content}</textarea> 
													<script>
															
															CKEDITOR.replace('detailContents',
																{
																	filebrowserImageUploadUrl:  'images_upload.jobq',
																	toolbar : 'MyToolbar',
																});
															
															
															CKEDITOR.on('detailContents', function (ev) {
																var dialogName = ev.data.name;
																var dialog = ev.data.definition.dialog;
																var dialogDefinition = ev.data.definition;

																	if (dialogName == 'image') {
																		dialog.on('show', function (obj) {
																		this.selectPage('Upload'); //업로드텝으로 시작
																	});

																	dialogDefinition.removeContents('advanced'); // 자세히탭 제거
																	dialogDefinition.removeContents('Link'); // 링크탭 제거
																}
															});
													</script>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<!--  등록폼  end -->
							<div class="col-sm-12 mrgb-30 btnArea">
								<c:choose>
									<c:when test="${param.pageName eq 'companyJob'}">
										<a class="btn btn-sm btn-social-linkedin" onclick="javascript:gogo.pageSubmitFn('insertGonggo')">
											<i class="fa fa-check"></i> 등록
										</a> 
										<a onclick="javascript:left.pageSubmitFn('companyMain')" class="btn btn-sm btn-warning">
											<i class="fa fa-times"></i> 취소
										</a>
									</c:when>
									<c:otherwise>
										
										<a class="btn btn-sm btn-social-linkedin" onclick="javascript:gogo.pageSubmitFn('updateGonggo')">
											<i class="fa fa-check"></i> 수정
										</a> 
										<%-- <a class="btn btn-sm btn-danger" onclick="javascript:deleteGonggo.pageSubmitFn('deleteGonggoEdit',${editGonggo['0'].jobNumber})">
						                    <i class="fa fa-times"></i> 삭제				                    
						                </a>  --%>
						                <a onclick="javascript:left.pageSubmitFn('companyMain')"class="btn btn-sm btn-warning">
											<i class="fa fa-times"></i> 취소 
										</a>
									</c:otherwise>	
								</c:choose>
							</div>
							<!-- //수정,삭제,등록 [E] -->
						</div>
					</div>
				</div>
			</div>
			<!-- //container[E]  -->
		</section>
	</form>
	<!--end wrapper-->
</section>

<script type="text/javascript">
		
	$(document).ready(function(){
		
		/* 기존의 사진들 가져오기 */
		
		$("#defaultBtn").click(function(){

			$("#gallery").show();
			
			var i=1;
			$(".defaultPicText").each(function(){
				
				$("#submitPic_" + i).val($(this).val());
				i++;
			});
			alert("기본사진을 가져왔습니다.")
		});
		
		deaultLogo
		$("#thumbnail-cancel-btn").click(function(){
			
			$("#deaultLogo").val("");
		});
		
		/* 공고 번호가 있다면 스킬리스트 뿌리기 */
		if ("${editGonggo['0'].jobNumber}" != null && "${editGonggo['0'].jobNumber}" != '') {
			/* 정보 집어넣기 */
			var skillList1 = "${editGonggo['0'].skillList}".split(", "); 
			var skillCount = 0;
			var ind = 0;
			
			$(".skill").each(function(){
				for ( var index in skillList1) {
					if ($.trim($(this).text()) == skillList1[index]) {
						$(this).css("background-color", "#C94040");
						$(this).addClass("selected");
						skillCount++;
						ind = index;
					}
				}
			});
		
			if (skillCount != skillList1.length && skillList1 != '') {
				for (var i = skillCount; i < skillList1.length; i++) {
					var $newCareerRow = $('<li>');

					$newCareerRow.append('<button class="btn newbtn selected" type="button" style="background-color: #C94040" onclick="removeNewBtn()">' + skillList1[i] + '</button></li>');
					$('#recruitOcc').append($newCareerRow);
				}
			};
			
			/* 정보 집어넣기 */
		};
		
		var geocoder = new daum.maps.services.Geocoder();
	       	// 주소로 좌표를 검색합니다
       	geocoder.addressSearch("${cmList[0].add2}", function(result, status) {

       	    // 정상적으로 검색이 완료됐으면 
       	     if (status === daum.maps.services.Status.OK) {
   	  		 	$("#mapLat").val(result[0].y);
   	  		 	$("#mapLng").val(result[0].x); 
   	  			$("#chooseAdd1").val(result[0].address.region_1depth_name);
   		    }  
   		});
	       	 
       	new daum.Postcode({
            oncomplete: function(data) {
            	
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.roadAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                
         	    // 주소 정보를 해당 필드에 넣는다.
                document.getElementById('full_address').value = fullAddr;
                //시,도 자동으로 넣기
                document.getElementById('chooseAdd1').value = data.sido;
            }
       	});
		
		/* 로고사진 업데이트 ajax구현 */
		$("#logoUpdateBtn").change(function(){
			var formData = new FormData();
			
			formData.append("fileUp",$("#logoUpdateBtn")[0].files[0]);
			 
	        $.ajax({
	            type : 'post',
	            url : 'logo_upload.jobq',
	            data : formData,
	            processData : false, 
	            contentType : false,
	            success : function(result) {
	            	var jsonRes = JSON.parse(result); 
	            	$("#logo_pic").attr("src", "./"+jsonRes);
	            },
	            error : function(error) {
	                alert("파일 업로드에 실패하였습니다.");
	                console.log(error);
	                console.log(error.status);
	            }
	        });
		});
		/* 로고사진 업데이트 ajax구현 */
		
		
		/* 파일 찾기 버튼 */
		$("#virtualFileBtn").click(function(){
			
			$("#realFileInput").trigger('click');
		});
		/* 드랍존 이벤트 */
		$('#drop-zone').on('dragenter dragover', function(event){
			event.preventDefault();
		});	
		
		$('#drop-zone').on('drop', function(event){
			event.preventDefault();
			
			var files = event.originalEvent.dataTransfer.files;
			var file = files[0];
			
			logo.fileUpload.createThumbnail(file);
			
			logo.fileUpload.remove("file");
			logo.fileUpload.upload(file);
		});
		/* 드랍존 이벤트 끝 */
		
		/* 직종 항목 추가 버튼 */
		$('#career-add-btn').on('click', function(e){
			
			var str = $("#newRecruit").val();
			career.plusCar(str);
		});
		/* 직종 항목 추가 버튼 끝 */
		
		/* 고용형태 버튼 중복선택 방지 */
		$(".employType").click(function(){
			 
			$(".employType").css("background-color", "");
			$(".employType").removeClass("selected");
			$(this).css("background-color", "#C94040");
			$(this).addClass("selected");
			
			$("#type_em").val($(this, ".selected").text()); 
		});
		/* 고용형태 버튼 중복선택 방지 */
		
		/* 경력  셀렉트박스 활성화 */
		$(".chk_info").click(function(){
			
			$("#careerSelect").attr('disabled', true);
			$("#careerCH").val("");
			
			if ($(this).val() == "경력") {
				
				$("#careerSelect").attr('disabled', false);
				$("#careerCH").val($(this).val() + "/" + $("#careerSelect").val());
			}else{
				
				$("#careerCH").val($(this).val());
			}
		});
		
		/* 연수가 바뀔시 자동으로 번경 */
		$("#careerSelect").change(function(){
			
			$("#careerCH").val("경력/" + $("#careerSelect").val());
		});
		/* 경력  셀렉트박스 활성화 */
		
		/* 회사 내규에 따름에 따른 활성화  */
		$("#money_rule").click(function(){
			
			if ($(".moneyR").attr("disabled") != "disabled") {
				$(".moneyR").attr("disabled", true);
			} else {
				$(".moneyR").attr("disabled", false);
			} 
		}); 
		/* 회사 내규에 따름  */
		
		/* 글자수 표시하기 */
		$(".lengthCh").keyup( function(){
			
			if ($(this).val().length > $(this).attr("maxlength")) {
				
				$(this).val().slice(0,-1);
				$(this).parent().children("span").text($(this).attr("maxlength") + "/" + $(this).attr("maxlength") + "자");
			}else{
				
				$(this).parent().children("span").text($(this).val().length + "/" + $(this).attr("maxlength") + "자");
			}
			});
		/* 글자수 표시하기 */
		
		/* 모집인원 버튼 처리 */
		$(".hNum").click(function(){
			
			if ($(this).hasClass("selected")) {
				
				$(".hNum").css("background", "");
				$(this).removeClass("selected");
 			}else{
 				
 				$(".hNum").css("background", "");
 				$(this).css("background", "#C94040");
 				$(".hNum").removeClass("selected");
 				$(this).addClass("selected");
 				$("#usr").val($(this).val());
 			}
		});
		
		$("#usr").change(function(){
			
			$(".hNum").css("background", "");
			$(".hNum").removeClass("selected");
		
 		});
		
		/* 이메일 유효성 검사 */
		$("#cmEmail").focusout(function(){
			
			var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			
			if (!regEmail.test($("#cmEmail").val())) {
				
				$("#emailError").css("display", "");
			}else{
				
				$("#emailError").css("display", "none");
			}
		});
		/* 이메일 유효성 검사 */
		
		/* 담당자변경 체크박스 */
		$("#cmChange").click(function(){
			
			if ($("#cmCkeck").prop("checked")) {
				
 				$("#cmCkeck").prop("checked", false);
			}else{
				 
				$("#cmCkeck").prop("checked", true);
			}
		});
		/* 담당자변경 체크박스 */
		
		
		/* 담당자 연락처 유효성 검사 */
		$("#phoneNum2").blur(function(){
			
			if(isNaN($(this).val()) == true) {
				
				alert("숫자를 입력해 주세요");
				$(this).val("")
			}else if($(this).val().length < 3){
				
				alert("전화번호를 확인해 주세요");
				$("#phoneNum1").focus();
				
			}
		});
		
		$("#phoneNum3").blur(function(){
			
			if(isNaN($(this).val()) == true) {
				
				alert("숫자를 입력해 주세요");
				$(this).val("")
			}else if($(this).val().length < 4){
				
				alert("전화번호를 확인해 주세요");
				$("#phoneNum1").focus();
			}
			
		});
		

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
		/* 버튼 누르면 선택되게 하기 */
		
		
		
		/* 급여 한글화 */
		$("#money2").keyup(function(){
			
			var money = $(this).val() * 1;
			var moneyText = "";
			
			won = money % 10000;
			man = parseInt(((money-won) / 10000) % 10000);
			bill = parseInt(((money-man-won) / 100000000) % 10000);
			
			if (won != 0) 
				moneyText += won;
			if (man != 0) 
				moneyText = man + "만" + moneyText;
			if (bill != 0) 
				moneyText = bill + "억" + moneyText;
			if (money <= 10000000000) {
				$("#moneyHan").text(moneyText + "원");
			}else{
				$("#moneyHan").text("입력치가 너무 큽니다.")	;
			}
			
		});
		/* 급여 한글화 */
	});
	            
	
	//document ready end
	function latLng(add){
			// 주소-좌표 변환 객체를 생성합니다
   			
		};
	
	/* 등록하기 유효성검사 */
	var gogo = 
	{
		pageSubmitFn : function(pageName) {
			
			var ckeditor = CKEDITOR.instances['detailContents']; 
			$("#skillList").val("");
			var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			
			$("#recruitOcc").children().each(function(){
				$("#skillList")
				if ($(this).children().hasClass("selected")) {
					
					if ($("#skillList").val() != '') {
						
						$("#skillList").val($("#skillList").val() + ", "); 
					}
					$("#skillList").val($("#skillList").val() + $(this).children().text().trim());
				}
			});
			
			
			if ($("#title").val() == '') {
				
				$("#title").focus();
				return alert("제목을 입력해주세요");
			}
			
			if ($("#careerCH").prop("value") == false) {
				
				$("#careerCH").val("신입");
			}
			
			if ($("#comName").val() == '') {
				
				$("#comName").focus();
				return alert("근무지를 입력해주세요");
			}
			if ($("#postNum").val() == "" || $("#address3").val()=="" || $("#full_address").val()=="" || $("#chooseAdd1").val()=="") {
				
				alert("주소를 정확하게 입력해주세요");
				$("#address3").focus();
				return;
			}
			
			if ($("#dp").val() == '') {
				
				$("#dp").focus();
				return alert("마감일을 설정해주세요.");
			}
			
			if ($("#skillList").val() == '') {
				
				$("#newRecruit").focus();
				return alert("모집직종을 입력해주세요");
			}
			
			if ($("#type_em").val() == '') {
				
				$("#type_em").focus();
				return alert("고용형태를 입력해주세요");
			}
			
			if ($("#usr").val() == '') {
				
				$("#usr").focus();
				return alert("모집인원을 입력해주세요");
			}
			
			if (isNaN($("#usr").val())) {
				
				$("#usr").focus();
				return alert("숫자만 입력해주세요")
			}
		
			if (($("#money2").val() == '') && $("#money_rule").prop("checked") == false) {
				
				$("#money2").focus();
				return alert("급여를 입력해주세요");
			}
			
			if (($("#money2").val() > 10000000000) && $("#money_rule").prop("checked") == false) {
				
				$("#money2").focus();
				return alert("급여가 너무 큽니다.");
			}
			if ($(".moneyR").attr("disabled") == "disabled") {
				
				$("#number_em").val("회사내규에 따름")
			}else{
				
				$("#number_em").val($("#money1").val() + $("#money2").val())
			}
			
			if ($("#cmName").val() == '') {
				
				$("#cmName").focus();
				return alert("이름을 입력해주세요");
			}
			
			if ($("#cmEmail").val() == '') {
				
				$("#cmEmail").focus();
				return alert("이메일을 입력해주세요");
			}
			
			if (!regEmail.test($("#cmEmail").val())) {
				
				$("#cmEmail").focus();
				$("#emailError").css("display", "");
				return alert("이메일을 확인해주세요"); 
			}else{
				
				$("#emailError").css("display", "none");
			}
			
			if ($("#phoneNum2").val() != '' && $("#phoneNum3").val() != '' && $("#phoneNum2").val().length > 2 && $("#phoneNum3").val().length == 4 && $("#phoneNum2").val().length < 5) {
				
				$("#cmPhone").val($("#phoneNum1").val() + "-" + $("#phoneNum2").val() + "-" + $("#phoneNum3").val());
			}else{
				$("#phoneNum1").focus();
				return alert("전화번호를 입력해주세요");
			}

			if (ckeditor.getData() == '') {
				
				$(ckeditor).focus();
				return alert("내용을 입력해주세요");
			}
			
			
			
			
			$("#pageName").val(pageName);
			
			$("#where").val("register");
			$("#regiFrm").attr("action", pageName + ".jobq");	
		
			$("#regiFrm").submit();
		}
	}
	
	var deleteGonggo = 
	{
			
		pageSubmitFn : function(pageName, gonggoNum) {
			
			
			if (confirm("삭제하시겠습니까?")) {
				$("#pageName").val(pageName);
				$("#gonggoNum").val(gonggoNum);
				
				$("#where").val("register");
				
				$("#deleteFrm").attr("action", pageName + ".jobq");	
			
				$("#deleteFrm").submit();
			}
		}
	}

	/* 추가된 직종 삭제 */
	$(document).on("click",".newbtn",function(){ 
	
		$(this).parent().remove();	
		careerCount--;
	});
	/* 추가된 직종 삭제 */
	
	
	
	
	var logo = {
			
		thumbnail :{
			
			showThumbnail : function(){
				
				$('#thumbnail').css('visibility', 'visible');
			},
			hideThumbnail : function(){
				
				$('#thumbnail').css('visibility', 'hidden');
			},
			$thumbnailCancelBtn:$('#thumbnail-cancel-btn')
		},
		fileUpload : {
			formData : new FormData()					
		}
	};
	
	/* 파일 업로드 헬퍼 */
	logo.fileUpload.checkImageType = function(file){
		if(file.type.toLowerCase() == 'image/png' || file.type.toLowerCase() == 'image/jpeg' 
			|| file.type.toLowerCase() == 'image/gif' || file.type.toLowerCase() == 'image/bmp' 
			|| file.type.toLowerCase() == 'image/tiff')	
			return true;
		
		return false;
	}
	
	logo.fileUpload.createThumbnail = function(file){
		
		var reader = new FileReader();
		
		if(!this.checkImageType(file)){
			alert('이미지 타입만 가능합니다.');
			
			return ;
		}				
		
		reader.readAsDataURL(file);
	
		reader.onload = function(){
			logo.thumbnail.showThumbnail();
			$('#virtualFileInput').val(file.name);
		
			$('#filename').text(file.name);
			$('#thumbnail-image').attr('src', reader.result);
		}	
	};
	
	logo.fileUpload.upload = function(file){
		logo.fileUpload.formData.append('file', file);
	};
	
	logo.fileUpload.remove = function(key){
		logo.fileUpload.formData.delete(key);
	};
	/* 파일 업로드 헬퍼 */
	
	/* 파일 선택시 드랍존으로 파일 추가 */
	$('#realFileInput').on('change', function(event){
			var reader = new FileReader();
			var file = event.originalEvent.srcElement.files[0];
			
			logo.fileUpload.createThumbnail(file);
			
			logo.fileUpload.remove("file");
			logo.fileUpload.upload(file);
	});
	/* 파일 선택시 드랍존으로 파일 추가 끝 */
	
	/* 썸네일 삭제 버튼 */
	logo.thumbnail.$thumbnailCancelBtn.on('click', function(e){
		logo.thumbnail.hideThumbnail();
		$('#thumbnail-image').attr('src', '');
	
		$('#virtualFileInput').val('');
	});
	/* 썸네일 삭제 버튼 끝 */
	
	/* 파일 업로드 초기화 버튼 */
	$('#logo-reset-btn').on('click', function(e){
		// alert('reset');
		logo.thumbnail.$thumbnailCancelBtn.trigger('click');
	});
	/* 파일 업로드 초기화 버튼 끝 */
	
	var careerCount = 0;
	
	/* 새로운 항목 추가 5개까지만 입력가능 */
	var career = {
		
		plusCar : function(val){
		
			if (val != "" && careerCount < 5) {
				
				var $newCareerRow = $('<li>');
	
				$newCareerRow.append('<button class="btn newbtn selected" type="button" style="background-color: #C94040" onclick="removeNewBtn()">' + val + '</button></li>');
				$("#newRecruit").val("");
				$('#recruitOcc').append($newCareerRow);
				careerCount++;
			}else{
				
				$("#newRecruit").val("");
				alert("직종을 입력 안하거나 5개가 넘었습니다.");
			}
		},
	
		enterFunction : function(e) {
			
			if (e.keyCode == 13) {
				
				career.plusCar($("#newRecruit").val());
			}
		}
	};
	/* 새로운 항목 추가 5개까지만 입력가능 */
</script>


<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 주소 및 위도 경도 가져오기 부분 -->
<script> 
    function jusoSearch() {
    	
        new daum.Postcode({
            oncomplete: function(data) {
            	
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.roadAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                
         	    // 주소 정보를 해당 필드에 넣는다.
                document.getElementById('full_address').value = fullAddr;
                //시,도 자동으로 넣기
                document.getElementById('chooseAdd1').value = data.sido;
                //시,군,구 자동으로 넣기
                /* document.getElementById('chooseAdd2').value = data.sigungu;
                //읍,면,동 자동으로 넣기
                document.getElementById('chooseAdd3').value = data.bname; */
                //우편번호는 뒤로 감추기
                //document.getElementById('chooseAdd3').value = data.bname;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('postNum').value = data.zonecode;
                
                
                /* 위도 경도 받아오기 */
        		// 주소-좌표 변환 객체를 생성합니다
       			var geocoder = new daum.maps.services.Geocoder();
            	    
       	       	// 주소로 좌표를 검색합니다
       	       	geocoder.addressSearch($("#full_address").val(), function(result, status) {

       	       	    // 정상적으로 검색이 완료됐으면 
       	       	     if (status === daum.maps.services.Status.OK) {
	       	  		 	$("#mapLat").val(result[0].y);
	       	  		 	$("#mapLng").val(result[0].x);
       	   		    }  
       	   		});
               	/* 위도 경도 받아오기 */
            }
        }).open();
    }
</script>

<!-- ck에디터적용 -->
<script type="text/javascript">
	function loadContent() {
		var attachments = {};
		attachments['image'] = [];
		attachments['image']
				.push({
					'attacher' : 'image',
					'data' : {
						'imageurl' : 'http://cfile273.uf.daum.net/image/2064CD374EE1ACCB0F15C8',
						'filename' : 'github.gif',
						'filesize' : 59501,
						'originalurl' : 'http://cfile273.uf.daum.net/original/2064CD374EE1ACCB0F15C8',
						'thumburl' : 'http://cfile273.uf.daum.net/P150x100/2064CD374EE1ACCB0F15C8'
					}
				});
		attachments['file'] = [];
		attachments['file']
				.push({
					'attacher' : 'file',
					'data' : {
						'attachurl' : 'http://cfile297.uf.daum.net/attach/207C8C1B4AA4F5DC01A644',
						'filemime' : 'image/gif',
						'filename' : 'editor_bi.gif',
						'filesize' : 640
					}
				});
		/* 저장된 컨텐츠를 불러오기 위한 함수 호출 */
		Editor.modify({
			"attachments" : function() { /* 저장된 첨부가 있을 경우 배열로 넘김, 위의 부분을 수정하고 아래 부분은 수정없이 사용 */
				var allattachments = [];
				for ( var i in attachments) {
					allattachments = allattachments.concat(attachments[i]);
				}
				return allattachments;
			}(),
			"content" : document.getElementById("sample_contents_source")
		/* 내용 문자열, 주어진 필드(textarea) 엘리먼트 */
		});
	};
	
	/* 사진 가져오는 창띄우기 */
	function changePic(){
		
		var params = "?guBun=c";
		var url = "changePic.jobq";
		var opt = "width=1050, height=750, scrollbars=no, status=no, toolbar=no, resizable=no, left=50%, top=50%";
		
		window.open(url+params, "사진을 바꿔봅시다", opt);
	}
	
	function changeGonggoPic(){
		
		var params = "?guBun=g&gonggoNum=${editGonggo['0'].jobNumber}";
		var url = "changePic.jobq";
		var opt = "width=1050, height=750, scrollbars=no, status=no, toolbar=no, resizable=no, left=50%, top=50%";
		
		window.open(url+params, "사진을 바꿔봅시다", opt);
	}
</script>

<!-- 데이트 피커 설정 -->
<script>
	var newDate = new Date();
	newDate.setDate(newDate.getDate() + 180);

	$('#dp').datepicker({
		minDate : new Date(),
		maxDate : newDate,
		dateFormat : 'yyyy-mm-dd',
		onSelect: function (dateText, inst) {
	    }
	})
</script>
