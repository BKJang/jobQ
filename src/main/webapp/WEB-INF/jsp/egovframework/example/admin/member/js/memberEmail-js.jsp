<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Javascript files -->

<!-- jqGrid -->
<script src="/sample/admin/js/grid.locale-en.js"></script>
<script src="/sample/admin/js/jquery.jqGrid.min.js"></script>

<!-- CKEditor JS -->
<script src="//cdn.ckeditor.com/4.7.1/full/ckeditor.js"></script>

<script>
	/* jqGrid */
	
	var selectedDatas ={
		emails : [],
		ids    : [],
		names  : [],
		rowNumbers : []
	};
	
	function keepCheckedBox(){
		$.each(selectedDatas.ids, function(index, id){
			if(document.getElementById('jqg_member-email-table_' + id) != null)
				document.getElementById('jqg_member-email-table_' + id).checked = true;
		});
	}
	
	function hoverJqGridId(){
		$('a[data-role-detail="id"]').each(function(i, el){
			$(el).hover(function(e){
				$(this).attr('style', 'text-decoration:underline !important');
			}, function(e){
				$(this).attr('style', '');
			})
		});
	};
	
	$(document).ready(function() {
			/* 메일 에디터 */
			
			var editor = CKEDITOR.replace('mail-editor', {
				removePlugins : 'elementspath',
				filebrowserImageUploadUrl: '/community/imageUpload'	// 서버로 업로드할 경로 지정
			});
			
			/* 메일 에디터 끝 */
			
			var $memberEmailTable = $("#member-email-table");

			$memberEmailTable.jqGrid({
				url 	  : '<c:url value="/admin/member/email/list" />',
				mtype     : 'get',
				authwidth : true,
				datatype  : "json",
				height    : '100%',
				rowNum    : 10,
				rowList   : [ 10, 15, 20 ],
				colNames  : [ '이름', '아이디', '휴대폰', '이메일', '분류', '가입일', '최근 수정일자'],
				colModel  : [ 
				{
					name : 'name',
					width : 60,
					align : 'center',
					editable : false
				}, // 아이디
				{
					name : 'id',
					width : 140,
					align : 'center',
					editable : false,
					key : true
				}, // 제목
				{
					name : 'phone',
					width : 110,
					align : 'center',
					editable : false
				}, // 공개 여부
				{
					name : 'email',
					width : 150,
					align : 'center',
					editable : false
				}, // 지역 코드
				{
					name : 'type',
					width : 40,
					align : 'center',
					editable : false
				}, // 직종 코드
				{
					name     : 'regDate',
					width    : 70,
					align    : 'center',
					editable : false
				}, // 등록 날짜
				{
					name     : 'updateDate',
					width    : 70,
					align    : 'center',
					editable : false
				}, // 수정 날짜
				],
				pager       : "#member-email-pager",
				gridview    : true,
				viewrecords : true,
				hidegrid    : false,
				altRows     : true,
				multiselect : true,
				resizable   : true,
				hoverrows   : false,
				jsonReader  : {
					page        : 'page',
					total       : 'total',
					root        : 'list',
					userdata    : 'userData',
					repeatitems : false
				},
				beforeSelectRow : function(e) {
					return false;
				}, 
				loadComplete    : function(data){
					keepCheckedBox();	// 체크박스 리로딩시 유지시키기.
					hoverJqGridId();	// id에 decoration hover걸기.
					
					$('#refresh_member-email-table').children().children().removeClass().end().text('새로 고침');
					$('#refresh_member-email-table').off('click');	// 기존의 click이벤트를 제거한다.
					$('#refresh_member-email-table').on('click', function(e){
						
						$memberEmailTable.jqGrid('clearGridData', true);
						$memberEmailTable.jqGrid('setGridParam', {
							url : '<c:url value="/admin/member/email/list" />',
							loadComplete : function(result){
								var memberCnt = $memberEmailTable.jqGrid('getGridParam', 'userData');
								
								keepCheckedBox();
								hoverJqGridId();
								
								$('#all-page-count').text('총 회원 수 : ' + memberCnt.allMembers);
							}
						}).trigger('reloadGrid');
					});
					
					$('#all-page-count').text('총 회원 수 : ' + $memberEmailTable.jqGrid('getGridParam', 'userData').allMembers);
				}
			});
			
			$memberEmailTable.jqGrid('navGrid','#member-email-pager',{edit:false, add:false, del:false, search:false});
			
			/* jqGrid End */

		});

	/* Document.ready End */

	/* 회원 검색 버튼 이벤트 */

	$('#member-search-btn').on('click', function() {
		var searchData = $.jobqForm.bindInputedValues();
		var $table = $('#member-email-table');
		
		if(Object.keys(searchData).length != 2){
			alert('검색할 조건을 입력하세요.');
			
			return ;
		}
		
		$.ajax({
			type    : 'get',
			url     : '<c:url value="/admin/member/email/search/exist" />',
			data    : $.param(searchData),
			success : function(result){
				if(result == 'NOT_EXIST_DATA'){
					
					alert('데이터가 존재하지 않습니다.');
				}else{
					
					$table.jqGrid('clearGridData', true);
					$table.jqGrid('setGridParam', {
						url : '<c:url value="/admin/member/email/search" />',
						serializeGridData : function(postData){
							var searchParams = $.extend({}, postData, searchData);
							
							return $.param(searchParams);
						}, loadComplete : function(result){
							var memberCnt = $table.jqGrid('getGridParam', 'userData');
							
							keepCheckedBox();
							hoverJqGridId();
							
							$('#all-page-count').text('총 회원 수 : ' + memberCnt.allMembers);
							$('#search-page-count').text('검색된 회원 수 : ' + memberCnt.countSearchedMembers);				
						}
					}).trigger('reloadGrid');
				}
			
			}	
		});
		
	});

	/* 회원 검색 버튼 이벤트  끝 */

	/* 회원 검색 엔터 이벤트 */

	$('#memberSearchInput').keydown(function(event) {
		if (event.keyCode == 13)
			$('#member-search-btn').trigger('click');
	})

	/* 회원 검색 엔터 이벤트 끝 */

	$(document).on('click', '.cbox', function(event){
		var selectedMemberInfo = {
			email : $(this).parent().next().next().next().next()[0].innerText,
			id    : $(this).parent().next().next()[0].innerText,
			name  : $(this).parent().next()[0].innerText
		};
		
		// 클릭보다 체크가 먼저 된다. 
		// 즉, 'check -> 클릭이벤트'이지  '클릭이벤트 -> check'가 아니다. 
		if($(this).is(':checked')){
			// 체크를 한 값들은 저장한다.
			selectedDatas.emails.push(selectedMemberInfo.email);
			selectedDatas.ids.push(selectedMemberInfo.id);
			selectedDatas.names.push(selectedMemberInfo.name);
		}else{
			var length = selectedDatas.ids.length; 
			for(var i = 0 ; i < length; i++){
				if(selectedDatas.ids[i] = selectedMemberInfo.id){
					selectedDatas.emails.splice(i, 1);
					selectedDatas.ids.splice(i, 1);
					selectedDatas.names.splice(i, 1);
					
					return ;	// 삭제가 되면 끝내야 한다.
				}
				
			}
		}
		
	});
	
	/* 선택 회원 메일 발송 */

	$(document).on('click', '.member-select-btn', function(event) {
		event.preventDefault();
		
		if (selectedDatas.emails.length == 0) {
			alert('메일을 전송할 회원을 선택하세요.');

			return;
		}else if($('#cb_member-email-table').is(':checked')){	// 전체 선택일 때, 맨 위에 체크박스는 무의미 하므로 제거.
			$('#member-addressee-list').val('모두 선택');
			
			return ;
		}
		
		if(selectedDatas.emails.length > 1)
			$('#member-addressee-list').val(selectedDatas.emails[0] + " 외 " + (selectedDatas.emails.length - 1) + "명");	// 2명이상을 경우 '외'를 붙여야 한다.	
		else if(selectedDatas.emails.length == 1)
			$('#member-addressee-list').val(selectedDatas.emails[0]);	// 한 명일 경우는 '외'를 붙이지 않아도 된다.
	});
	
	/* 선택 회원 메일 발송 끝 */
	
	/* 테이블 초기화 버튼 클릭 */
	
	$(document).on('click', '#member-addressee-reset-btn', function(e){
		$('#member-addressee-list').val('');
	});
	
	/* 테이블 초기화 버튼 클릭 끝 */
	
	/* 이메일 전송 버튼 */
	
	$('#email-send-btn').on('click', function(e){
		if(!confirm('이메일을 발송하시겠습니까?'))
			return ;
		
		var emailInfo = {};
		
		if($('#member-addressee-list').val() == '모두 선택'){
			emailInfo.emailList = 'all';
			emailInfo.title = $('#member-email-title').val();
			emailInfo.content = CKEDITOR.instances['mail-editor'].getData();
			emailInfo.formType = $('#member-email-subject-select option:selected').val();
		}else if($('#member-addressee-list').val() == ''){
			alert('메일을 발송을 할 회원을 선택하세요.');
			
			return ;
		}else{
			emailInfo.idList = selectedDatas.ids;
			emailInfo.emailList = selectedDatas.emails;
			emailInfo.nameList = selectedDatas.names;
			emailInfo.title = $('#member-email-title').val();
			emailInfo.content = CKEDITOR.instances['mail-editor'].getData();
			emailInfo.formType = $('#member-email-subject-select option:selected').val();
		}
		
		$.ajax({
			url        : '<c:url value="/admin/member/email" />',
			type       : 'post',
			contentType: 'application/json; charset=utf-8',
			data       : JSON.stringify(emailInfo),
			datatype   : 'text',
			success    : function(result){
				if(result == "MAIL_SEND_SUCCESS"){
					alert('메일이 성공적으로 발송되었습니다.');
					
					return ;					
				}
				
			}
		});
		
	});
	
	/* 이메일 전송 버튼 끝 */
	
	$('#member-email-subject-select').on('change', function(e){
		if($(this).val() == '선택')
			return ;

		var mailFormUrl = '<c:url value="/admin/member/email/form/" />' + $(this).val(); 
		$.ajax({
			type       : 'GET',
			url        : mailFormUrl,
			/* statusCode : {
				200 : function(result){
					console.log(result);
				},
				401 : function(result){
					
				}
			}, */
			success    : function(result){
				CKEDITOR.instances['mail-editor'].setData(result);
			}
		});
	});
	
</script>