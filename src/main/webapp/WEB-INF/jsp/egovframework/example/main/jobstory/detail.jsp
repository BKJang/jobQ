<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script>


$(document).ready(function() {

	
			var member_id = "<%=(String)session.getAttribute("member_id")%>";
			
			var storyNum = "<c:out value="${selectStoryDetail['0'].number}" />"
			
			//alert("<c:out value="${storyNum}" />");
			
			/* alert('아이디는 : ' + member_id + '글번호는 : ' + storyNum); */
			 
	
});


var storyEdit = 
	{
		
		pageSubmitFn : function(pageName) {
		
		
		$("#pageName").val(pageName);
		
		$("#editFrm").attr("action", pageName + ".jobq");	
		
		$("#editFrm").submit();
		
	}
	
	}
	
var storyCommentRegi = 
{	
		
	pageSubmitFn : function(pageName) {
		
		var st=false;
		
		var member_id = "${sessionScope.member_id}";
		
		if ($("#contentComment").val() == '') {
			
			$("#contentComment").focus();
			
			alert("댓글 내용을 입력하세요");
			
			return st=false;
		
		}
		
		if(member_id == "") {
			 
			 alert("댓글쓰기는 회원만 가능합니다. 로그인 해 주세요.")
			 
			 location.href="login.jobq";
		 } 
		
		else
			st=true;
		
		
		if(st==true){		

			
			
			$("#pageName").val(pageName);
			
			$("#regiFrm").attr("action", pageName + ".jobq");	
		
			$("#regiFrm").submit();
		}
	}
}


var storyDelete = 
{	
		
	pageSubmitFn : function (pageName){
	
	
	if (confirm("삭제하시겠습니까?")) {
		
		$("#pageName").val(pageName);
		
		$("#delFrm").attr("action", pageName + ".jobq");	
	
		$("#delFrm").submit(); 
		
	}

	
	}
};


var storyCommentDelete = 
{	
		
	pageSubmitFn : function (pageName, storyCommentNum, storyNum){
		
		
			alert ('댓글번호' + storyCommentNum);
	
	
	 if (confirm("댓글을 삭제하시겠습니까?")) {
		
		$("#pageName").val(pageName);
		
		// $("#storyCommentNum").val(storyCommentNum);
		// $("#storyNum").val(storyNum);
		
		$("#delComFrm").attr("action", pageName + ".jobq");	
	
		$("#delComFrm").submit(); 
		
	} 

	
	}
};



</script>


		


<!--start wrapper-->
<section class="wrapper">

	
		
	<section class="page_head">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<nav id="breadcrumbs">
						<ul>
							<li><a href="#" onclick="javascript:left.pageSubmitFn('mainJobstory')">job STORY</a></li>							
						</ul>
					</nav>
					<div class="page_title">
						<h2>job STORY</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="content elements">		
		<div class="container">	
			<div class="row">							
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">					
					<div class="row">
			            	            
		           		<div class="col-lg-12 col-md-12 col-sm-12 clear mt40">
		           			<div class="storyView">			           				
		           				<dl>
		           					<dt>
		           						<h5>
		           							<i class="fa fa-quote-left"></i> 
		           							<span class="hd5_txt"><c:out value="${selectStoryDetail['0'].title}"/></span> 
		           							<i class="fa fa-quote-right"></i>
		           						</h5>		           								           					
		           					</dt>
		           					<dd class="info clear">
			               				<span class="name"><b><c:out value="${selectStoryDetail['0'].id}"/></b> | <span><c:out value="${selectStoryDetail['0'].date}"/></span></span>
			               				<span class="clickCount">조회수 <c:out value="${selectStoryDetail['0'].hits}"/> |  댓글수 <c:out value="${selectStoryDetail['0'].commentsCNT}"/></span>
			               			</dd>
		           					<dd class="storyTxt">
		           					<c:if test= "${selectStoryDetail['0'].image != null}">	
		           						<img src="<c:out value="${selectStoryDetail['0'].image}"/>" alt="" /> 
		           					</c:if>
		           						<p>
		           							<c:out value="${selectStoryDetail['0'].content}"/>
		           							
		           						</p>
		           					</dd>
		           				</dl>		           					
			               </div>
			               <div class="col-sm-12 mrgb-30 btnArea">
			              <c:if test= "${sessionScope.member_id == selectStoryDetail['0'].id}">
				          
				          <form id="editFrm" action="" method="POST">
							 <input type="hidden" id="storyNum" name="storyNum" value="<c:out value="${storyNum}" />">      
				                <a href="#fakelink" class="btn btn-sm btn-danger" onclick="javascript:storyEdit.pageSubmitFn('storyEdit')" >
				                    <i class="fa fa-times"></i> 수정				                    
				                </a>
				          </form>
				                
				          <form id="delFrm" action="" method="POST">
							 <input type="hidden" id="storyNum" name="storyNum" value="<c:out value="${storyNum}" />">
				                				                	
				                <a href="#fakelink" class="btn btn-sm btn-danger" onclick="javascript:storyDelete.pageSubmitFn('storyDelete')" >
				                    <i class="fa fa-times"></i> 삭제				                    
				                </a>
				          </form>
				          </c:if>
				                <a href="#" onclick="javascript:left.pageSubmitFn('mainJobstory')" class="btn btn-sm btn-success">
				                    <i class="fa fa-list"></i> 목록				                    
				             	</a>
				                
				             
				           		
				                	               
				                <!-- <a href="jobstoryRegister.jobq" class="btn btn-sm btn-social-linkedin">
				                    <i class="fa fa-check"></i> 등록				                    
				                </a>
				                 <a href="jobstoryRegister.jobq" class="btn btn-sm btn-warning">
				                    <i class="fa fa-times"></i> 취소				                    
				                </a> -->
				                
				                			                
				            </div>
				            <!-- //수정,삭제,등록 [E] --> 
			               <div class="replySection">
								<span class="photo"></span>
								<div class="writeReply">
									
									<form id="regiFrm" action="" method="POST">
										<input type="hidden" id="storyNum" name="storyNum" value="<c:out value="${storyNum}" />">															
									<div class="write">
										<textarea name="contentComment" id="contentComment" cols="30" rows="10" title="댓글입력란" maxlength="100" placeholder="내용을 입력하세요!"></textarea>
									</div>
									<a href="#fakelink" class="btn btn-sm btn-social-linkedin submit" onclick="javascript:storyCommentRegi.pageSubmitFn('storyCommentInsert')">등록</a>										
									</form>
									
								</div>
							</div>	
							<!-- replyWrite [E] -->
							<c:if test="${selectStoryDetail[0].commentsCNT == 0}">
							<ul class="replyList">
								<li class="noneRe">등록된 댓글이 없습니다.</li>
							</ul>
							</c:if>
							<!-- No reply [E] -->
							<c:if test="${selectStoryDetail[0].commentsCNT != 0}"> 
							<ul class="replyList">
								<c:forEach var="selectStoryDetailComment" items="${selectStoryDetailComment}">
								<li>
									<span class="photo"><img src="images/about/photo-reply.gif" alt="프로필 이미지" width="98" height="98"></span>
									<span class="replyView">
										<span class="name"><b><c:out value="${selectStoryDetailComment.id}"/></b></span>
										<span class="date"><c:out value="${selectStoryDetailComment.date}"/></span>
										<span class="reply">
											<span class="txt">
												<c:out value="${selectStoryDetailComment.content}" />							
											</span>
											<c:if test= "${sessionScope.member_id == selectStoryDetailComment.id}">		
											<span class="btnGr">
											<form id="delComFrm" action="" method="POST">
											 <input type="hidden" id="storyCommentNum" name="storyCommentNum" value="<c:out value="${selectStoryDetailComment.numberComment}" />">											
											 <input type="hidden" id="storyNum" name="storyNum" value='${storyNum}' /> 	
												<a href="#fakelink" class="btn btnDel btn-social-stumbleupon" onclick="javascript:storyCommentDelete.pageSubmitFn('storyCommentDelete' , '<c:out value="${selectStoryDetailComment.numberComment}"/>', '${storyNum}' )">삭제</a>
											</form>
											</span>
											
											</c:if>
										</span>
								  </span>									
								</li>
								</c:forEach>
								
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

    
