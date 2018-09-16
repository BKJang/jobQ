<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<!-- Javascript files -->

<!-- AddressSearch JS -->
<script src="/sample/admin/js/address-search.js" ></script>

<script>
	var companyMember = {
			hasError : false
	};

	$(document).ready(function(){
		var isValidError = '<c:out value="${error}" />' 
			
		if(isValidError == 'NOT VALID')
			alert('입력양식을 다시 한번 확인하세요.');	
		
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
	
	/* 회원 가입 취소 */
	
	$('#memberAddCancleBtn').on('click', function(){
		history.back();
	})
	
	/* 회원 가입 취소 끝 */

	/* 회원 주소 팝업창 */
	
	$('#addr-btn').on('click', function(e){
		var addrSearch = new AddressSearch();
		
		addrSearch.showPopup();
	});
	
	/* 회원 주소 팝업창 끝 */

	/* 회원 가입 아이디 중복 검사 */
	
	$('#duplicate-id-btn').on('click', function(){
		if(companyMember.hasIdError){
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
	
	
	/* 생년 월일 스프링 폼 태그 맵핑 */
	
	$('#real-date').on('change', function(e){
		$('#hidden-date').val($(this).val());
	});
	
	/* 생년 월일 스프링 폼 태그 맵핑 끝 */
	
	
	/* 설립일 스프링 폼 태그 연동 */
	
	$('#company_birth_date_input').on('change', function(e){
		$('#hidden_company_birth_date_input').val($(this).val());
	});
	
	/* 설립일 스프링 폼 태그 연동 끝 */
	
	
	/* 기업 회원 정보 등록 */
	
	$('#company_member_regist_btn').on('click', function(e){
		$('#company_member_regist_form').attr('method', 'post');
		$('#company_member_regist_form').submit();
	});
	
	/* 기업 회원 정보 등록 끝 */
</script>