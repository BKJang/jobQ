<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Address Popup</title>

<script>
	var isPopupView = '<c:out value="${addressInfo.inputYn}" />';
	var addressInfo = {
		roadAddress : '<c:out value="${addressInfo.roadAddrPart1}" />',
		detailAddress : '<c:out value="${addressInfo.addrDetail}" />',
		zipCode : '<c:out value="${addressInfo.zipNo}" />'
	};
	
	window.onload = function(){
		if(isPopupView != 'Y'){
			var url = location.href;
			var confmKey = "U01TX0FVVEgyMDE3MDcyMjIwMTcwMjIzMDgw";
			var resultType = "3"; 
				document.form.confmKey.value = confmKey;
				document.form.returnUrl.value = url;
				document.form.resultType.value = resultType;
				document.form.action="http://www.juso.go.kr/addrlink/addrLinkUrl.do";
				
				document.form.submit();
			}else{
			opener.AddressSearch.prototype.insertAddressToInput(this.addressInfo);
			self.close();
		}
	}		
</script>
</head>

<body>
	<form id="form" name="form" method="post">
		<input type="hidden" id="confmKey" name="confmKey" value=""/>
		<input type="hidden" id="returnUrl" name="returnUrl" value=""/>
		<input type="hidden" id="resultType" name="resultType" value=""/>
	</form>
</body>
</html>