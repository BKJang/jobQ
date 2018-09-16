<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<script>

function logout() {
	
	if(confirm("로그아웃 하시겠습니까?")) {
		
		location.href="logout.jobq"
	}
}

</script>

<!-- Start header-top -->
<div class="header-top">
	<div class="container">
		<div class="row">
		
			<c:if test= "${empty sessionScope.member_id}">
			<div class="hidden-xs col-lg-7 col-sm-5 top-info">
				<span id=login><i class="fa fa-smile-o"><a href="login.jobq">Login</a></i></span> 
				<span id=join class="hidden-sm"><i class="fa fa-heart"><a href="join.jobq">Join</a></i></span>
				<span id=admin class="hidden-sm"><i class="fa fa-star"><a href="admin/main.jobq" target="_blank">admin</a></i></span>				
			</div>
			</c:if>
			
			<c:if test="${sessionScope.member_id ne null}">
			<div class="hidden-xs col-lg-7 col-sm-5 top-info">
				<span id=login><i class="fa fa-user"> <b>${sessionScope.member_name}</b>님 환영합니다!</i></span> 
			
			<c:if test= "${sessionScope.member_type eq 'p'}">	
				<span class="hidden-sm"><i class="fa fa-gear"><a href="edit_person.jobq">개인정보 수정</a></i></span>
			</c:if>
			
			<c:if test= "${sessionScope.member_type eq 'c'}">	
				<span class="hidden-sm"><i class="fa fa-gear"><a href="edit_company.jobq">기업정보 수정</a></i></span>
			</c:if>
			
				<span class="hidden-sm"><i class="fa fa-sign-out"><a href="#" onClick="logout()">logout</a></i></span>
				
			</div>
			</c:if>
			
			
			<div class="col-lg-5 col-sm-7 top-info clearfix">
				<ul>
					<li><a class="top_notice" href="notice.jobq">[공지] <c:out value="${noticeList['0'].title}" /></a>
					</li>
				</ul>
			</div>

		</div>
	</div>
</div>
<!--/.header-top -->
