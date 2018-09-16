<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<script>

var mainlist = {
		

		jobDetailFn : function(pageName, gonggoNum) {
			
			//공고상세 페이지 : 비로그인 접근 불가
			var memeber_id= "<%=(String)session.getAttribute("member_id") %>";
			
			if (memeber_id == 'null') {	
				
				
				alert("로그인을 먼저 해주세요");
				$("#frm_job").attr("action", "login.jobq"); 
				
				$("#frm_job").submit();
			}else{
				
				/* alert(gonggoNum);
				
				alert("${mainList['0'].jobnumber}"); */
				
				$("#pageName").val(pageName);
				$("#gonggoID").val(gonggoNum);
				
				$("#frm_job").attr("action", pageName + ".jobq");
		
				$("#frm_job").submit();
			}
	}
};




<%-- $(document).ready(function() {

	
			var member_id = "<%=(String)session.getAttribute("member_id")%>";
			var member_name = "<%=(String)session.getAttribute("member_name")%>";
			var member_type = "<%=(String)session.getAttribute("member_type")%>";
			var resume_title = "<%=(String)session.getAttribute("resume_title")%>";

			alert('아이디는 : ' + member_id + ' , 이름은 : ' + member_name + ' , 타입 : ' + member_type + ' , 이력서제목 : ' + resume_title);
			
	
}); --%>
		
</script> 


<form id="frm_job" name="frm_job" method="get">
	<input type="hidden" id="pageName"  name="pageName" /> 
	<input type="hidden" id="signTrgNo" name="signTrgNo" />
	<input type="hidden" id="gonggoID" name="gonggoID" />
</form>

<body class="home">
  <div class="slider_block">
        <div class="flexslider top_slider">
            <ul class="slides">
                <li class="slide1">
                    <div class="container">
                        <div class="flex_caption1" >

                            <p class="slide-heading FromTop" >IT업계 구인구직 서비스</p><br/>

                            <p class="sub-line FromBottom">개발자 전문 버티컬 리크루팅 네트워크   </p><br/>

                          
                        </div>
                        
                    </div>
                </li>

                <li class="slide2">
                    <div class="container">
                        <div class="slide flex_caption1">
                            <p class="slide-heading FromTop">전문 인재</p><br/>

                            <p class="sub-line FromRight">웹개발, 웹프로그래머, 시스템 프로그래머, 응용 프로그래머 </p><br/>
                        </div>
                        <div class="flex_caption2 FromBottom"></div>
                    </div>
                </li>
                <li class="slide3">
                    <div class="container">
                        <div class="slide flex_caption1">
                            <p class="slide-heading FromTop">자유로운 소통의 장 </p><br/>

                            <p class="sub-line FromRight">면접 정보, 자유게시판, 묻고답하기</p><br/>

                            

                        </div>
                        <div class="flex_caption2 FromRight"></div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
	
	<!--start wrapper-->
	<section class="wrapper">
	
		<!-- 비 로그인시에만 노출되는 섹션 -->
		<c:if test= "${empty sessionScope.member_id}">
		
		<section class="promo_box dark  wow fadeInDown">
			<div class="container">
                <div class="row">
                    <div class="col-sm-9">
                        <div class="promo_content">
                                 <h3>간단한 회원가입, 언제나 무료 서비스! :) </h3>
                        <p>잡큐는 건강하고 올바른 고용문화를 위해 노력하고 있습니다. </p>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="pb_action">
                            <a class="btn btn-lg btn-default" href="join.jobq">
                                <i class="fa fa-child"></i>
                            join
                            </a>
                        </div>
                    </div>
                </div>
			</div>
		</section> 
		
		</c:if>

        
        <section class="feature_bottom">
            <div class="container">
                <div class="row sub_content col-lg-8 col-md-8 col-sm-8">
                    <div class="col-lg-12 col-md-12 col-sm-12 wow fadeInLeft">
                        <div class="dividerHeading">
                            <h4><span>HOT  채용정보</span></h4>
                        </div>
                        <div class="row">
                        
                        	<a href="#"	onclick="javascript:mainlist.jobDetailFn('jobDetail', ${mainList['0'].jobnumber} )">
                            <div class="col-lg-6  rec_blog">
                               
                                <div class="blogPic">
                                    <img alt="" src="<c:out value="${mainList['0'].imageLogo}" />" >
                                   
                                </div>
                                <div class="blogDetail bx_width">
                                    <div class="blogTitle">

                                        	<h1><c:out value="${mainList['0'].company}" /></h1>
                                            <h2><c:out value="${mainList['0'].title}" /></h2>


                                    </div>
                                    <div class="blogMeta">
                                        
                                            <i class="fa fa-calendar"></i>
                                            <c:out value="${mainList['0'].dateClose}" />
                                        
                                       
                                            <i class="fa fa-user"></i>
                                            <c:out value="${mainList['0'].career}" />
                                        
                                        
                                            <i class="fa fa-comment"></i>
                                            C++
                                       
                                    </div>                                    
                                </div>
                            </div>
                            </a>
							
							<a href="#"	onclick="javascript:mainlist.jobDetailFn('jobDetail', ${mainList['1'].jobnumber} )">	
                            <div class="col-lg-6  rec_blog"> 
                                <div class="blogPic">
                                    <img alt="" src="<c:out value="${mainList['1'].imageLogo}" />" >
                                   
                                </div>
                                <div class="blogDetail bx_width">
                                    <div class="blogTitle">

                                        	<h1><c:out value="${mainList['1'].company}" /></h1>
                                            <h2><c:out value="${mainList['1'].title}" /></h2>


                                    </div>
                                    <div class="blogMeta">

                                            <i class="fa fa-calendar"></i>
                                            <c:out value="${mainList['1'].dateClose}" />


                                            <i class="fa fa-user"></i>
                                            <c:out value="${mainList['1'].career}" />


                                            <i class="fa fa-comment"></i>
                                            JAVA·SPRING

                                    </div>
                                    
                                </div>
                            </div>
                            </a>
                            
                            </div>
                        </div>
                    </div>

                    <!-- TESTIMONIALS -->
                    <div class="col-lg-4 col-md-4 col-sm-4 wow fadeInRight" style="padding-top:30px">
                        <div class="dividerHeading">
                            <h4><span>잡큐의 면접TIP</span></h4>
                        </div>
                        <div id="testimonial-carousel" class="testimonial carousel slide">
                            <div class="carousel-inner">
                                <div class="active item">
                                    <div class="testimonial-item">
                                        <div class="icon"><i class="fa fa-quote-right"></i></div>
                                        <blockquote>
                                            <p><c:out value="${mainTipList['0'].content}" /></p>
                                        </blockquote>
                                        <div class="icon-tr"></div>
                                        <%-- <div class="testimonial-review">
                                            <img src="images/testimonials/1.png" alt="testimoni">
                                            <h1><c:out value="${mainTipList['0'].name}" /><small><c:out value="${mainTipList['0'].company}" /></small></h1>
                                        </div> --%>
                                    </div>
                                </div>

                                <div class="item">
                                    <div class="testimonial-item">
                                        <div class="icon"><i class="fa fa-quote-right"></i></div>
                                        <blockquote>
                                            <p><c:out value="${mainTipList['1'].content}" /></p>
                                        </blockquote>
                                        <div class="icon-tr"></div>
                                        <%-- <div class="testimonial-review">
                                            <img src="images/testimonials/2.png" alt="testimoni">
                                            <h1><c:out value="${mainTipList['1'].name}" /><small><c:out value="${mainTipList['1'].company}" /></small></h1>
                                        </div> --%>
                                    </div>
                                </div>

                                

                            </div>
                            <div class="testimonial-buttons"><a href="#testimonial-carousel" data-slide="prev"><i class="fa fa-chevron-left"></i></a>&#32;
                                <a href="#testimonial-carousel" data-slide="next"><i class="fa fa-chevron-right"></i></a></div>
                        </div>
                    </div><!-- TESTIMONIALS END -->

			</div>
        </section>
        
        
        
        
        
            <section class="team">
        <div class="container">
            <div class="row  sub_content">
                <div class="col-lg-12 col-md-12 col-sm-12">
                    <div class="dividerHeading">
                        <h4><span>스페셜 채용정보</span></h4>
                    </div>
                </div>
                <a href="#"	onclick="javascript:mainlist.jobDetailFn('jobDetail', ${mainList2['0'].jobnumber} )">
                <div class="col-lg-3 col-md-3 col-sm-6">
                    <div class="our-team">
                        <div class="pic">
                            <img src="<c:out value="${mainList2['0'].imageLogo}" /> " alt="profile img">                            
                        </div>
                        <div class="team_prof">
                            <h3 class="names"><c:out value="${mainList2['0'].company}" /><small><c:out value="${mainList2['0'].dateClose}" /></small></h3>
                            <p class="description"><c:out value="${mainList2['0'].title}" /> </p>
                        </div>
                    </div>
                </div>
                </a>
                
                <a href="#"	onclick="javascript:mainlist.jobDetailFn('jobDetail', ${mainList2['1'].jobnumber} )">
                <div class="col-lg-3 col-md-3 col-sm-6">
                    <div class="our-team">
                        <div class="pic">
                            <img src="<c:out value="${mainList2['1'].imageLogo}" /> " alt="profile img">
                        </div>
                        <div class="team_prof">
                            <h3 class="names"><c:out value="${mainList2['1'].company}" /><small><c:out value="${mainList2['1'].dateClose}" /></small></h3>
                            <p class="description"><c:out value="${mainList2['1'].title}" /> </p>
                        </div>
                    </div>
                </div>
                </a>
                
                <a href="#"	onclick="javascript:mainlist.jobDetailFn('jobDetail', ${mainList2['2'].jobnumber} )">
                <div class="col-lg-3 col-md-3 col-sm-6">
                    <div class="our-team">
                        <div class="pic">
                            <img src="<c:out value="${mainList2['2'].imageLogo}" /> " alt="profile img">
                        </div>
                        <div class="team_prof">
                            <h3 class="names"><c:out value="${mainList2['2'].company}" /><small><c:out value="${mainList2['2'].dateClose}" /></small></h3>
                            <p class="description"><c:out value="${mainList2['2'].title}" /> </p>
                        </div>
                    </div>
                </div>
                </a>
                
                <a href="#"	onclick="javascript:mainlist.jobDetailFn('jobDetail', ${mainList2['3'].jobnumber} )">
                <div class="col-lg-3 col-md-3 col-sm-6">
                    <div class="our-team">
                        <div class="pic">
                            <img src="<c:out value="${mainList2['3'].imageLogo}" /> " alt="profile img">
                        </div>
                        <div class="team_prof">
                            <h3 class="names"><c:out value="${mainList2['3'].company}" /><small><c:out value="${mainList2['3'].dateClose}" /></small></h3>
                            <p class="description"><c:out value="${mainList2['3'].title}" /> </p>
                        </div>
                    </div>
                </div>
                </a>
                
				<a href="#"	onclick="javascript:mainlist.jobDetailFn('jobDetail', ${mainList2['4'].jobnumber} )">			
                <div class="col-lg-3 col-md-3 col-sm-6">
                    <div class="our-team">
                        <div class="pic">
                            <img src="<c:out value="${mainList2['4'].imageLogo}" /> " alt="profile img">
                        </div>
                        <div class="team_prof">
                            <h3 class="names"><c:out value="${mainList2['4'].company}" /><small><c:out value="${mainList2['5'].dateClose}" /></small></h3>
                            <p class="description"><c:out value="${mainList2['4'].title}" /> </p>
                        </div>
                    </div>
                </div>
                </a>
                
                <a href="#"	onclick="javascript:mainlist.jobDetailFn('jobDetail', ${mainList2['5'].jobnumber} )">
                <div class="col-lg-3 col-md-3 col-sm-6">
                    <div class="our-team">
                        <div class="pic">
                            <img src="<c:out value="${mainList2['5'].imageLogo}" /> " alt="profile img">
                        </div>
                        <div class="team_prof">
                            <h3 class="names"><c:out value="${mainList2['5'].company}" /><small><c:out value="${mainList2['5'].dateClose}" /></small></h3>
                            <p class="description"><c:out value="${mainList2['5'].title}" /> </p>
                        </div>
                    </div>
                </div>
                </a>
                
                <a href="#"	onclick="javascript:mainlist.jobDetailFn('jobDetail', ${mainList2['6'].jobnumber} )">
                <div class="col-lg-3 col-md-3 col-sm-6">
                    <div class="our-team">
                        <div class="pic">
                            <img src="<c:out value="${mainList2['6'].imageLogo}" /> " alt="profile img">
                        </div>
                        <div class="team_prof">
                            <h3 class="names"><c:out value="${mainList2['6'].company}" /><small><c:out value="${mainList2['6'].dateClose}" /></small></h3>
                            <p class="description"><c:out value="${mainList2['6'].title}" /> </p>
                        </div>
                    </div>
                </div>
                </a>
                
                <a href="#"	onclick="javascript:mainlist.jobDetailFn('jobDetail', ${mainList2['7'].jobnumber} )">
                <div class="col-lg-3 col-md-3 col-sm-6">
                    <div class="our-team">
                        <div class="pic">
                            <img src="<c:out value="${mainList2['7'].imageLogo}" /> " alt="profile img">
                        </div>
                        <div class="team_prof">
                            <h3 class="names"><c:out value="${mainList2['7'].company}" /><small><c:out value="${mainList2['7'].dateClose}" /></small></h3>
                            <p class="description"><c:out value="${mainList2['7'].title}" /> </p>
                        </div>
                    </div>
                </div>
                </a>
                
                
            </div>
        </div>
    </section>
    
     <!-- 아래 세줄은 임의로 넣음 -->
            <section>
            <div class="container">
                <div class="row sub_content">
                
                        <div class="col-md-4 wow fadeInUp">
                        <div class="dividerHeading">
                            <h4><span><a href="faq.jobq">job FAQ</a></span></h4>
                        </div>
                            <div id="accordion" class="panel-group accordion"><!-- Accordians -->
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                                <i class="switch fa fa-plus"></i>
                                                <c:out value="${faqList['0'].title}" /> 
                                            </a>
                                        </h4>
                                    </div>
                                    <div class="panel-collapse collapse in" id="collapseOne">
                                        <div class="panel-body"><c:out value="${faqList['0'].content}" /> </div>
                                    </div>
                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">
                                                <i class="switch fa fa-plus"></i>
                                                <c:out value="${faqList['1'].title}" /> 
                                            </a>
                                        </h4>
                                    </div>
                                    <div class="panel-collapse collapse" id="collapseTwo">
                                        <div class="panel-body"><c:out value="${faqList['1'].content}" /> </div>
                                    </div>
                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTen">
                                                <i class="switch fa fa-plus"></i>
                                                <c:out value="${faqList['2'].title}" /> 
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseTen" class="panel-collapse collapse">
                                        <div class="panel-body"><c:out value="${faqList['2'].content}" /> </div>
                                        <div class="panel-body">하나의 공고에는 한번만 지원 가능합니다. 지원취소를 한 경우에도 동일한 공고에 지원 불가능 합니다.</div>
                                    </div>
                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseEleven">
                                                <i class="switch fa fa-plus"></i>
                                                <c:out value="${faqList['3'].title}" /> 
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseEleven" class="panel-collapse collapse">
                                        <div class="panel-body"><c:out value="${faqList['3'].content}" /> </div>
                                        
                                    </div>
                                </div>

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseThree">
                                                <i class="switch fa fa-plus"></i>
                                                <c:out value="${faqList['4'].title}" /> 
                                            </a>
                                        </h4>
                                    </div>
                                    <div class="panel-collapse collapse" id="collapseThree">
                                        <div class="panel-body"><c:out value="${faqList['4'].content}" /> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-8 wow fadeInUp">
						<div class="dividerHeading">
							<h4><span><a href="mainJobstory.jobq">job STORY</a></span></h4>
						
						</div>
						
						

                        <div class="post-recent">
                        
                        	<c:if test= "${empty storyList['0'].image}">
                            <%-- <div class="post-images">
                                <a href="/sample/jobstoryDetail.jobq?storyNum=${storyList['0'].number}">
                                    <img src="${storyList['0'].image}" alt=""/>
                                </a>
                            </div> --%>
                            

                            <div class="post-detail">
                                <h5><a href="/sample/jobstoryDetail.jobq?storyNum=${storyList['0'].number}"><c:out value="${storyList['0'].title}" /></a></h5>
                                <span>
                                    <i class="fa fa-clock-o"></i>
                                    <c:out value="${storyList['0'].date}" />
                                </span>
                                <span>
                                    <i class="fa fa-user"></i>
                                    <a href=""><c:out value="${storyList['0'].commentsCNT}" /> Comments</a>
                                </span>
                                <p>
                                    <c:out value="${storyList['0'].content}" />
                                </p>
                            </div>
                            </c:if>
                            
                            <c:if test= "${storyList['0'].image != null}">
                            <div class="post-images">
                                <a href="/sample/jobstoryDetail.jobq?storyNum=${storyList['0'].number}">
                                    <img src="${storyList['0'].image}" alt=""/>
                                </a>
                            </div> 
                            <div class="post-detail">
                                <h5><a href="/sample/jobstoryDetail.jobq?storyNum=${storyList['0'].number}"><c:out value="${storyList['0'].title}" /></a></h5>
                                <span>
                                    <i class="fa fa-clock-o"></i>
                                    <c:out value="${storyList['0'].date}" />
                                </span>
                                <span>
                                    <i class="fa fa-user"></i>
                                    <a href=""><c:out value="${storyList['0'].commentsCNT}" /> Comments</a>
                                </span>
                                <p>
                                    <c:out value="${storyList['0'].content}" />
                                </p>
                            </div>
                            </c:if>
                         
                        </div>
                        
                        
                        
                        
                        <hr class="dashed">
                        
                        
                        
                        <div class="post-recent">
                        	<c:if test= "${empty storyList['1'].image}">
                            <%-- <div class="post-images">
                                <a href="/sample/jobstoryDetail.jobq?storyNum=${storyList['1'].number}">
                                    <img src="${storyList['1'].image}" alt=""/>
                                </a>
                            </div> --%>

                            <div class="post-detail">
                                <h5><a href="/sample/jobstoryDetail.jobq?storyNum=${storyList['1'].number}">
                                <c:out value="${storyList['1'].title}" /></a></h5>
                                <span>
                                    <i class="fa fa-clock-o"></i>
                                    <c:out value="${storyList['1'].date}" />
                                </span>
                                <span>
                                    <i class="fa fa-user"></i>
                                    <a href=""><c:out value="${storyList['1'].commentsCNT}" /> Comments</a>
                                </span>
                                <p>
                                    <c:out value="${storyList['1'].content}" />
                                </p>
                            </div>
                            </c:if>
                            
                            <c:if test= "${storyList['1'].image != null}">
                            <div class="post-images">
                                <a href="/sample/jobstoryDetail.jobq?storyNum=${storyList['1'].number}">
                                    <img src="${storyList['1'].image}" alt=""/>
                                </a>
                            </div> 

                            <div class="post-detail">
                                <h5><a href="/sample/jobstoryDetail.jobq?storyNum=${storyList['1'].number}">
                                <c:out value="${storyList['1'].title}" /></a></h5>
                                <span>
                                    <i class="fa fa-clock-o"></i>
                                    <c:out value="${storyList['1'].date}" />
                                </span>
                                <span>
                                    <i class="fa fa-user"></i>
                                    <a href=""><c:out value="${storyList['1'].commentsCNT}" /> Comments</a>
                                </span>
                                <p>
                                    <c:out value="${storyList['1'].content}" />
                                </p>
                            </div>
                            </c:if>
                            
                            
                        </div>
                        <!-- 아래 세줄은 임의로 넣음 -->
                        </div>
            </div>
        </section>
        
        
        

    </section>
    
    <!-- Parallax & Get Quote Section -->
    <section class="parallax parallax-1">
        <div class="container">
            <!--<h2 class="center">Testimonials</h2>-->
            <div class="row">
                <div class="col-lg-12 col-sm-12 wow bounceIn ">
                    <div class="heading-item">
                        <h4>
                            (주)jobQ 회사소개 </h4>
                        <p>
                            최고의 개발자들이 모여 만든 잡큐!<br>
                            항상 노력하고 있습니다 : )
                        </p>
                        <a class="btn btn-default" href="about.jobq">About Us</a>
                        <em>or give us call
                            <strong>
                                +23-4321-12323
                            </strong>
                        </em>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<!-- end Parallax & Get Quote Section -->