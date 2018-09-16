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
				<c:forEach var="story" items="${storys}">
					<tr>
						<td colspan="3" style="border-top-width: 0px; border-right:0px;">
						<strong>[잡 스토리]</strong><a href="<c:url value='/admin/board/jobstory/detail/${story.STORY_NUMBER}' />"> ${story.ID}님이 잡 스토리를 등록하였습니다.</a>
						</td>
						<td align="right" style="border-top-width: 0px;">${story.REGDATE.toString().substring(0, 10)}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>