<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<tiles:insertAttribute name="head" />
</head>

	<header id="header">
		<tiles:insertAttribute name="top" />
		<div id="menu-bar">
			<div class="container">
				<tiles:insertAttribute name="nav" />
			</div>
			<!--/.container -->
		</div>
	</header>

	<!--start wrapper-->

		<tiles:insertAttribute name="content" />
		<!--end wrapper-->

		<!--start footer-->
		<footer class="footer">
			<tiles:insertAttribute name="footer" />
		</footer>
		<!--end footer-->
		<tiles:insertAttribute name="footer_bottom" />
<%-- 		<tiles:insertAttribute name="script" /> --%>
</body>
</html>

