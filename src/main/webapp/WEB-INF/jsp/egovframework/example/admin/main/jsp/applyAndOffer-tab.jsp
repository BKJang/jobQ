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
				<c:forEach var="applyAndOffer" items="${applyAndOffers}">
					<tr>
						<td colspan="3" style="border-top-width: 0px; border-right:0px;">
							<c:choose>
								<c:when test="${applyAndOffer.TYPE eq 'apply'}">
									<strong>[면접 지원]</strong>
									<a href="<c:url value='/admin/applyandoffer/apply/detail/${applyAndOffer.SEQ}' />"> ${applyAndOffer.ID}님이 지원서를 작성했습니다.</a>
								</c:when>
								<c:otherwise>
									<strong>[면접 제의]</strong>
									<a href="<c:url value='/admin/applyandoffer/offer/detail/${applyAndOffer.SEQ}' />"> ${applyAndOffer.ID}님이 면접 제의서를 작성했습니다.</a>
								</c:otherwise>
							</c:choose>
						</td>
						
						<td align="right" style="border-top-width: 0px;">${applyAndOffer.REGDATE.toString().substring(0, 10)}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>