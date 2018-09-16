<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
	
	$(document).ready(function(){
		
		
		$("#selOne").val("${selectOne}");
		
		$("#appState").val("${appState}");
		
		$("#" + "${appState}").addClass("active in");
		
		$("#selTwo").val("${selectTwo}");
		
		//탭처리 
		$("#nav-tabs").children().removeClass("active");
		
		$.each($("#nav-tabs").children(), function( key, value ) {
			
			if ($(this).children().attr("href") == "#" + "${appState}") {
				$(this).addClass("active");
			}
		});
	});
	
	function closingChange(){
		
	    var val = $("#selOne").val();
	    $("#selTwo").children().remove();
	    
	    if (val == '전체') {
	    	ajaxC.changeMenu({url: "changeSelectMenu.jobq", closingNum : "2"});
		}else if(val == '게재중'){
	    	ajaxC.changeMenu({url: "changeSelectMenu.jobq", closingNum : "0"});
	    }else if(val == '마감'){
	    	ajaxC.changeMenu({url: "changeSelectMenu.jobq", closingNum : "1"});
	    }
	} 
	
	function checkState(appId, changeNum, pageNum){
		
		if (confirm("상태를 변경하시겠습니까?")) {
			ajaxC.changeState({url: "changeStateCheck.jobq", appId : appId, changeNum : changeNum, pageNum:pageNum});
		}
	} 
	
	var ajaxC = 
	{	
		/* 전체 게시중 마감 공고 멀티 셀렉트 처리 */
		changeMenu : function(options){
			
			var that = this;
			var settings = {
					url: "changeSelectMenu.jobq",
					closingNum : "0",
			}
			
			settings = $.extend({}, settings, options);
			
			$.ajax({
				
				type		: "POST",
				url			: settings.url,
				data		: {"closingNum" : settings.closingNum},
				async		: false,
				success		: function(result){

					var jsonRes = JSON.parse(result); 
					var strMenu = strMenu = '<option>공고룰 선택해주세요</option><option value="0">전체 공고</option>';
					var count = 0;
					
					if (settings.closingNum == 0) {
						strMenu = '<option>공고 선택하기</option><option value="0">전체 공고</option>'
					} else if(settings.closingNum == 1){
						strMenu = '<option>공고 선택하기</option><option value="0">전체 공고</option>'
					}
					
					$.each(jsonRes, function(i, item){ 
						strMenu += '<option value="' + item.jobNumber + '">[' + item.area + '/' + item.nameWp +']' + item.title + '</option>'
					});
					
					$("#selTwo").append(strMenu);
				},
				
				error		: function(){
					alert("이상이상");
				}
			});
		},
		
		/* 합격 여부 처리 */
		changeState : function(options){
			
			var settings = {
					url: "changeStateCheck.jobq",
					changeNum : "0",
					appId : "",
					pageNum : "1",
			}
			
			settings = $.extend({}, settings, options);
			
			$.ajax({
				
				type		: "POST",
				url			: settings.url,
				data		: {"changeNum" : settings.changeNum,
					"appId" : settings.appId},
				async		: false,
				success		: function(result){
					
					var changeState = "";
					$("."+settings.appId + "row").children(".A_state").children().remove(); 
					
					//applist.changePageNum('companyApplicants', settings.pageNum);
					if (settings.changeNum == 0) {
						$("."+settings.appId + "row").css("background-color", "");
						changeState = '<a onclick="checkState(' + settings.appId + ', \'1\', ' + settings.appId + ')">O /</a>'
									+ '<a onclick="checkState(' + settings.appId + ', \'2\', ' +  settings.appId + ')"> X</a>';
					} else if (settings.changeNum == 1) {
						$("."+settings.appId + "row").css("background-color", "#BFF4ED");
						changeState = '<a onclick="checkState(' + settings.appId + ', \'0\', ' + settings.appId + ')">O</a>';
					}else {
						$("."+settings.appId + "row").css("background-color", "#E5A5AF");
						changeState = '<a onclick="checkState(' + settings.appId + ', \'0\', ' + settings.appId + ')">X</a>';
					}
					$("."+settings.appId + "row").children(".A_state").append(changeState); 
				},
				
				error		: function(){
					alert("이상이상");
				}
			});
		},
	};
	
	
	var resumelist = {
				
			resumeDetailFn : function(resumeNum, appId) {
				
				$("#resume_detail").val(resumeNum);
				
				$("#appId").val(appId);
				
				$("#frm_re").attr("action", "resumeDetail.jobq");
				 
				$("#frm_re").submit();
			},
	};
	
	
	
	var applist = {
			
			applistFn : function() {
				
				$("#pageName").val('companyApplicants');
				
				$("#selectOne").val($("#selOne").val());
				 
				$("#selectTwo").val($("#selTwo").val());
				
				//$("#appState").val($("#nav-tabs").children(".active").children().attr("href").subString(1,-1));
				
				$("#gonggoNum").val($("#selTwo").val());
 
				$("#frm_app").attr("action", "companyApplicants.jobq");
				 
				$("#frm_app").submit();
			},
			
			changePageNum : function(pageNum, appState) {

				$("#appState").val(appState);
				
				if ($("#appState").val() != appState) {
					$("#pageNum").val(1);
				}else{
					$("#pageNum").val(pageNum);
				}
				
				this.applistFn();
			},
		}
</script>
<!-- resumeDetail.jobq -->
<form id="frm_app" name="frm_app" method="post">
	<input type="hidden" id="pageName" name="pageName" value=""/> 
	<input type="hidden" id="selectOne" name="selectOne" value="전체"/> <!-- 첫번째 셀렉트 박스 -->
	<input type="hidden" id="selectTwo" name="selectTwo" value="0"/> <!-- 두번째 셀렉트 박스 -->
	<input type="hidden" id="appState" name="appState" value="전체"/> <!-- 이걸 굳이 안해도 될듯한데 -->
	<input type="hidden" id="gonggoNum" name="gonggoNum" value="0"/> <!-- 셀렉트박스로 공고불러오기 -->
	
	<!-- 페이지 넘버 -->
	<input type="hidden" id="pageNum" name="pageNum" value=""/>
</form>

<!-- resumeDetail.jobq -->
<form id="frm_re" name="frm_re" method="post">
	<input type="hidden" id="resume_detail" name="resume_detail" value=""/> 
	<input type="hidden" id="appId" name="appId" value=""/>
</form>

<style>
a{
	cursor: pointer;
}

th{
	text-align: center;
	font-size: 13px;
}

</style>
<section class="wrapper">
	<!-- 페이지 헤더 -->
	<section class="page_head">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="page_title">
						<h2>지원자 관리</h2>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="content elements">
		<div class="container">
			<div class="container">
				<!-- 상단 제목관리 -->
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="dividerHeading">
						<h4>
							<span>지원자 관리</span> <span class="bar_gray"> | </span><span
								class="total_top">${allCount}건</span>
						</h4>
					</div>
				</div>
				<!-- select box1 -->
				<div class="col-lg-12 col-md-12 col-sm-12">
					<!-- 첫번째 셀렉트 박스 -->
					<div class="col-lg-4">
						<div class="form-group">
							<select id="selOne" class="selectpicker form-control" onchange="closingChange()">
								<option value="전체">전체</option>
								<option value="게재중">게재중</option>
								<option value="마감">마감</option>
							</select>
						</div>
					</div>
					<!-- select box2 -->
					<div class="col-lg-8">
						<div class="form-group">
							<!-- 공고 선택해서 뿌리기 -->
							<select id="selTwo" class="selectpicker form-control" onchange="applist.applistFn('companyApplicants')">
								<option value="0">전체 공고</option>	
								
								<c:forEach varStatus="status" items="${allGonggoList}" var="allGonggoList">
									<option value="${allGonggoList.jobNumber}">[<c:out value="${allGonggoList.area}"/>/<c:out value="${allGonggoList.nameWp}"/>] <c:out value="${allGonggoList.title}"/></option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>

				<!-- 열람 / 미열람 태그 선택-->
				<div class="edge-tab sidebar-tab">
				 
					<ul id="nav-tabs" class="nav nav-tabs tabChange">
						<li class="active"><a href="#Popular" data-toggle="tab" >전체</a></li>
						<li class=""><a href="#Recent" data-toggle="tab">미열람</a></li>
						<li class=""><a href="#Announce_End" data-toggle="tab" >열람</a></li>
					</ul>
					
					<div class="tab-content clearfix">
						<!-- 전체내용 -->
						<div class="tab-pane fade" id="Popular">
							<jsp:include page="/WEB-INF/jsp/egovframework/example/company/applicants/all.jsp">
								<jsp:param value="0" name="closing" />
							</jsp:include>
						</div>
						<!-- 게시중 -->
						<div class="tab-pane fade" id="Recent">
							<jsp:include page="/WEB-INF/jsp/egovframework/example/company/applicants/ing.jsp">
								<jsp:param value="0" name="closing" />
							</jsp:include>
						</div>

						<!-- 게재종료 -->
						<div class="tab-pane fade" id="Announce_End">
							
						<jsp:include page="/WEB-INF/jsp/egovframework/example/company/applicants/end.jsp">
							<jsp:param value="0" name="closing" />
						</jsp:include>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</section>

