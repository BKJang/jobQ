<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">

	function IngChange(gonggoNum, changeNum){
		
		ajaxC.ajaxCallFn({url: "closing.jobq", FCGubun: "F", gonggoNum : gonggoNum, changeNum: changeNum});
		$("." + gonggoNum).parent().remove();
	};
</script>

<div class="row">
	<div class="col-sm-12 col-md-12 col-sm-12 clear">
		<a class="btn btn-sm btn-danger ingDelete" style="float:right" onclick="deleteGonggo('i','1')">
            <i class="fa fa-times"></i> 삭제				                    
        </a>
        <a class="btn btn-sm btn-success ingClose" style="float:right" onclick="closingGonggo('ic','1')">
            <i class="fa fa-check"></i> 마감				                    
        </a>
		<select id="ichageCountList" class="form-control list_count_fr chageCountList" style="float:right" onchange="goPage('i',1)">
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
			<tbody id="IngTable">
			</tbody>
		</table>

		<div class="col-sm-12">
			<div class="dataTables_paginate paging_simple_numbers text-center"
				id="example2_paginate">
				<ul id="RecentPaging" class="pagination">
					
				</ul>
			</div>
		</div>
	</div>
</div>