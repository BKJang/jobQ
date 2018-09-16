<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<form id="delFrm" name="delFrm">
	<input type="hidden" id="offerId" name="offerId" /> 
	<input type="hidden" id="signTrgNo" name="signTrgNo" />
</form>
<form id="offerFrm" name="offerFrm">
	<input type="hidden" id="page" name="page" />
</form>
<form name="frmPopup">
<input type="hidden" name="cId">
</form>
<!--start wrapper-->
<section class="wrapper">
	<section class="page_head">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					
					<div class="page_title">
						<h2>면접제의</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="content elements">
		<div class="container">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

				<div class="dividerHeading">
					<h4>
						<span>면접제의</span> <span class="bar_gray"> | </span><span
							class="total_top"><c:out value="${pagingCnt.totalTotCnt}" />건</span>
					</h4>

				</div>
				<c:if test="${pagingCnt.totalTotCnt == 0}">
						<table class="table table-striped table-hover" style="text-align : center;">
							<tbody>
							<colgroup>
								<col width="100%" />							
							</colgroup>							
							<tbody id="submitAppId">
								
								<tr class="clickId">
									
									<td>면접 제의 내역이 없습니다.</td>
								</tr>	
							</tbody>
						</table>		
						</c:if>	
						<c:if test="${pagingCnt.totalTotCnt != 0}">	
				<c:forEach var="pagingList"  items="${pagingList}">
				<div class="col-lg-12 col-md-12 col-sm-12" >
						
					<div class="row sub_content">
						<div class="offer">
							<div class="dividerHeading">
							
								<h4>
									
									<a href="#" onclick="open_pop('<c:out value="${pagingList.cId}" />');">
										
										<b><c:out value="${pagingList.company}" /></b>에서 면접을 제의합니다.
									</a>
								</h4>
									
							</div>
								
							<div class="offerCon_Wrap">

									<div class="offer_txt">
										<div class="col-lg-2 col-md-2 col-sm-2 ">
											<div id="ResumeBaseInfo" class="resumeView">
												<c:if test="${pagingList.mainPic == null}">
													<div class="photoArea" style="text-align: center; vertical-align : middle;">
														<span class="photo" style=""> <img
															src="./images/logo_edit.png" alt=""
															class="center_img img-thumbnail" width="300" height="300">
														</span> <span> </span>

													</div>
												</c:if>

												<c:if test="${pagingList.mainPic != null}">
													<div class="photoArea" style="text-align: center;">
														<span class="photo"> <img
															src="./${pagingList.mainPic}" alt=""
															class="center_img img-thumbnail" width="300" height="300">
														</span> <span> </span>

													</div>
												</c:if>
											</div>
										</div>
										<div class="promo_box col-lg-9 col-md-9 col-sm-9"
											style="float: right;">

											<div class="form-control">

												<c:if test="${pagingList.content == null}">
											면접을 제의합니다. 연락처나 이메일로 연락주세요.
										</c:if>
												<c:if test="${pagingList.content != null}">
													<c:out value="${pagingList.content}" />
												</c:if>
											</div>
											<span class="offer_info1">담당자 연락처 : <span
												class="fw_normal"> <c:out value="${pagingList.phone}" /></span></span>
											<span class="offer_info2">Email : <span
												class="fw_normal"> <c:out value="${pagingList.email}" /></span></span>
										</div>
									</div>
									<span class="btn_del"> 
									<button class="btn btn-default btn-sm del" value="<c:out value="${pagingList.offerId}" />" 
									id="delete">삭제</button>
								</span>	
							</div>	
							
							<!-- //offerCon_Wrap [E]  -->						
						</div>
						<!-- //면접제의 컨텐츠 [E]  -->
						
					</div>
					
				</div>
				</c:forEach>
				</c:if>
				<div class="col-lg-12 col-md-12 col-sm-12">
						<div class="dataTables_paginate paging_simple_numbers text-center"
							id="example2_paginate">
							<ul class="pagination">
								<c:if test="${resMap.pageGroup > 1}">
									<li><a
										href="javascript:fnGoPaging(<c:out value='${resMap.prePage}'/>)">Previous</a></li>
								</c:if>

								<c:forEach var="i" begin="${resMap.startPage}"
									end="${resMap.endPage > resMap.totalPage ? resMap.totalPage : resMap.endPage}">

									<c:choose>
										<c:when test="${resMap.page eq i}">
											<li class="active"><a
												href="javascript:fnGoPaging(${i});">${i}</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="javascript:fnGoPaging(${i});">${i}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<c:if test="${resMap.nextPage <= resMap.totalPage}">
									<li><a
										href="javascript:fnGoPaging(<c:out value='${resMap.nextPage}'/>)">Next</a></li>
								</c:if>
							</ul>
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

	});	
	
	function fnGoPaging(page){
		
		//location.href = "http://localhost:8080/sample/noPaging.do?page=" + page;
		
		$("#page").val(page);
		
		$("#offerFrm").attr("action", "personOffer.jobq");	
		
		$("#offerFrm").attr("method", "post");

		$("#offerFrm").submit();
	}
	
	function open_pop(cId){
	    var frmPop= document.frmPopup;
	    var url = 'initCompanyMain.jobq';
	    window.open(url,'popupView','width=800, height=600, toolbar=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no');  
	    
	    frmPop.method = 'post';
	    frmPop.action = url;
	    frmPop.target = 'popupView'; //window,open()의 두번째 인수와 같아야 하며 필수다.  
	    frmPop.cId.value = cId;
	    frmPop.submit();   
	     
	}
	
	$(".del").click(function(){
		
		if(confirm("면접 제의 삭제시 되돌릴 수 없습니다. 정말 삭제하시겠습니까?") == true){
			
			$("#offerId").val($(this).val());
			
			$("#delFrm").attr("action", "personOfferDelete.jobq");	
			
			$("#delFrm").attr("method", "post");

			$("#delFrm").submit();
		}else{
			return;
		}		
		
	});
		
</script>


