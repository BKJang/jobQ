<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Javascript files -->

<!-- jqGrid -->
<script src="/sample/admin/js/grid.locale-en.js"></script>
<script src="/sample/admin/js/jquery.jqGrid.min.js"></script>


<script>
	var excel = {
		selectedRows : []	
	};
	
	/* jqGrid */
		
	var jqGridFormatter = {};

	jqGridFormatter.showMemberDetail = function(cellValue, options, rowData, action) {
		var type = '';
		
		if(rowData.type == '일반')
			type = 'p';
		else 
			type = 'c';
		
		return "<a data-role-detail='id' href='<c:url value='/admin/member/manage/detail?id=" + rowData.id + "&type=" + type + "' />'>" + rowData.id + "</a>";
	};
	
	function isAllCheckboxSelected(){
		return $('#cb_memberManageTable').is(':checked');
	};
	
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
		var $memberManageTable = $("#memberManageTable");

		$("#memberManageTable").jqGrid({
			url : '<c:url value="/admin/member/manage/list" />',
		    mtype : 'get',
		    datatype : "json",
		    authwidth : true,
			height : '100%',
			rowNum : 10,
			rowList : [ 10, 15, 20 ],
			colNames : [ '이름', '아이디', '휴대폰', '이메일', '분류', '가입일', '최근 수정일자'],
			colModel : [ // JSON데이터의 키값과 colModel의 name의 value가 일치해야만 매핑이 된다!
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
				formatter : jqGridFormatter.showMemberDetail
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
				name : 'regDate',
				width : 70,
				align : 'center',
				editable : false
			}, // 등록 날짜
			{
				name : 'updateDate',
				width : 70,
				align : 'center',
				editable : false
			} // 수정 날짜
			],
			pager : "#memberManagePager",
			gridview : true,
			viewrecords : true,
			hidegrid : false,
			altRows : true,
			multiselect : true,
			resizable : true,
			hoverrows : false,
			jsonReader : {
				page : 'page',
				total : 'total',
				root : 'list',
				userdata : 'userData',
				repeatitems : false
			},
			ondblClickRow : function(rowid, iRow, iCol) { // ondbClickRow아니다! 주의할 것!
				alert('efef');
			},
			beforeSelectRow : function(e) {
				return false;
			}, loadComplete : function(data){
				hoverJqGridId();
				
				$('#all-page-count').text('총 회원 수 : ' + $("#memberManageTable").jqGrid('getGridParam', 'userData').allMembers);
			}
		});
		
		$('#memberManageTable').jqGrid('navGrid','#memberManagePager',{edit:false, add:false, del:false, search:false});
		$('#refresh_memberManageTable').children().children().removeClass().end().text('새로 고침');
		
		/* jqGrid End */

	});

	/* Document.ready End */

	/* 회원 검색 버튼 이벤트 */

	$('#member-search-btn').on('click', function() {
		var searchData = $.jobqForm.bindInputedValues();
		var $table = $('#memberManageTable');
		
		if(Object.keys(searchData).length != 2){
			alert('검색할 조건을 입력하세요.');
			
			return ;
		}
			
		$table.jqGrid('clearGridData', true);
		$table.jqGrid('setGridParam', {
			url : '<c:url value="/admin/member/manage/search" />',
			serializeGridData : function(postData){
				var searchParams = $.extend({}, postData, searchData);
				
				return $.param(searchParams);
			}, loadComplete : function(result){
				var memberCnt = $table.jqGrid('getGridParam', 'userData');
				
				hoverJqGridId();
				
				$('#all-page-count').text('총 회원 수 : ' + memberCnt.allMembers);
				$('#search-page-count').text('검색된 회원 수 : ' + memberCnt.countSearchedMembers);				
			}
		}).trigger('reloadGrid');
	});

	/* 회원 검색 버튼 이벤트  끝 */

	/* 회원 검색 엔터 이벤트 */

	$('#memberSearchInput').keydown(function(event) {
		if (event.keyCode == 13)
			$('#member-search-btn').trigger('click');
	})

	/* 회원 검색 엔터 이벤트 끝 */

	/* 선택 회원 삭제 */

	$(document).on('click', '#member-delete-btn', function(event) {
		event.preventDefault();

		var selectedRows = [];
		var selectedCheckboxs = $(".cbox:checked");

		selectedCheckboxs.each(function(i, el) {
			selectedRows.push($(el).parent().parent().attr('id'));
		});

		if (selectedRows.length == 0) {
			alert('삭제하실 공고를 선택하세요.');

			return;
		}

		if (confirm("정말로 삭제하시겠습니까?") == false)
			return;

		$.ajax({
			type : 'delete',
			url : '<c:url value="/admin/member/manage/list" />',
			headers : {
				'Content-Type' : 'application/json; charset=utf-8',
				'X-HTTP-Method-Override' : 'DELETE'
			},
			data : JSON.stringify(selectedRows),
			dataType : 'text',
			success:function(response){
				if(response == 'SUCCESS'){
					alert(selectedRows.length + '건 의 데이터가 삭제됬습니다.');
					
					$("#memberManageTable").trigger("reloadGrid");
				}
				
			}
		})
	});

	/* 선택 회원 삭제  끝 */

	/* 회원 추가 */

	$('#member-add-btn').on('click', function() {
		$('#select-member-modal').modal();
	});

	$('.member-register').on('click', function(e) {
			var memberState = "";
			
			switch (this.innerText) {
			case "일반 회원":
				memberState = "general";
				break;

			case "기업 회원":
				memberState = "company";
				break;
			};

			location.href = "<c:url value='/admin/member/manage/register/" + memberState + "' />";
		});

	/* 회원 추가 끝 */

	/* 엑셀 Export */

	$('#excel-btn').on('click', function(e) {
		var selectedRows = [];
		var selectedCheckboxs = $(".cbox:checked");

		selectedCheckboxs.each(function(i, el) {
			selectedRows.push($(el).parent().parent().attr('id'));
		});
		
		if (selectedRows.length == 0) {
			alert('엑셀로 출력할 회원을 선택하세요.');

			return;
		}
		
		excel.selectedRows = selectedRows;
		$('#excel-version-select').modal();
	});
	
	$('button[id*=excel200]').on('click', function(e){
		var $excelForm = $('#excel-form');
		$excelForm.attr('method', 'post');
		
		if(!isAllCheckboxSelected())
			$('#memberIds').val(excel.selectedRows);
		else
			$('#memberIds').val('all');
		
		if(this.innerText.startsWith('excel 2003'))
			$("#excel-version").val('xls');			
		else
			$("#excel-version").val('xlsx');
		
		$excelForm.attr('action', '<c:url value="/admin/member/manage/excel" />');
		$excelForm.submit();
	});
	
	/* $('#excel-2003-btn').on('click', function(e) {
			$('#excel-form').attr('method', 'post');
			$('#excel-form').attr('action', '<c:url value="/admin/member/manage/excel2003" />');
			
			if(!isAllCheckboxSelected())
				$('#memberIds').val(excel.selectedRows);
			else
				$('#memberIds').val('all');
			
			$('#excel-form').submit();
		});

	$('#excel-2007-btn').on('click', function(e) {
			$('#excel-form').attr('method', 'post');
			$('#excel-form').attr('action', '<c:url value="/admin/member/manage/excel2007" />');
			
			if(!isAllCheckboxSelected())
				$('#memberIds').val(excel.selectedRows);
			else
				$('#memberIds').val('all');
			
			$('#excel-form').submit();
		}); */

	/* 엑셀 Export 끝 */
</script>