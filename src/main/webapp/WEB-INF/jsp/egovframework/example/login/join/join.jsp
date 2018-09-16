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
    <div class="full-page register-page" data-color="orange" data-image="../../assets/img/full-screen-image-2.jpg">

    <!--   you can change the color of the filter page using: data-color="blue | azure | green | orange | red | purple" -->
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <div class="header-text">
                            <h2>jobQ 회원가입</h2>
                            <h4>간단한 회원가입으로 모든서비스를 무료로 즐기실 수 있습니다.</h4>
                            <hr />
                        </div>
                    </div>
                    <div class="col-md-4 col-md-offset-2">
                        <div class="media">
                            <div class="media-left">
                                <div class="icon">
                                    <i class="pe-7s-light"></i>
                                </div>
                            </div>
                            <div class="media-body">
                                <h4>IT업계 구인구직 서비스</h4>
                                IT 관련 직종에 종사하시나요? 개발자를 위한 지역/직종별 채용정보는 잡큐에서 확인하세요! 
                            </div>
                        </div>

                        <div class="media">
                            <div class="media-left">
                                <div class="icon">
                                    <i class="pe-7s-users"></i>
                                </div>
                            </div>
                            <div class="media-body">
                                <h4>전문직 인재풀</h4>
                                전문 인재를 찾고 계신가요? 잡큐에서는 무료로 이력서를 등록하고 무료로 채용공고를 등록할 수 있습니다.

                            </div>
                        </div>

                        <div class="media">
                            <div class="media-left">
                                <div class="icon">
                                    <i class="pe-7s-like2"></i>
                                </div>
                            </div>
                            <div class="media-body">
                                <h4>입사지원·면접제의</h4>
                               잡큐에서는 관심있는 채용공고에 입사지원을 하고, 딱 맞는 인재에게 면접을 제의할 수 있습니다.

                            </div>
                        </div>

                    </div>
                    <div class="col-md-4 col-md-offset-s1">
                        <form method="#" action="#">
                            <div class="card card-plain">
                                <div class="content">
                                 <div class="footer text-center">
                                    <div class="form-group">
                                        <input type="button" class="btn btn-fill btn-neutral btn-wd" onclick="location='join_company.jobq'" value="기업회원 가입하기"></input>
                                    </div>
                                    <div class="form-group">
                                        <input type="button" class="btn btn-fill btn-neutral btn-wd" onclick="location='join_person.jobq'" value="개인회원 가입하기"></input>
                                    </div>
                                    </div>
                                </div>
                                
                            </div>
                        </form>

                    </div>
                </div>
            </div>
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
