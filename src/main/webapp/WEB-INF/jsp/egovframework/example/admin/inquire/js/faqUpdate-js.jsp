<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<!-- Javascript files -->

<!-- CKEditor JS -->
<script src="//cdn.ckeditor.com/4.7.1/full/ckeditor.js"></script>

<script>
	$(document).ready(function(){
		/* 메일 에디터 */

		CKEDITOR.replace('contentEditor', {
			removePlugins : 'elementspath'
		});

		/* 메일 에디터 끝 */
	})	
	
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
	
	
	$('#faqUpdateCancelBtn').on('click', function(){
		history.back();
	});
	
	$('#faqListBtn').on('click', function(){
		location.href="<c:url value='/admin/inquire/faq/main.jobq' />";
	});
	
	/* 회원 가입 아이디 중복 검사 */
	
	$('#dupId').on('click', function(){
		$.ajax({
			type:'get',
			url:'<c:url value="/admin/member/manage/dupid.jobq" />',
			data:$('#memberAddId').serialize(),
			contentType:'applicaion/json; charset=utf8',
			dataType:'json',
			success:function(response){
				console.dir(response);
			}
		})	
	})
	
	/* 회원 가입 아이디 중복 검사 끝 */

	/* 회원 주소 팝업창 */
	
	$('#addr-btn').on('click', function(e){
		var addrSearch = new AddressSearch();
		
		addrSearch.showPopup();
	});
	
	/* 회원 주소 팝업창 끝 */

</script>