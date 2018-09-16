<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<!-- Javascript files -->

<!-- CKEditor JS -->
<script src="//cdn.ckeditor.com/4.7.1/full/ckeditor.js"></script>

<script>
	$(document).ready(function(){
		/* 메일 에디터 */

		CKEDITOR.replace('qna-reply-editor', { removePlugins : 'elementspath'});

		/* 메일 에디터 끝 */
	});	
	
	$('#qna-reply-btn').on('click', function(){
		$('.detail-page').css('display', 'none');
		$('.update-page').css('display', '');
	});
	
	$('#qna-reply-regist-btn').on('click', function(){
		if(!confirm('답글을 등록하시겠습니까?'))
			return ;
		
		var qnaReplyVO = {
			no      : '${qna.no}',
			id      : '${sessionScope.login.id}',
			content : CKEDITOR.instances['qna-reply-editor'].getData()
		};
		
		$.ajax({
			type    : 'POST',
			url     : '<c:url value="/admin/inquire/qna/reply" />',
			headers : {
				'Content-Type' : 'application/json',
				'X-HTTP-Method-Override' : 'POST'
			},
			data    : JSON.stringify(qnaReplyVO),
			dataType: 'text',
			success : function(result){
				console.dir(result);
				if(result.startsWith("SUCCESS:")){
					alert('답글이 등록되었습니다.');
					var redirectURL = "<c:url value='/admin/inquire/qna/detail/' />";

					location.href = redirectURL + result.substring(8);
				}
			},
			error   : function(xhr, status, response){
				
			}
		});
	});
	
	$('#qna-list-btn').on('click', function(e){
		location.href="<c:url value='/admin/inquire/qna/main' />";
	});
	
	$('#qna-delete-btn').on('click', function(e){
		var deleteList = [];
		deleteList.push('<c:out value="${qna.no}" />');
		
		if(!confirm('정말로 삭제하시겠습니까?'))										
			return ;
		
		$.ajax({
			type    : 'DELETE',
			url     : '<c:url value="/admin/inquire/qna/list" />',
			headers : {
				'Content-Type' : 'application/json',
				'X-HTTP-Method-Override' : 'DELETE'
			},
			data    : JSON.stringify(deleteList),
			dataType: 'text',
			success : function(result){
				if(result == 'SUCCESS'){
					alert("데이터가 삭제되었습니다.");
					
					location.href="<c:url value='/admin/inquire/qna/main' />"
				}
			},
			error   : function(xhr, status, response){
				
			}
		});
	});
	
</script>