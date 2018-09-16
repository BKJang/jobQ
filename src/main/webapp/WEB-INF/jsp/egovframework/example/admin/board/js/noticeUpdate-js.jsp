<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<!-- Javascript files -->

<script>
	$(document).ready(function(){
		/* 메일 에디터 */
		
	 	CKEDITOR.replace('mailEditor', {removePlugins:'elementspath'});
	 	
	 	/* 메일 에디터 끝 */
	});	
	
	/* 이메일 선택시 */
	
	$('#selectEmail').on('change', function(e){
		var $emailDomain = $('#emailDomain');
		e.preventDefault();
		
		if(this.value == '직접 입력')
			$emailDomain.val('');
		else	
			$emailDomain.val(this.value);
	})
	
	/* 이메일 선택시 끝 */

	/* 비밀번호 확인 */
	
	$('#confirmPassword').on('change', function(){
		var $confirmPassword = $('#confirmPassword');
	
		if($confirmPassword.val() != $('#password').val()){
			alert('비밀번호가 일치하지 않습니다.');
			
			$confirmPassword.val('');
		}
				
	})
	
	$('#password').on('change', function(){
		var $confirmPassword = $('#confirmPassword');
		var $password = $('#password');
	
		if($confirmPassword.val() == '')
			return ;
		
		if($confirmPassword.val() != ''){
			if($password.val() != $confirmPassword.val()){
				alert('비밀번호가 일치하지 않습니다.');
				
				$password.val('');
			}
		}
				
	})	
	
	/* 비밀번호 확인 끝 */
	
	/* 잡 스토리 수정 버튼 */
	
	$('#noticeUpdateBtn').on('click', function(){
		location.href="<c:url value='/admin/board/notice/update.jobq?no=" + ${no} + "' />";
	});
	
	/* 잡 스토리 수정 버튼 끝 */
	
	/* 잡 스토리 리스트 버튼 */
	
	$('#noticeListBtn').on('click', function(){
		location.href="<c:url value='/admin/board/notice/main.jobq' />";
	})
	
	/* 잡 스토리 리스트 버튼 끝 */
	
	/* 잡 스토리 리스트 버튼 */
	
	$('#noticeUpdateCancelBtn').on('click', function(){
		history.back();
	})
	
	/* 잡 스토리 리스트 버튼 끝 */

</script>