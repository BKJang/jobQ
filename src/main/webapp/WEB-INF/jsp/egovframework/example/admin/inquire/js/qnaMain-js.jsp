<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Javascript files -->

<!-- jQuey DataTables-->
<script src="https://cdn.datatables.net/v/dt/jszip-3.1.3/pdfmake-0.1.27/dt-1.10.15/af-2.2.0/b-1.3.1/b-colvis-1.3.1/b-html5-1.3.1/datatables.min.js"></script>

<script>
	var qna = {
		$table : $('#qna-table')
	}

	var table = {};
	
	/* DataTables */
	$(document).ready(function() {
			table = qna.$table.DataTable({
				paging     : true,
				bPaginate  : true,
				serverSide : true,
				processing : true,
				ajax       : {
					'type'     : 'GET',
					'url'      : '<c:url value="/admin/inquire/qna/list" />',
					'dataType' : 'JSON',
					'data'     : function(d){

					},
					'dataSrc'  : function(result){
						
						return result.data;
					}
				},
				columns : [ {
					'title' : "<input type='checkbox' />"
				}, {
					'title' : "번호",
					'data'  : 'no'
				}, {
					'title' : "문의 제목",
					'data'  : 'title'
				}, {
					'title' : "회원 아이디",
					'data'  : 'id'
				}, {
					'title' : "등록 일자",
					'data'  : 'regDate'
				}, {
					'title' : "최근 수정 일자",
					'data'  : 'updateDate'
				},{
					'title' : "답변 상태",
					'data'  : 'replyState'
				}],
				language : {
					"search"         : '검색',
					"info"           : "전체 - _TOTAL_개 항목",
					"lengthMenu"     : " _MENU_개 항목씩 보여주기",
					"loadingRecords" : "로딩중...",
					"paginate" : {
						"previous" : "이전",
						"next" : "다음"
					},
					"infoFiltered"   : ""
				},
				columnDefs : [
				{
					'className' : 'dt-center',
					'targets' : '_all'
				},
				{
					'targets' : 0,
					'width' : '3px',
					'searchable' : false,
					'orderable' : false,
					'className' : 'dt-body-center',
					'render' : function(data, type, full, meta) {
						return '<input type="checkbox" name="" value="'
								+ full.no
								+ '" width="100%"/>';
					}
				},
				{
					'targets' : 1,
					'width' : "20px",
					'className' : 'dt-center'
				},
				{
					'targets' : 2,
					'width' : "120px",
					'className' : 'dt-center',
					'render' : function(data, type,
							full, meta) {
						// data에는 위에 columns속성에서 정의한 data와 같고, full은 각 컬럼들의 모든 정보가 들어있다.
						return "<a href='<c:url value='/admin/inquire/qna/detail/"
								+ full.no
								+ "' />' >"
								+ data
								+ "</a>";
					}
				}, {
					'targets' : 3,
					'width' : "50px",
					'className' : 'dt-center'
				}, {
					'targets' : 4,
					'width' : "70px",
					'className' : 'dt-center'
				}, {
					'targets' : 5,
					'width' : "70px",
					'className' : 'dt-center'
				},{
					'targets' : 6,
					'width' : "70px",
					'className' : 'dt-center'
				}],
				select : true,
				rowGroup : {
					className : 'stripe'
				},
				'searching' : false,
				'lengthMenu' : [ 10, 20, 30 ]
			});

				/* 테이블의 체크박스 클릭 */

				qna.$table.find('thead tr').on('click', 'input[type="checkbox"]', function(e) {
						var $tableBodyCheck = qna.$table.find('tbody tr input[type="checkbox"]');
						
						if ($(this).is(':checked') != true) {
							$tableBodyCheck.each(function(i, el) {
								$(el).prop('checked', false);
							});

							return;
						}

						$tableBodyCheck.prop('checked', true);
					});

				/* 테이블의 체크박스 클릭 끝 */

				var buttonsOnBottom = new $.fn.dataTable.Buttons(
				qna.$table,
				{
					buttons : [
							'excelHtml5',
							'pdfHtml5',
							{
								text : '선택 삭제',
								action : function(e, dt, node, config) {
									var $selectedRows = qna.$table.find('tbody tr input:checkbox:checked');
									var removeColumnNumbers = [];
									
									$selectedRows.each(function(i, el){
										removeColumnNumbers.push(el.value);
									});
									
									if(removeColumnNumbers.length == 0){
										alert("삭제하실 Q&A을 선택하세요.");
										
										return ;
									}
									
									if(!confirm('정말로 삭제하시겠습니까?'))										
										return ;
									
									$.ajax({
										type    : 'DELETE',
										url     : '<c:url value="/admin/inquire/qna/list" />',
										headers : {
											'Content-Type' : 'application/json',
											'X-HTTP-Method-Override' : 'DELETE'
										},
										data    : JSON.stringify(removeColumnNumbers),
										dataType: 'text',
										success : function(data){
											if(data == 'SUCCESS'){
												alert(removeColumnNumbers.length + "건의 데이터가 삭제되었습니다.");
												
												location.href="<c:url value='/admin/inquire/qna/main' />"
											}
										}
									});
								}
							}]
						});

						$('#qna-table_info').after(
								buttonsOnBottom.container().css({
									'padding' : '3px',
									'padding-left' : '20px'
								}));
						$('#qna-table_length').find('label').css({
							'margin-top' : '5px'
						});

						$('#qna-table_info').next().find('.dt-button').css({
							'padding-left' : '14px',
							'padding-right' : '14px',
							'border' : 'none',
							'background' : 'transparent'
						}).find('span').css({
							'font-size' : '14px'
						});

						
						qna.$table.find('tbody tr td > a').each(function(i, el) {
							$(el).hover(function(e) {
								$(this).attr('style', 'text-decoration:underline !important');
								},
								function(e) {
									$(this).attr('style','');
								});
						});

					});

	/* DataTables end */
	
	$('#qna-search-btn').on('click', function(e){
		var searchValues = $.jobqForm.bindInputedValues();
		var newUrl = '<c:url value="/admin/inquire/qna/search" />?';
		
		if(Object.keys(searchValues).length < 2){
			alert('검색할 조건들을 입력하세요.');
			
			return ;
		}
		
		newUrl += $.param(searchValues);
		
		table.ajax.url(newUrl).load();
	});
</script>