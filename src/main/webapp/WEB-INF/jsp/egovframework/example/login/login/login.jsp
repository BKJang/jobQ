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
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#navigation-example-2">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jobq">jobQ</a>
		</div>
		<div class="collapse navbar-collapse">

			<ul class="nav navbar-nav navbar-right">
				<li><a href="join.jobq"> 회원가입 </a></li>
			</ul>
		</div>
	</div>
</nav>


<div class="wrapper wrapper-full-page">
	<div class="full-page login-page" data-color="orange"
		data-image="../../assets/img/full-screen-image-1.jpg">

		<!--   you can change the color of the filter page using: data-color="blue | azure | green | orange | red | purple" -->
		<div class="content">
			<div class="container">
				<div class="row">
					<div class="col-md-4 col-sm-6 col-md-offset-4 col-sm-offset-3">
						<form method="#" action="#">

							<!--   if you want to have the card without animation please remove the ".card-hidden" class   -->
							<div class="card card-hidden">
								<div class="header text-center" style="padding-bottom: 1px;">Login</div>
								<div class="content">
									<!-- <div class="form-group"><p>
										<label class="radio" style="display:inline-block; margin-right:10px"> <input type="radio"
											data-toggle="radio" name="optionsRadios2" value="" >
											개인회원
										</label> <label class="radio" style="display:inline-block"> <input type="radio"
											data-toggle="radio" name="optionsRadios2" value="" checked>
											기업회원
										</label></p>
									</div> -->
	
									<div class="form-group">
										<label>ID</label> 
										<input type="text" placeholder="아이디를 입력하세요" class="form-control" id="login-id" onkeydown='enterkey()'>
									</div>
									
									
									<div class="form-group">
										<label>Password</label> 
										<input type="password" placeholder="비밀번호를 입력하세요" class="form-control" id="login-pwd" onkeydown='enterkey()'>
									</div>







								</div>
								<div class="footer text-center">
									<button type="button" class="btn btn-fill btn-warning btn-wd" id="login-btn" >Login</button>
								</div>
								
								
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>

		<footer class="footer footer-transparent">
			<div class="container">
				<nav class="pull-left">
					<!-- <ul>
                        <li>
                            <a href="#">
                                Home
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                Company
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                Portfolio
                            </a>
                        </li>
                        <li>
                            <a href="#">
                               Blog
                            </a>
                        </li>
                    </ul> -->
				</nav>
				<p class="copyright text-center">
					&copy; Copyright 2017 by 2017 <a href="main.jobq">jobQ</a>
				</p>
			</div>
		</footer>

	</div>

</div>


</body>


</html>