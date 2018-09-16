<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<script>
	/* 회원 가입 취소 */
	
	$('#interviewUpdateBtn').on('click', function(){
		location.href="<c:url value='/admin/mainsetting/interview/update.jobq?no=" + ${no} + "' />";
	});
	
	/* 회원 가입 취소 끝 */
	
	/* 면접 Tip 리스트 버튼 */
	
	$('#interview-list-btn').on('click', function(){
		location.href="<c:url value='/admin/mainsetting/interview/main' />";
	});
	
	/* 면접 Tip 리스트 버튼 끝 */
	
	/* 면접 Tip 삭제 */
	
	$('#interview-delete-btn').on('click', function(){
		var deleteList = [];
		if(confirm("데이터를 삭제하시겠습니까?") == false)
			return ;
			
		deleteList.push('${interview.no}');
		$.ajax({
			type : 'delete',
			url : "<c:url value='/admin/mainsetting/interview/list' />",
			headers : {
				"Content-Type" : "application/json; charset=utf-8",
				"X-HTTP-Method-Override" : "DELETE"
			},
			datatype : 'text',
			data : JSON.stringify(deleteList),
			success : function(result){
				if(result == 'SUCCESS'){
					alert('데이터를 삭제했습니다.');
					location.href="<c:url value='/admin/mainsetting/interview/main' />";
					
					return ;
				}
				
			}
			
		});
	});
	
	/* 면접 Tip 삭제 끝 */

	/* 면접 Tip 수정 */
	
	$('#interview-update-btn').on('click', function(e){
		location.href = "<c:url value='/admin/mainsetting/interview/updatePage/" + ${interview.no} + "' />"
	});
	
	/* 면접 Tip 수정  끝 */
	
</script>