<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	


<script>
	$(document).ready(function(){
		
		/* 현재 시간  */
		
		var date = new Date();
	 	var yyyy = date.getFullYear();
	 	var mm = (date.getMonth() < 10) ? '0' + (date.getMonth() + 1) : date.getMonth();
	 	var dd = (date.getDate() < 10) ? '0' + date.getDate() : date.getDate();
	 	
	 	$('#interview-reg-date').val(yyyy + '-' + mm + '-' + dd);
	
	 	/* 현재 시간  끝 */
	});	
	
	$('#interview-regist-cancle-btn').on('click', function(){
		location.href="<c:url value='/admin/mainsetting/interview/main' />";
	});
	
	$('#interview-regist-btn').on('click', function(){
		var interviewTipVO = {
			id : '${sessionScope.login.id}',
			content : $('#interview-editor').val()
		};
		
		if(!confirm('면접 Tip을 등록하시겠습니까?')){
			return ;			
		}
			
		$.ajax({
			type    : 'POST',
			url     : '<c:url value="/admin/mainsetting/interview" />',
			headers : {
				'Content-Type' : 'application/json',
				'X-HTTP-Method-Override' : 'POST'
			},
			data    : JSON.stringify(interviewTipVO),
			success : function(result){
				if(result == 'SUCCESS'){
					alert('등록되었습니다.');
					
					location.href="<c:url value='/admin/mainsetting/interview/main' />";
				}
			}
		});
	});
</script>