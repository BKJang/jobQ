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
                            <h2>기업회원 가입하기</h2>
                            <h4>잡큐에 오신것을 환영합니다! 가입 후 채용공고를 등록해 보세요 :)</h4>
                            <hr />
                        </div>
                    </div>
                    <div class="col-md-4 col-md-offset-2">
                                           
                        <form method="#" action="#">
                            <div class="card card-plain">
                                <div class="content">
                                    <div class="form-group">
                                        회사명 <input type="name" placeholder="회사명을 입력하세요" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        사업자번호 <input type="name" placeholder="사업자번호를 입력하세요" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        아이디 <input type="id" placeholder="사용할 아이디를 입력하세요" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        비밀번호<input type="password" placeholder="비밀번호를 입력하세요" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        비밀번호 확인<input type="password" placeholder="다시한번 비밀번호를 입력하세요" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        대표자명<input type="text" placeholder="휴대폰번호를 입력하세요" class="form-control">
                                    </div>                                 
                                    <div class="form-group">
                                    기업형태<select name="ctype">
									    <option value="">대기업</option>
									    </select>
									    
									    설립년도<select name="birth">
									    <option value="">2001</option></select>
									    </div>
									    
									 <div class="form-group">
                                      사업내용 <input type="text" placeholder="사업내용을 입력하세요 (최대 50글자)" class="form-control">
                                    </div>
                                    <div class="form-group">
                                      직원수 <input type="text" placeholder="직원수를 입력하세요" class="form-control">
                                    </div>
                                    <div class="form-group">
                                      홈페이지 <input type="text" placeholder="회사 홈페이지 주소를 입력하세요" class="form-control">
                                    </div>
                                    
                                    </div>
                                    
                                    
                                    
                                </div>
                                
                            </div>
             
                    
                    <div class="col-md-4 col-md-offset-s1">
                        <form method="#" action="#">
                            <div class="card card-plain">
                                <div class="content">
                                    <div class="form-group">
                                        회사명 <input type="name" placeholder="회사명을 입력하세요" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        사업자번호 <input type="name" placeholder="사업자번호를 입력하세요" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        아이디 <input type="id" placeholder="사용할 아이디를 입력하세요" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        비밀번호<input type="password" placeholder="비밀번호를 입력하세요" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        비밀번호 확인<input type="password" placeholder="다시한번 비밀번호를 입력하세요" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        휴대폰번호<input type="text" placeholder="휴대폰번호를 입력하세요" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        이메일 <input type="email" placeholder="이메일주소를 입력하세요" class="form-control">
                                    </div>
                                    <div class="form-group">
                                    생년월일<select name="birth">
									    <option value="">태어난 해</option>
									</select>
									<select name="birth2">
									    <option value="">태어난 월</option>
									</select>
									<select name="birth3">
									    <option value="">태어난 일</option>
									</select>
                                        
                                    </div>
                                    <div class="form-group">
                                        <div class="form-group"><p>
										<label class="radio"> <input type="radio"
											data-toggle="radio" name="optionsRadios2" value="">
											남성
										</label> <label class="radio"> <input type="radio"
											data-toggle="radio" name="optionsRadios2" value="" checked>
											여성
										</label></p>
									</div>
                                    </div>
                                    
                                </div>
                                
                            </div>
                        </form>
<div class="footer text-center">
                                    <button type="submit" class="btn btn-fill btn-neutral btn-wd">가입완료</button>
                                </div>
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
