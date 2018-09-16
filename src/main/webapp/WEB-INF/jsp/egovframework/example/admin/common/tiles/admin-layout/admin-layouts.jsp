<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>

<!DOCTYPE html>
<html>
		<head>
  			<tiles:insertAttribute name="header"/>
  		</head>
  		<body>
	  		<tiles:insertAttribute name="nav"/>
	  		<div class="content">
	  			<tiles:insertAttribute name="left"/>	
			  	<tiles:insertAttribute name="content"/>
	  			<tiles:insertAttribute name="clearfix"/>
	  		</div>
	  		
	  		<tiles:insertAttribute name="slidebox"/>
	  		<tiles:insertAttribute name="totop"/>  	
	  		<tiles:insertAttribute name="cmmn-script"/> <!-- 공통 스크립트 -->
	  		<tiles:insertAttribute name="script" />		<!-- 개인 스크립트 -->	
  	</body>
</html>