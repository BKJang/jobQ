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
				<c:forEach var="resume" items="${resumes}">
					<tr>
						<td colspan="3" style="border-top-width: 0px; border-right:0px;">
						<strong>[${resume.TYPE_EMPLOY}]</strong><a href="<c:url value='/admin/resume/detail/${resume.RE_NUMBER}' />"> ${resume.ID}님이 이력서를 등록하였습니다.</a>
						</td>
						<td align="right" style="border-top-width: 0px;">${resume.REGDATE.toString().substring(0, 10)}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>