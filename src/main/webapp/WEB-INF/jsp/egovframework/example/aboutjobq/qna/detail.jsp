<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<form id="qnaDetailFrm" name="qnaDetailFrm">
	<input type="hidden" id="qnaNumber" name="qnaNumber" value="<c:out value="${qnaDetail['0'].qNumber}" />"/>
</form>
<!--start wrapper-->
<section class="wrapper">	
	<section class="page_head">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="page_title">
						<h2>Q&A</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="content elements">		
		<div class="container">	
			<div class="row">							
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">					
		            <!-- //Hot 직종별 채용정보[E]  -->
					<div class="row">
			            	            
		           		<div class="col-lg-12 col-md-12 col-sm-12 clear mt40">
		           			<div class="storyView">			           				
		           				<dl>
		           					<dt>
		           						<h5>
		           							<i class="fa fa-quote-left"></i> 
		           							<span class="hd5_txt"><c:out value="${qnaDetail['0'].qTitle}" /></span> 
		           							<i class="fa fa-quote-right"></i>
		           						</h5>		           								           					
		           					</dt>
		           					<dd class="info clear">
			               				<span class="name"><c:out value="${qnaDetail['0'].qId}" /> | <span><c:out value="${qnaDetail['0'].qDateModi}" /></span></span>
			               			</dd>
		           					<dd class="storyTxt">		           						
		           						<p>
		           							${qnaDetail['0'].qContent}
		           						</p>
		           					</dd>
		           				</dl>		           					
			               </div>
			               <div class="col-sm-12 mrgb-30 btnArea">
			               		<c:if test="${qnaDetail['0'].qReplyDate == null}">
				                <a href="#" onclick="javascript:qnaDetail.pageSubmitFn('modifyQnA')" class="btn btn-sm btn-social-linkedin">
				                    <i class="fa fa-pencil"></i> 문의 수정				                    
				                </a>
				                </c:if>				                	
				                <a href="#"  onclick="javascript:qnaDetail.pageSubmitFn('deleteQnADetail')" class="btn btn-sm btn-danger">
				                    <i class="fa fa-times"></i> 문의 삭제				                    
				                </a> 				               
				                <!-- <a href="jobstoryRegister.jobq" class="btn btn-sm btn-social-linkedin">
				                    <i class="fa fa-check"></i> 등록				                    
				                </a>
				                 <a href="jobstoryRegister.jobq" class="btn btn-sm btn-warning">
				                    <i class="fa fa-times"></i> 취소				                    
				                </a> -->
				                <a href="#" onclick="javascript:qnaDetail.pageSubmitFn('goQnAList')" class="btn btn-sm btn-success">
				                    <i class="fa fa-list"></i> 문의 목록				                    
				                </a>			                
				            </div>
							<!-- replyWrite [E] -->
							<c:if test="${qnaDetail['0'].qReplyDate == null}">
								<ul class="replyList">
									<li class="noneRe">아직 답변이 오지 않았습니다.</li>
								</ul>
							</c:if>
							<!-- No reply [E] -->
							<c:if test="${qnaDetail['0'].qReplyDate != null}">
								<ul class="replyList">
									<li>
										<span class="photo"><img src="images/about/photo-reply.gif" alt="프로필 이미지" width="98" height="98"></span>
										<span class="replyView">
										<span class="name">관리자</span>
										<span class="date"><c:out value="${qnaDetail['0'].qReplyDate}" /></span>
										<span class="reply">
											<span class="txt">
												${qnaDetail['0'].qReplyContent}							
											</span>		
										</span>
								  </span>									
								</li>
							</ul>
							</c:if>		                 
		           		 </div>
		           	 </div>  
				</div>
			</div>						
		</div>
		<!-- //container[E]  -->
	</section>
</section>
<!--end wrapper-->
<script type="text/javascript">

var qnaDetail = {
		pageSubmitFn : function(pageName){
			
			$("#qnaDetailFrm").attr("action", pageName + ".jobq");	
			
			$("#qnaDetailFrm").attr("method", "post");

			$("#qnaDetailFrm").submit();
		}
}

</script>

    
