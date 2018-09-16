<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="row">
	<div class="col-sm-12 col-md-12 col-sm-12 clear">
		 
		<a class="btn btn-sm btn-danger allDelete" style="float:right" onclick="deleteGonggo('a','${param.pageNo}')">
            <i class="fa fa-times"></i> 삭제				                    
        </a> 
        <a class="btn btn-sm btn-success allClose" style="float:right" onclick="closingGonggo('ac','${param.pageNo}')">
            <i class="fa fa-check"></i> 마감				                    
        </a>
		<select id="achageCountList" class="form-control list_count_fr chageCountList" style="float:right" onchange="goPage('a',1)">
			<option value="10" selected>10개씩</option>
			<option value="20">20개씩</option>
			<option value="50">50개씩</option>
		</select>
	</div>
	<div class="col-lg-12 col-md-12 col-sm-12 tbl_vertical">
		<table class="table table-striped table-hover">
			<colgroup>
				<col width="5%" />
				<col width="8%" />
				<col width="*" />
				<col width="15%" />
				<%-- <col width="7%" /> --%>
				<col width="15%" />
				<col width="10%" />
			</colgroup>
			<thead>
				<tr>
					<th><input type="checkbox" name="chk_info" class="topCheck" value=""></th>
					<th>공고번호</th>
					<th>공고제목</th>
					<th>등록일/마감일</th>
					<!-- <th>조회수</th> -->
					<th>지원자수</th>
					<th>수정/마감</th>
				</tr>
			</thead>
			<tbody>
				<!-- 리스트 한줄 -->
				<c:forEach var="gonggoList" items="${gonggoList}" varStatus="status">
					<tr>
					 <c:if test="${gonggoList.closing eq 1}">
					 	<tr id="${gonggoList.jobNumber}" style="background-color: #F0B3C0">
					 </c:if>
					 <c:if test="${gonggoList.closing eq 0}">
					 	<tr id="${gonggoList.jobNumber}">
					 </c:if>
					
						<td><input type="checkbox" name="chk_info" class="deleteCheck"
							value="<c:out value="${gonggoList.jobNumber}" />"></td>
						<td><c:out value="${gonggoList.jobNumber}" /></td>
						<td>
							<a href="#"	onclick="javascript:joblist.jobDetailFn('jobDetail', ${gonggoList.jobNumber} )">
								<strong class="ann_name">[<c:out value="${gonggoList.area}" /> / <c:out value="${gonggoList.nameWp}" />]</strong> <c:out value="${gonggoList.title}" />
							</a>
						</td>
						<c:set var="date1" value="${gonggoList.dateRegi}" />
						<c:set var="date2" value="${gonggoList.dateClose}" />
						<td><c:out value="${fn:substring(date1, 0, 10)}" />~<c:out
								value="${fn:substring(date2, 0, 10)}" /></td>
						<%-- <td><c:out value="${gonggoList.hits}" /></td> --%>
						<td class="appTD"><a href="#"
							onclick="javascript:applist.appDetailFn('Recent',${gonggoList.jobNumber} , ${gonggoList.closing})">미열람
								<c:out value="${gonggoList.unreadcount}"/></a> / <a href="#"
							onclick="javascript:applist.appDetailFn('Popular',${gonggoList.jobNumber} , ${gonggoList.closing})">
								전체 <c:out value="${gonggoList.allcount}"/></a></td>
						<td class="${gonggoList.jobNumber} closingTD"><c:if
								test="${gonggoList.closing eq 0}">
								<a href="#" onclick="javascript:joblist.jobDetailFn('gonggoEdit', ${gonggoList.jobNumber})"
									style="cursor: pointer">수정 /</a>
								<a onclick="change.changeClosing(${gonggoList.jobNumber}, 1)"
									style="cursor: pointer"> 마감</a>
							</c:if> <c:if test="${gonggoList.closing eq 1}">
								<a onclick="change.changeClosing(${gonggoList.jobNumber}, '0')"
									style="cursor: pointer;"> 다시게재 </a>
							</c:if></td>
						</tr>
				</c:forEach>
			</tbody>
		</table>


		<!-- 다음페이지 --> 
		<div class="col-sm-12">
			<div class="dataTables_paginate paging_simple_numbers text-center"
				id="example2_paginate">
				<ul id="PopularPaging" class="pagination">
					<li class="paginate_button previous" id="example2_previous" style="cursor:pointer"><a
						onclick="javascript:goPage('a',${param.prevPageNo})" aria-controls="example2" data-dt-idx="0" tabindex="0">이전</a>
					</li>
					<c:forEach var="i" begin="${param.startPageNo}" end="${param.endPageNo}" step="1">
			            <c:choose>
			                <c:when test="${i eq param.pageNo}">
			                	<li class="paginate_button active paging_${i}" style="cursor:pointer"><a onclick="javascript:goPage('a',${i})"
								aria-controls="example2" data-dt-idx="1" tabindex="0">${i}</a></li>
			                </c:when>
			                <c:otherwise>
			                	<li class="paginate_button paging_${i}" style="cursor:pointer"><a onclick="javascript:goPage('a',${i})"
								aria-controls="example2" data-dt-idx="1" tabindex="0">${i}</a></li>
			                </c:otherwise>
			            </c:choose>
			        </c:forEach>
					<li class="paginate_button next" id="example2_next" style="cursor:pointer">
						<a onclick="javascript:goPage('a',${param.nextPageNo})" aria-controls="example2" data-dt-idx="7" tabindex="0">다음</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
</div>