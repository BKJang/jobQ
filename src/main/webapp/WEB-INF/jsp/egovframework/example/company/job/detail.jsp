<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 데이트 피커 적용 -->
<link href="dist/css/datepicker.min.css" rel="stylesheet" type="text/css">
<script src="dist/js/datepicker.min.js"></script>
<script src="dist/js/i18n/datepicker.ko.js" charset='utf-8'></script>

<!-- services 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a55bbfb4a575a3da392b25bf76df0d7&libraries=services"></script>

<form id="applyFrm" name="applyFrm"> 
	<input type="hidden" name="gonggoNum" value="${selectGonggo['0'].jobNumber}"/>
	<input type="hidden" id="pageName" name="pageName" value=""/>
</form>	

<form id="frm_job" name="frm_job" method="get">
	<input type="hidden" id="pageName"  name="pageName" /> 
	<input type="hidden" id="signTrgNo" name="signTrgNo" />
	<input type="hidden" id="gonggoID" name="gonggoID" />
	<input type="hidden" id="gonggoNum" name="gonggoNum" />
</form>

<style>
#map {
	height: 370px;
	width: 100%;
}
</style>

<!--start wrapper-->
<section class="wrapper">

	<section class="page_head">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div id="main" class="page_title">
						<h2>공고 상세</h2>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="content elements">
		<div class="container">
			<div class="container">
				<div class="col-lg-1 col-md-1 col-sm-1"></div>
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="dividerHeading">
							</div>
						</div>

						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="promo_box">
								<div class="col-lg-3 col-sm-3">
									
									<c:choose>
										<c:when test="${selectGonggo['0'].imageLogo ne null}">
											<img src="./${selectGonggo['0'].imageLogo}" alt=""
										class="img-responsive" style="width: 100%; height: auto">
										</c:when>
										<c:otherwise>
											<img src="./images/jobq_corLogo.jpg" alt=""
											class="img-responsive" style="width: 100%; height: auto">
										</c:otherwise>
									</c:choose> 
									
								</div>
								<div class="col-lg-6 col-sm-6">
									<div class="promo_content" style="float: left">
										<h4><c:out value="${selectGonggo['0'].company}"/></h4>
										<h3>[<c:out value="${selectGonggo['0'].area}" /> / <c:out value="${selectGonggo['0'].nameWp}" />]  <c:out value="${selectGonggo['0'].title}" /></h3>
									</div>
								</div>
								<div class="col-lg-3 col-sm-3" style="margin-top: 10px;">
									<div class="col-lg-12 col-md-12 col-sm-12 clear" id="popUp">
										<div class="row text-center">
										
											<!-- 기업회원인데 자기 공고일경우 -->
											<c:if test="${type eq 'c'}">
												<button class="btn btn-danger list_count_fr mt40"	style="float:right" data-toggle="modal" onclick="javascript:detail.jobDetailFn('deleteGonggoD',${param.gonggoID})">삭제하기</button>
												<button class="btn btn-primary list_count_fr mt40"	style="float:right" data-toggle="modal" onclick="javascript:detail.jobDetailFn('gonggoEdit',${selectGonggo['0'].jobNumber})" >수정하기</button>
											
											</c:if>
											
											<!-- 개인 회원일 때 -->
											<jsp:useBean id="toDay" class="java.util.Date" />
											<c:set var="Close" value="${fn:substring(selectGonggo['0'].dateClose, 0, 10)}"></c:set>
											<fmt:formatDate var="now" value="${toDay}" pattern="yyyy-MM-dd" />
											<c:choose>
												<c:when test="${sessionScope.member_type eq 'p' and now <= Close eq true and appGubun eq null}">
													<!-- 결론적으로 여기서 보낼건 공고 번호 밖에 없음 -->
													<a class="btn btn-lg btn-default largeModal" data-toggle="modal" id="">
														 지원 하기
													</a>
													<div id="applyLayer"class="col-lg-12 col-md-12 col-sm-12 layerPop" style="margin-right: 0px;">
														<div class="modal-content"> 
															<div class="clear modal-body">
																<h3 class="modal-title">지원하시겠습니까?</h3><br>
																<button type="button" class="col-lg-6 col-md-6 col-sm-6 btn btn-danger closes jqclose"
																	data-dismiss="modal">취소</button>
																<button type="button" class="col-lg-6 col-md-6 col-sm-6 btn btn-primary" onclick="applyBtn()">지원</button>
															</div>
														</div>
													</div>
												</c:when>
												<c:when test="${sessionScope.member_type eq 'p' and now <= Close eq true and appGubun eq null and type eq 'c'}">
													<span style="font-weight: bold; font-size: 20px; color: red">이미 지원을 완료한<br> 공고 입니다.</span>
												</c:when>
											</c:choose> 
											 
											
											
											<%-- <c:if test="${sessionScope.member_type eq 'p' and now <= Close eq true and appGubun eq null}"> 
											
												<!-- 결론적으로 여기서 보낼건 공고 번호 밖에 없음 -->
												<a class="btn btn-lg btn-default largeModal" data-toggle="modal" id="">
													 지원 하기
												</a>
												<div id="applyLayer"class="col-lg-12 col-md-12 col-sm-12 layerPop" style="margin-right: 0px;">
													<div class="modal-content"> 
														<div class="clear modal-body">
															<h3 class="modal-title">지원하시겠습니까?</h3><br>
															<button type="button" class="col-lg-6 col-md-6 col-sm-6 btn btn-danger closes jqclose"
																data-dismiss="modal">취소</button>
															<button type="button" class="col-lg-6 col-md-6 col-sm-6 btn btn-primary" onclick="applyBtn()">지원</button>
														</div>
													</div>
												</div>
											</c:if> --%>
										</div>
									</div>
								</div> 
							</div>
						</div>	

						<!-- 지원자격 근무조건 회사정보 간략히-->
						<div class="row sub_content">
							<div class="col-md-12 col-lg-12 col-sm-12 ">
								<div class="dividerHeading">
									<h4>
										<span>간략정보</span>
									</h4>
								</div>
							</div>
							<div class="col-md-12 col-lg-12 col-sm-12 ">
							<div class="col-lg-4 col-md-4 col-sm-4">
								<div class="serviceBox_1">
									<div class="service_icon">
										<i class="fa fa-laptop"></i>
										<h3>지원자격</h3>
									</div>
									<div class="service_content">
										<dl class="tbList">
											<dt style="float: left;">경력 :&nbsp</dt>
											<dd>
												<c:set var="career" value="${selectGonggo['0'].career}"></c:set>
												<strong class="col_1"><c:out value="${fn:substring(selectGonggo['0'].career,0,2)}" />
												
												<c:if test="${fn:substring(career,3,fn:length(career)) ne ''}">
												
													<c:out value="${fn:substring(career,3,fn:length(career))}" />년 이상
												</c:if>
												
												</strong>
											</dd>
											<dt style="float: left;">학력 :&nbsp</dt>
											<dd>
												<strong class="col_1"><c:out value="${selectGonggo['0'].academic}" /></strong> 
											</dd>
											<dt style="float: left;">기술자격 :&nbsp</dt>
											<dd>
												<strong class="col_1"><c:out value="${selectGonggo['0'].skillList}" /></strong> 
											</dd>
										
										</dl>
									</div>
								</div>
							</div>

							<div class="col-lg-4 col-md-4 col-sm-4">
								<div class="serviceBox_1">
									<div class="service_icon">
										<i class="fa fa-heart"></i>
										<h3>근무조건</h3>

										<dl class="tbList">
											<dt style="float: left">고용형태 : &nbsp</dt>
											<dd>
												<ul class="addList">
													<li><strong class="col_1"><c:out value="${selectGonggo['0'].typeEmploy}" /></strong> <span
														class="tahoma"></span></li>
												</ul>
											</dd>
											<dt style="float: left">급여 : &nbsp</dt>
											<dd>
												<em id='salary' class="dotum">
												</em> 
											</dd>
											<dt style="float: left">지역 : &nbsp</dt> 
											<dd><c:out value="${selectGonggo['0'].addressWp2}" /></dd>
											<dt style="float: left">모집인원 : &nbsp</dt> 
											<dd><c:out value="${selectGonggo['0'].numberEmploy}" />명</dd>
										</dl>
									</div>
								</div>
							</div>

							<div class="col-lg-4 col-md-4 col-sm-4">
								<div class="serviceBox_1">
									<div class="service_icon">
										<i class="fa fa-trophy"></i>
										<h3>회사정보</h3>
										<dl class="card">
											<dt style="float: left">사원수 :&nbsp</dt>
											<dd>
												<span class="tahoma"><c:out value="${selectGonggo['0'].member}" /></span>명
											</dd>
											<dt style="float: left">설립년도 : &nbsp</dt>
											<dd>
												<text> <span class="tahoma"><c:out value="${fn:substring(selectGonggo['0'].birth, 0, 4)}" /></span>년 (<span
													class="tahoma">${2017 - (fn:substring(selectGonggo['0'].birth, 0, 4))}</span>년차) </text>
											</dd>
											<dt style="float: left">기업형태 :&nbsp</dt>
											<dd><c:out value="${selectGonggo['0'].type}" /></dd>
											<dt style="float: left">홈페이지 :&nbsp</dt>
											<dd>
												<c:if test="${selectGonggo['0'].homepage} != null"><span class="tahoma"><a class="devCoHomepageLink"
													href="<c:out value="${selectGonggo['0'].homepage}" />"
													onclick="javascript:go_HomePageTrace('<c:out value="${selectGonggo['0'].homepage}" />','26378561');return false;">
														<c:out value="${selectGonggo['0'].homepage}" /></a></span>
														
												</c:if>
												<c:if test="${selectGonggo['0'].homepage eq null}">
													<span>홈페이지가 없습니다</span> 
												</c:if>
												
											</dd>

										</dl>
									</div>
								</div>
							</div>
							</div>
						</div>

						<!-- 상세요강 -->
						<div class="row">
							<div class="col-lg-12">


							</div>
						</div>


						<div id="content" class="row sub_content">
							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="dividerHeading">
									<h4>
										<span>상세요강</span>
									</h4>

								</div>
								<div><c:out value="${selectGonggo['0'].content}" escapeXml="false"/></div>
								
							
							</div>
						</div>
						<!-- 접수기간 -->
						<div class="row sub_content">
							<div class="col-md-12 col-lg-12 col-sm-12 ">
								<div id="date" class="dividerHeading">
									<h4>
										<span>접수기간</span>
									</h4>
								</div>
							</div>

							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="promo_box">
									<div class="pricingBlock theme-color-pt">
										<div class="col-lg-4 col-md-4 col-sm-4" >
											<div class="pricingTable"> 
												<div class="pricingTable-header">
													<span class="heading">남은시간</span> 
													<span class="price-value">
														
													
													
														<span id="countdownPar">
														
															<c:choose>
																<c:when test="${selectGonggo['0'].closing eq 0}">
																	<div id="countdown">
																	</div>
																</c:when>
																<c:otherwise>
																	마감
																</c:otherwise>
															</c:choose>
														</span>
													</span>
												</div>

												<div class="pricingContent">
													<ul>
														<li><strong>시작일</strong></li>
														<li id="startDate"><span><c:out value="${fn:substring(selectGonggo['0'].dateRegi, 0, 10)}" /></span></li>
														<li><strong>마감일</strong></li>
														<li id="closeDate"><span><c:out value="${fn:substring(selectGonggo['0'].dateClose, 0, 10)}" /></span></li>
														<li>
															<div class="col-lg-12 col-sm-12">
															<c:if test="${sessionScope.member_type eq 'p' and now <= Close eq true and appGubun eq null}">
											
																<!-- 결론적으로 여기서 보낼건 공고 번호 밖에 없음 -->
																<a class="btn btn-lg btn-default largeModal" data-toggle="modal">
																	 지원 하기
																</a>
																<div id="applyLayer"class="col-lg-12 col-md-12 col-sm-12 layerPop" style="margin-right: 0px;">
																	<div class="modal-content"> 
																		<div class="clear modal-body">
																			<h3 class="modal-title">지원하시겠습니까?</h3><br>
																			<button type="button" class="col-lg-6 col-md-6 col-sm-6 btn btn-danger closes jqclose"
																				data-dismiss="modal">취소</button>
																			<button type="button" class="col-lg-6 col-md-6 col-sm-6 btn btn-primary" onclick="applyBtn()">지원</button>
																		</div>
																	</div>
																</div>
															</c:if>
															<c:if test="${type eq 'c'}">
																<a id="closingEdit" class="btn btn-default btn-lg"> <i
																	class="fa fa-check-square-o"></i> 수정하기
																</a>
																<div style="display: none">
																	
																	<input type='text' id="dp" name="dp" class="form-control address3"
																		style="font-size: 15px; text-align: center; font-weight: bold" data-language='ko' data-position="right top" value="${fn:substring(editGonggo['0'].dateClose, 0, 10)}" readonly="readonly"/>
																</div>
															</c:if>
															</div>
															<!-- 마감일 수정 숨김 처리 -->
															<script type="text/javascript">
																
																$("#closingEdit").click(function(){
																	
																	$(this).hide();
																	$(this).next().show();
																});
															</script>
															
														</li>
													</ul>
												</div>
											</div>
										</div>

										<div class="col-lg-8 col-md-8 col-sm-8">



											<div class="Content">
												<ul>
													<li><i class="fa fa-map-marker"></i>
													<strong><c:out value="${selectGonggo['0'].addressWp2}" />&nbsp&nbsp<c:out value="${selectGonggo['0'].addressWp3}" /></strong></li>
													<li><div id="map"></div></li>

												</ul>
											</div>

										</div>
									</div>
								</div>
							</div>
						</div>


						<!-- 담당자 한마디 -->
						<div class="row sub_content">
							<div class="col-lg-8 col-md-8 col-sm-8">
								<div class="project_description">
									<div class="widget_title">
										<h4>
											<span>담당자 한마디</span>
										</h4>
									</div>

									<!-- 담당자 정보 -->
									<div class="col-lg-12">
										<div class="about_author">
											<div class="author_desc" style="text-align: center" >
												<img src="images/img-style_man.jpg">
											</div>

											<div class="author_bio">
												<h3 class="author_name"><c:out value="${selectGonggo['0'].nameCm}" /></h3>
												<h5>
													채용담당자 at <a href="#"><c:out value="${selectGonggo['0'].company}" /></a>
												</h5>
												<h5>담당자 번호 : <c:out value="${selectGonggo['0'].phoneCm}" /></h5>
												<h5>담당자 이메일 : <c:out value="${selectGonggo['0'].emailCm}" /></h5>
												<!-- <p class="author_det">안녕하세요? ㈜유니에스 채용담당자입니다. 상세요강 확인 후
													접수방법에 기재된 방법으로 입사지원해주세요..</p> -->
											</div>

										</div>
									</div>

									<!-- Q&A -->
									<!-- <div class="col-lg-12">
										<div class="panel-group accordion" id="accordion">
											<div class="panel panel-default">
												<div class="panel-heading">
													<h4 class="panel-title">
														<a data-toggle="collapse" data-parent="#accordion"
															href="#collapseTwo"> <i class="switch fa fa-plus"></i>
															Q.신규 채용인가요? 결원에 의한 충원인가요?
														</a>
													</h4>
												</div>
												<div id="collapseTwo" class="panel-collapse collapse">
													<div class="panel-body">A.결원에 의한 충원입니다.</div>
												</div>
											</div>

											<div class="panel panel-default">
												<div class="panel-heading">
													<h4 class="panel-title">
														<a data-toggle="collapse" data-parent="#accordion"
															href="#collapseThree"> <i class="switch fa fa-plus"></i>
															Q.채용 합격시 입사예정일은 언제쯤으로 예상하고 있어야 하나요?
														</a>
													</h4>
												</div>
												<div id="collapseThree" class="panel-collapse collapse">
													<div class="panel-body">A.채용 최종합격 후, 가능한 빠른 시일 내에
														입사하여 출근하길 희망합니다.</div>
												</div>
											</div>
										</div>
									</div> -->
								</div>
							</div>

							<div class="col-lg-4 col-md-4 col-sm-4">
								<div id="info" class="project_details">
									<div class="widget_title">
										<h4>
											<span>기업정보</span>
										</h4>
									</div>
									<ul class="details">
										<li><span>회사명 :</span><c:out value="${selectGonggo['0'].company}" /></li>
										<li><span>사원수 :</span> <c:out value="${selectGonggo['0'].member}" />명</li>
										<li><span>기업형태 :</span> <c:out value="${selectGonggo['0'].type}" /></li>
										<!-- <li><span>산업 :</span> 인력공급업</li> -->
										<li><span>설립 :</span> <c:out value="${fn:substring(selectGonggo['0'].birth, 0, 4)}" />년(${2017 - (fn:substring(selectGonggo['0'].birth, 0, 4))}년차)</li>
										<!-- <li><span>매출액 :</span> 3,229억 7,185만원</li> -->
									</ul>
								</div>
							</div>
						</div>

						<div class="row sub_content">
							<div class="carousel-intro">
								<div class="col-md-12">
									<div class="dividerHeading">
										<h4>
											<span>회사 사진</span>
										</h4>
									</div>
									<!-- <div class="carousel-navi">
										<div id="work-prev" class="arrow-left jcarousel-prev"
											data-jcarouselcontrol="true">
											<i class="fa fa-angle-left"></i>
										</div>
										<div id="work-next" class="arrow-right jcarousel-next active"
											data-jcarouselcontrol="true">
											<i class="fa fa-angle-right"></i>
										</div>
									</div> -->
									<div class="clearfix"></div>
								</div>
							</div>

							<div class="jcarousel recent-work-jc" data-jcarousel="true"
								style="height: 162px;">
								<ul class="jcarousel-list" style="left: 0px;">
									<c:forEach begin="0" end="5" var="i"> 
										<c:if test="${multiPicList[i].picRoute ne null}"> 
											<!-- Recent Work Item -->
											<li class="col-sm-3 col-md-3 col-lg-3">
												<img src="${multiPicList[i].picRoute}" alt=""
												class="img-responsive incompic">
											</li>
										</c:if> 
									</c:forEach>
								</ul>
							</div>
							<script>
								$(".incompic").css("width", "100%");
								$(".incompic").css("height", "130px"); 
							</script>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
</section>
<!--end wrapper-->
<script type="text/javascript">
	
	var mon = "${selectGonggo['0'].salary}";
	var num = mon.substr(2,mon.length);
	var prevMon = mon.substr(0,2);

	$(document).ready( function() { 
		
		if (mon == '회사내규에 따름') {
			$("#salary").text(mon);
		}else{
			moneyKor(num);
		}
		
		
		$(".layerPop").css("display", "none");

		$(".largeModal").click(	function() {
					$(this).next().show();
		});
		$(".jqclose").click(function() {
			$(this).parents(".layerPop").css("display", "none");
		});
		
		$("#initOffer").click(function() {
			
			alert($("#modalContent").val());
			
			$("#offerContent").val($("#modalContent").val());
			
			offer.pageSubmitFn('insertOffer');
			
		});
		
		
	});
	
	
	/* 급여 한글화 */
	function moneyKor(InputMoney){
		
		var money = InputMoney * 1;
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
			$("#salary").text(prevMon + moneyText + "원");
		}
		
	};
	/* 급여 한글화 */
	
	
	var detail = {
			
			jobDetailFn : function(pageName, gonggoNum) {
				
		
			$("#pageName").val(pageName);
			if (pageName == "gonggoEdit") {
				
				$("#gonggoID").val(gonggoNum);
			}else{
				
				$("#gonggoNum").val(gonggoNum);
			}
			
			
			$("#frm_job").attr("action", pageName + ".jobq");
	
			$("#frm_job").submit();
		}
	};
	
	function applyBtn(){
		
		$("#pageName").val(pageName);
		
		$("#applyFrm").attr("action","insertApp.jobq");
		
		$("#applyFrm").submit();
	};
	
	
	
	
	var end = "${fn:substring(selectGonggo['0'].dateClose,0,10)}";
	var timer = "";
	var countE = CountDownTimer(end, 'countdown'); // 마감일까지의 카운트다운 
	
	/* 한자리 숫자의 경우 앞에 0붙이기 */
	function pad(n) {
		n = n + '';
		return n.length >= 2 ? n : '0' + n;
	}

	/* 카운트 다운 구현 부분 */
	function CountDownTimer(dt, id) {
		
		var end = new Date(dt);
		end.setDate(end.getDate() + 1);
		var _second = 1000;
		var _minute = _second * 60;
		var _hour = _minute * 60;
		var _day = _hour * 24;
		
 
		function showRemaining() {
			var now = new Date();
			var distance = end - now;
			
			/* 마감일이 지났을 경우 처리하기 */
			if (distance < 0) {

				clearInterval(timer);
				$("#" + id).html("<span style='font-size : 40px; font-weigth: bold'>마감</span>");
				return;
			}
			var days = Math.floor(distance / _day);
			var hours = Math.floor((distance % _day) / _hour);
			var minutes = Math.floor((distance % _hour) / _minute);
			var seconds = Math.floor((distance % _minute) / _second);
			
			$("#" + id).html("<span style='font-size : 40px; font-weigth: bold'>" + days + '일 ' + pad(hours) + ':' + pad(minutes) + ':' + pad(seconds) + "</span>");
		}
		timer = setInterval(showRemaining, 1000);
	};
	/* 카운트 다운 구현 부분 */
	
	/* 마감일 수정 아작스 처리 */
	var ajaxC = 
	{	
			
		/* 마감일만 수정하고 페이지에서 마감일 수정하기 */
		changeCloseDate : function(options){
			
			var that = this;
			var settings = {
					url: ".jobq",
					closeDate : "",
					gonggoNum : "",
			}
			
			settings = $.extend({}, settings, options);
			
			$.ajax({
				type		: "POST",
				url			: settings.url,
				data		: {"closeDate" : settings.closeDate,
					"gonggoNum" : settings.gonggoNum},
				async		: false,
				success		: function(result){
					
					clearInterval(timer);
					countE = CountDownTimer(settings.closeDate, 'countdown');
					$("#closeDate").children().remove();
					$("#closeDate").append("<span>" + settings.closeDate + "</span>");
					alert("마감일이 변경되었습니다.");
					
				},
				error		: function(){
					alert("이상이상");
				}
			});
		},
	}
	
	
	
	
	
</script>

<!-- 지도 관련 스크립트 -->
<script>

	var mapContainer = document.getElementById('map'), mapOption = {
		center : new daum.maps.LatLng("${selectGonggo['0'].lat}", "${selectGonggo['0'].lng}"),
		level : 3
	// 지도의 확대 레벨
	};

	var imageSrc = './images/mapPointer.png', // 마커이미지의 주소입니다    

	imageSize = new daum.maps.Size(70, 69), // 마커이미지의 크기입니다
	imageOption = {
		offset : new daum.maps.Point(27, 69)
	}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

	var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,
			imageOption);

	//지도를 미리 생성
	var map = new daum.maps.Map(mapContainer, mapOption);

	//마커를 미리 생성
	var marker = new daum.maps.Marker({
		position : new daum.maps.LatLng("${selectGonggo['0'].lat}", "${selectGonggo['0'].lng}"),
		image : markerImage,
		map : map
	});
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
	         ajaxC.changeCloseDate({url : "changeCloseDate.jobq", closeDate : dateText, gonggoNum : "${selectGonggo['0'].jobNumber}"});
	    }
	}) 
</script>
