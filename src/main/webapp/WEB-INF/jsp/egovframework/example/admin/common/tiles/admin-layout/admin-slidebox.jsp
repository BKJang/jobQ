<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${cookie.isClose.value eq 'true'}">
	<div class="slide-box" style="display:none;">	
</c:if>
<c:if test="${cookie.isClose.value eq 'false'}">
	<div class="slide-box">
</c:if>
	<!-- Notification box head -->
	<div class="slide-box-head bred">
		<!-- Title -->
		<div class="pull-left">사이트 현황</div>
		<!-- Icon -->
		<div class="slide-icons pull-right">
			<a href="javascript:void(0)" class="sminimize">
			<c:if test="${cookie.slideBoxState.value eq 'up'}">
				<i class="fa fa-chevron-down"></i>
			</c:if>
			<c:if test="${cookie.slideBoxState.value eq 'down'}">
				<i class="fa fa-chevron-up"></i>
			</c:if>
	
			</a> 
			<a href="#" class="sclose">
				<i class="fa fa-times"></i>
			</a>
		</div>
		<div class="clearfix"></div>
	</div>

	<c:if test="${cookie.slideBoxState.value eq 'up'}">
		<div class="slide-content">
	</c:if>
	<c:if test="${cookie.slideBoxState.value eq 'down'}">
		<div class="slide-content" style="display:none;">
	</c:if>
	<!-- <div class="slide-content"> -->
		<!-- It is default bootstrap nav tabs. See official bootstrap doc for doubts -->
		<ul class="nav nav-tabs">
			<li class="slidebox-tab-menus active">
				<a href="#site-current-state" data-toggle="site-current-state">
					<i class="fa fa-file-o"></i>
				</a>
			</li>
			
			<li class="slidebox-tab-menus">
				<a href="#notice" data-toggle="notice">
					<i class="fa fa-phone"></i>
				</a>
			</li>
			
			<li class="slidebox-tab-menus">
				<a href="#tab3" data-toggle="tab3">
					<i class="fa fa-comments"></i>
				</a>
			</li>
		</ul>

		<!-- Tab content -->

		<div class="tab-content">
			<div class="tab-pane active" id="site-current-state">
				<!-- Earning item -->
				<div class="slide-data">
					<div class="slide-data-text">전체 회원수</div>
					<div class="slide-data-result">4, 232명</div>
					<div class="clearfix"></div>
				</div>

				<!-- Earning item -->
				<div class="slide-data">
					<div class="slide-data-text">고객 문의</div>
					<div class="slide-data-result">728건</div>
					<div class="clearfix"></div>
				</div>

				<!-- Earning item -->
				<div class="slide-data">
					<div class="slide-data-text">총 이력서 개수</div>
					<div class="slide-data-result">4, 088건</div>
					<div class="clearfix"></div>
				</div>

				<!-- Earning item -->
				<div class="slide-data">
					<div class="slide-data-text">채용 공고글</div>
					<div class="slide-data-result">1, 028건</div>
					<div class="clearfix"></div>
				</div>

			</div>

			<div class="tab-pane" id="notice">
				<div class="slide-data">
					<div class="slide-data-text">채용 공고글</div>
					<div class="slide-data-result">1, 028건</div>
					<div class="clearfix"></div>
				</div>
			</div>

			<div class="tab-pane" id="tab3">
				<div class="slide-data">
					<div class="slide-data-text">총 이력서 개수</div>
					<div class="slide-data-result">4, 088건</div>
					<div class="clearfix"></div>
				</div>
			</div>

		</div>

	</div>

</div>