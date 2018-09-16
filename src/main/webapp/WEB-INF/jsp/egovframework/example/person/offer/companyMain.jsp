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
						<h2>기업정보</h2>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="content elements">
		<div class="container">
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-md-6 col-lg-6">
						<div class="widget_title">
							<h4>
								<span style="font-weight: bold">회사 로고</span>
							</h4>
						</div>
						<div style="width: 280px; margin:auto;">
							<figure class="effect-bubba">
								<!-- 로고 보여주는 공간 -->
								<c:if test="${companyInfoList['0'].mainpic != null}">
									<img id="logo_pic" src="./${companyInfoList['0'].mainpic}">
								</c:if>
								<c:if test="${companyInfoList['0'].mainpic eq null}">
									<!-- 로고 보여주는 공간 -->
									<img id="logo_pic" src="images/jobq_corLogo.jpg" width="2px" height="auto">
								</c:if>
							</figure>
						</div>
						
					
						<!-- 회사 내 사진 최대 6개 구현 -->
						<div class="widget_title">
							<h4>
								<span class="favicon_wrap" style="font-weight: bold"> 회사 내 사진
									
								</span> 
							</h4>
						</div>
							<div id="gallery" class="col-sm-12 col-md-12 col-lg-12">
							
							<ul class="image">
							<c:if test="${companyPicList['0'].picRoute eq null}">
								<span style="font-weight: bold; color: blue">회사 내 사진이 등록되어 있지 않습니다.</span>
							</c:if>
								<c:forEach begin="0" end="5" var="i">
									<c:if test="${companyPicList[i].picRoute ne null}">
										<!-- 로고 보여주는 공간 --> 
										<li>
											<img src="${companyPicList[i].picRoute}" class="img-responsive">
										</li>
									</c:if>
								</c:forEach>
							</ul> 
							<div id="thumbnail">
							<c:if test="${companyPicList['0'].picRoute ne null}">
								<div class="prev">
									<span>
										<img src="./images/company/picSlider/pre.gif" alt="이전" />
									</span>
								</div>
							</c:if>
								<div class="imgcontainer">
									<ul>
										<c:forEach begin="0" end="5" var="i">
											<c:if test="${companyPicList[i].picRoute ne null}">
												<!-- 로고 보여주는 공간 --> 
												<li>
													<img src="${companyPicList[i].picRoute}" class="img-responsive">
												</li>
											</c:if>
										</c:forEach>
									</ul>
								</div>
								<c:if test="${companyPicList['0'].picRoute ne null}">
								<div class="next">
									<span>
										<img src="./images/company/picSlider/next.gif" alt="다음" />
									</span>
								</div>
								</c:if>
							</div>
						</div> 
						</div>

					
					
					<div class="col-sm-6 col-md-6 col-lg-6">
						<div class="widget_title">
							<h4>
								<span class="favicon_wrap" style="font-weight: bold"> 회사 정보
									
								</span>
							</h4>
						</div>
						<div class="widget_content">
							<ul class="">
								<li>
									<p>
										<i class="fa fa-home"></i> <strong> 회사명</strong> :
										<c:out value="${companyInfoList['0'].company}" />
									</p>
								</li>

								<li>
									<p>
										<i class="fa fa-user"></i> <strong> 대표자</strong> :
										<c:out value="${companyInfoList['0'].boss}" />
									</p>
								</li>

								<li>
									<p>
										<i class="fa fa-bookmark"></i> <strong> 사업자 번호</strong> :
										<c:out value="${companyInfoList['0'].numbercorp}" />

									</p>
								</li>

								<li>
									<p>
										<i class="fa fa-building"></i> <strong> 기업형태</strong> :
										<c:out value="${companyInfoList['0'].type}" />
									</p>
								</li>
								<li>
									<p>
										<i class="fa fa-calendar"></i> <strong> 설립년도</strong> :
										<c:out value="${fn:substring(companyInfoList['0'].birth,0,10)}" />
									</p>
								</li>
								<li>
									<p>
										<i class="fa fa-users"></i> <strong> 직원수</strong> :
										<c:out value="${companyInfoList['0'].member}" />
										명
									</p>
								</li>

								<li>
									<p>
										<i class="fa fa-file-text"></i> <strong> 사업내용</strong> :
										<c:out value="${companyInfoList['0'].explain}" />

									</p>
								</li>

								<li></li>

								<li>
									<p>
										<i class="fa fa-home"></i><strong> 홈페이지</strong> :
										<c:if test="${companyInfoList['0'].homepage ne ''}">
											<a href="#<c:out value="${companyInfoList['0'].homepage}" />">
												<c:out value="${companyInfoList['0'].homepage}" />
											</a>
										</c:if>
										<c:if test="${companyInfoList['0'].homepage eq null}">
										 	<span style="font-weight: bold; color: blue">홈페이지가 등록되어 있지 않습니다.</span>
										</c:if>
									</p>
								</li>
								<li>
									<p>
										<i class="fa fa-map-marker"></i> <strong> 주소</strong> : 
											<c:out value="${companyInfoList['0'].address}" />
									</p>
								</li>
								<li>
									<div class="widget_title">
										<h4>
											<span class="favicon_wrap" style="font-weight: bold"> 담당자 정보
											</span>
										</h4>
									</div>
								</li>

								<li>
									<p>
										<i class="fa fa-user"></i> <strong> 담당자</strong> :
										<c:out value="${companyInfoList['0'].name}" />
										/ 
										<c:choose>
											<c:when test="${companyInfoList['0'].sex eq 0}">
												남
											</c:when>
											<c:when test="${companyInfoList['0'].sex eq 1}">
												여
											</c:when>
											<c:otherwise>
												<c:out value="${companyInfoList['0'].sex}" />
											</c:otherwise>
										</c:choose>
										
									</p>
								</li>
								<li>
									<p>
										<i class="fa fa-phone"></i> <strong> 전화번호</strong> :
										<c:out value="${companyInfoList['0'].phone}" />
										

									</p>
								</li>
								<li>
									<p>
										<i class="fa fa-envelope"></i> <strong> Email</strong> : <a
											href="#"><c:out value="${companyInfoList['0'].email}" /></a>
									</p>
								</li>
							</ul>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</section>
</section>
<!--end wrapper-->


<script type="text/javascript">
	$(document).ready(function() {
		
		// 회원수정 온/오프
		$(".widget_title .favicon").hide();

		$(".widget_title span").on({
			mouseenter : function() {
				$(this).find(".favicon").show();
			},
			mouseleave : function() {
				$(".widget_title .favicon").hide();
			}
		});
		
		$("#logoUpdateBtn").change(function(){
			var formData = new FormData();
			 //첫번째 파일태그
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
</script>
<script>
	//로고 파일 업로드 열기
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
</script>
