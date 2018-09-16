<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<!-- Javascript files -->

<script>

	$("#offer-list-btn").on('click', function(e){
		location.href = '<c:url value="/admin/applyandoffer/offer/main" />';
	});
	
	
	$('#offer-delete-btn').on('click', function(){
		alert('삭제합니다.');
	});
	
</script>