<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<!-- Javascript files -->

<!-- AddressSearch JS -->
<script src="/sample/admin/js/address-search.js" ></script>

<!-- CKEditor JS -->
<script src="//cdn.ckeditor.com/4.7.1/full/ckeditor.js"></script>

<script>
	$(document).ready(function(){
		/* 채용 공고 상세 에디터 */
		
	 	CKEDITOR.replace('employ-editor', {removePlugins:'elementspath'});
	 	
	 	/* 채용 공고 상세 에디터 끝 */
	 	
	 	var salary = '${employ.salary}';
	 	var academic = '${employ.academic}';
		var career = '${employ.career}';
		var skills ='${employ.skills}'.split(',');
		
		$.each(skills, function(index, skill){
			$('input[data-employ-skill=' + skill + ']').prop('checked', true);			
		});
		
		if(career == '신입'){
			$('#employ-career-beginner').prop('checked', true);
		}else if(career == '무관'){
			$('#employ-career-none').prop('checked', true);
		}else{
			$('#employ-career-select').removeAttr('disabled');
			$('#employ-career').prop('checked', true);
			$('#employ-career-select').find('option').each(function(index, element){
		 		if(element.value == career.substring(career.indexOf('/') + 1)){
		 			$(element).attr('selected', 'selected');
		 		}
		 	});
		}
		
	 	$('#employ-academic').find('option').each(function(index, element){
	 		if(element.value == academic.trim()){
	 			$(element).attr('selected', 'selected');
	 		}
	 	});
	 	
	 	$('#employ-salary-money').val(salary.substring(2));
	 	$('#employ-salary-type').find('option').each(function(index, element){
	 		if(element.innerText == salary.substring(0, 2).trim()){
	 			$(element).attr('selected', 'selected');	// 원래 selected같은 속성은 prop으로 접근하지 않나??..
	 		}
	 	});
	 	
	 	$('#type-employ').find('label').each(function(index, element){
	 		if(element.innerText == '${employ.employType}'){
	 			$(element).find('input').prop('checked', true);
	 		}
	 	});
	 	
	 	// 제이쿼리 each문에서 return true는 continue와 같은 역할을, return false는 break와 같은 역할을 수행한다.
	 	$('#employ-career').find('option').each(function(index, element){
	 		if('${employ.career}' == '무관'){
 				$('#employ-nocareer').prop('checked', true);
 				
 				return false;
 			}
	 		
	 		if(element.value == '${employ.career}'){
		 		$(element).attr('selected', 'selected');	 
	 		}
	 	});
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

	
	/* 공고 주소 팝업창 */
	
	$('#addr-btn').on('click', function(e){
		var addrSearch = new AddressSearch();
		
		addrSearch.showPopup();
	});
	
	/* 공고 주소 팝업창 끝 */
	
	$('.employ-career-btn').on('click', function(e){
		if($(this).parent().text().trim() == '경력')
			$('#employ-career-select').prop('disabled', false);
		else
			$('#employ-career-select').prop('disabled', true);
	});
	
	$('#employ-update-btn').on('click', function(e){
		location.href = '<c:url value="/admin/employ/main" />';
	});

</script>