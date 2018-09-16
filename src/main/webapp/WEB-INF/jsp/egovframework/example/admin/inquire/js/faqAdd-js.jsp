<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<!-- Javascript files -->

<!-- CKEditor JS -->
<script src="//cdn.ckeditor.com/4.7.1/full/ckeditor.js"></script>

<script>
	$(document).ready(function(){
		/* 메일 에디터 */

		CKEDITOR.replace('faq-regist-editor', {removePlugins : 'elementspath'});

		/* 메일 에디터 끝 */
		
		var date = new Date();
	 	var yyyy = date.getFullYear();
	 	var mm = (date.getMonth() < 10) ? '0' + (date.getMonth() + 1) : date.getMonth();
	 	var dd = (date.getDate() < 10) ? '0' + date.getDate() : date.getDate();
	 	
		$('#reg-date').val(yyyy + '-' + mm + '-' + dd);
	});	
	
	$('#faq-regist-btn').on('click', function(e){
			if(!confirm('FAQ를 추가하시겠습니까?'))
				return ;	
			
			var faqVO = {
				subject : $('#subject option:selected').val(),
				title   : $('#title').val(),
				content : CKEDITOR.instances['faq-regist-editor'].getData()
			};
			
			console.dir(faqVO);
			
			$.ajax({
				type    : 'POST',
				url     : '<c:url value="/admin/inquire/faq/addpage" />',
				headers : {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'POST'
				},
				data    : JSON.stringify(faqVO),
				dataType: 'text',
				success : function(result){
					if(result == 'SUCCESS'){
						alert('성공적으로 등록되었습니다.');
						
						location.href = "<c:url value='/admin/inquire/faq/main' />";
					}
				},
				error   : function(xhr, status, response){
					
				}
			});
	});
	
	$('#faq-cancel-btn').on('click', function(e){
		location.href = "<c:url value='/admin/inquire/faq/main' />";
	});
	
</script>