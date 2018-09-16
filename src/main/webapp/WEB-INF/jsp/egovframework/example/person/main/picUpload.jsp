<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>




<figure class="post_img">
	<!-- Post Image Slider -->
	<div id="slider" class="swipe" style="visibility: visible;">
		<ul class="swipe-wrap" style="width: 2249.97px;">
			<li data-index="0"
				style="width: 749.99px; left: 0px; transition-duration: 400ms; transform: translate(-749.99px, 0px) translateZ(0px);"><img
				src="images/blog/blog_2.png" alt="blog post"></li>
			<li data-index="0"
				style="width: 749.99px; left: 0px; transition-duration: 400ms; transform: translate(-749.99px, 0px) translateZ(0px);"><img
				src="images/blog/blog_2.png" alt="blog post"></li>
			<li data-index="0"
				style="width: 749.99px; left: 0px; transition-duration: 400ms; transform: translate(-749.99px, 0px) translateZ(0px);"><img
				src="images/blog/blog_2.png" alt="blog post"></li>
		</ul>
		<div class="swipe-navi">
			<div class="swipe-left" onclick="mySwipe.prev()">
				<i class="fa fa-chevron-left"></i>
			</div>
			<div class="swipe-right" onclick="mySwipe.next()">
				<i class="fa fa-chevron-right"></i>
			</div>
		</div>

		<form method="post" enctype="multipart/form-data" action="">
			<div class="col-lg-2 col-md-2 col-xs-12">
				<!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
				<button class="btn btn-primary btn-lg btn-block" type="file"><input type="file" name="filename1" size=40> </button>
			</div>
			<div class="col-lg-2 col-md-2 col-xs-12">
				<!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
				<button class="btn btn-primary btn-lg btn-block" type="button"><input
				type="submit" onclick="javascript:closePopup()" value="업로드"></button>
			</div>
			<br>
			<br>

		</form>
	</div>
</figure>
<script>
	function closePopup() {
		window.open("about:blank", "_self").close();

	}
</script>