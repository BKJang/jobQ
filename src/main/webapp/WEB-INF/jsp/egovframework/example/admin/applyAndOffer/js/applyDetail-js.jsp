<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<!-- Javascript files -->

<script>

	$('#applyUpdateBtn').on('click', function(){
		$.ajax({
			type:'',
			url:'',
			data:'',
			contentType:'application:json; charset=utf8',
			datatype:'json',
			sccuess:function(response){
				
			}
		})
	});
	
	
	$('#applyUpdateCancleBtn').on('click', function(){
		history.back();
	});
	
	
	/* 이미지 업로드 */
	
	$('#imageBtn').on('click', function(){
		$('#realImageBtn').click();
	});
	
	/* 이미지 업로드 끝 */
	
	$('#apply-list-btn').on('click', function(e){
		location.href = '<c:url value= "/admin/applyandoffer/apply/main" />';
	});
	
	/* 이미지 업로드 끝 */
</script>