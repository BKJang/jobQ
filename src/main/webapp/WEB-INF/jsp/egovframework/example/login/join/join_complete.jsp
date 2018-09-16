<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>







<nav class="navbar navbar-transparent navbar-absolute">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse">

            <ul class="nav navbar-nav navbar-right">
                <li>
                   <a href = "login.jobq">
                        로그인하기
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="wrapper wrapper-full-page">
    
    <div class="full-page lock-page" data-color="orange" data-image="../../assets/img/full-screen-image-4.jpg">   
        
    <!--   you can change the color of the filter page using: data-color="blue | azure | green | orange | red | purple" -->
        <div class="content">
            <form method="#" action="#">
                <div class="user-profile">        
                    <div class="author">
                        <img class="avatar" src="images/img-style.jpg" alt="...">
                    </div> 
                    <h4>hj90barca님! 기업회원 가입이 완료되었습니다.</h4> 
                    
                    <button type="button" class="btn btn-neutral btn-round btn-fil btn-wd">로그인하기</button>                                 
                </div>
            </form>
        </div>


    	<footer class="footer footer-transparent">
            <div class="container">
                <p class="copyright text-center">
                    &copy; Copyright 2017 by 2017 <a href="main.jobq">jobQ</a>
                </p>
            </div>
        </footer>

    </div>

</div>


</body>


</html>
