<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!--start wrapper-->
<section class="wrapper">	
	<section class="page_head">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<nav id="breadcrumbs">
						<ul>
							<li><a href="#" onclick="javascript:left.pageSubmitFn('notice')">NOTICE</a></li>							
						</ul>
					</nav>
					<div class="page_title">
						<h2>공지사항</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="content elements">		
		<div class="container">	
			<div class="row">							
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">	
					<div class="row">
			            			            
		           		<div class="col-lg-12 col-md-12 col-sm-12">
			                <div class="notice_cont_bx">
			                	<p class="notices"><i class="fa fa-bullhorn"></i> 공지사항을 통해 jobQ의 새로운 소식을 전해드리겠습니다.</p>
			                	<dl>
			                		<dt class="clear">
			                			<span class="notiTit"><c:out value="${noticeDetail['0'].nTitle}" /></span>
			                			<span class="noti_date"><c:out value="${noticeDetail['0'].nDateModi}" /></span>
			                		</dt>
			                		<dd>
			                			${noticeDetail['0'].nContent}
			                		</dd>
			                	</dl>
			                <div class="col-sm-12 mrgb-30 btnArea">
				                <a href="#" onclick="javascript:left.pageSubmitFn('notice')" class="btn btn-sm btn-social-linkedin">
				                    <i class="fa fa-list"></i> 공지사항 목록				                    
				                </a>			                
				            </div>	
			                </div>
			                
		           		 </div>
		           	 </div>  
				</div>
			</div>						
		</div>
		<!-- //container[E]  -->
	</section>
</section>
<!--end wrapper-->


