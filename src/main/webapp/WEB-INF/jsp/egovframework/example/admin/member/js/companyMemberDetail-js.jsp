<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<!-- Javascript files -->

<script>
	$('#member-list-btn').on('click', function(e){
		location.href = "<c:url value='/admin/member/manage/main' />";
	});
	
	$('#member-delete-btn').on('click', function(e){
		alert('기업 회원 삭제');
	});
	
</script>