<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="navbar navbar-inverse navbar-fixed-top bs-docs-nav"
	role="banner">
	<div class="container">
		<!-- Menu button for smallar screens -->
		<div class="navbar-header">
			<button class="navbar-toggle" type="button" data-toggle="collapse"
				data-target=".bs-navbar-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a href="<c:url value="/admin/main" />" class="navbar-brand">job
				<span class="bold">Q</span>
			</a>
		</div>
		<!-- Site name for smallar screens -->
		<!-- Navigation starts -->
		<nav class="collapse navbar-collapse bs-navbar-collapse"
			role="navigation">
			<!-- Links -->
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a data-toggle="dropdown"
					class="dropdown-toggle" href="#"> <img
						src="http://via.placeholder.com/40x40" alt=""
						class="nav-user-pic img-responsive" /> 관리자 <b class="caret"></b>
				</a> <!-- Dropdown menu -->
					<ul class="dropdown-menu">
						<!-- <li><a href="#"><i class="fa fa-user"></i> 프로필</a></li>
						<li><a href="#"><i class="fa fa-cogs"></i> 설정</a></li> -->
						<li><a href="<c:url value='/admin/logout' />"><i class="fa fa-power-off"></i>로그아웃</a></li>
					</ul></li>
			</ul>
			<!-- Notifications -->
			<ul class="nav navbar-nav navbar-right" id="jobq-nav">
				<li>
					<c:if test="${cookie.isClose.value eq 'true'}">
						<a href="#" id="slidebox-show-btn">
					</c:if>
					
					<%-- EL태그에서 쿠키는 ${cookie.쿠키명.value}로 접근한다. --%>
					<c:if test="${cookie.isClose.value eq 'false'}">	
						<a href="#" id="slidebox-show-btn" style="display : none;">
					</c:if>
						
					<i class="fa fa-window-maximize"></i> 사이트 현황 
					</a>
				</li>
				<!-- <li class="dropdown dropdown-big">
					<a class="dropdown-toggle" href="#" data-toggle="dropdown"> <i class="fa fa-envelope-o"></i>
						메세지 함
				</a>

					<ul class="dropdown-menu">
						<li>
							Heading - h5
							<h5>
								<i class="fa fa-envelope-o"></i>상세 메세지
							</h5> Use hr tag to add border
							<hr />
						</li>
						<li>
							List item heading h6 <a href="#">이력서 첨부 질문</a> List item para
							<p>고생이 많으십니다. 한 가지 여쭤뵐게 있어 질문을 드립니다. 지금 제가...</p>
							<hr />
						</li>
						<li><a href="#">장난하는 것도 아니고...</a>
							<p>잡큐 매우 실망스럽니다. 사기치는 것도 아니고 면접보러 갔는데 없는 회...</p>
							<hr /></li>
						<li>
							<div class="drop-foot">
								<a href="#">View All</a>
							</div>
						</li>
					</ul></li> -->

				<!-- <li class="dropdown dropdown-big"><a class="dropdown-toggle"
					href="#" data-toggle="dropdown"> <i class="fa fa-bell"></i> 알림
				</a>
					<ul class="dropdown-menu">
						<li>
							Heading - h5
							<h5>
								<i class="fa fa-user"></i> Users
							</h5> Use hr tag to add border
							<hr />
						</li>
						<li>
							List item heading h6 <a href="#">Ravi Kumar</a> <span
							class="label label-warning pull-right">Free</span>
							<div class="clearfix"></div>
							<hr />
						</li>
						<li><a href="#">Balaji</a> <span
							class="label label-important pull-right">Premium</span>
							<div class="clearfix"></div>
							<hr /></li>
						<li><a href="#">Kumarasamy</a> <span
							class="label label-warning pull-right">Free</span>
							<div class="clearfix"></div>
							<hr /></li>
						<li>
							<div class="drop-foot">
								<a href="#">View All</a>
							</div>
						</li>
					</ul></li> -->


			</ul>
		</nav>
	</div>
</div>