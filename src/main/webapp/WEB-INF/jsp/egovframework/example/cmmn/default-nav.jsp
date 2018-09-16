<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript">
	var left = {
		pageSubmitFn : function(pageName) {

			$("#pageName").val(pageName);
			
			$("#frm").attr("action", pageName + ".jobq");
			
			$("#frm").submit();

			/* if (pageName == "mainJoblist") {

				$("#frm").attr("action", "mainJoblist.jobq");

			} else if (pageName == "mainResumelist") {

				$("#frm").attr("action", "mainResumelist.jobq");

			} else if (pageName == "mainJobstory") {

				$("#frm").attr("action", "mainJobstory.jobq");
			} else if (pageName == "personMain") {

				$("#frm").attr("action", "personMain.jobq");
			} else if (pageName == "personResume") {

				$("#frm").attr("action", "personResume.jobq");
			} else if (pageName == "personResumeRegister") {

				$("#frm").attr("action", "personResumeRegister.jobq");
			} else if (pageName == "personApplication") {

				$("#frm").attr("action", "personApplication.jobq");
			} else if (pageName == "personOffer") {

				$("#frm").attr("action", "personOffer.jobq");
			}  else if (pageName == "companyMain") {

				$("#frm").attr("action", "companyMain.jobq");
			}  else if (pageName == "companyJob") {

				$("#frm").attr("action", "companyJob.jobq");
			}  else if (pageName == "companyJobmanage") {

				$("#frm").attr("action", "companyJobmanage.jobq");
			}  else if (pageName == "companyApplicants") {

				$("#frm").attr("action", "companyApplicants.jobq");
			}  else if (pageName == "companyOffer") {

				$("#frm").attr("action", "companyOffer.jobq");
				
			}	else if (pageName == "about") {

				$("#frm").attr("action", "about.jobq");
			}  else if (pageName == "notice") {

				$("#frm").attr("action", "notice.jobq");
			}  else if (pageName == "faq") {

				$("#frm").attr("action", "faq.jobq");
			}  else if (pageName == "personResumeModify") {

				$("#frm").attr("action", "personResumeModify.jobq");
			} else if (pageName == "resumeDeatil") {

				$("#frm").attr("action", "resumeDeatil.jobq");
			} else if (pageName == "paging") {

				$("#frm").attr("action", "paging.jobq");
			} else if (pageName == "login") {

				$("#frm").attr("action", "login.jobq");
			} else if (pageName == "goQnAList") {

				$("#frm").attr("action", "goQnAList.jobq");
			}else if (pageName == "registerQnA") {

				$("#frm").attr("action", "registerQnA.jobq");
			}
			
			
			$("#frm").submit(); */
		}
	}

	$(document).ready(function() {

		var pageName = "<c:out value="${param.pageName}"/>";

		$("[prop=menu]").removeClass("active");

		$("#" + pageName).addClass("active");
	});
</script>

<form id="frm" name="frm">
	<input type="hidden" id="pageName" name="pageName" /> 
	<input type="hidden" id="signTrgNo" name="signTrgNo" />
	
</form>


 <div class="row">
                    <div class="col-md-3 col-sm-3">
                        <div id="logo">
                            <h1><a href="main.jobq"><img src="images/logo.png"/></a></h1>
                        </div>
                    </div>

<!-- Navigation
                    ================================================== -->
                    <div class="col-lg-9 col-sm-9 navbar navbar-default navbar-static-top container" role="navigation">
                        <!--  <div class="container">-->
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>
                        <div class="navbar-collapse collapse">
                            <ul class="nav navbar-nav">
                                <li prop="menu"  id="mainJoblist"><a href="#"
							onclick="javascript:left.pageSubmitFn('mainJoblist')"><span class="data-hover"data-hover="채용정보">채용정보</span></a>
                                    
                                </li>

                                <li prop="menu" id="mainResumelist"><a href="#" onclick="javascript:left.pageSubmitFn('paging')"><span class="data-hover" data-hover="인재정보">인재정보</span></a>
                                    <!-- <ul class="dropdown-menu">
                                        <li><a href="elements.html">Elements</a></li>
                                        <li><a href="columns.html">Columns</a></li>
                                        <li><a href="typography.html">Typography</a></li>
                                        <li><a href="pricing-tables.html">Pricing Tables</a></li>
                                        <li><a href="icons.html">Icons</a></li>
                                    </ul> -->
                                </li>

                                <li prop="menu" id="mainJobstory"><a href="#"	onclick="javascript:left.pageSubmitFn('mainJobstory')"><span class="data-hover" data-hover="jobStory">jobStory</span></a>
                                   <!--  <ul class="dropdown-menu">
                                        <li>
                                            <a href="about.html">About</a>
                                            <ul class="dropdown-menu">
                                                <li><a href="about.html">About Us 1</a></li>
                                                <li><a href="about-2.html">About Us 2</a></li>
                                            </ul>
                                        </li>
                                        <li><a href="services.html">Services</a></li>
                                        <li><a href="faq.html">FAQ</a></li>
                                        <li><a href="sidebar-right.html">Right Sidebar</a></li>
                                        <li><a href="sidebar-left.html">Left Sidebar</a></li>
                                        <li><a href="404-page.html">404 Page</a></li>
                                    </ul> -->
                                </li>
                                
                                <c:if test="${sessionScope.member_type eq 'p'}">
                                <li prop="menu" id="personMain"><a href="#" onclick="javascript:left.pageSubmitFn('personMain')"><span class="data-hover" data-hover="개인회원 서비스">개인회원 서비스</span></a>
                                    <ul class="dropdown-menu">
                                        <li prop="menu" id="personMain"><a href="#" onclick="javascript:left.pageSubmitFn('personMain')">마이페이지</a>

                                        </li>
                                                                    
                                       <c:if test= "${sessionScope.resume_delete == 'N' || empty sessionScope.resume_delete}">
                                       <li prop="menu"  id="personResumeRegister"><a href="#" onclick="javascript:left.pageSubmitFn('personResumeRegister')">이력서	등록</a></li>
                                       </c:if>
                                       
                                       <c:if test= "${sessionScope.resume_delete == 'Y'}">	<!-- 둘다안됨 -->
                                       <%-- <c:if test= "${not empty sessionScope.rusume_title}"> --%>
                                       
                                       <li prop="menu"  id="personResume"><a href="#" onclick="javascript:left.pageSubmitFn('personResume')">이력서	관리</a></li>
                                       </c:if>

                                        <li prop="menu" id="personApplication"><a href="#"	onclick="javascript:left.pageSubmitFn('personApplication')">나의 지원현황</a>

                                        </li>
                                        <li prop="menu" id="personOffer"><a href="#"	onclick="javascript:left.pageSubmitFn('personOffer')">면접제의</a></li>
                                    </ul>
                                </li>
                                </c:if>


                               <c:if test="${sessionScope.member_type eq 'c'}">
                               <li prop="menu" id="companyMain"><a href="#" 	onclick="javascript:left.pageSubmitFn('companyMain')"><span class="data-hover" data-hover="기업회원 서비스">기업회원 서비스</span></a>
                                    <ul class="dropdown-menu">
                                        <li prop="menu" id="companyMain"><a href="#" 	onclick="javascript:left.pageSubmitFn('companyMain')">마이페이지</a>
                                            <!-- <ul class="dropdown-menu">
                                                <li><a href="blog-masonry-two.html">Blog Masonry 2</a></li>
                                                <li><a href="blog-masonry-three.html">Blog Masonry 3</a></li>
                                                <li><a href="blog-masonry-four.html">Blog Masonry 4</a></li>
                                            </ul> -->
                                        </li>
                                        <li prop="menu" id="companyJob"><a href="#" 	onclick="javascript:left.pageSubmitFn('companyJob')">구인공고 등록</a>
                                            <!-- <ul class="dropdown-menu">
                                                <li><a href="blog-large-image.html">Large Image</a></li>
                                                <li><a href="blog-medium-image.html">Medium Image</a></li>
                                            </ul> -->
                                        </li>
                                        <li prop="menu" id="companyJobmanage"><a href="#" 	onclick="javascript:left.pageSubmitFn('companyJobmanage')">구인공고 관리</a></li>
                                   		<li prop="menu" id="companyApplicants"><a href="#" 	onclick="javascript:left.pageSubmitFn('companyApplicants')">지원자 관리</a></li>
                                   		<li prop="menu" id="companyOffer"><a href="#" 	onclick="javascript:left.pageSubmitFn('companyOffer')">면접제의</a></li>
                                   
                                    </ul>
                                </li>
                                </c:if>

                                <li prop="menu" id="about"><a href="#" 	onclick="javascript:left.pageSubmitFn('about')"><span class="data-hover" data-hover="jobQ">jobQ</span></a>
                                    <ul class="dropdown-menu">
                                        <li prop="menu" id="about"><a href="#" 	onclick="javascript:left.pageSubmitFn('about')">About Us</a></li>
                                        <li prop="menu" id="faq"><a href="#" 	onclick="javascript:left.pageSubmitFn('faq')">FAQ</a></li>
                                        <li prop="menu" id="notice"><a href="#" 	onclick="javascript:left.pageSubmitFn('notice')">NOTICE</a></li>
                                   		<c:if test= "${sessionScope.member_id != null}">
                                   			<li prop="menu" id="notice"><a href="#" 	onclick="javascript:left.pageSubmitFn('goQnAList')">QnA</a></li>
                                   		</c:if>
                                    </ul>
                                </li>
                                
                                                           
                            </ul>
                        </div>
                    </div>
                </div>

