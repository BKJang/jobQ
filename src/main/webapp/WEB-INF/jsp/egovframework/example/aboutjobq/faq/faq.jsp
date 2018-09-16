<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<section class="wrapper">
	<section class="page_head">
		
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="page_title">
						<h2>FAQ</h2>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="content elements">
		<div class="container">
			<div class="container">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="dividerHeading">
						<h4>
							<span>자주묻는 질문</span>
						</h4>
					</div>
				</div>
				<div class="edge-tab sidebar-tab">
					<ul class="nav nav-tabs">
						<!-- <li class=""><a href="#all" data-toggle="tab" >전체</a></li> -->
						<li class="active"><a href="#1" data-toggle="tab" >회원가입</a></li>
						<li class=""><a href="#2" data-toggle="tab" >로그인</a></li>
						<li class=""><a href="#3" data-toggle="tab" >공고등록</a></li>
					</ul>
					
					<div class="tab-content clearfix">
						<%-- <div class="tab-pane fade active in" id="all">
							<div class="col-lg-12 clear mt40">
							<div class="panel-group accordion" id="accordion">
								<c:forEach var="faqListAll" items="${faqListAll}"> 
								
								<div class="panel panel-default">
								    <div class="panel-heading">
									  <h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion" href="#collapse-${faqListAll.num}">
										    <i class="switch fa fa-plus"></i>
										    <strong class="col_blue"><c:out value="${faqListAll.subject}" /></strong>
										    <c:out value="${faqListAll.title}" />
										</a>
									  </h4>
								    </div>
								    
								    <div id="collapse-${faqListAll.num}" class="panel-collapse collapse">
										  <div class="panel-body">
										  	<ul class="faqTxt">
										  		<li>
										  		<c:out value="${faqListAll.content}" /></li>
										  	</ul>
										  </div>
								    </div>
								</div>
								
								</c:forEach>		
							</div>
						</div> 
						</div>--%>


						<div class="tab-pane fade active in" id="1">
							<div class="col-lg-12 clear mt40">
							<div class="panel-group accordion" id="accordion">
								<c:forEach var="faqList1" items="${faqList1}"> 
								
								<div class="panel panel-default">
								    <div class="panel-heading">
									  <h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion" href="#collapse-${faqList1.num}">
										    <i class="switch fa fa-plus"></i>
										    <strong class="col_blue"><c:out value="${faqList1.subject}" /></strong>
										    <c:out value="${faqList1.title}" />
										</a>
									  </h4>
								    </div>
								    
								    <div id="collapse-${faqList1.num}" class="panel-collapse collapse">
										  <div class="panel-body">
										  	<ul class="faqTxt">
										  		<li>
										  		<c:out value="${faqList1.content}" /></li>
										  	</ul>
										  </div>
								    </div>
								</div>
								
								</c:forEach>		
							</div>
						</div>
						</div>

						<div class="tab-pane fade in" id="2">
							<div class="col-lg-12 clear mt40">
							<div class="panel-group accordion" id="accordion">
								<c:forEach var="faqList2" items="${faqList2}"> 
								
								<div class="panel panel-default">
								    <div class="panel-heading">
									  <h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion" href="#collapse-${faqList2.num}">
										    <i class="switch fa fa-plus"></i>
										    <strong class="col_blue"><c:out value="${faqList2.subject}" /></strong>
										    <c:out value="${faqList2.title}" />
										</a>
									  </h4>
								    </div>
								    
								    <div id="collapse-${faqList2.num}" class="panel-collapse collapse">
										  <div class="panel-body">
										  	<ul class="faqTxt">
										  		<li>
										  		<c:out value="${faqList2.content}" /></li>
										  	</ul>
										  </div>
								    </div>
								</div>
								
								</c:forEach>		
							</div>
						</div>
						</div>
						
						<div class="tab-pane fade in" id="3">
							<div class="col-lg-12 clear mt40">
							<div class="panel-group accordion" id="accordion">
								<c:forEach var="faqList3" items="${faqList3}"> 
								
								<div class="panel panel-default">
								    <div class="panel-heading">
									  <h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion" href="#collapse-${faqList3.num}">
										    <i class="switch fa fa-plus"></i>
										    <strong class="col_blue"><c:out value="${faqList3.subject}" /></strong>
										    <c:out value="${faqList3.title}" />
										</a>
									  </h4>
								    </div>
								    
								    <div id="collapse-${faqList3.num}" class="panel-collapse collapse">
										  <div class="panel-body">
										  	<ul class="faqTxt">
										  		<li>
										  		<c:out value="${faqList3.content}" /></li>
										  	</ul>
										  </div>
								    </div>
								</div>
								
								</c:forEach>		
							</div>
						</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</section>
</section>

				
<%-- 	           			<div class="col-lg-12 clear mt40">
							<div class="panel-group accordion" id="accordion">
								<c:forEach var="faqList" items="${faqList}"> 
								<div class="panel panel-default">
								    <div class="panel-heading">
									  <h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion" href="#collapse02">
										    <i class="switch fa fa-plus"></i>
										    <strong class="col_blue"><c:out value="${faqList.subject}" /></strong>
										    <c:out value="${faqList.title}" />
										</a>
									  </h4>
								    </div>
								    <div id="collapse02" class="panel-collapse collapse">
										  <div class="panel-body">
										  	<ul class="faqTxt">
										  		<li>
										  		<c:out value="${faqList.content}" /></li>
										  	</ul>
										  </div>
								    </div>
								</div>
								</c:forEach>		
							</div>
						</div> --%>


    
