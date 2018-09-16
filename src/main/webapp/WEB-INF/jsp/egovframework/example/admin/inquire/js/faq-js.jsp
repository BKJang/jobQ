<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Javascript files -->

<!-- jQuey DataTables-->
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/jszip-3.1.3/pdfmake-0.1.27/dt-1.10.15/af-2.2.0/b-1.3.1/b-colvis-1.3.1/b-html5-1.3.1/datatables.min.js"></script>

<script>
	var faq = {
		$table : $('#faqTable')
	}
	
	var table = {};
	
	/* DataTables */
	$(document).ready(function() {
			table = faq.$table.DataTable({
					paging     : true,
					bPaginate  : true,
					serverSide : true,
					processing : true,
					"bDeferRender": true,
					ajax       : {
						'type'     : 'GET',
						'url'      : '<c:url value="/admin/inquire/faq/list" />',
						'dataType' : 'JSON',
						'data'     : function(d){
							// console.dir(d);
						},
						'dataSrc'  : function(result){
							// console.dir(result);
							
							return result.data;
						}
					},
					columns : [ {
						'title' : "<input type='checkbox' />"
					}, {
						'title' : "번호",
						'data' : 'no'
					}, {
						'title' : "카테고리",
						'data' : 'subject'
					}, {
						'title' : "제목",
						'data' : 'title'
					}, {
						'title' : "등록 일자",
						'data' : 'regDate'
					}, {
						'title' : "최근 수정 일자",
						'data' : 'updateDate'
					},{
						'title' : "메인 게재",
						'data' : 'public'
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
								'render' : function(data, type,
										full, meta) {
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
								'width' : "50px",
								'className' : 'dt-center'
							},
							{
								'targets' : 3,
								'width' : "150px",
								'className' : 'dt-center',
								'render' : function(data, type,
										full, meta) {
									// data에는 위에 columns속성에서 정의한 data와 같고, full은 각 컬럼들의 모든 정보가 들어있다.
									return "<a href='<c:url value='/admin/inquire/faq/detail/"
											+ full.no
											+ "' />' >"
											+ data
											+ "</a>";
								}
							},{
								'targets' : 4,
								'width' : "70px",
								'className' : 'dt-center'
							},{
								'targets' : 5,
								'width' : "70px",
								'className' : 'dt-center'
							},{
								'targets' : 6,
								'width' : "40px",
								'className' : 'dt-center',
								'render' : function(data, type, full, meta) {
									return '<strong class="faq-main-use" style="cursor : pointer" data-faq-no="' + full.no + '">' + data + '</p>';
								}
							}],
					select : true,
					rowGroup : {
						className : 'stripe'
					},
					'searching' : false,
					'lengthMenu' : [ 10, 15, 20 ],
					'fnRowCallback' : function(nRow, aData, iDisplayIndex, iDisplayIndexFull){
						$(nRow).children().eq(3).children().hover(function(e){
							$(this).attr('style', 'text-decoration:underline !important');
						}, function(e){
							$(this).attr('style', '');
						});
					}
				});

						/* 테이블의 체크박스 클릭 */

						faq.$table.find('thead tr').on('click', 'input[type="checkbox"]', function(e) {
							var $tableBodyCheck = faq.$table.find('tbody tr input[type="checkbox"]');

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
								faq.$table,
								{
									buttons : [
										'excelHtml5',
										'pdfHtml5',
										{
											text : '선택 삭제',
											action : function(e, dt, node, config) {
												var $selectedRows = faq.$table.find('tbody tr input:checkbox:checked');
												var removeColumnNumbers = [];
												
												$selectedRows.each(function(i, el){
													removeColumnNumbers.push(el.value);
												});
												
												if(removeColumnNumbers.length == 0){
													alert("삭제하실 FAQ을 선택하세요.");
													
													return ;
												}
												
												if(!confirm('정말로 삭제하시겠습니까?'))										
													return ;
												
												$.ajax({
													type    : 'DELETE',
													url     : '<c:url value="/admin/inquire/faq/list" />',
													headers : {
														'Content-Type' : 'application/json',
														'X-HTTP-Method-Override' : 'DELETE'
													},
													data    : JSON.stringify(removeColumnNumbers),
													dataType: 'text',
													success : function(data){
														if(data == 'SUCCESS'){
															alert(removeColumnNumbers.length + "건의 데이터가 삭제되었습니다.");
															
															location.href="<c:url value='/admin/inquire/faq/main' />"
														}
													}
												});
											}
										}]
								});

						var buttonsOnTop = new $.fn.dataTable.Buttons(
								faq.$table, {
									buttons : [ {
										text : 'FAQ 추가',
										action : function(e, dt, node, config) {
											location.href="<c:url value='/admin/inquire/faq/addpage' />"
										}
									}]
								});

						$('#faqTable_info').after(
								buttonsOnBottom.container().css({
									'padding' : '3px',
									'padding-left' : '20px'
								}));
						$('#faqTable_length').after(
								'<div class="pull-right"></div>');
						$('#faqTable_length').next().append(
								buttonsOnTop.container());
						$('.pull-right .dt-buttons').find('.dt-button').css({
							'padding' : '3px 8px'
						});
						$('#faqTable_length').find('label').css({
							'margin-top' : '5px'
						});

						$('#faqTable_info').next().find('.dt-button').css({
							'padding-left' : '14px',
							'padding-right' : '14px',
							'border' : 'none',
							'background' : 'transparent'
						}).find('span').css({
							'font-size' : '14px'
						});

						faq.$table.find('tbody tr td > a').each(function(i, el) {
							$(el).hover(
								function(e){
									$(this).attr('style', 'text-decoration:underline !important');
								},
								function(e){
									$(this).attr('style', '');
								})
						});

					});

	/* DataTables end */
	
	$('#faq-search-btn').on('click', function(e){
		var searchValues = $.jobqForm.bindInputedValues();
		var newUrl = '<c:url value="/admin/inquire/faq/search" />?';
		
		if(Object.keys(searchValues).length < 2){
			alert('검색할 조건들을 입력하세요.');
			
			return ;
		}
		
		newUrl += $.param(searchValues);
		
		console.log(newUrl);
		
		table.ajax.url(newUrl).load();
	});
	
	$(document).on('click', '.faq-main-use', function(e){
		var mainUseFaqCnt = '<c:out value="${mainUseFaqCnt}" />';
		var isFaqState = $(this).text();
		var isMainUse = '';
		
		if(mainUseFaqCnt < 5){
			if(isFaqState == '미게재'){
				if(confirm('메인 FAQ로 바꾸시겠습니까?')){
					isMainUse = 'Y'
				}else{
					return ;
				}
			}else{
				if(confirm('미개제 상태로 바꾸시겠습니까?')){
					isMainUse = 'N';
				}else{
					return ;
				}
			}
		}else{
			if(isFaqState == '게재중'){
				if(confirm('미개제 상태로 바꾸시겠습니까?')){
					isMainUse = 'N';
				}else{
					return ;
				}
			}else{
				alert('메인 FAQ는 5개까지만 가능합니다.');
				
				return ;
			}
		}
		
		$.ajax({
			type    : 'PATCH',
			url     : '<c:url value="/admin/inquire/faq/state" />?no=' + $(this).attr('data-faq-no') + '&state=' + isMainUse,
			headers : {
				'X-HTTP-Override-Method' : 'PATCH'
			},
			success : function(result){	// ajax는 상태값만 200면 값이 엉망이더라도 success를 실행한다.
				if(result == 'OK'){
					location.href = '<c:url value="/admin/inquire/faq/main" />'
				}
			}
		});
		
	});
	
</script>