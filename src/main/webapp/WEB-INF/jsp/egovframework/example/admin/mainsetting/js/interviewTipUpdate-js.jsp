<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<!-- CKEditor JS -->
<!-- <script src="//cdn.ckeditor.com/4.7.1/full/ckeditor.js"></script> -->

<script>
	$(document).ready(function(){
		
        /* 현재 시간  */
		
		var date = new Date();
	 	var yyyy = date.getFullYear();
	 	var mm = (date.getMonth() < 10) ? '0' + (date.getMonth() + 1) : date.getMonth();
	 	var dd = (date.getDate() < 10) ? '0' + date.getDate() : date.getDate();
	 	
	 	$('#interview-update-date').val(yyyy + '-' + mm + '-' + dd);
	
	 	/* 현재 시간  끝 */
	});	
	
	/* 면접 Tip 수정 취소 */
	
	$('#interview-update-cancle-btn').on('click', function(){
		history.back();
	});
	
	/* 면접 Tip 수정 취소 끝 */
	
	/* 면접 Tip 리스트 취소 */
	
	$('#interview-list-btn').on('click', function(){
		location.href="<c:url value='/admin/mainsetting/interview/main' />";
	});
	
	/* 면접 Tip 리스트 취소 끝 */

	/* 면접 Tip 수정  */
	
	$('#interview-update-btn').on('click', function(e){
		var updateInfo = {
			no      : '${interview.interviewNo}',
			content : $('#update-editor').val().trim()
		};
		
		if(!confirm('수정하시겠습니까?')){
			return ;			
		}
		
		$.ajax({
			type    : 'PATCH',
			url     : '<c:url value="/admin/mainsetting/interview" />',
			headers : {
				'Content-Type' : 'application/json; charset=utf-8',
				'X-HTTP-Method-Override' : 'PATCH'
			},
			data    : JSON.stringify(updateInfo),
			success : function(result){
				if(result == 'SUCCESS'){
					alert('수정되었습니다.');
					
					location.href="<c:url value='/admin/mainsetting/interview/detail/${interview.interviewNo}' />";
				}
					
			}
		});
	});
	
	/* 면접 Tip 수정  끝 */
	
</script>