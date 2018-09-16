<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<!-- Javascript files -->

<script>
	$(document).ready(function(){
		
	});
	
	/* 잡 스토리 리스트 버튼 */
	
	$('#jobstory-list-btn').on('click', function(){
		location.href="<c:url value='/admin/board/jobstory/main' />";
	});
	
	/* 잡 스토리 리스트 버튼 끝 */
	
	/* 공지 사항 상세 삭제 버튼 */
	
	$('#jobstory-delete-btn').on('click', function(e){
		var deleteList = [];
		deleteList.push('<c:out value="${jobstory.no}" />');
		
		if(!confirm('정말로 삭제하시겠습니까?'))										
			return ;
		
		$.ajax({
			type    : 'DELETE',
			url     : '<c:url value="/admin/board/jobstory/list" />',
			headers : {
				'Content-Type' : 'application/json',
				'X-HTTP-Method-Override' : 'DELETE'
			},
			data    : JSON.stringify(deleteList),
			dataType: 'text',
			success : function(result){
				if(result == 'SUCCESS'){
					alert("데이터가 삭제되었습니다.");
					
					location.href="<c:url value='/admin/board/jobstory/main' />"
				}
			},
			error   : function(xhr, status, response){
				
			}
		});
	});
	
	/* 공지 사항 상세 삭제 버튼 끝 */

	$('.reply-id').on('dblclick', function(e){
		if($(this).text() != '<c:out value="${sessionScope.login.id}" />')
		$('#reply-content').val($(this).text() + ' >> ');
	});
	
	$('.reply-delete-btn').on('click', function(e){
		var deleteList = [];
		deleteList.push($(this).attr('data-reply-no'));
		
		console.dir($(this).attr('data-reply-no'));
		if(!confirm('정말로 삭제하시겠습니까?'))										
			return ;
		
		$.ajax({
			type    : 'DELETE',
			url     : '<c:url value="/admin/board/jobstory/reply" />',
			headers : {
				'Content-Type' : 'application/json',
				'X-HTTP-Method-Override' : 'DELETE'
			},
			data    : JSON.stringify(deleteList),
			dataType: 'text',
			success : function(result){
				if(result == 'OK'){
					alert("댓글이 삭제되었습니다.");
					
					location.href="<c:url value='/admin/board/jobstory/detail/" + ${jobstory.no} + "' />"
				}
			},
			error   : function(xhr, status, response){
				
			}
		});
	});
	
</script>