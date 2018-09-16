<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
	<div class="table-responsive">
		<table class="table">
			<thead>
			<tr style="display:none;">
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
			</thead>
			<tbody>
				<c:forEach var="qna" items="${qnas}">
					<tr>
						<td colspan="3" style="border-top-width: 0px; border-right:0px;">
						<strong>[Q & A]</strong><a href="<c:url value='/admin/inquire/qna/detail/${qna.QNA_NUMBER}' />"> ${qna.ID}님이 문의 사항을 등록했습니다.</a>
						</td>
						<td align="right" style="border-top-width: 0px;">${qna.REGDATE.toString().substring(0, 10)}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>