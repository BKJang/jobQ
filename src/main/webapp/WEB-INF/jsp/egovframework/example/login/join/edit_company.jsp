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

		var member_id = document.getElementById('member_id');
		var member_companyName = document.getElementById('member_companyName');
		var member_boss = document.getElementById('member_boss');
		var member_numCompany = document.getElementById('member_numCompany');
		var member_typeCompany = document.getElementById('member_typeCompany');
		var member_birthCompany = document.getElementById('member_birthCompany');
		var member_totalNumCompany = document.getElementById('member_totalNumCompany');
		var member_explainCompany = document.getElementById('member_explainCompany');
		var member_homepage = document.getElementById('member_homepage');	
		var member_name = document.getElementById('member_name');
		var member_phone = document.getElementById('member_phone');
		var member_email = document.getElementById('member_email');
				
		var full_address = document.getElementById('full_address');
		var address3 = document.getElementById('address3');
		
		var member_sex = $('input:radio[name=member_sex]:checked').val(); // 선택된 radio(sex)의 value 가져오기!!
		
		var regExp = /^\d{3}-\d{3,4}-\d{4}$/;
		
		

		
		if (member_companyName.value == '' || member_companyName.value == null) {

			alert('회사명을 입력하세요');

			focus.member_companyName;

			return false;

		}
		
		if (member_boss.value == '' || member_boss.value == null) {

			alert('대표자명을 입력하세요');

			focus.member_boss;

			return false;

		}
		
		if (member_numCompany.value == '' || member_numCompany.value == null) {

			alert('사업자번호를 입력하세요');

			focus.member_boss;

			return false;

		}
		
		if (member_typeCompany.value == '' || member_typeCompany.value == null) {

			alert('기업형태를 입력하세요');

			focus.member_boss;

			return false;

		}
		
		if (member_birthCompany.value == '' || member_birthCompany.value == null) {

			alert('설립일을 선택하세요');

			focus.member_birthCompany;

			return false;

		}
		
		if (member_totalNumCompany.value == '' || member_totalNumCompany.value == null) {

			alert('직원수를 입력하세요');

			focus.member_totalNumCompany;

			return false;

		}
		
		if (member_explainCompany.value == '' || member_explainCompany.value == null) {

			alert('사업내용을 간략하게 입력하세요');

			focus.member_explainCompany;

			return false;

		}
		
		if (full_address.value == '' || full_address.value == null) {

			alert('주소찾기 버튼을 클릭하여 주소를 선택하세요');

			focus.full_address;

			return false;

		}
		
	
		
		
		if (address3.value == '' || address3.value == null) {

			alert('상세주소를 입력하세요');

			focus.address3;

			return false;

		}
		
		
		if (member_phone.value == '' || member_phone.value == null) {

			alert('담당자 연락처를 입력하세요');

			focus.member_phone;

			return false;

		}
		
		 if (!regExp.test($("#member_phone").val())) {
				
				alert('-를 포함하여 올바른 연락처를 입력하세요.');
				
				return false;
			} 
		
		
		if (member_email.value == '' || member_email.value == null) {

			alert('이메일주소를 입력하세요');

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


<!-- 선형꺼 참고 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 주소 및 위도 경도 가져오기 부분 -->
<script> 
    function jusoSearch() {
    	
        new daum.Postcode({
            oncomplete: function(data) {
            	
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.roadAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                
         	    // 주소 정보를 해당 필드에 넣는다.
                document.getElementById('full_address').value = fullAddr;
                //시,도 자동으로 넣기
                document.getElementById('chooseAdd1').value = data.sido;
                //시,군,구 자동으로 넣기
                /* document.getElementById('chooseAdd2').value = data.sigungu;
                //읍,면,동 자동으로 넣기
                document.getElementById('chooseAdd3').value = data.bname; */
                //우편번호는 뒤로 감추기
                //document.getElementById('chooseAdd3').value = data.bname;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('postNum').value = data.zonecode;
                
              }
        }).open();
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
														"<c:out value="${editCompany['0'].id}" />"<hr />
						</div>
					</div>

					<div class="content">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-8 join-content">
									<div class="card">
										<div class="content" style="padding: 30px 20px">
											<form action="/sample/update_company.jobq" method="post" id="edit">
												<input type="hidden" id="member_id" name="member_id" value="<c:out value="${editCompany['0'].id}" />">	
		
												<!-- 우편번호와 Area -->
												<input type="hidden" id="postNum" name="postNum" value="<c:out value="${editCompany['0'].address1}" />">
												<input type="hidden" id="chooseAdd1" name="chooseAdd1" value="">
														
												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label>ID</label> <input type="text" class="form-control"
																disabled placeholder="아이디" id="member_id" name="member_id"
																value="<c:out value="${editCompany['0'].id}" />">
														</div>
													</div>
													
												</div>



												<div class="row">
													<div class="col-md-5">
														<div class="form-group">
															<label>* 회사명</label> <input type="text"
																class="form-control" placeholder="회사명"
																 id="member_companyName" name="member_companyName"
																 value="<c:out value="${editCompany['0'].companyName}" />">
														</div>
													</div>
													<div class="col-md-3">
														<div class="form-group">
															<label>* 대표자</label> <input type="text"
																class="form-control" placeholder="대표자명" 
																id="member_boss" name="member_boss"
																value="<c:out value="${editCompany['0'].boss}" />">
														</div>
													</div>
													<div class="col-md-4">
														<div class="form-group">
															<label for="exampleInputEmail1">* 사업자번호</label> <input
																type="text" class="form-control" placeholder="사업자번호"
																id="member_numCompany" name="member_numCompany"
																value="<c:out value="${editCompany['0'].numCompany}" />">
														</div>
													</div>
												</div>

												<div class="row">
													<div class="col-md-5">
														<div class="form-group">
															<label>* 기업형태</label> <input type="text"
																class="form-control" placeholder="기업형태" 
																id="member_typeCompany" name="member_typeCompany"
																value="<c:out value="${editCompany['0'].typeCompany}" />">
														</div>
													</div>
													<div class="col-md-3">
														<div class="form-group">
															<label>* 설립일</label> <input type="date"
																class="form-control" placeholder="Username"
																id="member_birthCompany" name="member_birthCompany"
																value="<c:out value="${editCompany['0'].birthCompany.toString().substring(0, 10)}" />">
														</div>
													</div>
													<div class="col-md-4">
														<div class="form-group">
															<label for="exampleInputEmail1">* 직원수</label> <input
																type="text" class="form-control"
																placeholder="직원수를 입력하세요"
																id="member_totalNumCompany" name="member_totalNumCompany"
																value="<c:out value="${editCompany['0'].totalNumCompany}" />">
														</div>
													</div>
												</div>

												<div class="row">
													<div class="col-md-12">
														<div class="form-group">
															<label>* 사업내용</label> <input type="text"
																class="form-control" placeholder="간략한 사업내용을 입력해주세요."
																id="member_explainCompany" name="member_explainCompany"
																value="<c:out value="${editCompany['0'].explainCompany}" />">
														</div>
													</div>
												</div>

												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label>* 회사주소</label> 
															<input type="text" class="form-control" placeholder="도로명 주소찾기를 클릭하세요"
																onclick="jusoSearch();" id="full_address" name="full_address"
																value="<c:out value="${editCompany['0'].address2}" escapeXml="false" />">
														</div>
													</div>
													<div class="col-md-6" style="top: 25px">
														<a class="btn btn-info" onclick='jusoSearch()'>도로명 주소찾기</a>
													</div>
												</div>
													
												<div class="row">
													<div class="col-md-8">
														<div class="form-group">
													<input type="text" class="form-control address3" id="address3" name="address3" placeholder="상세주소를 입력하세요"
													value="<c:out value="${editCompany['0'].address3}" />">
													</div>
													</div>
												</div>
													

												<div class="row">
													<div class="col-md-10">
														<div class="form-group">
															<label>홈페이지</label> <input type="text"
																class="form-control" placeholder="Home Address"
																id="member_homepage" name="member_homepage"
																value="<c:out value="${editCompany['0'].homepage}" />">
														</div>
													</div>
												</div>





												<div class="row">
													<div class="col-md-12">
														<div class="form-group">
															<h6>담당자정보 기본설정 (공고별로 상이하게 입력하실 수 있습니다.)</h6>
														</div>
													</div>
												</div>

												<div class="row">
													<div class="col-md-4">
														<div class="form-group">
															<label>* 담당자 이름</label> <input type="text"
																class="form-control" placeholder="담당자 이름" id="member_name" name="member_name"
																value="<c:out value="${editCompany['0'].name}" />">
														</div>
													</div>

												</div>

												<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label>* 담당자 연락처</label> <input type="text"
																class="form-control" placeholder="-포함하여 입력하세요" id="member_phone" name="member_phone"
																value="<c:out value="${editCompany['0'].phone}" />">
														</div>
													</div>
													<div class="col-md-6">
														<div class="form-group">
															<label>* 담당자 이메일주소</label> <input type="text"
																class="form-control" placeholder="이메일주소" id="member_email" name="member_email"
																value="<c:out value="${editCompany['0'].email}" />">
														</div>
													</div>
												</div>

																								<div class="row">
													<div class="col-md-6">
														<div class="form-group">
															<label>* 생년월일</label> 
															<input type="date" class="form-control"  id="member_birth" name="member_birth"
															value="<c:out value="${editCompany['0'].birth.toString().substring(0, 10)}" />">
															
														</div>
													</div>
												</div>

												<div class="row">
													<div class="col-md-5">
														<div class="form-group">
															<label>성별</label><br>
															
															<c:if test="${editCompany['0'].sex eq 0}">														
															<label class="radio" style="display: inline-block; margin-right: 10px">
																<input type="radio" data-toggle="radio"	name="member_sex" value="0" checked="checked"> 남성</label> 
															<label class="radio" style="display: inline-block">
																<input type="radio" data-toggle="radio"	name="member_sex" value="1"> 여성	</label>
															</c:if>
															
															<c:if test="${editCompany['0'].sex eq 1}">
															<label class="radio" style="display: inline-block; margin-right: 10px">
																<input type="radio" data-toggle="radio"	name="member_sex" value="0" > 남성</label> 
															<label class="radio" style="display: inline-block">
																<input type="radio" data-toggle="radio"	name="member_sex" value="1" checked="checked"> 여성	</label>
															</c:if>
															
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