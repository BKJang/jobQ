<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!--start wrapper-->
<section class="wrapper">
	<section class="page_head">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<nav id="breadcrumbs">
						<ul>
							<li><a href="about.jobq">ABOUT US</a></li>
						</ul>
					</nav>
					<div class="page_title">
						<h2>About us</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="maps">
		<div id="map" style="height:300px"></div>
	</div>


        <div class="container">
            <div class="row sub_content">
                <div class="col-lg-12 col-md-12 col-sm-12 text-center">
                    <div class="dividerHeading">
                        <h4><span><b>한큐에자바 취업반 7기 2조★</b></span></h4>
                    </div>
                    <p class="lead">모두들 고생 많으셨습니다~~!!! >_< </p>
                </div>

                </div>

                <div class="col-lg-3 col-md-3 col-sm-3">
                    <div class="sidebar">
                        <div class="widget_info">
                            <div class="dividerHeading">
                                <h4><span>김혜진</span></h4>
                            </div>
                            <ul class="widget_info_contact clearfix">
                                <li class="col-sm-12"><i class="fa fa-envelope"></i> <strong>Email</strong><p> <a href="#"> henidani@naver.com</a></p> </li>
                                <li class="col-sm-12"><i class="fa fa-phone"></i> <strong>Phone</strong> <p> 010-3391-3151</p></li>
                            </ul>
                        </div>


                    </div>
                </div>
                
                <div class="col-lg-3 col-md-3 col-sm-3">
                    <div class="sidebar">
                        <div class="widget_info">
                            <div class="dividerHeading">
                                <h4><span>윤요한</span></h4>
                            </div>
                            <ul class="widget_info_contact clearfix">
                                <li class="col-sm-12"><i class="fa fa-envelope"></i> <strong>Email</strong><p> <a href="#"> dbsdy1235@naver.com</a></p> </li>
                                <li class="col-sm-12"><i class="fa fa-phone"></i> <strong>Phone</strong> <p> 010-2974-7563</p></li>
                            </ul>
                        </div>


                    </div>
                </div>
                
                <div class="col-lg-3 col-md-3 col-sm-3">
                    <div class="sidebar">
                        <div class="widget_info">
                            <div class="dividerHeading">
                                <h4><span>장봉기</span></h4>
                            </div>
                            <ul class="widget_info_contact clearfix">
                                <li class="col-sm-12"><i class="fa fa-envelope"></i> <strong>Email</strong><p> <a href="#"> jp302119@naver.com</a></p> </li>
                                <li class="col-sm-12"><i class="fa fa-phone"></i> <strong>Phone</strong> <p> 010-4502-7756</p></li>
                            </ul>
                        </div>


                    </div>
                </div>
                
                <div class="col-lg-3 col-md-3 col-sm-3">
                    <div class="sidebar">
                        <div class="widget_info">
                            <div class="dividerHeading">
                                <h4><span>조선형</span></h4>
                            </div>
                            <ul class="widget_info_contact clearfix">
                                <li class="col-sm-12"><i class="fa fa-envelope"></i> <strong>Email</strong><p> <a href="#"> senjing9379@naver.com</a></p> </li>
                                <li class="col-sm-12"><i class="fa fa-phone"></i> <strong>Phone</strong> <p> 010-8949-9925</p></li>
                            </ul>
                        </div>


                    </div>
                </div>

            </div>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>
            
        </div>
    </section>
</section>
<!--end wrapper-->



<!-- 지도 관련 스크립트 -->

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="//apis.daum.net/maps/maps3.js?apikey=80dccaf4d23ec698c02c3d39025744bd"></script>

<script>
	var mapContainer = document.getElementById('map'), mapOption = {
		center : new daum.maps.LatLng(37.555061, 126.918139),
		level : 2
	// 지도의 확대 레벨
	};

	var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    

	imageSize = new daum.maps.Size(64, 69), // 마커이미지의 크기입니다
	imageOption = {
		offset : new daum.maps.Point(27, 69)
	}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

	var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,
			imageOption);

	//지도를 미리 생성
	var map = new daum.maps.Map(mapContainer, mapOption);

	//마커를 미리 생성
	var marker = new daum.maps.Marker({
		position : new daum.maps.LatLng(37.555061, 126.918139),
		image : markerImage,
		map : map
	});

</script>

