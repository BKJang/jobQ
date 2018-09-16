<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<!-- Javascript files -->

<!-- jqGrid -->
<script src="/sample/admin/js/grid.locale-en.js"></script>
<script src="/sample/admin/js/jquery.jqGrid.min.js"></script>


<script>
	var jobqRegex = new JobqRegEx();
	var generalMember = {
		hasIdError : false
	};
	
	$(document).ready(function(){
		var isValidError = '<c:out value="${error}" />' 
		
		if(isValidError == 'NOT VALID')
			alert('입력양식을 다시 한 번 확인하세요.');
		
		if($('#hidden-date').val() != '')
			$('#real-date').val($('#hidden-date').val());
	});	
	
	/* 이메일 선택시 */
	
	$('#select-email').on('change', function(e){
		var $emailDomain = $('#email-domain');
		e.preventDefault();
		
		if(this.value == '직접 입력')
			$emailDomain.val('');
		else	
			$emailDomain.val(this.value);
	})
	
	/* 이메일 선택시 끝 */

	/* 비밀번호 확인 */
	
	$('#confirmPassword').on('blur', function(e){
		var $password = $('#password');
		var $confirmPassword = $('#confirmPassword');
		var $confirmPasswordError = $('#confirm-password-error');
		
		if($confirmPassword.val() == ''){
			$confirmPasswordError.css('color', 'red').text('필수 입력 사항입니다.');	
		}else if($confirmPassword.val() != $('#password').val()){
			$confirmPasswordError.css('color', 'red').text('비밀번호가 일치하지 않습니다.');
			
			$confirmPassword.val('');
		}else if(($confirmPassword.val() == $password.val()) && $confirmPasswordError.text() != '')
			$confirmPasswordError.text('');
				
	});
	
	$('#id').on('blur', function(e){
		var $id = $('#id');
		var $idError = $('#id-error');
		
		if($id.val() == ''){
			generalMember.hasIdError = true;
			$idError.css('color', 'red').text('필수 입력 사항입니다.');	
			
			return ;
		}else if($id.val() != '' && !jobqRegex.isIdRegex($id.val())){
			generalMember.hasIdError = true;
			$idError.css('color', 'red').text('띄어쓰기, 한글, 특수문자는 사용할 수 없습니다.');
	
			return ;
		}else if($id.val() != '' && $idError.text() != '')
			$idError.text('');
		
		generalMember.hasIdError = false;
	});
	
	$('#password').on('blur', function(e){
		var $password = $('#password');
		var $passwordError = $('#password-error');
		
		if($password.val() == '')
			$passwordError.css('color', 'red').text('필수 입력 사항입니다.');
		if($password.val() != '' && $passwordError.text() != '')
			$passwordError.text('');
	});	
	
	/* 비밀번호 확인 끝 */
	
	$('#name').on('blur', function(e){
		var $name = $('#name');
		var $nameError = $('#name-error');
		
		if($name.val() == ''){
			$nameError.css('color', 'red').text('필수 입력 사항입니다.');
		}else if($name.val() != '' && !jobqRegex.isNameRegex($name.val()))
			$nameError.css('color', 'red').text('한글만 입력이 가능합니다.');
		else if($name.val() != '' && $nameError.text() != ''){
			$nameError.text('');
		}
	});
	
	$('#real-date').on('change', function(e){
		$('#hidden-date').val($(this).val());
	});
	
	$('#member-regist-btn').on('click', function(e){
		$('#member-regist-form').submit();
	});
	
	/* 회원 가입 취소 */
	
	$('#member-regist-cancle-btn').on('click', function(){
		location.href = '<c:url value="/admin/member/manage/main" />';
	});
	
	/* 회원 가입 취소 끝 */
	
	/* 회원 가입 아이디 중복 검사 */
	
	$('#duplicate-id-btn').on('click', function(){
		if(generalMember.hasIdError){
			alert('아이디를 다시 한 번 확인하세요.');
			
			return ;
		}
		
		$.ajax({
			type:'get',
			url:'/sample/admin/member/manage/dupid/' + $('#id').val(),
			dataType:'text',
			success:function(response){
				if(response == 'SUCCESS')
					alert('사용 가능한 아이디입니다.');
				else{
					$('#id-error').css('color', 'red').text('이미 사용중인 아이디입니다.')
				}
					
			}
		});	
		
	});
	
	/* 회원 가입 아이디 중복 검사 끝 */
</script>