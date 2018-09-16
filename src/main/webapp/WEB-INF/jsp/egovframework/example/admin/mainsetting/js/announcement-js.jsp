<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- jqGrid -->
<script src="/sample/admin/js/grid.locale-en.js"></script>
<script src="/sample/admin/js/jquery.jqGrid.min.js"></script>

<script>
		var announcement = {
				$table:$("#announcementTable"),
				$announcementDeleteBtn:$('.announcementDeleteBtn'),
				$announcementUpdateBtn:$('#announcementUpdateBtn'),
				$mainAnnouncementUpdateRow:[]
		}
		
		function hoverJqGridTitle(){
			$('.announcement-title').each(function(i, el){
				$(el).hover(function(e){
					$(this).attr('style', 'text-decoration:underline !important');
				}, function(e){
					$(this).attr('style', '');
				});
			});
		};
		
		$(document).ready(function(){
			/* 테이블 조정 */
			
			$('.table tr td').css('padding', '5px 8px');
			
			/* 테이블 조정 끝 */
			
			
			/* jqGrid */
			
			var jqGridFormatter = {};
			
			jqGridFormatter.showAnnouncementTitle = function(cellValue, options, rowData, action){
				return "<a class='announcement-title' href='<c:url value='/admin/mainsetting/announcement/detail/" + rowData.no + "' />' >" + rowData.title + "</a>";
			};
			
			// jqGrid는 JSON양식을 서버로 부터 받을 때, 반드시 root Element가 필요하다.
			announcement.$table.jqGrid({
			    url      : '<c:url value="/admin/mainsetting/announcement/list" />',
			    authwidth: true,
			    mtype    : 'get',
			    datatype : "json",
			    height   : '100%',
			    rowNum   : 10,
			    rowList  : [10,15,20],
			    colNames : ['공고 번호', '담당자 아이디', '공고 제목', '회사명', '상태', '등록 일자', '수정 일자'],
			    colModel : [	// JSON데이터의 키값과 colModel의 name의 value가 일치해야만 매핑이 된다!
						    {name:'no',          width:40,  align:'center', editable:false, key:true},	// 이력서 번호
						    {name:'id', 	     width:70,  align:'center', editable:false},				// 아이디
						    {name:'title', 	     width:120, align:'center', editable:false/* formatter:jqGridFormatter.showAnnouncementTitle  */},			// 제목
						    {name:'companyName', width:80,  align:'center', editable:false},			// 공개 여부
						    {name:'state', 		 width:80,  align:'center', editable:false},
						    {name:'regDate',	 width:70,  align:'center', editable:false},		// 등록 날짜
						    {name:'updateDate',	 width:70,  align:'center', editable:false},		// 수정 날짜
				],
			    pager       : "#announcementPager",
			    loadonce    : false,
			    gridview    : true,
			    viewrecords : true,
			    hidegrid    : false,
			    altRows     : true,
			    sortorder   : 'dsec',
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
					$('#all-page-count').text('총 메인 공고 수 : ' + announcement.$table.jqGrid('getGridParam', 'userData'));
				}
			});
			
			announcement.$table.jqGrid('navGrid','#announcementPager',{edit:false, add:false, del:false, search:false});
			$('#refresh_announcementTable').children().children().removeClass().end().text('새로 고침');
			
			/* jqGrid End */
			
			});  
			
		/* 메인 공고 삭제 */
		
		$(document).on('click', '.announcementDeleteBtn', function(event){
			event.preventDefault();
			
			var selectedRows = [];
			var selectedCheckboxs = $(".cbox:checked");
			var deleteAnnouncementsLength = selectedRows.length;
			
			selectedCheckboxs.each(function(i, el){
				selectedRows.push($(el).parent().parent().attr('id'));	
			});
			deleteAnnouncementsLength = selectedRows.length;
			
			if(deleteAnnouncementsLength == 0){
				alert('삭제하실 공고를 선택하세요.');
				
				return ;
			}
			
			if(confirm("정말로 삭제하시겠습니까?") == false)
				return ;
			
			$.ajax({
				type : 'delete',
				url : '<c:url value="/admin/mainsetting/announcement/list" />',
				headers : {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'DELETE'
				},
				dataType : 'text',
				data : JSON.stringify(selectedRows),
				success : function(result){
					if(result == 'SUCCESS'){
						alert(deleteAnnouncementsLength + '건의 데이터가 삭제되었습니다.');
						announcement.$table.trigger("reloadGrid");
					}
				}
				
			})
		});
		
		/* 메인 공고 삭제 끝 */
		
		/* 메인 공고 수정(HOT 채용정보 / 스폐셜 채용정보) */
		
		$('#announcement-update-Btn').click(function(){
			var selectedRows = [];
			var selectedCheckboxs = $(".cbox:checked");
			
			selectedCheckboxs.each(function(i, el){
				announcement.$mainAnnouncementUpdateRow.push($(el).parent().parent().attr('id'));	
			});
			
			if(announcement.$mainAnnouncementUpdateRow.length == 0){
				alert('수정할 공고를 선택하지 않았습니다.');
				
				return ;
			}
			
        	$('.special-hot-confirm').modal();
    	});
    	
    	$('.special-hot-confirm').find('.padd').children().on('click', function(e){
    		// 모달창 닫기 => 위치를 무조건 이쪽에 두어야 한다.
    		// 왜냐하면, announcement.$table.trigger("reloadGrid");와 같은 ajax와 겹칠 경우 모달창이 묻혀버려서 닫히지가 않는다.
    		$('.special-hot-confirm').modal('toggle');	
    		
    		var announcementName = '';
    		if(this.innerText == '스폐셜 채용 공고')
    			announcementName = '스폐셜';
    		else if(this.innerText == 'HOT 채용 공고')
    			announcementName = '핫';
    		else
    			announcementName = '미등록';
    		
    			announcement.sendToServerWithUpdateNumbers('<c:url value="/admin/mainsetting/announcement/list" />', announcementName);
    	});
    	
    	announcement.sendToServerWithUpdateNumbers = function(url, state){
    		var updateData = {
    				'updateList' : announcement.$mainAnnouncementUpdateRow,
    				'state' : state
    		};
    			
    		$.ajax({
    			type : 'put',
    			url : url,
    			headers : {
    				'Content-Type' : 'application/json',
    				'X-HTTP-Method-Override' : 'PUT'
    			},
    			data:JSON.stringify(updateData),
    			success:function(data){
    				if(data == 'SUCCESS'){
    					alert(announcement.$mainAnnouncementUpdateRow.length + '건 의 데이터가 변경되었습니다.');
    					announcement.updateAnnouncementState();		// 테이블을 리로드한다.
    				}
    				
    			},error : function(x, s, r){
    				console.dir(x);
    				console.dir(s);
    				console.dir(r);
    			}
    		})
    	};
    	
    	announcement.updateAnnouncementState = function(){
    		announcement.$mainAnnouncementUpdateRow = [];
    		
    		announcement.$table.trigger("reloadGrid");
    	};
    	
		/* 메인 공고 수정 끝 */
		
		/* 검색 버튼 클릭 */
			
		$('#announcementSearchBtn').on('click', function(e){
			var searchValues = $.jobqForm.bindInputedValues();
			
			if(Object.keys(searchValues).length == 0){
				alert('검색할 조건들을 입력하세요.');
				
				return ;
			}
				
			announcement.$table.jqGrid('clearGridData', true);
			announcement.$table.jqGrid('setGridParam', {
				url : '<c:url value="/admin/mainsetting/announcement/search" />',
				serializeGridData : function(postData){
					var searchParams = $.extend({}, postData, searchValues);
					
					console.dir(searchValues);
					
					return $.param(searchParams);
				}, loadComplete : function(result){
					var announcementCnt = announcement.$table.jqGrid('getGridParam', 'userData');
					
					hoverJqGridTitle();
					
					$('#all-page-count').text('총 메인 공고 수 : ' + announcementCnt.allAnnouncements);
					$('#search-page-count').text('검색된 메인 공고 수 : ' + announcementCnt.countSearchedAnnouncements);				
				}
			}).trigger('reloadGrid');
		});
		
		/* 검색 버튼 클릭 끝 */
		
    	</script>