<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<script>
	var resume = {
			career:{
				careerCompanyNumber : 1
			},
			school:{
				schoolNumber : 1
			}
	};
	
	$('#apply-list-btn').on('click', function(e){
		location.href = '<c:url value="/admin/resume/main" />';
	});
	
	/* 이력서 삭제 버튼 */
	
	$('#apply-delete-btn').on('click', function(){
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
	
	/* 이력서 삭제 버튼 끝 */
	
</script>