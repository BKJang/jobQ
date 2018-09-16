<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!-- 딥레이어팝업을 위한 스타일 -->
<style>
.pop-layer .pop-container {
	padding: 20px 25px;
}

.pop-layer p.ctxt {
	color: #666;
	line-height: 25px;
}

.pop-layer .btn-r {
	width: 100%;
	margin: 10px 0 20px;
	padding-top: 10px;
	border-top: 1px solid #DDD;
	text-align: right;
}

.pop-layer {
	display: none;
	position: absolute;
	top: 50%;
	left: 50%;
	width: 410px;
	height: auto;
	background-color: #fff;
	border: 5px solid #3571B5;
	z-index: 10;
}

.dim-layer {
	display: none;
	position: fixed;
	_position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 100;
}

.dim-layer .dimBg {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: #000;
	opacity: .5;
	filter: alpha(opacity = 50);
}

.dim-layer .pop-layer {
	display: block;
}

a.btn-layerClose {
	display: inline-block;
	height: 25px;
	padding: 0 14px 0;
	border: 1px solid #304a8a;
	background-color: #3f5a9d;
	font-size: 13px;
	color: #fff;
	line-height: 25px;
}

a.btn-layerClose:hover {
	border: 1px solid #091940;
	background-color: #1f326a;
	color: #fff;
}

.textEl{
	white-space: nowrap; 
	overflow: hidden; 
	text-overflow: ellipsis;
}

</style>
<form id="frm_offer" name="frm_offer" method="post">
	<input type="hidden" id="pageNum" name="pageNum" value="${paging.pageNo}"/>
	<input type="hidden" id="pageSize" name="pageSize" />
</form>

<form id="frm_resume" name="frm_resume" method="post">
	<input type="hidden" id="resumeNum" name="resume_detail" /> 
</form>
<!--start wrapper-->
<section class="wrapper">
	<section class="page_head">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<!-- <nav id="breadcrumbs">
						<ul>
							<li><a href="#"
								onclick="javascript:left.pageSubmitFn('companyMain')">기업서비스</a></li>
							<li><a href="#"
								onclick="javascript:left.pageSubmitFn('companyOffer')">면접제의</a></li>
						</ul>
					</nav> -->
					<div class="page_title">
						<h2>면접제의</h2>
					</div>
				</div>

			</div>
		</div>
	</section>
	<section class="content elements">
		<div class="container">
			<div class="container">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="dividerHeading">
						<h4>
							<span>면접제의</span> <span class="bar_gray"> | </span><span
								class="total_top">${offerListCount}건</span>
						</h4>
					</div>


				</div>

				<div class="col-sm-12 col-md-12 col-sm-12 clear">
					<select id="pSize" class="form-control list_count_fr" onchange="changeSize()">
						<option value="10" selected>10개씩</option>
						<option value="20">20개씩</option>
						<option value="50">50개씩</option>
					</select>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="card_wrap" style="border : 0px;">
						<ul class="listResult clear">

							<c:if test="${empty offerList or offerList eq null}" >
								<tr>
									<td rowspan="2">
										지원자 내역이 없습니다.
									</td>
								</tr>
							</c:if>
							<!-- 한명의 내역 -->
							<c:forEach var="offerList" items="${offerList}" varStatus="Status">
								<li style="border: 1px solid #ccc;">
									<div class="card">
										<a href="#"	onclick="javascript:offerlist.resumeDetailFn('${offerList.reNumber}')">
											<dl class="clear">
												<dt class="photo">
													<c:choose>
														<c:when test="${offerList.mainPic ne null}">
															<img class="img-circle img-responsive" src="./${appList.mainPic}" >
														</c:when>
														<c:otherwise>
															<img class="img-circle img-responsive" src="images/img-style_man.jpg" >
														</c:otherwise>
													</c:choose>
												</dt>
												<dd class="infoWrap">
													<ul>
														<li class="info1"><strong class="name"><c:out value="${offerList.name}"/></strong> <span>
															(
															<c:choose>
															<c:when test="${offerList.sex eq 0}">
																남
															</c:when>
															<c:when test="${offerList.sex eq 1}">
																여
															</c:when>
															<c:otherwise>
																<c:out value="${offerList.sex}"/>
															</c:otherwise>
															</c:choose>
															,
															<c:out value="${fn:substring(offerList.sysdate, 0, 4) - fn:substring(offerList.birth, 0, 4)}"/>세 )</span>
															<span class="upload_time" style="float: right">제의 날짜 : <c:out value="${fn:substring(offerList.offerdate,0,10)}"/></span>
														</li>
														<li class="info2"><strong><c:out value="${offerList.title}"/></strong>
														</li>
														<li class="info3"><c:out value="${offerList.rcontent}"/></li>
														
													</ul>
												</dd>
											</dl>
										</a>
										<p class="job_list textEl">분야 - <c:out value="${offerList.skill}"/></p> 
										<div class="card_footWrap clear"
											style="text-overflow: ellipsis; overflow: hidden">
											<div class="area_schedule">
												<a href="#${offerList.offerId}_layer" class="btn-example"><span class="area textEl"
													><c:out value="${offerList.content}"/></span></a>
												
												
												<!-- 레이어 팝업 처리 -->
												<div class="dim-layer">
													<div class="dimBg"></div>
													<div id="${offerList.offerId}_layer" class="pop-layer">
														<div class="pop-container">
															<div class="pop-conts">
																<p class="ctxt mb20"><c:out value="${offerList.content}"/></p>
																<div class="btn-r">
																	<a class="btn-layerClose">닫기</a>
																</div>
															</div>
														</div>
													</div>
												</div>
												<!-- 레이어 팝업 처리 -->
											</div>
										</div>
									</div>
								</li>
							</c:forEach>
							<!-- 한명 끝 -->
						</ul>
					</div>
					<div class="col-sm-12">
						<div class="dataTables_paginate paging_simple_numbers text-center"
							id="example2_paginate">
							<ul class="pagination">
								<li class="paginate_button previous" id="previous">
									<a href="#" aria-controls="example2" data-dt-idx="${paging.prevPageNo}"
									tabindex="0" onclick="offerlist.offerListFn('${paging.prevPageNo}')">이전</a>
								</li>
								
								<c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1">
									<c:choose>
										<c:when test="${i eq paging.pageNo}">
											<li class="paginate_button active">
												<a href="#"	aria-controls="example2" data-dt-idx="${i}" tabindex="0" onclick="offerlist.offerListFn('${i}')">${i}</a></li>
											<li class="paginate_button ">
										</c:when>
										<c:otherwise>
											<li class="paginate_button">
												<a href="#"	aria-controls="example2" data-dt-idx="${i}" tabindex="0" onclick="offerlist.offerListFn('${i}')">${i}</a></li>
											<li class="paginate_button ">
										</c:otherwise>
									</c:choose>
								</c:forEach>
								
								<li class="paginate_button next" id="next">
									<a href="#" aria-controls="example2" data-dt-idx="${paging.nextPageNo}"
									tabindex="0" onclick="offerlist.offerListFn('${paging.nextPageNo}')">다음</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- //container[E]  -->
	</section>
</section>
<!--end wrapper-->



<script>
	$(document).ready(function() {

		$(".card_wrap > ul > li:odd").css("border-left", "1px solid #ccc");
		$("#pSize").val("${pageSize}");

	});
	
	/* 딥레이어팝업 설정 */
	$('.btn-example').click(function() {
		var $href = $(this).attr('href');
		layer_popup($href);
	});

	function layer_popup(el) {

		var $el = $(el); //레이어의 id를 $el 변수에 저장
		var isDim = $el.prev().hasClass('dimBg'); //dimmed 레이어를 감지하기 위한 boolean 변수

		isDim ? $el.parent('.dim-layer').fadeIn() : $el.fadeIn();

		var $elWidth = ~~($el.outerWidth()), $elHeight = ~~($el.outerHeight()), docWidth = $(
				document).width(), docHeight = $(document).height();

		// 화면의 중앙에 레이어를 띄운다.
			$el.css({
				marginTop : -$elHeight / 2,
				marginLeft : -$elWidth / 2
			})
		
		$el.find('a.btn-layerClose').click(function() {
			isDim ? $('.dim-layer').fadeOut() : $el.fadeOut(); // 닫기 버튼을 클릭하면 레이어가 닫힌다.
			return false;
		});

		$('.layer .dimBg').click(function() {
			$('.dim-layer').fadeOut();
			return false;
		});
	}
	/* 딥레이어팝업 설정 */
	
	
	/* 갯수전환시 페이지 리로드 */
	function changeSize(){
		
		offerlist.offerListFn($("#pageSize").val());
	}
	/* 갯수전환시 페이지 리로드 */
	
	
	var offerlist = {
			
		resumeDetailFn : function(resumeNum){

			$("#resumeNum").val(resumeNum);

			$("#frm_resume").attr("action", "resumeDetail.jobq");

			$("#frm_resume").submit();
		},
		
		offerListFn : function(pageNum) {

			$("#pageNum").val(pageNum);
			
			$("#pageSize").val($("#pSize").val());
			
			$("#frm_offer").attr("action", "companyOffer.jobq");

			$("#frm_offer").submit();
		} 
	}
</script>





