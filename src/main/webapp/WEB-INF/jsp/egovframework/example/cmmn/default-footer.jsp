<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-12 col-lg-12" style=" padding-bottom: 50px;">
                    <div class="widget_title">
                        <h4><span>jobQ sitemap</span></h4>
                    </div>
                    
                    <div class="col-sm-4 col-md-4 col-lg-4">
                    <div class="widget_content">
                        <ul class="links">
                        <li onclick="javascript:left.pageSubmitFn('mainJoblist')"> <a href="#">채용정보<span>서울, 경기, 인천, 부산, 경상, 전라, 강원, 대구, 대전</span></a></li>
                        <li onclick="javascript:left.pageSubmitFn('paging')"> <a href="#">인재정보<span>JAVA, C#, SQL, xml, .NET, Networks, ERP</span></a></li>
                        <!-- <li> <a href="#">직종별 채용정보 <span>JAVA, C#, SQL, xml, .NET, Networks, ERP</span></a></li>
                        <li> <a href="#">경력별 채용정보<span>신입채용, 1~3년, 3~7년, 7년 이상</span></a></li>
                         -->
                    </ul>
                    </div>
                    </div>
                    
                   <div class="col-sm-4 col-md-4 col-lg-4">
                    <div class="widget_content">
                        <ul class="links">
                        <c:if test="${sessionScope.member_type eq 'p'}">
                       		<li onclick="javascript:left.pageSubmitFn('personMain')"> <a href="#">개인회원 서비스 <span>이력서 관리, 면접제의, 지원현황</span></a></li>
                        </c:if>
                        <c:if test="${sessionScope.member_type eq 'c'}">
                        	<li onclick="javascript:left.pageSubmitFn('companyMain')"> <a href="#">기업회원 서비스 <span>공고등록, 공고관리, 지원자현황, 면접제의</span></a></li>
                        </c:if>
                        <c:if test="${sessionScope.member_type != null}">
                        	<li onclick="javascript:left.pageSubmitFn('goQnAList')"> <a href="#">나의 1대1 문의 <span>문의 등록, 문의 수정, 문의 삭제</span></a></li>
                        </c:if>
                        
                        
                    </ul>
                    </div>
                    </div>
                    
                    <div class="col-sm-4 col-md-4 col-lg-4">
                    <div class="widget_content">
                        <ul class="links">
                       
                        <li onclick="javascript:left.pageSubmitFn('mainJobstory')"> <a href="#">jobStory<span>자유게시판, 묻고답하기, comment</span></a></li>
                        <li onclick="javascript:left.pageSubmitFn('about')"> <a href="#">jobQ <span>회사소개, 공지사항, FAQ, QNA</span></a></li>
                    </ul>
                    </div>
                    </div>
                                        
                </div>
                
                </div>
            </div>

 