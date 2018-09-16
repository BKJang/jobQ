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

$(document).ready(function() {

	
	var member_id = "<%=(String)session.getAttribute("member_id")%>";
	
});
	

	function formCheck() {
		
		

		
		/* var password = document.getElementById('password');
		var password_check = document.getElementById('password_check'); */
		var member_name = document.getElementById('member_name');
		var member_phone = document.getElementById('member_phone');
		var member_email = document.getElementById('member_email');		
		var member_birth = document.getElementById('member_birth');
		var member_sex = $('input:radio[name=member_sex]:checked').val(); // 선택된 radio(sex)의 value 가져오기!!
		var member_homepage = document.getElementById('member_homepage');
		
		var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
		var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

		/* if (password.value == '' || password.value == null) {

			alert('비밀번호를 입력하세요');

			focus.password;

			return false;

		}

		if (password_check.value == '' || password_check.value == null) {

			alert('비밀번호확인란을 입력하세요');

			focus.password_check;

			return false;

		} */

		/* if (password.value != password_check.value) {

			alert("비밀번호와 비밀번호 확인란이 다릅니다.");

			focus.passowrd;

			return false;

		} */
		
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

		var str3 = document.getElementById('edit');

		str3.submit();

		alert("회원정보 수정이 완료되었습니다.")

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
				<li><a href="main.jobq"> 홈으로 </a></li>
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
							<h2><b>${sessionScope.member_name}</b>님의 회원정보</h2>
							
							<h4>잡큐를 이용해주셔서 감사합니다 :)</h4>
														"<c:out value="${editPerson['0'].id}" />"<hr />
						</div>
					</div>



					<div class="content">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-8 join-content">
									<div class="card">

										<div class="content" style="padding: 30px 20px">
											<form action="/sample/update_person.jobq" method="post" id="edit">
												<input type="hidden" id="member_id" name="member_id" value="<c:out value="${editPerson['0'].id}" />">	
		
												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label>ID</label> <input type="text" class="form-control"
																disabled placeholder="아이디" id="member_id" name="member_id"
																value="<c:out value="${editPerson['0'].id}" />">
														</div>
													</div>
													<div class="col-md-6" style="top: 25px">
														<!-- <input type="button" class="btn btn-info" value="중복확인"
															onclick='idCheck()'> -->
													</div>
												</div>

												<!-- <div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label>비밀번호 | <b>변경을 원하실 경우 입력해주세요!</b></label> <input type="password"
																class="form-control" placeholder="비밀번호" id="password"
																name="member_password">
														</div>
													</div>
												</div>

												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label>비밀번호 확인</label> <input type="password"
																class="form-control" placeholder="비밀번호를 다시 입력하세요" id="password_check"
																name="password_check">
														</div>
													</div>
												</div> -->

												<div class="row">
													<div class="col-md-5">
														<div class="form-group">
															<label>이름</label> <input type="text" class="form-control"
																placeholder="이름" id="member_name" name="member_name"
																value="<c:out value="${editPerson['0'].name}" />">
														</div>
													</div>
												</div>

												<div class="row">
													<div class="col-md-5">
														<div class="form-group">
															<label>휴대폰번호</label> <input type="text"
																class="form-control" placeholder="-없이 입력하세요" id="member_phone" name="member_phone"
																value="<c:out value="${editPerson['0'].phone}" />">
														</div>
													</div>
													<div class="col-md-5">
														<div class="form-group">
															<label>이메일주소</label> <input type="text"
																class="form-control" placeholder="이메일주소" id="member_email" name="member_email"
																value="<c:out value="${editPerson['0'].email}" />">
														</div>
													</div>
												</div>

												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label>생년월일</label> 
															<input type="date" class="form-control"  id="member_birth" name="member_birth"
															value="<c:out value="${editPerson['0'].birth.toString().substring(0, 10)}" />">
															
														</div>
													</div>
												</div>

												<div class="row">
													<div class="col-md-5">
														<div class="form-group">
															<label>성별</label><br>
															
															<c:if test="${editPerson['0'].sex eq 0}">														
															<label class="radio" style="display: inline-block; margin-right: 10px">
																<input type="radio" data-toggle="radio"	name="member_sex" value="0" checked="checked"> 남성</label> 
															<label class="radio" style="display: inline-block">
																<input type="radio" data-toggle="radio"	name="member_sex" value="1"> 여성	</label>
															</c:if>
															
															<c:if test="${editPerson['0'].sex eq 1}">
															<label class="radio" style="display: inline-block; margin-right: 10px">
																<input type="radio" data-toggle="radio"	name="member_sex" value="0" > 남성</label> 
															<label class="radio" style="display: inline-block">
																<input type="radio" data-toggle="radio"	name="member_sex" value="1" checked="checked"> 여성	</label>
															</c:if>
															
														</div>
													</div>
												</div>



												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label>홈페이지</label> <input type="text"
																class="form-control" placeholder="홈페이지 주소" id="member_homepage" name="member_homepage"
																value="<c:out value="${editPerson['0'].homepage}" />">
														</div>
													</div>
												</div>



										


												<input type="button"
													class="btn btn-info btn-fill pull-right" id="edit"
													name="edit" value="수정완료" onclick="javascript:formCheck();">

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
			



