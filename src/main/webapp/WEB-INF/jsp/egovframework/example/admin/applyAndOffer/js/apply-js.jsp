<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
	
<!-- Javascript files -->

<!-- jQuey DataTables-->
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/jszip-3.1.3/pdfmake-0.1.27/dt-1.10.15/af-2.2.0/b-1.3.1/b-colvis-1.3.1/b-html5-1.3.1/datatables.min.js"></script>

<script>
	var apply = {
		$table : $('#apply-table')
	};
	
	var table = {};
	
	/* DataTables */
	$(document).ready(function() {
				table = apply.$table.DataTable({
					paging     : true,
					bPaginate  : true,
					serverSide : true,
					processing : true,
					deferRender: true,
					ajax       : {
						'type'     : 'GET',
						'url'      : '<c:url value="/admin/applyandoffer/apply/list" />',
						'dataType' : 'JSON',
						'data'     : function(d){
							
							console.dir(d);
						},
						'dataSrc'  : function(result){
							console.dir(result);
							
							return result.data;
						}
					},
					columns : [{
						'title' : "<input type='checkbox' />"
					},{
						'title' : "번호",
						'data' : "no"
					},{
						'title' : "회사명",
						'data' : "companyName"
					},{
						'title' : "공고 제목",
						'data' : "title"
					}, {
						'title' : "회원 아이디",
						'data' : "id"
					},{
						'title' : "이메일",
						'data' : "email"
					},{
						'title' : "지원 일자",
						'data' : "regDate"
					},{
						'title' : "열람 여부",
						'data' : "read"
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
						'className':'dt-center', 'targets':'_all'
					},
					{
						'targets': 0,
						'width':'3px',
				        'searchable': false,
				        'orderable': false,
				        'className': 'dt-body-center',
				        'render': function (data, type, full, meta){
				             return '<input type="checkbox" name="" value="' + full.no + '" width="100%"/>';
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
						'width' : "130px",
						'className' : 'dt-body-center',
						'render':function(data, type, full, meta){
							// data에는 위에 columns속성에서 정의한 data와 같고, full은 각 컬럼들의 모든 정보가 들어있다.
							// 지원 공고에 디테일한 부분을 볼려면 지원 번호를 보내는게 아니라 지원을 한 사람의 이력서 번호를 보내야 한다.
							return "<a href='<c:url value='/admin/applyandoffer/apply/detail?no=" + full.resumeNumber + "&state=" + full.isSuccess + "' />' >" + data + "</a>";
						}
					}, 
					{
						'targets' : 4,
						'width' : "70px",
						'className' : 'dt-center'
					}, 
					{
						'targets' : 5,
						'width' : "70px",
						'className' : 'dt-center'
					},
					{
						'targets' : 6,
						'width' : "70px",
						'className' : 'dt-center'
					},
					{
						'targets' : 7,
						'width' : "30px",
						'className' : 'dt-center'
					}],
					select:true,
					rowGroup : {
						className : 'stripe'
					},
					'searching' : false,
					'lengthMenu':[10, 15, 20],
					'fnRowCallback' : function(nRow, aData, iDisplayIndex, iDisplayIndexFull){
						$(nRow).children().eq(3).children().hover(function(e){
							$(this).attr('style', 'text-decoration:underline !important');
						}, function(e){
							$(this).attr('style', '');
						});
					}
				});
				
				/* 테이블의 체크박스 클릭 */
				
				apply.$table.find('tbody tr').on('click', 'input[type="checkbox"]', function(e){
					
				});
				
				apply.$table.find('thead tr').on('click', 'input[type="checkbox"]', function(e){
					var $tableBodyCheck = apply.$table.find('tbody tr input[type="checkbox"]');
					
					if($(this).is(':checked') != true){
						$tableBodyCheck.each(function(i, el){
							$(el).prop('checked', false);
						});
	
						return ;	
					}
					
					$tableBodyCheck.prop('checked', true);
				});
				
				/* 테이블의 체크박스 클릭 끝 */
				
				var buttonsOnBottom = new $.fn.dataTable.Buttons(apply.$table, {
					buttons:[
								{
									text:'선택 삭제',
									action:function(e, dt, node, config){
										var $selectedRows = apply.$table.find('tbody tr input:checkbox:checked');
										var removeColumnNumbers = [];
										
										$selectedRows.each(function(i, el){
											removeColumnNumbers.push(el.value);
										});
										
										if($selectedRows.length == 0){
											alert("삭제하실 잡스토리를 선택하세요.");
											
											return ;
										}

										if(!confirm('정말로 삭제하시겠습니까?'))										
											return ;
										
										$.ajax({
											url:'<c:url value="/admin/board/jobstory/delete.jobq" />',
											type:'post',
											contentType:'applicaion/json; charset=utf8',
											data:JSON.stringify(removeColumnNumbers),
											success:function(data){
												$selectedRows.each(function(i, el){
													$(el).parent().parent().remove();
												});
											}
										});
									}
								}
							]	
				});
				
				
				$('#apply-table_info').after(buttonsOnBottom.container().css({'padding':'3px','padding-left':'20px'}));
				$('#apply-table_length').find('label').css({'margin-top':'5px'});
				
				$('#apply-table_info').next().find('.dt-button').css({'padding':'3px 12px'}).
									 find('span').css({'font-size':'14px'});
				
				apply.$table.find('tbody tr td > a').each(function(i, el){
					$(el).hover(function(e){
						$(this).attr('style', 'text-decoration:underline !important');
					}, function(e){
						$(this).attr('style', '');
					})
				});
					
				/* DataTables end */
				
				$('#apply-search-btn').on('click', function(e){
					var searchValues = $.jobqForm.bindInputedValues();
					var newUrl = '<c:url value="/admin/applyandoffer/apply/search" />?';
					
					if(Object.keys(searchValues).length < 1){
						alert('검색할 조건들을 입력하세요.');
						
						return ;
					}
					
					newUrl += $.param(searchValues);
					table.ajax.url(newUrl).load();
				});
				
		});

</script>