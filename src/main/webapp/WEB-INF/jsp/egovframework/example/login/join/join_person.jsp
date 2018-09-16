<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<script type="text/javascript" src="resources/js/jquery_latest_160826.js"></script>  

<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script> --> 

<script type="text/javascript">
	var count = 0;

	function idCheck() {

		var text = $("#member_id").val();
		var regexp = /[0-9a-zA-Z]/; // 숫자,영문,특수문자
		// var regexp = /[0-9]/; // 숫자만
		//         var regexp = /[a-zA-Z]/; // 영문만

		for (var i = 0; i < text.length; i++) {

			if (text.charAt(i) != " " && regexp.test(text.charAt(i)) == false) {
				alert("한글이나 특수문자는 입력불가능 합니다.");

				return false;

			}
		}
		overlapCheck();

	}

	function overlapCheck() {

		var param = "member_id" + "=" + $("#member_id").val();

		if ($("#member_id").val() == '' || $("#member_id").val() == null)

		{
			alert("아이디를 입력하세요");

			return false;
		}

		$.ajax({

			url : "/sample/overlaptest.jobq",
			type : "POST",
			data : param,
			cache : false,
			async : false,
			dataType : "text",
			success : function(response) {

				if (response == '0')

				{
					count = 1;

					alert("사용가능한 아이디 입니다.")
					
				} else	{
					
					alert("이미 존재하는 아이디입니다. 다른 아이디를 입력하세요.");
					
					$("#member_id").val("");
					
					return false;
				}
			},

			error : function(request, status, error) {

				if (request.status != '0') {			
					
					alert(count + "아작스오류")
					
					/* alert("code : " + request.status + "\r\nmessage : "

					+ request.reponseText + "\r\nerror : " + error); */

				}

			} 

		});

	}

	function formCheck() {
		
		

		var member_id = document.getElementById('member_id');
		var password = document.getElementById('password');
		var password_check = document.getElementById('password_check');
		var member_name = document.getElementById('member_name');
		var member_phone = document.getElementById('member_phone');
		var member_email = document.getElementById('member_email');		
		var member_birth = document.getElementById('member_birth');
		var member_sex = $('input:radio[name=member_sex]:checked').val(); // 선택된 radio(sex)의 value 가져오기!!
		var member_homepage = document.getElementById('member_homepage');
		
		var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
		var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		//alert('성별(남0여1) :' + member_sex);

		


		if (member_id.value == '' || member_id.value == null) {

			alert('아이디를 입력하세요');

			focus.member_id;

			return false;

		}
		
		if (count == 0)

		{
			
			alert("중복확인을 눌러주세요");

			return null;

		}

		if (password.value == '' || password.value == null) {

			alert('비밀번호를 입력하세요');

			focus.password;

			return false;

		}

		if (password_check.value == '' || password_check.value == null) {

			alert('비밀번호확인란을 입력하세요');

			focus.password_check;

			return false;

		}

		if (password.value != password_check.value) {

			alert("비밀번호와 비밀번호 확인란이 다릅니다.");

			focus.passowrd;

			return false;

		}
		
		if (member_name.value == '' || member_name.value == null) {

			alert('이름을 입력하세요');

			focus.member_name;

			return false;

		}
		
		
		if (member_phone.value == '' || member_phone.value == null) {

			alert('휴대폰번호를 입력하세요');

			focus.member_phone;

			return false;

		}
		
		 if (!regExp.test($("#member_phone").val())) {
				
				alert('-를 포함하여 올바른 휴대폰번호를 입력하세요.');
				
				return false;
			}  
		
		
		if (member_email.value == '' || member_email.value == null) {

			alert('이메일주소를 입력하세요');

			focus.member_email;

			return false;

		}
		
		if (!regEmail.test($("#member_email").val())) {
			
			alert('이메일 형식을 다시 한 번 확인해주세요');
			
			focus.member_email;
			
			return false;
		}
		
		if (member_birth.value == '' || member_birth.value == null) {

			alert('생년월일을 선택하세요');

			focus.member_birth;

			return false;

		}
		
		
		
		if(member_sex === undefined) // 라디오 선택을 하지 않았을 경우
		{
		    alert('성별을 선택해주세요.');
		    
		    focus.member_sex;
		    
		    return false;
		} 
		

		else {
			
			save();			

		}

	}
	


	function init() {

		count = 0;

	}

	function save() {

		var str3 = document.getElementById('join');

		str3.submit();

		alert("가입이 완료되었습니다. 새로운 아이디로 로그인 하세요 :)")

	}

	function countCheck() {

		if (count == 1) {

			count = 0;

		}

	}
</script>






<nav class="navbar navbar-transparent navbar-absolute">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#navigation-example-2">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse">

			<ul class="nav navbar-nav navbar-right">
				<li><a href="login.jobq"> 로그인하기 </a></li>
			</ul>
		</div>
	</div>
</nav>

<div class="wrapper wrapper-full-page">
	<div class="full-page register-page" data-color="orange"
		data-image="../../assets/img/full-screen-image-2.jpg">

		<!--   you can change the color of the filter page using: data-color="blue | azure | green | orange | red | purple" -->
		<div class="content">
		

			<div class="container">
				<div class="row">
					<div class="col-md-8 col-md-offset-2 join-header">
						<div class="header-text">
							<h2>개인회원 가입하기</h2>
							<h4>잡큐에 오신것을 환영합니다! 가입 후 이력서를 등록해 보세요 :)</h4>
							<hr />
						</div>
					</div>



					<div class="content">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-8 join-content">
									<div class="card">

										<div class="content" style="padding: 30px 20px">
											<form action="/sample/join_person_complete.jobq" method="post" id="join">
												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label>* ID</label> <input type="text" class="form-control"
																placeholder="아이디" id="member_id" name="member_id"
																onkeydown="countCheck();" onkeypress="countCheck();">
														</div>
													</div>
													<div class="col-md-6" style="top: 25px">
														<input type="button" class="btn btn-info" value="중복확인"
															onclick='idCheck()'>
													</div>
												</div>

												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label>* 비밀번호</label> <input type="password"
																class="form-control" placeholder="비밀번호" id="password"
																name="member_password">
														</div>
													</div>
												</div>

												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label>* 비밀번호 확인</label> <input type="password"
																class="form-control" placeholder="비밀번호를 다시 입력하세요" id="password_check"
																name="password_check">
														</div>
													</div>
												</div>

												<div class="row">
													<div class="col-md-5">
														<div class="form-group">
															<label>* 이름</label> <input type="text" class="form-control"
																placeholder="이름" id="member_name" name="member_name">
														</div>
													</div>
												</div>

												<div class="row">
													<div class="col-md-5">
														<div class="form-group">
															<label>* 휴대폰번호</label> <input type="text"
																class="form-control" placeholder="-포함하여 입력하세요" id="member_phone" name="member_phone">
														</div>
													</div>
													<div class="col-md-5">
														<div class="form-group">
															<label>* 이메일주소</label> <input type="text"
																class="form-control" placeholder="이메일주소" id="member_email" name="member_email">
														</div>
													</div>
												</div>

												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label>* 생년월일</label> 
															<input type="date" class="form-control"  id="member_birth" name="member_birth">
															
														</div>
													</div>
												</div>

												<div class="row">
													<div class="col-md-5">
														<div class="form-group">
															<label>* 성별</label><br>
															
															<label class="radio" style="display: inline-block; margin-right: 10px">
																<input type="radio" data-toggle="radio"	name="member_sex" value="0" checked="checked"> 남성</label> 
															<label class="radio" style="display: inline-block">
																<input type="radio" data-toggle="radio"	name="member_sex" value="1"> 여성	</label>
														</div>
													</div>
												</div>



												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label>홈페이지</label> <input type="text"
																class="form-control" placeholder="홈페이지 주소" id="member_homepage" name="member_homepage">
														</div>
													</div>
												</div>



										


												<input type="button"
													class="btn btn-info btn-fill pull-right" id="join"
													name="join" value="가입완료" onclick="javascript:formCheck();">

												<div class="clearfix"></div>
											</form>
										</div>
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

			</div>
			</div>
			</div>
			


			</body>
			



