<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<meta name="viewport" content="width=device-width" />

<title>Jobq</title>

<!-- Bootstrap CSS -->
<link href="/sample/admin/css/bootstrap/bootstrap.min.css" rel="stylesheet">

<!-- Font awesome CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />

<!-- Custom CSS -->
<link href="/sample/admin/css/custom/style.css" rel="stylesheet">

<!-- Favicon -->
<link rel="shortcut icon" href="#">
</head>

<body>

	<!-- Form area -->
	<div class="admin-form" style="margin:100px auto;">
		<!-- Widget starts -->
		<div class="widget worange">
			<!-- Widget head -->
			<div class="widget-head">
				<i class="fa fa-lock"></i> 로그인
			</div>

			<div class="widget-content">
				<div class="padd">
					<!-- Login form -->
					<form:form cssClass="form-horizontal" commandName="login">
						<!-- Id -->
						<div class="form-group">
							<label class="control-label col-lg-3" for="inputEmail">아이디</label>
							<div class="col-lg-9">
								<form:input path="id" cssClass="form-control"/>
							</div>
						</div>
						
						<!-- Password -->
						<div class="form-group">
							<label class="control-label col-lg-3" for="inputPassword">비밀번호</label>
							<div class="col-lg-9">
								<form:password path="password" cssClass="form-control"/>
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-lg-9 col-lg-offset-3">
								<input type="submit" class="btn btn-danger" value="로그인"/>
							</div>
						</div>
						</form:form>
				</div>
			</div>
		</div>
	</div>

	<!-- jQuery -->
	<script src="/sample/admin/js/jquery.js"></script>

	<!-- jQuery Cookie -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

	<!-- Bootstrap JS -->
	<script src="/sample/admin/js/bootstrap.min.js"></script>
	
	<!-- Respond JS for IE8 -->
	<script src="/sample/admin/js/respond.min.js"></script>
	
	<!-- HTML5 Support for IE -->
	<script src="/sample/admin/js/html5shiv.js"></script>
	
	<script>
		$(document).ready(function(){
			// 맨 처음 실행시 메인 화면에서 slidebox를 띄워주기 위해서 설정.
			// 로그인이 가장 먼저 실행되기 때문에 여기에 설정. => MainController에도 해줄 수 있지만, 파라미터에 선언부가 길어지기 때문에 이쪽에 선언.
			if($.cookie('isClose') == null){
				
				$.cookie('isClose', 'false', {path : '/sample/admin'});
			}
			
			if($.cookie('slideBoxState') == null){
				
				$.cookie('slideBoxState', 'up', {path : '/sample/admin'});
			}
			
			if($.cookie('selectedTabMenu') == null){
				
				$.cookie('selectedTabMenu', 0, {path : '/sample/admin'});
			}
		
				
			var error = '${ERROR}';
			
			if(error == 'NOT_VALID'){
				alert('양식이 올바르지 않습니다.');
				
				return ;
			}else if(error == 'LOGIN_FAIL'){
				alert('아이디와 비밀번호가 일치하지 않습니다.');
				
				return ;
			}
				
		});
	
		/* $('#login-btn').on('click', function(){
			var memberVO = {
					userId : $('#adminId').val(),
					userPwd : $('#adminPwd').val()
				};		
				
				if(memberVO.userId == '' || memberVO.userPwd == ''){
					alert('아이디와 패스워드를 다시 한 번 확인하세요.');
					return ;
				};
				
				$.ajax({
					type:'post',
					url:'<c:url value="/admin/login" />',
					contentType:'application/json; charset=utf8',
					data:JSON.stringify(memberVO),
					success:function(data){
						if(data == 'false'){
							alert('아이디와 비밀번호가 일치하지 않습니다.');
							
							$('#adminPwd').val('');
							return ;
						}
						
						location.href=data;
					}
				});
		}); */
	</script>
</body>
</html>
