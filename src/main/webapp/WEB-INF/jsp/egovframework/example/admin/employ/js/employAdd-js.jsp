<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<!-- Javascript files -->

<!-- CKEditor JS -->
<script src="https://cdn.ckeditor.com/4.7.3/standard/ckeditor.js"></script>

<script>
	$(document).ready(function(){
		/* 채용 공고 상세 에디터 */
		
	 	CKEDITOR.replace('employ-regist-editor', {
	 		removePlugins:'elementspath',
	 		filebrowserImageUploadUrl: '<c:url value="/admin/employ/logo" />',	// 서버로 업로드할 경로 지정
	 		entities: false,
            basicEntities: false,
            entities_greek: false,
            entities_latin: false,
            htmlEncodeOutput : false
	 	});
	 	
	 	/* 채용 공고 상세 에디터 끝 */
		// $('#hidden-employ-regist-editor').val()
	 	// CKEDITOR.instances['employ-regist-editor'].setData('<strong>dkdkd</strong>');
		
		if($('#hidden-employ-date').val() != '')
			$('#real-employ-date').val($('#hidden-employ-date').val());
	 	
	 	
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

	$('#employ-add-btn').on('click', function(e){
		/* $.ajax({
			type : 'POST',
			url  : '<c:url value="/admin/employ" />',
			data : ,
			
		}); */
		
		$('#employ-form').attr('method', 'POST');
		$('#employ-form').attr('action', '<c:url value="/admin/employ" />');
		$('#employ-form').attr('accept-charset', 'utf-8');
	
		$('#hidden-employ-content').val(CKEDITOR.instances['employ-regist-editor'].getData());

		$('#employ-form').submit();
	});
	
	$('#real-employ-date').on('change', function(e){
		$('#hidden-employ-date').val($(this).val());
	});
</script>