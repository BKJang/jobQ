<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
th{
	text-align: center;
	font-size: 13px;
}
td{
	text-align: center;	
}

</style>
<section class="wrapper">
	<section class="page_head">
		
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="page_title">
						<h2>공고관리</h2>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="content elements">
		<div class="container">
			<div class="container">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="dividerHeading">
						<h4>
							<span>일반 채용정보</span> <span class="bar_gray"> | </span><span
								class="total_top"><c:out value="${ListCount}"></c:out>건</span>
						</h4>
					</div>
				</div>
				<div class="edge-tab sidebar-tab">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#Popular" data-toggle="tab" onclick="goPage('a','1')">전체</a></li>
						<li class=""><a href="#Recent" data-toggle="tab" onclick="goPage('i','1')">게재중</a></li>
						<li class=""><a href="#Announce_End" data-toggle="tab" onclick="goPage('f','1')">마감</a></li>
					</ul>
					
					<div class="tab-content clearfix">
						<div class="tab-pane fade active in" id="Popular">
							<jsp:include page="/WEB-INF/jsp/egovframework/example/company/job_manage/all.jsp">
								<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
							    <jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
							    <jsp:param name="startPageNo" value="${paging.startPageNo}" />
							    <jsp:param name="pageNo" value="${paging.pageNo}" />
							    <jsp:param name="endPageNo" value="${paging.endPageNo}" />
							    <jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
							    <jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
							</jsp:include>
						</div>


						<!-- 게시중 -->
						<div class="tab-pane fade" id="Recent">
							<jsp:include page="/WEB-INF/jsp/egovframework/example/company/job_manage/ing.jsp">
								<jsp:param value="0" name="closing" />
							</jsp:include>
						</div>

						<!-- 게재종료 -->
						<div class="tab-pane fade" id="Announce_End">
							<jsp:include page="/WEB-INF/jsp/egovframework/example/company/job_manage/end.jsp">
								<jsp:param value="1" name="closing"/>
							</jsp:include>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</section>

<form id="frm_app" name="frm_app" method="post">
	<input type="hidden" id="selectOne"  name="selectOne" /> 
	<input type="hidden" id="appState" name="appState" /> 
	<input type="hidden" id="selectTwo" name="selectTwo" />
	<input type="hidden" id="gonggoNum" name="gonggoNum" />
</form>
<form id="frm_job" name="frm_job" method="get">
	<input type="hidden" id="pageName"  name="pageName" /> 
	<input type="hidden" id="gonggoID" name="gonggoID" />
</form>


<script type="text/javascript">

	$(document).ready(function(){
		
		/* 모든 체크박스 클릭시 처리하기 */
		$(".topCheck").click(function(){
			
			if (!$(this).prop("checked")) {
				$(this).parent().parent().parent().next().children().find("[type='checkbox']").prop("checked", false);
			}else{
				$(this).parent().parent().parent().next().children().find("[type='checkbox']").prop("checked", true);
			}
		});
		
	});
	
	/* 공고 디테일 페이지 이동 */
	var joblist = {
			
			jobDetailFn : function(pageName, gonggoNum) {
		
				$("#pageName").val(pageName);
				$("#gonggoID").val(gonggoNum);
				
				$("#frm_job").attr("action", pageName + ".jobq");
	
				$("#frm_job").submit();
			
			}
	};
	
	/* 지원자 현황으로 페이지 이동 */
	var applist = {
			
			appDetailFn : function(appstate, gonggoNum, selectOne) {
		
			$("#appState").val(appstate);
			$("#gonggoNum").val(gonggoNum);
			$("#selectTwo").val(gonggoNum);
			if (selectOne == 0) {
				$("#selectOne").val("게재중");
			}else{
				$("#selectOne").val("마감");
			}
			
			$("#frm_app").attr("action", "companyApplicants.jobq");

			$("#frm_app").submit();
		}
	};
	
	 
	/* 마감 - 게재 처리 */
	var change = 
	{
		changeClosing : function(gonggoNum, change, FCGubun, pageNum){
			
			if (change == 0) {
				if(confirm("다시 게재 하시겠습니까?")){
					/*  */
				}else{
					return false;
				}
			}else{
				if(!confirm("마감 하시겠습니까?")){
					return false;
				}
			}
			ajaxC.ajaxCallFn({url: "closing.jobq", FCGubun: FCGubun, gonggoNum : gonggoNum, changeNum: change});
			//goPage(FCGubun, pageNum);
		},
	};
	
	
	var ajaxC = 
	{	
		/* 마감과 게재 처리 */
		ajaxCallFn : function(options){
			
			var settings = {
					url: "closing.jobq",
					FCGuBun: "F",
					gonggoNum : "",
					changeNum : "0",
			}
			
			settings = $.extend({}, settings, options);
			
			$.ajax({
				
				type		: "POST",
				url			: settings.url,
				data		: {"gonggoNum" : settings.gonggoNum,
					"changeNum" : settings.changeNum},
				async		: false,
				success		: function(result){
					
					//마감이라는 글씨가 사라지고 다시 게재 나오도록
					$("#" + settings.gonggoNum).children(".closingTD").children().remove();
					
					if (settings.changeNum == "0") {
						
						$("#" + settings.gonggoNum).children(".closingTD").append('<a href="#" onclick="javascript:joblist.jobDetailFn(\'gonggoEdit\',' + settings.gonggoNum + ')" style="cursor:pointer">수정 /</a><a onclick="change.changeClosing(' + settings.gonggoNum + ', 1)" style="cursor:pointer"> 마감</a>');
						$("#EndTable").children("#" + settings.gonggoNum).remove();
						$("#" + settings.gonggoNum).css("background-color","");
					}else{
						
						$("#" + settings.gonggoNum).children(".closingTD").append('<a onclick="change.changeClosing(' + settings.gonggoNum + ', 0)" style="cursor:pointer"> 다시게재 </a>');
						$("#IngTable").children("#" + settings.gonggoNum).remove();
						$("#" + settings.gonggoNum).css("background-color","#F0B3C0");
					}
				},
				error		: function(error){
					
					alert("마감일이 이미 지나 게재할 수 없습니다.");
					if (confirm("마감일을 수정하시겠습니까?")) {
						
						joblist.jobDetailFn('gonggoEdit',settings.gonggoNum);
					}
				}
			});
		},

		/* 행지우기 다중마감처리 */
		ajaxDelete : function(options){
			
			var settings = {
					url: "deleteGonggo.jobq",
					FCGubun: "",
					gonggoNum : "",
					closingNum : "0",
			}
			
			settings = $.extend({}, settings, options);
			
			$.ajax({
				
				type		: "POST",
				url			: settings.url,
				data		: {"gonggoNum" : settings.gonggoNum,
					"FCGubun" : settings.FCGubun,
					"closingNum" : settings.closingNum },
				async		: false,
				success		: function(result){
					
					var arr = settings.gonggoNum.split(",");
					var count = arr.length;
					
					if (settings.FCGubun == "a" || settings.FCGubun == "i" || settings.FCGubun == "f") {
						for ( var i in arr) {
							$("#" + arr[i]).remove();
						}
						
						var test = $(".total_top").text().substring(0,$(".total_top").text().length-1)*1;
						/* 상단 공고 갯수 설정 */
						$(".total_top").text(($(".total_top").text().substring(0,$(".total_top").text().length-1) - count) + "건");
						alert(count + "건을 삭제했습니다.");
					}else if (settings.FCGubun == "fc") {
						alert(count + "건을 게재했습니다.");
					}else{
						alert(count + "건을 마감했습니다.");
					}
				},
				error		: function(){
				},
			
			})
		},
		
		/* 페이징 처리하기  */
		makePaging : function(options){
			
			var settings = {
					url: "makePaging.jobq",
					FCGuBun: "",
					pageNum : "0",
					pageSize : "10"
			}
			
			settings = $.extend({}, settings, options);
			
			$.ajax({
				
				type		: "POST",
				url			: settings.url,
				data		: {"pageNum" : settings.pageNum,
					"FCGuBun" : settings.FCGuBun, "pageSize" : settings.pageSize},
				async		: false,
				success		: function(result){

					var jsonRes = JSON.parse(result);
					var pagingMenu="";
					
					$.each(jsonRes, function(i, item){
						pagingMenu += '<li class="paginate_button previous" id="example2_previous" style="cursor:pointer">'
								+ '<a onclick="javascript:goPage(\'' + settings.FCGuBun + '\',' + item.prevPageNo + ')" aria-controls="example2" data-dt-idx="0" tabindex="0">이전</a>'
								+ '</li>';
								
								for (var i = item.startPageNo; i <= item.endPageNo; i++) {
									if (i == item.pageNo) {
										pagingMenu += '<li class="paginate_button active paging_' + i + '" style="cursor:pointer"><a onclick="javascript:goPage(\''+ settings.FCGuBun +'\',' + i + ')" aria-controls="example2" data-dt-idx="1" tabindex="0">' + i + '</a></li>';
									} else {
										pagingMenu += '<li class="paginate_button paging_' + i + '" style="cursor:pointer"><a onclick="javascript:goPage(\''+ settings.FCGuBun +'\',' + i + ')" aria-controls="example2" data-dt-idx="1" tabindex="0">' + i + '</a></li>';
									}
								};
						pagingMenu +=	'<li class="paginate_button next" id="example2_next" style="cursor:pointer">'
								+ '<a onclick="javascript:goPage(\''+ settings.FCGuBun +'\',' + item.nextPageNo + ')" aria-controls="example2" data-dt-idx="7" tabindex="0">다음</a>'
								+ '</li>';	
					});
										
					/* 페이징 어디다 뿌리지 */
					if (settings.FCGuBun == "a") {
						$("#PopularPaging").children().remove();
						$("#PopularPaging").append(pagingMenu);
						$(".allDelete").attr("onclick","deleteGonggo(\'" + settings.FCGuBun + "\'," + settings.pageNum + ")");
						$(".allClose").attr("onclick","closingGonggo('ac'," + settings.pageNum + ")");
					}else if (settings.FCGuBun == "i") {
						$("#RecentPaging").children().remove();
						$("#RecentPaging").append(pagingMenu);
						$(".ingDelete").attr("onclick","deleteGonggo(\'" + settings.FCGuBun + "\'," + settings.pageNum + ")");
						$(".ingClose").attr("onclick","closingGonggo('ic'," + settings.pageNum + ")");
					}else{
						$("#Announce_EndPaging").children().remove();
						$("#Announce_EndPaging").append(pagingMenu);
						$(".endDelete").attr("onclick","deleteGonggo(\'" + settings.FCGuBun + "\'," + settings.pageNum + ")");
					}
					$(".chageCountList").attr("onchange", "goPage(\'" + settings.FCGuBun + "\'," + settings.pageNum + ")");
					
					/* 페이징 어디다 뿌리지 */
				},
				error		: function(){ 
				},
			
			})
		},
		
		/* 페이지 이동 제일 중요한 부분이 되겠군*/
		changePaging : function(options){
			
			var settings = {
					url: "changeMenu.jobq",
					FCGuBun: "",
					pageNum : "0",
					pageSize : "10"
			};
			
			settings = $.extend({}, settings, options);
			
			$.ajax({
				
				type		: "POST",
				url			: settings.url,
				data		: {"pageNum" : settings.pageNum,
					"FCGuBun" : settings.FCGuBun, "pageSize" : settings.pageSize},
				async		: false,
				success		: function(result){
					
					var jsonRes = JSON.parse(result);
					var strMenu="";
					var count = 0;
					
					$.each(jsonRes, function(i, item){ 
	                    
	                    var today = new Date(item.dateRegi);  // 자바스크립에서 원하는 형태로 사용가능
	                    var RegiDate = today.getFullYear()+ "-" + (("0" + (today.getMonth() + 1)).slice(-2)) + "-" + (("0" + today.getDate()).slice(-2));
	                    today = new Date(item.dateClose);
	                    var CloseDate = today.getFullYear()+ "-" + (("0" + (today.getMonth() + 1)).slice(-2)) + "-" + (("0" + today.getDate()).slice(-2));
	                    
								if (item.closing == 1) {
        							strMenu += '<tr id="' + item.jobNumber + '" style="background-color: #F0B3C0">'
								}else if(item.closing == 0){
									strMenu += '<tr id="' + item.jobNumber + '" >'
								}
						strMenu += '<td><input class="deleteCheck" type="checkbox" name="chk_info" value="' + item.jobNumber + '"></td>'
        						+ '<td>' + item.jobNumber + '</td>'
        						+ '<td><a href="#" onclick="javascript:joblist.jobDetailFn(\'jobDetail\',' + item.jobNumber + ')">'
        						+ '<strong class="ann_name">[' + item.area + ' / ' + item.nameWp + ']</strong> ' + item.title
        						+ '</a></td>'
        						+ '<td>' + RegiDate + '~' + CloseDate + '</td>'
        						/* + '<td>' + item.hits  + '</td>' */
        						+ '<td><a href="#" onclick="javascript:applist.appDetailFn(\'Recent\',' + item.jobNumber + ',' + item.closing + ')">미열람  ' + item.allcount + '/ </a> '
        						+ '<a href="#" onclick="javascript:applist.appDetailFn(\'Popular\',' + item.jobNumber + ',' + item.closing + ')"> 전체 ' + item.unreadcount + ' </a> </td>'
        						+ '<td class="' + item.jobNumber + ' closingTD">';
        						if (item.closing == 0) {
									
        							strMenu += '<a href="#" onclick="javascript:joblist.jobDetailFn(\'gonggoEdit\',' + item.jobNumber + ')">수정 /</a>'
            						+ '<a onclick="javascript:change.changeClosing(' + item.jobNumber + ', 1, \'' + settings.FCGuBun + '\', ' + settings.pageNum +')" style="cursor: pointer;"> 마감</a>'
								}else if(item.closing == 1){
									
									strMenu += '<a onclick="change.changeClosing(' + item.jobNumber + ', 0, \'' + settings.FCGuBun + '\', ' + settings.pageNum +')" style="cursor: pointer;"> 다시게재 </a>'
								}
        				strMenu += '</td></tr>';
        				count++;
					});
					
					/* 리스트 어디다 뿌리지 */
					if (settings.FCGuBun == "a") {
						$("#Popular").find("tbody").children().remove();
						$("#Popular").find("tbody").append(strMenu);
					}else if (settings.FCGuBun == "i") {
						$("#Recent").find("tbody").children().remove();
						$("#Recent").find("tbody").append(strMenu);
					}else{
						$("#Announce_End").find("tbody").children().remove();
						$("#Announce_End").find("tbody").append(strMenu);
					}
					/* 리스트 어디다 뿌리지 */
					
					/* 탭 이동시  탭 체크*/
					$(".topCheck").prop("checked", true);
					$(".topCheck").click();
					/* 탭 이동시  탭 체크*/
				},
				error		: function(){
					alert("이상이상");
				}
			});
		},
	};
	
	function goPage(FCGuBun, pageNum){
		
		ajaxC.changePaging({url: "changeMenu.jobq", FCGuBun: FCGuBun, pageNum : pageNum, pageSize : $("#" + FCGuBun + "chageCountList").children("option:selected").val()});
		ajaxC.makePaging({url: "makePaging.jobq", FCGuBun: FCGuBun, pageNum : pageNum, pageSize : $("#" + FCGuBun + "chageCountList").children("option:selected").val()});
	};
	
	/* 삭제 버튼 처리(수정2) 마감도 처리가능하게 바꾸기 */
	function deleteGonggo(FCGubun, pageNum){
		
		var gonggoNumArr = "";
		var gonggoNumArr1 = [];
		
		if (confirm("삭제하시겠습니까?")) {
			
			$(".deleteCheck").each(function(){
				
				if ($(this).prop("checked")) {
					/* gonggoNumArr1.push($(this).val()); */
					if (gonggoNumArr != "") {
						
						gonggoNumArr += ",";
					}
					gonggoNumArr += $(this).val();
				}
			});
			
			/* console.dir(JSON.stringify(gonggoNumArr1)); */
			if (gonggoNumArr == '') {
				alert("삭제할 공고를 선택해 주세요");
			}else{
				ajaxC.ajaxDelete({url: "deleteGonggo.jobq", FCGubun: FCGubun, gonggoNum : gonggoNumArr});	
				goPage(FCGubun, pageNum);
			}
		}
	};
	
	/* 마감 처리 */
	function closingGonggo(FCGubun, pageNum){
		
		var gonggoNumArr = "";
		var closingNum = "1";  
		
		if (confirm("상태를 변경하시겠습니까?")) {
			
			$(".deleteCheck").each(function(){
				
				if ($(this).prop("checked") && $(this).parent().parent('tr').attr("style")== undefined) { 
					if (gonggoNumArr != "") {
						
						gonggoNumArr += ",";
					} 
					gonggoNumArr += $(this).val();
				}
			});
			
			if (gonggoNumArr == '') {
				alert("마감할 공고를 선택해 주세요");
			}else{
				if (FCGubun == 'fc') {
					closingNum = 0;
				}
				ajaxC.ajaxDelete({url: "deleteGonggo.jobq", FCGubun: FCGubun, gonggoNum : gonggoNumArr, closingNum : closingNum});	
			}
			goPage(FCGubun.substring(0, 1), pageNum);
		}
	};
	
</script>