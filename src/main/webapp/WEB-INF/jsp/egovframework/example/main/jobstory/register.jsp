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
	
	var storyNum = "<c:out value="${editStory['0'].number}" />"
	
	var storyId = "<c:out value="${editStory['0'].id}" />"
	
	/* alert("<c:out value="${storyNum}" />"); */
	
	alert('아이디는 : ' + member_id + '글작성자는 : ' + storyId + '글번호는 :'+ storyNum);
	 

});

/* $(document).ready(function(){
	
	window.onbeforeunload = function(e) {
		
		return "작성하신 내용이 모두 사라집니다. 페이지를 나가시겠습니까?";
	};

}); */


var storyRegi = 
{	
		
	pageSubmitFn : function(pageName) {
		var st=false;
		
		if ($("#title").val() == '') {
			
			$("#title").focus();
			
			alert("제목을 입력해주세요");
			
			return st=false;
		}else if(($("#contents").val() == '')) {
			
			$("#money").focus();
			
			alert("내용을 입력해주세요");
			
			return bool = false;
		
		}else
			st=true;
		
		
		if(st==true){		

			alert('efef123');
			$("#pageName").val(pageName);
			
			$("#regiFrm").attr("action", pageName + ".jobq");	
		
			$("#regiFrm").submit();
		}
	}
	
	
}
	

</script>


<!--start wrapper-->
<section class="wrapper">

	<form id="regiFrm" action="" method="POST" enctype="multipart/form-data">
		<input type="hidden" id="storyNum" name="storyNum" value="<c:out value="${editStory['0'].number}" />">	
		
		
	<section class="page_head">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<nav id="breadcrumbs">
						<ul>
							<li><a href="#"
								onclick="javascript:left.pageSubmitFn('mainJobstory')">job
									STORY</a></li>
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
					<!-- //Hot 직종별 채용정보[E]  -->
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<!-- <div class="dividerHeading">
								<h4>
									<span>job STORY</span>
								</h4>
							</div> -->
						</div>
						<div class="col-sm-12 col-md-12 col-sm-12 clear mt40">
							<h5 class="hd5">
								<i class="fa fa-quote-left"></i> <span class="hd5_txt">글쓰기</span>
								<i class="fa fa-quote-right"></i>
							</h5>

						</div>
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="storyWrap">
								<span class="tbl_noti">* 필수 입력 사항 입니다.</span>
								<%-- <form name="" method="" action=""> --%>
									<table class="tbl_write">
										<colgroup>
											<col width="25%" />
											<col width="*" />
										</colgroup>
										<tbody>
											<tr>
												<th><span class="bulit">*</span> 제목</th>
												<td><input type="text" class="form-control" id="title" name="title" 
													placeholder="제목을 입력하세요!" name="title"
													value="${editStory['0'].title}">
												<%-- <c:choose>
														<c:when test="${fn:length(editStory['0'].title) > 0}">
															<c:out value="${editStory['0'].title}"></c:out>
														</c:when>
													
												</c:choose> --%></td>
											</tr>
											<tr>
												<th><span class="bulit">*</span> 내용</th>
												<td>
													<div class="form-group">
														<textarea id="contents" name="contents" class="form-control" rows="10">
														<c:choose>
														<c:when test="${fn:length(editStory['0'].content) > 0}">
															<c:out value="${editStory['0'].content}"></c:out>
														</c:when>												
												</c:choose></textarea>
													</div>
												</td>
											</tr>
											<tr class="last">
												<th>첨부파일</th>
												<td>
													<input type="file" id="storyPic" name="storyPic" accept="image/*" />
												</td>
											</tr>
										</tbody>
									</table>
								
							</div>
							<div class="col-sm-12 mrgb-30 btnArea">
							<c:choose>
								<c:when test="${sessionScope.member_id == editStory['0'].id}">
								<a class="btn btn-sm btn-social-linkedin" onclick="javascript:storyRegi.pageSubmitFn('updateStory')"> <i
									class="fa fa-check"></i> 수정				                    
				                </a> <a href="#"
									onclick="javascript:left.pageSubmitFn('mainJobstory')"
									class="btn btn-sm btn-success"> <i class="fa fa-list"></i>
									취소
								</a>				                	
				                
				                </c:when>
				                <c:otherwise>
								<a class="btn btn-sm btn-social-linkedin" onclick="javascript:storyRegi.pageSubmitFn('storyInsert')"> <i
									class="fa fa-check"></i> 등록
								</a> <a href="#"
									onclick="javascript:left.pageSubmitFn('mainJobstory')"
									class="btn btn-sm btn-success"> <i class="fa fa-list"></i>
									취소
								</a>
								</c:otherwise>
							</c:choose>
							</div>
							<!-- //수정,삭제,등록 [E] -->
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- //container[E]  -->
	</section>
	</form>
	
</section>
<!--end wrapper-->




