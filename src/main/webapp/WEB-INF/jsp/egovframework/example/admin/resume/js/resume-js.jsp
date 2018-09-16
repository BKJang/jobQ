<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<!-- Javascript files -->

<!-- jqGrid -->
<script src="/sample/admin/js/grid.locale-en.js"></script>
<script src="/sample/admin/js/jquery.jqGrid.min.js"></script>


<script>	
			var resume = {
					data:[],
					$table:{},
					$resumeUpdateBtn:$('.resumeUpdateBtn'),
					$resumeDeleteBtn:$('.resumeDeleteBtn'),
					beforeSearchData : {} // 검색 실패시 이전값을 출력한다.
			};
			
			/* 테이블 크기 조정 */

			$('.table tr td').css('padding', '5px 8px');

			/* 테이블 크기 조정 끝 */
			
			/* jqGrid */
			
			var jqGridFormatter = {};
			
			function hoverJqGridTitle(){
				$('.announcement-title').each(function(i, el){
					$(el).hover(function(e){
						$(this).attr('style', 'text-decoration:underline !important');
					}, function(e){
						$(this).attr('style', '');
					});
				});
			};
			
			jqGridFormatter.showResumeDetail = function(cellValue, options, rowData, action){
				return "<a href='<c:url value='/admin/resume/detail/" + rowData.no + "' />' data-role-detail='title'>" + rowData.title + "</a>";
			}
			
			$(document).ready(function(){
				resume.$table = $("#resumeTable").jqGrid({
					url      : '<c:url value="/admin/resume/list" />',
				    authwidth: true,
				    mtype    : 'get',
				    datatype : "json",
				    height   : '100%',
				    rowNum   : 10,
				    rowList  : [10, 15, 20],
				    colModel:[	// JSON데이터의 키값과 colModel의 name의 value가 일치해야만 매핑이 된다!
							    {label : '번호'    ,name:'no',         width:30,  align:'center', editable:false, /* formatter:link, */ key:true},	// 이력서 번호
							    {label : '아이디'   ,name:'id',         width:70,  align:'center', editable:false},				// 아이디
							    {label : '제목'    ,name:'title',      width:110, align:'center', editable:false, formatter:jqGridFormatter.showResumeDetail},			// 제목
							    {label : '희망 근무지',name:'area',       width:70,  align:'center', editable:false},			// 지역 코드
							    {label : '기술 사항'    ,name:'skill',      width:70,  align:'center', editable:false},			// 직종 코드
							    {label : '등록 일자' ,name:'regDate',    width:60,  align:'center', editable:false},		// 등록 날짜
							    {label : '수정 일자' ,name:'updateDate', width:60,  align:'center', editable:false},		// 수정 날짜
							    {label : '희망 연봉' ,name:'salary',     width:60,  align:'center', editable:false},  		// 희망연봉
							    {label : '공개'    ,name:'public',     width:30,  align:'center', editable:false},			// 공개 여부
					],
				    pager       : "#resumePager",
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
					}, ondblClickRow : function(rowid, iRow, iCol){	// ondbClickRow아니다! 주의할 것!

					}, beforeSelectRow : function(e){
						
						return false;
					}, onPaging : function(event){
						
					}, loadComplete : function(data){
						/* title에 hover설정 */
						// 비동기라서 여기다 선언하지 않으면 .announcement-title는 존재하지 않는 값으로 나온다.
						hoverJqGridTitle();
						
						// ajax시 Model을 사용하는것은 의미가 없는거 같다.
						// Model은 일반적으로 한번의 Request와 Response동안만 살아있는데,  
						$('#all-page-count').text('총 이력서 수 : ' + resume.$table.jqGrid('getGridParam', 'userData').allResumes);
					}, beforeProcessing : function(response, b, c, d){	// 서버에서 데이터를 받고 그리드를 그리기전에 실행되는 이벤트 핸들러
						if(response.list.length == 0){
							alert('데이터가 존재하지 않습니다.');
							
							return false;
						}
						
						return true;;
					}
				});
			
			});
			
			/* jqGrid End */
			
			$('#id').on('keydown', function(e){
				if(key.keyCode == 13){
					$('#resume-search-btn').trigger();
		        }
			});
			
			/* 이력서 조건 검색 */
			
			$('#resume-search-btn').on('click', function(e){
				var searchData = $.jobqForm.bindInputedValues();
				
				resume.$table.jqGrid('clearGridData', true);
				resume.$table.jqGrid('setGridParam', {
					url : '<c:url value="/admin/resume/search" />',
					serializeGridData : function(postData){
						var searchParams = $.extend({}, postData, searchData);
						
						return $.param(searchParams);
					}, loadComplete : function(result){
						var memberCnt = resume.$table.jqGrid('getGridParam', 'userData');
						
						hoverJqGridTitle();
						
						$('#all-page-count').text('총 이력수 수 : ' + memberCnt.allResumes);
						$('#search-page-count').text('검색된 이력서 수 : ' + memberCnt.countSearchedResumes);				
					}, beforeProcessing : function(response, b, c){
						
						return true;
					}
				}).trigger('reloadGrid');
			});	 		
			
			/* 이력서 조건 검색 끝 */
		
			/* 이력서 수정  */
			
			/* resume.$resumeUpdateBtn.on('click', function(){
				var $updateRow = $('#resumeTable').jqGrid('getGridParam', 'selarrrow');
				if($updateRow.length == 0){
					alert('수정하실 이력서를 선택하지 않았습니다.');
					
					return ;
				}else if($updateRow.length > 1){
					alert('수정시 한 개의 컬럼만 수정이 가능합니다.');
					resume.$table.jqGrid('resetSelection');
					
					return ;
				}
				
				location.href="<c:url value='/admin/resume/update.jobq' />";
			}); */
			
			/* 이력서 수정  */
			
			/* rowList의 'all'클릭시 데이터 전체 보이기 */
			
			$('.ui-pg-selbox[role="listbox"]').on('change', function(){
				if(this.value == 'all'){
					alert(resume.$table.height);
				}	
			}); 
			
			/* rowList의 'all'클릭시 데이터 전체 보이기 끝 */
			
			/* 이력서 삭제 */
			
			$(document).on('click', '.resume-delete-btn', function(event){
				var selectedRows = [];
				var selectedCheckboxs = $(".cbox:checked");
				
				selectedCheckboxs.each(function(i, el){
					selectedRows.push($(el).parent().parent().attr('id'));	
				});
				
				if(selectedRows.length == 0){
					alert('삭제할 이력서를 선택하세요.');
					
					return ;
				}
				
				if(confirm("정말로 삭제하시겠습니까?") == false)
					return ;
				
				$.ajax({
					type    : 'DELETE',
					url     : '<c:url value="/admin/resume" />',
					headers : {
						'Content-Type' : 'application/json; charset=utf-8',
						'X-HTTP-Override-Method' : 'DELETE'
					},
					data:JSON.stringify(selectedRows),
					success:function(response){
						if(response == 'OK'){
							alert(selectedRows.length + '건의 이력서가 삭제되었습니다.');
							
							resume.$table.trigger('reloadGrid');
							return ;
						}
					}
				});
			})
			
			/* 이력서 삭제 끝 */
	</script>