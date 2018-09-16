<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!--   Core JS Files and PerfectScrollbar library inside jquery.ui   -->
<script src="js/assets/jquery.min.js" type="text/javascript"></script>
<script src="js/assets/jquery-ui.min.js" type="text/javascript"></script>
<script src="js/assets/bootstrap.min.js" type="text/javascript"></script>


<!--  Forms Validations Plugin -->
<script src="js/assets/jquery.validate.min.js"></script>

<!--  Plugin for Date Time Picker and Full Calendar Plugin-->
<script src="js/assets/moment.min.js"></script>

<!--  Date Time Picker Plugin is included in this js file -->
<script src="js/assets/bootstrap-datetimepicker.js"></script>

<!--  Select Picker Plugin -->
<script src=js/assets/bootstrap-selectpicker.js"></script>

<!--  Checkbox, Radio, Switch and Tags Input Plugins -->
<script src="js/assets/bootstrap-checkbox-radio-switch-tags.js"></script>

<!--  Charts Plugin -->
<script src="js/assets/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="js/assets/bootstrap-notify.js"></script>

<!-- Sweet Alert 2 plugin -->
<script src="js/assets/sweetalert2.js"></script>

<!-- Vector Map plugin -->
<script src="js/assets/jquery-jvectormap.js"></script>

<!--  Google Maps Plugin    -->
<script src="https://maps.googleapis.com/maps/api/js"></script>

<!-- Wizard Plugin    -->
<script src="js/assets/jquery.bootstrap.wizard.min.js"></script>

<!--  Bootstrap Table Plugin    -->
<script src="js/assets/bootstrap-table.js"></script>

<!--  Plugin for DataTables.net  -->
<script src="js/assets/jquery.datatables.js"></script>


<!--  Full Calendar Plugin    -->
<script src="js/assets/fullcalendar.min.js"></script>

<!-- Light Bootstrap Dashboard Core javascript and methods -->
<script src="js/assets/light-bootstrap-dashboard.js"></script>

<!-- Light Bootstrap Dashboard DEMO methods, don't include it in your project! -->
<script src="js/assets/demo.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		lbd.checkFullPageBackgroundImage();

		setTimeout(function() {
			// after 1000 ms we add the class animated to the login/register card
			$('.card').removeClass('card-hidden');
		}, 1000)
	});

	$('#login-btn').click(function() {
		// alert('id : ' + $('#login-id').val() + ', password : ' + $('#login-pwd').val())
		var loginVO = {
			id : $('#login-id').val(),
			pwd : $('#login-pwd').val()
		};

		$.ajax({
			type : 'POST',
			url : '/sample/login.jobq',
			data : $.param(loginVO),
			success : function(result) {

				if (result == 'FAIL') {
					alert('아이디 또는 비밀번호가 일치하지 않습니다.');

					return;
				}

				if (result == 'SUCCESS')
					location.href = "/sample/main.jobq";

			}

		});
	});
	


	function enterkey() {
	    if (window.event.keyCode == 13) {
			
			if ($("#login-id").val() != "" && $("#login-pwd").val() != "") {
				
				alert('둘다입력함');
				
				$("#login-btn").trigger('click');
				
			} else {
				
				alert ('하나입력하세요');
			}
	    	
	    	
	}
	    
	}


</script>