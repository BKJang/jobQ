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
			<!-- items안에는 문자열이 아닌 EL표현식으로 작성해야 한다. -->
			<c:forEach var="member" items="${members}">
				<tr>
					<td colspan="3" style="border-top-width: 0px; border-right:0px;">
					
					<c:if test="${member.TYPE eq 'p'}">
						<strong>[일반 회원]</strong>
					</c:if>
					<c:if test="${member.TYPE eq 'c'}">
						<strong>[기업 회원]</strong>
					</c:if>
					
						<a href="<c:url value='/admin/member/manage/detail' />?id=${member.ID}&type=${member.TYPE}">${member.NAME}님이 회원가입을 하셨습니다.</a>
					</td>
					
					<td align="right" style="border-top-width: 0px;">${member.REGDATE.toString().substring(0, 10)}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>