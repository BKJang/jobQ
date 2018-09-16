<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<form id="frm_job" name="frm_job" method="get">
	<input type="hidden" id="pageName"  name="pageName" /> 
	<input type="hidden" id="signTrgNo" name="signTrgNo" />
	<input type="hidden" id="gonggoID" name="gonggoID" />
</form>

<style>
th {
	font-size: 14px; 
}
tr,th{ 
	text-align: center;
}

.tbl_Tit{
	color: #4D77F6;
	font-size:14px;
}
</style>
<!--start wrapper-->
<section class="wrapper">	
	<section class="page_head">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="page_title">
						<h2>지역별 채용정보</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="content elements">		
		<div class="container">	
			<div class="row">
				<!--Sidebar Widget-->
				<div class="col-lg-2 col-md-2 col-sm-2">
					<div class="sidebar">						
						<div class="widget widget_categories">
							<div class="widget_title">
								<h4>
									<span>지역상세</span>
								</h4>
							</div>
							<!-- 지역 데이터  -->	
							<ul class="list_style">
								<li style="color:white">
									<a id="전체" style="cursor : pointer; font-weight: bold " onclick="javascript:goPage('전체', '1')">전체 ( ${ListCount} )</a>
								</li>
								<c:forEach var="locationList" items="${locationList}" varStatus="status">
	                    			<c:if test="${locationCount[0][locationList.area] != '0'}">
	                    				<li>
	                    					<a id="${locationList.area}" style="cursor:pointer; font-weight: bold" onclick="javascript:goPage('${locationList.area}', '1')"><c:out value="${locationList.area}" /> ( <c:out value="${locationCount[0][locationList.area]}" /> )</a>
	                    				</li>
	                    			</c:if>
	                    		</c:forEach>
							</ul>
							<!-- 지역 데이터  -->
						</div>						
					</div>
				</div>				
				<div class="col-xs-12 col-sm-10 col-md-10 col-lg-10">
					<div class="row  sub_content list_top">
		                <div class="col-lg-12 col-md-12 col-sm-12">
		                    <div class="dividerHeading">
		                        <h4><span>직종별</span></h4>
		                    </div>
		                    <div>
	                    
		 	                   <!-- 스킬 데이터  -->
		                    	<ul class="clear keyword">
		                    		<li>
	                    				<button id="allsbtn" class="btn allsbtn " type="button" style="font-weight: bold">전체</button>
	                  				</li>
		                    		<c:forEach var="skillList" items="${skillList}" varStatus="status">
		                    			<li>
		                    				<button class="btn sbtn ${skilldList.skill}" type="button" style="font-weight: bold">${skillList.skill}</button>
		                    			</li>
		                    		</c:forEach>
		                    	</ul>
		                    	<input type="hidden" id="checkedSkillList" name="checkedSkillList" />
		                    	<!-- 스킬 데이터  -->	
		                    </div>
		                    <div class="col-lg-12 col-md-12 col-sm-12 clear" id="popUp">
		                    </div>		                
		                </div>   		                
		            </div>
		            
		            
		            <!-- //Hot 직종별 채용정보[E]  -->
					<div class="row">
			            <div class="col-lg-12 col-md-12 col-sm-12">
			               <div class="dividerHeading">
			                   <h4><span>일반 채용정보</span> <span class="bar_gray"> | </span><span class="total_top">${ListCount}건</span></h4>
			               </div>
			            </div>
			            <div class="col-sm-12 col-md-12 col-sm-12 clear">
				            <select id="countSelect" class="form-control list_count_fr" onchange="goPage('전체','1')">
							  <option value="10" selected="selected">10개씩</option>
							  <option value="20">20개씩</option>
							  <option value="50">50개씩</option>							  
							</select>
						</div>
		           		<div class="col-lg-12 col-md-12 col-sm-12 tbl_vertical">
			                <table class="table table-striped table-hover" id="gonggoListTable">
			                	<colgroup>
									<col width="12%" />
									<col width="*" />
									<col width="15%" />
									<col width="15%" />
									<col width="20%" />
								</colgroup>
			                   <thead>
			                   <tr>
			                        <th>공고번호</th>
			                        <th>기업명/공고 제목</th>
			                        <th>마감일</th>
			                        <th>경력</th>
			                        <th>학력</th>
			                   </tr>
			                   </thead>
			                   <tbody>
					             <c:forEach var="gonggoList" items="${gonggoList}" varStatus="status">
									<tr>
										<td><c:out value="${gonggoList.jobNumber}" /></td>
						                <td>
				                			<a href="#"	onclick="javascript:joblist.jobDetailFn('jobDetail', ${gonggoList.jobNumber} )">
						                		<strong class="tbl_Tit">${gonggoList.company}</strong>
												<strong>[<c:out value="${gonggoList.area}" />/<c:out value="${gonggoList.nameWp}" />]</strong> <c:out value="${gonggoList.title}" />
											</a>
										</td>
										<td><c:out value="${fn:substring(gonggoList.dateClose,0,10)}" /></td>
						                <td>
						                	<c:choose>
						                		<c:when test="${fn:substring(gonggoList.career,0,2) eq '경력'}">
						                			<c:out value="${gonggoList.career}" />년 이상
						                		</c:when>
						                		<c:otherwise>
						                			<c:out value="${gonggoList.career}" />
						                		</c:otherwise>
						                	</c:choose>
						               	</td> 
						                <td>
						                	<c:choose>
						                		<c:when test="${gonggoList.academic eq '무관'}">
						                			학력무관
						                		</c:when>
						                		<c:otherwise>
						                			<c:out value="${gonggoList.academic}" /> 졸업 이상
						                		</c:otherwise>
						                	</c:choose>
						                </td>		
									</tr>
								</c:forEach>
			                   </tbody>
			               </table>
			               <div class="col-sm-12">
								<div class="dataTables_paginate paging_simple_numbers text-center" id="">
									<ul id="gonggoPaging" class="pagination">
										<li class="paginate_button previous" id="previous" style="cursor:pointer"><a
											onclick="javascript:goPage('전체',${paging.prevPageNo})" aria-controls="example2" data-dt-idx="0" tabindex="0">이전</a>
										</li>
										<c:forEach var="i" begin="${paging.startPageNo}" end="${paging.endPageNo}" step="1">
								            <c:choose>
								                <c:when test="${i eq paging.pageNo}">
								                	<li class="paginate_button active paging_${i}" style="cursor:pointer"><a onclick="javascript:goPage('전체',${i})"
													aria-controls="example2" data-dt-idx="${i}" tabindex="0">${i}</a></li>
								                </c:when>
								                <c:otherwise>
								                	<li class="paginate_button paging_${i}" style="cursor:pointer"><a onclick="javascript:goPage('전체',${i})"
													aria-controls="example2" data-dt-idx="${i}" tabindex="0">${i}</a></li>
								                </c:otherwise>
								            </c:choose>
								        </c:forEach>
										<li class="paginate_button next" id="next" style="cursor:pointer">
											<a onclick="javascript:goPage('전체',${paging.nextPageNo})" aria-controls="example2" data-dt-idx="7" tabindex="0">다음</a>
										</li>
									</ul>
									<input type="hidden" id="fixedPageNum" value="1"/>
									<input type="hidden" id="fixedLocation" value="전체"/>
								</div>
							</div>
		           		 </div>
		           	 </div>  
				</div>
			</div>						
		</div>
		<!-- //container[E]  -->
	</section>
</section>


<script type="text/javascript">
	
	$(document).ready(function(){
		
		$('#allsbtn').click(function(){
			$("#checkedSkillList").val("");
		});
		
		/* 스킬버튼 누르면 메뉴 바뀌게 처리하자 */
		$(".sbtn").click(function(){
			
			$("#allsbtn").css("background-color", "");
			$("#allsbtn").removeClass("selected");
			
			if (!$(this).hasClass("selected")) {
		
				$(this).css("background-color", "#C94040");
				$(this).addClass("selected");
			}else{
				
				$(this).css("background-color", "");
				$(this).removeClass("selected");
			} 
			
			/* 스킬리스트를 초기화 */
			$("#checkedSkillList").val("");
			
			/* 각각의 항목을 보고 선택되어 있으면 넣어줌 */
			$(".sbtn").each(function(){
				
				if ($(this).hasClass("selected")) {
					
					if ($("#checkedSkillList").val()=="") {
						$("#checkedSkillList").val($(this).text())
					}else{
						$("#checkedSkillList").val($("#checkedSkillList").val() + "," + $(this).text())
					}
				}
			});
			
			if ($("#checkedSkillList").val() == "") {
				$("#allsbtn").css("background-color", "#C94040");
				$("#allsbtn").addClass("selected");
			}
			
			ajaxC.changePaging({url: "gonggoList.jobq", LocationGuBun: $("#fixedLocation").val(), pageNum : $("#fixedPageNum").val(), pageSize : $("#countSelect").children("option:selected").val(), skillList : $("#checkedSkillList").val()});
			ajaxC.makePaging({url: "gonggoPaging.jobq", LocationGuBun: $("#fixedLocation").val(), pageNum : $("#fixedPageNum").val(), pageSize : $("#countSelect").children("option:selected").val(), skillList : $("#checkedSkillList").val()});
		});
		/* 스킬버튼 누르면 메뉴 바뀌게 처리하자 */
		
		$("#allsbtn").click(function(){
			
			$(this).css("background-color", "#C94040");
			$(this).addClass("selected");
			
			$(".sbtn").css("background-color", "");
			$(".sbtn").removeClass("selected");

			ajaxC.changePaging({url: "gonggoList.jobq", LocationGuBun: $("#fixedLocation").val(), pageNum : $("#fixedPageNum").val(), pageSize : $("#countSelect").children("option:selected").val(), skillList : ""});
			ajaxC.makePaging({url: "gonggoPaging.jobq", LocationGuBun: $("#fixedLocation").val(), pageNum : $("#fixedPageNum").val(), pageSize : $("#countSelect").children("option:selected").val(), skillList : ""});
		});
		
		/* 처음 페이지 버튼 초기화 */
		$("#전체").parent().css("background-color","#3498db");
		$("#전체").css("color", "WHITE");
		$("#allsbtn").css("background-color", "#C94040");
		$("#allsbtn").addClass("selected");
		/* 처음 페이지 버튼 초기화 */
	});
	
	var ajaxC = 
	{	
			/* 페이징 처리하기  */
			makePaging : function(options){
				
				var that = this;
				var settings = {
						url: "gonggoPaging.jobq",
						LocationGuBun : "",
						pageNum : "0",
						pageSize : "10",
						skillList : ""
				}
				
				settings = $.extend({}, settings, options);
				
				$.ajax({
					
					type		: "POST",
					url			: settings.url,
					data		: {"pageNum" : settings.pageNum,
						"LocationGuBun" : settings.LocationGuBun, 
						"pageSize" : settings.pageSize,
						"skillList" : settings.skillList},
					async		: false,
					success		: function(result){

						var jsonRes = JSON.parse(result);
						var pagingMenu="";
						
						$.each(jsonRes, function(i, item){
							pagingMenu += '<li class="paginate_button previous" id="example2_previous" style="cursor:pointer">'
									+ '<a onclick="javascript:goPage(\'' + settings.LocationGuBun + '\',' + item.prevPageNo + ')" aria-controls="example2" data-dt-idx="0" tabindex="0">이전</a>'
									+ '</li>';
									
									for (var i = item.startPageNo; i <= item.endPageNo; i++) {
										if (i == item.pageNo) {
											pagingMenu += '<li class="paginate_button active paging_' + i + '" style="cursor:pointer"><a onclick="javascript:goPage(\''+ settings.LocationGuBun +'\',' + i + ')" aria-controls="example2" data-dt-idx="1" tabindex="0">' + i + '</a></li>';
										} else {
											pagingMenu += '<li class="paginate_button paging_' + i + '" style="cursor:pointer"><a onclick="javascript:goPage(\''+ settings.LocationGuBun +'\',' + i + ')" aria-controls="example2" data-dt-idx="1" tabindex="0">' + i + '</a></li>';
										}
									}; 
							pagingMenu +=	'<li class="paginate_button next" id="example2_next" style="cursor:pointer">'
									+ '<a onclick="javascript:goPage(\''+ settings.LocationGuBun +'\',' + item.nextPageNo + ')" aria-controls="example2" data-dt-idx="7" tabindex="0">다음</a>'
									+ '</li>';	
						});
					
						
						$("#gonggoPaging").children().remove();
						$("#gonggoPaging").append(pagingMenu);
						/* 페이징 어디다 뿌리지 */
					},
					error		: function(){ 
					},
				
				})
			},

		/* 페이징 불러오기  지역과 페이지 넘버와 사이즈로 구분*/
		changePaging : function(options){
			
			var that = this;
			var settings = {
					url: "gonggoList.jobq",
					LocationGuBun: "",
					pageNum : "0",
					pageSize : "10",
					skillList : "",
			};
			
			settings = $.extend({}, settings, options);
			
			$.ajax({
				
				type		: "POST",
				url			: settings.url,
				data		: {"pageNum" : settings.pageNum,
					"LocationGuBun" : settings.LocationGuBun, 
					"pageSize" : settings.pageSize,
					"skillList" : settings.skillList},
				async		: false,
				success		: function(result){
					
					var jsonRes = JSON.parse(result);
					var strMenu="";
					var count = 0;
					
					$.each(jsonRes, function(i, item){ 
	                    
	                    var today = new Date(item.dateClose);  // 자바스크립에서 원하는 형태로 사용가능
	                    var CloseDate = today.getFullYear()+ "-" + (("0" + (today.getMonth()+1)).slice(-2)) + "-" + (("0" + today.getDate()).slice(-2));
	                    
						strMenu += '<tr><td>' + item.jobNumber + '</td>' 
								+ '<td><a href="#"	onclick="javascript:joblist.jobDetailFn(\'jobDetail\', ' + item.jobNumber + ')"><strong class="tbl_Tit">' + item.company + '</strong><strong>[' + item.area + '/' + item.nameWp + ']</strong> ' + item.title + '</a></td>' 
        						+ '<td>' + CloseDate + '</td>'
        						+ '<td>';
        						
        						if (item.career != '신입' && item.career != '무관') {
        							strMenu += item.career + '년 이상';
								} else if(item.career == null){
									strMenu += '무관';
								} else {
									strMenu += item.career;
								}
        				strMenu += '</td><td>'
        						
        						if (item.academic == '무관') {
        							strMenu += '학력무관';
								} else {
									strMenu += item.academic + '졸업 이상';
								}
        				strMenu += '</td></tr>';
					});
					
					$("#gonggoListTable").children("tbody").children().remove();
					$("#gonggoListTable").children("tbody").append(strMenu);
					
					$("#countSelect").attr("onchange", "goPage(\'" + settings.LocationGuBun + "\','1')");
					
					menuColorChange(settings.LocationGuBun);
				},
				
				error		: function(){
					alert("이상이상");
				}
			}); 
		},
	};
	 
	/* 지역구분 버튼 색 번화 */
	function menuColorChange(locate){
		
		$(".list_style").children("li").css("background-color","");
		$(".list_style").children("li").css("color", "");
		$(".list_style").children("li").children().css("color", "");
		$("#" + locate).parent().css("background-color","#3498db");
		$("#" + locate).parent().css("color", "WHITE");
		$("#" + locate).css("color", "WHITE");
	}
	/* 지역구분 버튼 색 번화 */
	 
	
	/* 지역버튼 클릭시 리스트와 페이징 처리 */
	function goPage(LocationGuBun, pageNum){
		
		$("#fixedPageNum").val(pageNum);
		$("#fixedLocation").val(LocationGuBun);
		
		ajaxC.changePaging({url: "gonggoList.jobq", LocationGuBun: LocationGuBun, pageNum : pageNum, pageSize : $("#countSelect").children("option:selected").val(), skillList : $("#checkedSkillList").val()});
		ajaxC.makePaging({url: "gonggoPaging.jobq", LocationGuBun: LocationGuBun, pageNum : pageNum, pageSize : $("#countSelect").children("option:selected").val(), skillList : $("#checkedSkillList").val()});
	};
	/* 지역버튼 클릭시 리스트와 페이징 처리 */
	
	
	/* 디테일 페이지로 이동하기 */
	var joblist = {
			
			/* 상세보기로 이동 보내기 */
			jobDetailFn : function(pageName, gonggoNum) {
				
				var memeber_id= "<%=(String)session.getAttribute("member_id") %>";
				//로그인 여부검사
				if (memeber_id == 'null') {
					
					alert("로그인을 먼저 해주세요");
					$("#frm_job").attr("action", "login.jobq"); 
					
					$("#frm_job").submit();
				}else{
					$("#pageName").val(pageName);
					$("#gonggoID").val(gonggoNum);
					
					$("#frm_job").attr("action", pageName + ".jobq");
			
					$("#frm_job").submit();
				}
		}
	};
</script>



