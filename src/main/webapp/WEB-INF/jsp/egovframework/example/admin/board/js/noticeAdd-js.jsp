<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<!-- Javascript files -->

<!-- CKEditor JS -->
<script src="//cdn.ckeditor.com/4.7.1/full/ckeditor.js"></script>

<script>
	$(document).ready(function(){
		/* 메일 에디터 */
		
	 	CKEDITOR.replace('notice-regist-editor', {removePlugins:'elementspath'});
	 	
	 	/* 메일 에디터 끝 */
		
	 	var date = new Date();
	 	var yyyy = date.getFullYear();
	 	var mm = (date.getMonth() < 10) ? '0' + (date.getMonth() + 1) : date.getMonth();
	 	var dd = (date.getDate() < 10) ? '0' + date.getDate() : date.getDate();
	 	
		$('#reg-date').val(yyyy + '-' + mm + '-' + dd);
	});	
	
	
	
	/* 잡 스토리 수정 버튼 */
	
	$('#notice-regist-btn').on('click', function(){
		if(!confirm('공지사항을 추가하시겠습니까?'))
			return ;
		
		var noticeVO = {
				id      : '${sessionScope.login.id}',
				title   : $('#title').val(),
				content : CKEDITOR.instances['notice-regist-editor'].getData()
			};
			
			$.ajax({
				type    : 'POST',
				url     : '<c:url value="/admin/board/notice/addpage" />',
				headers : {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'POST'
				},
				data    : JSON.stringify(noticeVO),
				dataType: 'text',
				success : function(result){
					if(result == 'SUCCESS'){
						alert('성공적으로 등록되었습니다.');
						
						location.href = "<c:url value='/admin/board/notice/main' />";
					}
				},
				error   : function(xhr, status, response){
					
				}
			});
	});
	
	/* 잡 스토리 수정 버튼 끝 */
	
	/* 잡 스토리 리스트 버튼 */
	
	$('#notice-cancle-btn').on('click', function(){
		location.href="<c:url value='/admin/board/notice/main' />";
	});
	
	/* 잡 스토리 리스트 버튼 끝 */

</script>