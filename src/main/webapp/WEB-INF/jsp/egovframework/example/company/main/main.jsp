<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet" href="css/company/imageSlider.css">

<section class="wrapper">
	<section class="page_head">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="page_title">
						<h2>마이페이지</h2>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="content elements">
		<div class="container">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-md-3 col-lg-4">
						<div class="widget_title">
							<h4>
								<span style="font-weight: bold">회사 로고</span>
							</h4>
						</div>
						<div style="width: 280px; margin:auto;">
							<figure class="touching effect-bubba">
								
								<c:if test="${comMainList['0'].mainpic ne null}">
									<!-- 로고 보여주는 공간 -->
									<img id="logo_pic" src="./${comMainList['0'].mainpic}" class="img-responsive" width="2px" height="auto">
								</c:if>
								<c:if test="${comMainList['0'].mainpic eq null}">
									<!-- 로고 보여주는 공간 -->
									<img id="logo_pic" src="images/jobq_corLogo.jpg" class="img-responsive" width="2px" height="auto">
								</c:if>
								
								<!-- 로고 파일 업로드 버튼 -->
								<input id="logoUpdateBtn" type="file" style="display: none">
								<figcaption class="item-description" onclick="javascript:clickUploadBtn()">
								
								</figcaption>
							</figure>
						</div>
						
						
						
						<!-- 회사 내 사진 최대 6개 구현 이중팝업으로 하자 이건 -->
						<div class="widget_title">
							<h4>
								<span class="favicon_wrap" style="font-weight: bold"> 회사 내 사진
									<a href="#" class="option favicon" onclick="changePic()">
										<i class="fa fa-cog fa-spin"></i>
									</a>
								</span> 
							</h4>
						</div>
						<c:if test="${fn:length(picList) eq '0'}">
								<span style="font-weight: bold; color: blue;">회사 내 사진이 등록되어 있지 않습니다.</span>
						</c:if>
						<span id='picNone' style="font-weight: bold; color: blue; display: none">회사 내 사진이 등록되어 있지 않습니다.</span>
						<!-- 썸네일 구현 최대 사진 갯수는 6개-->
						<div id="gallery" class="col-sm-12 col-md-12 col-lg-12">
							<c:if test="${fn:length(picList) ne 0}">
								<ul class="image">
									<c:forEach begin="0" end="5" var="i"> 
										<c:if test="${picList[i].picRoute ne null}">
											<!-- 로고 보여주는 공간 --> 
											<li>
												<img src="${picList[i].picRoute}" class="img-responsive">
											</li>
										</c:if>
									</c:forEach>
								</ul> 
								<div id="thumbnail">
									<div class="prev">
										<span>
											<img src="./images/company/picSlider/pre.gif" alt="이전" />
										</span>
									</div>
	
									<div class="imgcontainer">
										<ul>
											<c:forEach begin="0" end="5" var="i">
												<c:if test="${picList[i].picRoute ne null}">
													<!-- 로고 보여주는 공간 --> 
													<li>
														<img src="${picList[i].picRoute}" class="img-responsive">
													</li>
												</c:if>
											</c:forEach>
										</ul>
									</div>
	
									<div class="next">
										<span>
											<img src="./images/company/picSlider/next.gif" alt="다음" />
										</span>
									</div>
								</div>
							</c:if>
						</div> 
					</div>
					
					<div class="col-sm-6 col-md-3 col-lg-4">
						<div class="widget_title">
							<h4>
								<span class="favicon_wrap" style="font-weight: bold"> 회사 정보
									<a href="edit_company.jobq" class="option favicon">
										<i class="fa fa-cog fa-spin"></i>
									</a>
								</span>
							</h4>
						</div>
						<div class="widget_content">
							<ul>
								<li>
									<p>
										<i class="fa fa-home"></i> <strong> 회사명</strong> :
										<c:choose>
											<c:when test="${comMainList['0'].company eq null}">
												<span style="font-weight: bold; color: blue">기업명을 등록해주세요.</span>
											</c:when>
											<c:otherwise>
												<c:out value="${comMainList['0'].company}" />
											</c:otherwise>
										</c:choose>
									</p>
								</li>
								<li>
									<p>
										<i class="fa fa-user"></i> 
										<strong> 대표자 </strong> : 
										<c:choose>
											<c:when test="${comMainList['0'].boss eq null}">
												<span style="font-weight: bold; color: blue">대표자명을 등록해주세요.</span>
											</c:when>
											<c:otherwise>
												<c:out value="${comMainList['0'].boss}" />
											</c:otherwise>
										</c:choose>
									</p>
								</li>
								<li>
									<p>
										<i class="fa fa-bookmark"></i> <strong> 사업자 번호</strong> :
										
										<c:choose>
											<c:when test="${comMainList['0'].numbercorp eq null}">
												<span style="font-weight: bold; color: blue">사업자 번호를 등록해주세요.</span>
											</c:when>
											<c:otherwise>
												<c:out value="${comMainList['0'].numbercorp}" />
											</c:otherwise>
										</c:choose>
									</p>
								</li>

								<li>
									<p>
										<i class="fa fa-building"></i> <strong> 기업형태 </strong> :
										<c:choose>
											<c:when test="${comMainList['0'].type eq null}">
												<span style="font-weight: bold; color: blue">기업형태를 등록해주세요.</span>
											</c:when>
											<c:otherwise>
												<c:out value="${comMainList['0'].type}" />
											</c:otherwise>
										</c:choose>
									</p>
								</li>
								<li>
									<p>
										<i class="fa fa-calendar"></i> <strong> 설립년도</strong> :
										<c:choose>
											<c:when test="${comMainList['0'].birth eq null}">
												<span style="font-weight: bold; color: blue">설립연도를 등록해주세요.</span>
											</c:when>
											<c:otherwise>
												<c:out value="${fn:substring(comMainList['0'].birth,0,10)}" />
											</c:otherwise>
										</c:choose>
									</p>
								</li>
								<li>
									<p>
										<i class="fa fa-users"></i> <strong> 직원수</strong> :
										<c:choose>
											<c:when test="${comMainList['0'].member eq null}">
												<span style="font-weight: bold; color: blue">직원수를 등록해주세요.</span>
											</c:when>
											<c:otherwise>
												<c:out value="${comMainList['0'].member}" />명
											</c:otherwise>
										</c:choose>
									</p>
								</li>

								<li>
									<p>
										<i class="fa fa-file-text"></i> <strong> 사업내용</strong> :
										<c:choose>
											<c:when test="${comMainList['0'].explain eq null}">
												<span style="font-weight: bold; color: blue">사업내용을 등록해주세요.</span>
											</c:when>
											<c:otherwise>
												<c:out value="${comMainList['0'].explain}" />
											</c:otherwise>
										</c:choose>
									</p>
								</li>

								<li></li>

								<li>
									<p>
										<i class="fa fa-home"></i><strong> 홈페이지</strong> :
										<c:if test="${comMainList['0'].homepage ne ''}">
											<a href="#<c:out value="${comMainList['0'].homepage}" />">
												<c:out value="${comMainList['0'].homepage}" />
											</a>
										</c:if>
										<c:if test="${comMainList['0'].homepage eq null}">
										 	<span style="font-weight: bold; color: blue">홈페이지가 등록되어 있지 않습니다.</span>
										</c:if>
									</p>
								</li>
								<li>
									<p>
										<i class="fa fa-map-marker"></i><strong>주소</strong> : 
										<c:choose>
											<c:when test="${comMainList['0'].address eq null}">
												<span style="font-weight: bold; color: blue">주소를 등록해주세요.</span>
											</c:when>
											<c:otherwise>
												<c:out value="${comMainList['0'].address}" /><br>
												<c:out value="${comMainList['0'].addressd}" />
											</c:otherwise>
										</c:choose>
									</p>
								</li>
								<li>
									<div class="widget_title">
										<h4>
											<span class="favicon_wrap" style="font-weight: bold"> 담당자 정보 <a
												class="option favicon" href="#"
												onclick="javascript:left.pageSubmitFn('companyJobmanage')">
											</a>
											</span>
										</h4>
									</div>
								</li>

								<li>
									<p>
										<i class="fa fa-user"></i> <strong> 담당자</strong> :
										<c:out value="${comMainList['0'].name}" />
										/ 
										<c:choose>
											<c:when test="${comMainList['0'].sex eq 0}">
												남
											</c:when>
											<c:when test="${comMainList['0'].sex eq 1}">
												여
											</c:when>
											<c:otherwise>
												<c:out value="${comMainList['0'].sex}" />
											</c:otherwise>
										</c:choose>
										
									</p>
								</li>
								<li>
									<p>
										<i class="fa fa-phone"></i> <strong> 전화번호</strong> :
										<c:choose>
											<c:when test="${comMainList['0'].phone eq null}">
												<span style="font-weight: bold; color: blue">전화번호를 등록해주세요.</span>
											</c:when>
											<c:otherwise>
												<c:out value="${comMainList['0'].phone}" />
											</c:otherwise>
										</c:choose>
									</p>
								</li>
								<li>
									<p>
										<i class="fa fa-envelope"></i> <strong> Email</strong> : 
										<c:choose>
											<c:when test="${comMainList['0'].email eq null}">
												<span style="font-weight: bold; color: blue">전화번호를 등록해주세요.</span>
											</c:when>
											<c:otherwise>
												<c:out value="${comMainList['0'].email}" />
											</c:otherwise>
										</c:choose>
									</p>
								</li>
							</ul>
						</div>
					</div>
					<!-- <div class="col-sm-6 col-md-3 col-lg-4">
						<div class="widget_title">
							<h4>
								<span style="font-weight: bold">최근 활동 내역</span>
							</h4>
						</div>
						<div class="widget_content">
							<ul class=""> 
								<li>
									최근활동 내역이 없습니다.
								</li>
							</ul>
						</div>
					</div>
	 -->				
					<div class="col-sm-6 col-md-6 col-lg-4" style="overflow: hidden">
						<div class="widget_title">
							<h4>
								<span class="favicon_wrap"> <strong>나의 문의 내역</strong> 
								
								</span> 
							</h4>
						</div>
						<div class="widget_content">						
							
							<ul class="links">
								<c:if test="${qnaList['0'].qNumber ne null}">
								
									<c:forEach items="${qnaList}" var="qnaList">
										<li id="" class="qNumber" value="<c:out value="${qnaList.qNumber}"/>">
											
											<c:if test="${qnaList.replyDate == null}">	
											<a href="#">
												<font color="black">
													<c:out value="${qnaList.title}" />
												</font>
											</a>	
											</c:if>
											<c:if test="${qnaList.replyDate != null}">	
											<a href="#">
												<font color="green">
													<c:out value="${qnaList.title}" />
												</font>
											</a>	
											</c:if>		
											
										</li>
									</c:forEach>
									<c:if test="${fn:length(qnaList)>5}">
										<font style="text-aling:center;"><a href="goQnAList.jobq">문의 내역 더보기</a></font>
									</c:if>
								</c:if>
							</ul>
							<c:if test="${qnaList['0'].qNumber == null}">
								<span>문의 내역이 없습니다.</span>
							</c:if>
							
							
						</div>
					</div>
				</div>

				<div class="row sub_content">
				<!-- 공란 -->
				</div>
				
				<div class="row sub_content">
					<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="dividerHeading">
							<h4>
								<span>대쉬보드</span>
							</h4>
 
						</div>
					</div>
					<div class="pricingBlock theme-color-pt">

						<!-- 공고 등록으로 이동 -->
						<div class="col-lg-3 col-md-3 col-sm-3">
							<a class="option" href="#" onclick="javascript:left.pageSubmitFn('companyJob')">
								<div class="pricingTable">
									<div class="pricingTable-header">
										<span class="heading">공고 등록</span> 
										<span class="price-value"></span>
									</div>
									<div class="pricingContent">
										<ul>
											<li>
												<i class="fa fa-share fa-3x"></i>
											</li>
											<li style="font-size: 20px">
												<strong>지금</strong>등록 하러가기
											</li>
										</ul>
									</div>
									<div class="pricingTable-sign-up">
										<span class="btn btn-block btn-default">공고 등록</span>
									</div>
								</div>
							</a>
						</div>
						
						<!-- 게시중 공고 수 보여주기-->
						<div class="col-lg-3 col-md-3 col-sm-3">
							<a class="announce" href="#" onclick="javascript:left.pageSubmitFn('companyJobmanage')">
								<div class="pricingTable">
									<div class="pricingTable-header">
										<span class="heading">게시중 공고</span> 
										<span class="price-value"></span>
									</div>
									<div class="pricingContent">
										<ul>
											<li>
												<i class="fa fa-file-text-o fa-3x"></i>
											</li>
											<li class="font_siz">
												<strong><c:out value="${allCount[0]}"></c:out></strong> 건
											</li>
										</ul>
									</div> 
									<div class="pricingTable-sign-up">
										<span class="btn btn-block btn-default">공고 관리</span>
									</div>
								</div>
							</a>
						</div>



						<!-- 미열람 지원자 수 보여주기 -->
						<div class="col-lg-3 col-md-3 col-sm-3">
							<a class="applicant" href="#" onclick="javascript:left.pageSubmitFn('companyApplicants')">
								<div class="pricingTable">
									<div class="pricingTable-header">
										<span class="heading">미열람 지원자</span> 
										<span class="price-value"></span>
									</div>
									<div class="pricingContent">
										<ul>
											<li>
												<i class="fa fa-users fa-3x"></i>
											</li>
											<li class="font_siz">
												<strong><c:out value="${allCount[1]}"></c:out></strong> 명
											</li>
										</ul>
									</div>
									<div class="pricingTable-sign-up">
										<span class="btn btn-block btn-default">지원자 관리</span>
									</div>
								</div>
							</a>
						</div>

						<!-- 면접제의 신청인원 수 보여주기 -->
						<div class="col-lg-3 col-md-3 col-sm-3">
							<a class="suggest" href="#"	onclick="javascript:left.pageSubmitFn('companyOffer')">
								<div class="pricingTable">
									<div class="pricingTable-header">
										<span class="heading">면접 제의</span> 
										<span class="price-value"></span>
									</div>
									<div class="pricingContent">
										<ul>
											<li>
												<i class="fa fa-child fa-3x"></i>
											</li>
											<li class="font_siz">
												<strong><c:out value="${allCount[2]}"></c:out></strong> 명
											</li>
										</ul>
									</div>
									<div class="pricingTable-sign-up">
										<span class="btn btn-block btn-default">면접제의 관리</span>
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</section>
<form id="qnaFrm" name="qnaFrm">
	<input type="hidden" id="qnaNumber" name="qnaNumber" />
</form> 
<script type="text/javascript">

	$(document).ready(function() {
		
		var picCom = "${picList}";
		
		if (picCom.length == 30) {
			$("#gallery").hide();
			$("#picNone").show(); 
		}
		 
		/* 문의내역 자세히 보기 */
		$(".qNumber").click(function(){
			
			$("#qnaNumber").val($(this).val());
			
			qna.pageSubmitFn("QnADetail");
			
		});
		
		/* 로그인 상태가 아니면 막기 */
		var memeber_id= "<%=(String)session.getAttribute("member_id") %>";
		if (memeber_id == null) {
			alert("로그인을 해주세요.");
			left.pageSubmitFn('login');
		};
		/* 로그인 상태가 아니면 막기 */
		
		/* 회원수정 온/오프 */
		$(".widget_title .favicon").hide();

		$(".widget_title span").on({
			mouseenter : function() {
				$(this).find(".favicon").show();
			},
			mouseleave : function() {
				$(".widget_title .favicon").hide();
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

	});
	
	/* 회사 내 사진 보기 구현 */
	/* 로고 파일 업로드 열기 */
	function clickUploadBtn(){
		
		$("#logoUpdateBtn").trigger("click");
	};
	
	/* 썸네일 리스트형 */
	var DUI = DUI || {};
	
	(function(global, $) {
	
		DUI.gallery = function(selector) {
			var current = 0, thumbListSize = 3, thumbnail = $(selector), 
					prev = selector + ' > .prev', next = selector + ' > .next', 
					$container = thumbnail.find('> .imgcontainer > ul'), 
					$containWidth = thumbnail.find('> .imgcontainer').width(), 
					$thumb = $container.find('> li'), 
					thumbStr = '.'+ thumbnail.find('> .imgcontainer').attr('class') + ' li', 
					maxSize = $thumb.length, // 총썸네일 갯수
					$image = $('.image > li'), 
					thumbnailSizeCheck = parseInt(maxSize / thumbListSize);//넘길수 있는 페이지 수
			
			//실질적 실행 코드		
			$(document).on('click.gallery.next', next, nextListShow).on(
					'click.gallery.prev', prev, prevListShow).on(
					'click.gallery.thumb', thumbStr, thumbnailShow);
			//실질적 작동 코드
			
			/* 다음 사진 리스트 */
			function nextListShow() {
				if (current < thumbnailSizeCheck) {
					current++;
				}
				marginSpace();
				movingList();
			}
			/* 다음 사진 리스트 */
	
			
			/* 이전 사진 리스트 */
			function prevListShow() {
				if (current > 0) {
					current--;
				}
				marginSpace();
				movingList();
			}
			/* 이전 사진 리스트 */
	
			/* 사진 보여주기 */
			function thumbnailShow() {
				$image.css('display', 'none');
				var i = $(this).index();
				$image.eq(i).fadeIn();
			}
			/* 사진 보여주기 */
			
			/* 리스트 이동 */
			function movingList() {
				var mvWidth = $containWidth * current * -1;
				$container.stop().animate({
					left : mvWidth
				}, {
					duration : 500
				});
			}
			/* 리스트 이동 */
			function marginSpace() {
				$container.css('margin-left', -6 * (current + 1));
			}
		};
	
		$(function() {
			DUI.gallery('#thumbnail');
		});
	
	})(window, window.jQuery);
	
	
	function changePic(){
		
		var params = "?guBun=c";
		var url = "changePic.jobq";
		var opt = "width=1050, height=750, scrollbars=no, status=no, toolbar=no, resizable=no, left=50%, top=50%";
		
		window.open(url+params, "사진을 바꿔봅시다", opt);
	}
	
	/* 문의내역 자세히 보기 */
	var qna = {
			pageSubmitFn : function(pageName){
				
				$("#qnaFrm").attr("action", pageName + ".jobq");	
				
				$("#qnaFrm").attr("method", "post");

				$("#qnaFrm").submit();
			}
	}
	
</script>
