<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>







<nav class="navbar navbar-transparent navbar-absolute">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navigation-example-2">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse">

            <ul class="nav navbar-nav navbar-right">
                <li>
                   <a href = "main.jobq">
                        홈으로
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="wrapper wrapper-full-page">
    <div class="full-page register-page" data-color="orange" data-image="../../assets/img/full-screen-image-2.jpg">

    <!--   you can change the color of the filter page using: data-color="blue | azure | green | orange | red | purple" -->
        <div class="content">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2 join-header">
                        <div class="header-text">
                            <h2>기업회원 회원정보 수정</h2>
                            <h4>항상 노력하는 잡큐가 되겠습니다 :)</h4>
                            <hr />
                        </div>
                    </div>
                    
             
                    
       <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8 join-content">
                        <div class="card">
                            <!-- <div class="header">
                                <h4 class="title"></h4>
                            </div> -->
                            <div class="content" style="padding:30px 20px">
                                <form>
                                <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>ID</label>
                                                <input type="text" class="form-control" disabled placeholder="Company" value="Mike">
                                            </div>
                                        </div>
                                        
                                    </div>
                                    
                                     <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>비밀번호</label>
                                                <input type="password" class="form-control" placeholder="Company" value="Mike">
                                            </div>
                                        </div>
                                         <div class="col-md-6">
                                            <div class="form-group">
                                                <label>비밀번호 확인</label>
                                                <input type="password" class="form-control" placeholder="Company" value="Mike">
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>회사명</label>
                                                <input type="text" class="form-control" disabled placeholder="Company" value="(주)잡큐">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>대표자</label>
                                                <input type="text" class="form-control" placeholder="Username" value="김똥빤스">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">사업자번호</label>
                                                <input type="text" class="form-control" placeholder="사업자번호" value="132-82-45192">
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="form-group">
                                                <label>기업형태</label>
                                                <input type="text" class="form-control"  placeholder="기업형태" value="중소기업">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label>설립일</label>
                                                <input type="text" class="form-control" placeholder="Username" value="2017-09-23">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1">직원수</label>
                                                <input type="text" class="form-control" placeholder="직원수를 입력하세요">
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>사업내용</label>
                                                <input type="text" class="form-control" placeholder="Home Address" value="최고의 인재로 최고의 효율을">
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>회사주소</label>
                                                <input type="text" class="form-control" placeholder="Home Address" value="서울특별시 강남구 역삼동 테헤란로 322 ">
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>홈페이지</label>
                                                <input type="text" class="form-control" placeholder="Home Address" value="http://jobq.co.kr">
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
                                                <label>담당자 이름</label>
                                                <input type="text" class="form-control" placeholder="name" value="조선형">
                                            </div>
                                        </div>
                                        
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>담당자 연락처</label>
                                                <input type="text" class="form-control" placeholder="number" value="02-3133-2591">
                                            </div>
                                        </div>
                                         <div class="col-md-6">
                                            <div class="form-group">
                                                <label>담당자 이메일주소</label>
                                                <input type="text" class="form-control" placeholder="email" value="jsh@jobq.com">
                                            </div>
                                        </div>
                                    </div>

                                    

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>담당자 한마디 (채용공고 상세 하단에 표시됩니다)</label>
                                                <textarea rows="5" class="form-control" placeholder="Here can be your description" value="Mike">많이좀 지원해주시겠어요?</textarea>
                                            </div>
                                        </div>
                                    </div>

                                    <button type="submit" class="btn btn-info btn-fill pull-right">수정완료</button>
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


</body>


</html>
