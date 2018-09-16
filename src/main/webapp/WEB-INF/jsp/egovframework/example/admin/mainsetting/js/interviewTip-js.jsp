<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Javascript files -->

<!-- jqGrid -->
<script src="/sample/admin/js/grid.locale-en.js"></script>
<script src="/sample/admin/js/jquery.jqGrid.min.js"></script>

<script>
		var interview = {
				$table:$("#interview-table"),
				$interviewDeleteBtn:$('.interviewDeleteBtn'),
				$interviewUpdateBtn:$('#interviewUpdateBtn'),
				$interviewAddBtn:$('#interview-add-btn'),
				$mainNoticeAddRow:[]
		}
		
		function hoverJqGridTitle(){
			$('a[data-role-detail="title"]').each(function(i, el){
				$(el).hover(function(e){
					$(this).attr('style', 'text-decoration:underline !important');
				}, function(e){
					$(this).attr('style', '');
				})
			});
		}
		
		$(document).ready(function(){
			/* 테이블 조정 */
			
			$('.table tr td').css('padding', '5px 8px');
			
			/* 테이블 조정 끝 */
			
			
			/* jqGrid */
			
			var jqGridFormatter = {};
			
			jqGridFormatter.showResumeDetail = function(cellValue, options, rowData, action){
				return "<a href='<c:url value='/admin/mainsetting/interview/detail/" + rowData.no + "' />' data-role-detail='title'>" + rowData.content + "</a>";
			}
			
			interview.$table.jqGrid({
				url      : '<c:url value="/admin/mainsetting/interview/list" />',
			    mtype    : 'get',
			    datatype : "json",
			    authwidth: true,
			    height   : '100%',
			    rowNum   : 10,
			    rowList  : [10,15,20],
			    colModel : [	// JSON데이터의 키값과 colModel의 name의 value가 일치해야만 매핑이 된다!
						    {label:'번호'       ,name:'no',          width:30,  align:'center', editable:false, key:true},	// 이력서 번호
						    {label:'내용'       ,name:'content',     width:170, align:'center', editable:false, formatter:jqGridFormatter.showResumeDetail},			// 제목
						    {label:'등록 일자'    ,name:'regDate',     width:80,  align:'center', editable:false},		// 등록 날짜
						    {label:'수정 일자'    ,name:'updateDate',  width:80,  align:'center', editable:false},		// 수정 날짜
						    {label:'사용 여부'    ,name:'use',         width:70,  align:'center', editable:false},			// 공개 여부	
				],
			    pager       : "#interview-pager",
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
				ondblClickRow : function(rowid, iRow, iCol){	// ondbClickRow아니다! 주의할 것!
					alert('efef');
				}, beforeSelectRow : function(e){
					return false;
				}, loadComplete : function(data){
					hoverJqGridTitle();
					
					$('#all-page-count').text('총 면접 TIP 수 : ' + interview.$table.jqGrid('getGridParam', 'userData'));
				}
			});
			
			interview.$table.jqGrid('navGrid','#interview-pager',{edit:false, add:false, del:false, search:false});
			$('#refresh_interview-table').children().children().removeClass().end().text('새로 고침');
			
			/* jqGrid End */
			
		});
		
		/* 메인 공고 수정  */
		
		interview.$interviewUpdateBtn.on('click', function(){
			var selectedRows = [];
			var selectedCheckboxs = $(".cbox:checked");
			
			selectedCheckboxs.each(function(i, el){
				selectedRows.push($(el).parent().parent().attr('id'));	
			});
			
			if(selectedRows.length == 0){
				alert('수정하실 컬럼을 선택하지 않았습니다.');
				
				return ;
			}else if($updateRow.length > 1){
				alert('수정시 한 개의 컬럼만 수정이 가능합니다.');
				interview.$table.jqGrid('resetSelection');
				
				return ;
			}
			
			location.href="<c:url value='/admin/resume/update.jobq' />";
		});
		
		/* 메인 공고 수정 끝 */
		
		/* 메인 공고 삭제 */
		
		$(document).on('click', '.interview-delete-btn', function(event){
			event.preventDefault();
			
			var selectedRows = [];
			var selectedCheckboxs = $(".cbox:checked");
			
			selectedCheckboxs.each(function(i, el){
				selectedRows.push($(el).parent().parent().attr('id'));	
			});
			
			if(selectedRows.length == 0){
				alert('삭제하실 공고를 선택하세요.');
				
				return ;
			}
			
			if(confirm("정말로 삭제하시겠습니까?") == false)
				return ;
			
			$.ajax({
				type : 'delete',
				url : '<c:url value="/admin/mainsetting/interview/list" />',
				headers : {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'DELETE'
				},
				dataType : 'text',
				data : JSON.stringify(selectedRows),
				success : function(result){
					if(result == 'SUCCESS'){
						alert(selectedRows.length + '건의 데이터가 삭제되었습니다.');
						interview.$table.trigger("reloadGrid");
					}
				}
			});
		});
		
		/* 메인 공고 삭제 끝 */
		
		/* 면접 Tip 추가 */
		
		$('#interview-add-btn').click(function(){
			location.href="<c:url value='/admin/mainsetting/interview/addpage' />";
    	});
    
		/* 면접 Tip 추가 끝 */
		
		$('#interview-search-btn').on('click', function(e){
			var searchData = $.jobqForm.bindInputedValues();
			
			if(Object.keys(searchData).length == 0){
				alert('검색할 조건을 입력하세요.');
				
				return ;
			}
			
			interview.$table.jqGrid('clearGridData', true);
			interview.$table.jqGrid('setGridParam', {
				url : '<c:url value="/admin/mainsetting/interview/search" />',
				serializeGridData : function(postData){
					var searchParams = $.extend({}, postData, searchData);
					
					return $.param(searchParams);
				}, loadComplete : function(result){
					var interviewCnt = interview.$table.jqGrid('getGridParam', 'userData');
					
					hoverJqGridTitle();
					
					$('#all-page-count').text('총 면접 TIP 수 : ' + interviewCnt.allInterviews);
					$('#search-page-count').text('검색된 면접 TIP 수 : ' + interviewCnt.countSearchedInterviews);				
				}
			}).trigger('reloadGrid');
		}); 
		
    	</script>