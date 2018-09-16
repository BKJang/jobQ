<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Javascript files -->

<!-- jqGrid -->
<script src="/sample/admin/js/grid.locale-en.js"></script>
<script src="/sample/admin/js/jquery.jqGrid.min.js"></script>

<script>
		var employ = {
				$table:$("#employTable"),
				$employDeleteBtn:$('.employDeleteBtn'),
				$employAddBtn:$('#employAddBtn'),
				$mainNoticeAddRow:[]
		};
		
		function hoverJqGridTitle(){
			$('a[data-role-detail="title"]').each(function(i, el){
				$(el).hover(function(e){
					$(this).attr('style', 'text-decoration:underline !important');
				}, function(e){
					$(this).attr('style', '');
				})
			});
		};	
		
		$(document).ready(function(){
			/* 테이블 조정 */
			
			$('.table tr td').css('padding', '5px 8px');
			
			/* 테이블 조정 끝 */
			
			
			/* jqGrid */
			
			var jqGridFormatter = {};
			
			jqGridFormatter.showEmployDetail = function(cellValue, options, rowData, action){
				return "<a href='<c:url value='/admin/employ/detail/" + rowData.no + "' />' data-role-detail='title'>" + rowData.title + "</a>";
			}
			
			employ.$table.jqGrid({
				url      : '<c:url value="/admin/employ/list" />',
			    authwidth: true,
			    mtype    : 'get',
			    datatype : "json",
			    height   : '100%',
			    rowNum   : 10,
			    rowList: [10,15,20],
			    colModel:[	
						    {label:'공고 번호',    name:'no', width:50, align:'center', editable:false, key:true},	// 이력서 번호
						    {label:'담당자 아이디',  name:'id', width:100, align:'center', editable:false},				// 아이디
						    {label:'공고 제목',    name:'title', width:180, align:'center', editable:false, formatter:jqGridFormatter.showEmployDetail},			// 제목
						    {label:'회사명',      name:'companyName', width:120, align:'center', editable:false},			// 공개 여부
						    {label:'고용 형태',    name:'typeEmploy', width:80, align:'center', editable:false},
						    {label:'학력',       name:'academic', width:45, align:'center', editable:false},			// 직종 코드
						    {label:'경력',       name:'career', width:60, align:'center', editable:false},
						    {label:'등록 일자',    name:'regDate', width:60, align:'center', editable:false},		// 등록 날짜
						    {label:'마감 여부',    name:'closing', width:60, align:'center', editable:false}		// 수정 날짜
				],
			    pager       : "#employPager",
			    loadonce    : false,
			    gridview    : true,
			    viewrecords : true,
			    hidegrid    : false,
			    altRows     : true,
			    loadtext    : "",
				multiselect : true,
				resizable   : true,
				hoverrows   : false,
				jsonReader  : {
					page        : 'page',
					total       : 'total',
					root        : 'list',
					userdata    : 'userData',
					repeatitems : false
				}, ondblClickRow:function(rowid, iRow, iCol){	// ondbClickRow아니다! 주의할 것!

				}, beforeSelectRow:function(e){
					return false;
				}, onPaging : function(event){
					
				}, loadComplete : function(data){
					/* title에 hover설정 */
					// 비동기라서 여기다 선언하지 않으면 .announcement-title는 존재하지 않는 값으로 나온다.
					hoverJqGridTitle();
					
					// ajax시 Model을 사용하는것은 의미가 없는거 같다.
					// Model은 일반적으로 한번의 Request와 Response동안만 살아있는데,  
					$('#all-page-count').text('총 구인 공고 수 : ' + employ.$table.jqGrid('getGridParam', 'userData').allEmploys);
				}
			});
			
			/* jqGrid End */
		});
		
		/* 채용 공고 삭제 */
		
		$(document).on('click', '.employDeleteBtn', function(event){
			event.preventDefault();
			
			var selectedRows = [];
			var selectedCheckboxs = $(".cbox:checked");
			var deleteEmploysLength = selectedRows.length;
			
			selectedCheckboxs.each(function(i, el){
				selectedRows.push($(el).parent().parent().attr('id'));	
			});
			deleteEmploysLength = selectedRows.length;
			
			if(deleteEmploysLength == 0){
				alert('삭제하실 공고를 선택하세요.');
				
				return ;
			}
			
			if(confirm("정말로 삭제하시겠습니까?") == false)
				return ;
			
			for(var i = deleteEmploysLength - 1 ; i >= 0 ; i--)
				employ.$table.jqGrid('delRowData', selectedRows[i]);
			
			$.ajax({
				type:'post',
				url:'<c:url value="/admin/mainsetting/employ/delete.jobq" />',
				contentType:'applicaion/json; charset=utf8',
				data:JSON.stringify(selectedRows),
				dataType:'json'
				/* success:function(response){
					
				} */
			})
		});
		
		/* 채용 공고 삭제 끝 */
		
		/* 채용 공고 추가 */
		
		$('#employAddBtn').click(function(){
			location.href="<c:url value='/admin/employ/addpage' />";
    	});
    
		/* 채용 공고 추가 끝 */
	
		/* 채용 검색 버튼 */
		
		// 검색을 할 때 데이터가 없을 경우 대처하는 방법은 지금 나의 짧은 생각으로는 2가지가 존재하는거 같다.
		// 1. 검색에 일치하는 데이터가 없을 경우, 경고창으로 '데이터가 존재하지 않습니다.'라고 알리는것
		// 2. 검색에 일치하는 데이터가 없을 경우, 구글처럼 일치하는 데이터가 없다는 텍스트로 넣어주는것
		// 사실 2개는 같은 원리로 작동하지만, 아웃풋만 약간 다른거 같다.
		$('#employ-search-btn').on('click', function(e){
			var searchData = $.jobqForm.bindInputedValues();
			var preSearchData = 
			
			searchData.page = 1;
			searchData.rows = employ.$table.jqGrid('getGridParam', 'rowNum');
			
			employ.$table.jqGrid('setGridParam', {page : 1});	// 검색시 1페이지로 고정
			$.ajax({
				type : 'GET',
				url  : '<c:url value="/admin/employ/search" />?' + $.param(searchData),
				success : function(result){
					if(result.userData.countSearchedEmploys == 0){
						alert('검색과 일치하는 데이터가 존재하지 않습니다.');
						
						return ;
					}else{
						// 'clearGridData'를 하지 않으면 그리드를 지우지 않는다.
						// 검색 실패시 clearGridData를 안하고 그전값으로 유지해야 한다.
						/* employ.$table.jqGrid('clearGridData', true); */	
						employ.$table.jqGrid('setGridParam', {	// 'setGridParam'을 url을 설정만한 상태에서 아직 반영이 안된것이다. trigger.('reloadGrid')를 해야한다.
							// 'setGridParam'도 ajax를 기반으로 하는것으로 비동기이다!!
							url : '<c:url value="/admin/employ/search" />',
							serializeGridData : function(postData){
								// var searchParams = $.extend({}, postData, searchData);	// 뒤에께 앞에 꺼를 덮어씌운다.
								var searchParams = $.extend({}, searchData, postData);
								
								return $.param(searchParams);
							}, loadComplete : function(result){
								var memberCnt = employ.$table.jqGrid('getGridParam', 'userData');
								
								hoverJqGridTitle();
								
								$('#all-page-count').text('총 공고 수 : ' + memberCnt.allEmploys);
								$('#search-page-count').text('검색된 공고 수 : ' + memberCnt.countSearchedEmploys);
							}, beforeProcessing : function(response, b, c){
								/* if(response.userData.countSearchedEmploys == 0){

									// 데이터가 없다면 다음 단계로 넘어가지 않고 여기서 끝낸다.
									return false;					
								} */
								
								return true;
							}
						}).trigger('reloadGrid');
					}
				}
				
			});		
			
			
		});
		
		/* 채용 검색 버튼 끝 */
    	</script>