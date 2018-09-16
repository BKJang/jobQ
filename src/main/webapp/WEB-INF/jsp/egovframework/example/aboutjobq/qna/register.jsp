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
					<div class="page_title">
						<h2>Q&A</h2>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="content elements">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
					<!-- //Hot 직종별 채용정보[E]  -->
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<!-- <div class="dividerHeading">
								<h4>
									<span>job STORY</span>
								</h4>
							</div> -->
						</div>
						<div class="col-sm-12 col-md-12 col-sm-12 clear mt40">
							<h5 class="hd5">
								<i class="fa fa-quote-left"></i> <span class="hd5_txt">1대1 문의 하기</span>
								<i class="fa fa-quote-right"></i>
							</h5>

						</div>
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="storyWrap">
								<span class="tbl_noti">* 필수 입력 사항 입니다.</span>
								<form id="qnaRegisterFrm" name="qnaRegisterFrm">

									<table class="tbl_write">
										<colgroup>
											<col width="25%" />
											<col width="*" />
										</colgroup>
										<tbody>
											<tr>
												<th><span class="bulit">*</span> 제목</th>
												<td><input type="text" class="form-control" id="qnaTitle"
													maxlength= "50" placeholder="문의 제목을 입력하세요!" name="qnaTitle"></td>
											</tr>
											<!-- <tr>
												<th><span class="bulit">*</span> 등록자</th>
												<td><input type="text" class="form-control" id="usr"></td>
											</tr>
											<tr>
												<th><span class="bulit">*</span> 비밀번호</th>
												<td><input type="password" class="form-control"
													id="pwd"></td>
											</tr> -->
											<tr>
												<th><span class="bulit">*</span> 내용</th>
												<td>
													<div class="form-group">
											<textarea class="form-control lengthCh" rows="5" id="qnaContent" name="qnaContent"
											maxLength="500" placeholder="500자 이내로 작성해주세요!"></textarea>
											<span style="float : right;" id="counter">
										/500자</span>
										</div>
												</td>
											</tr>
										</tbody>
									</table>
								</form>
							</div>
							<div class="col-sm-12 mrgb-30 btnArea">
								<!-- <a href="jobstoryRegister.jobq" class="btn btn-sm btn-social-linkedin">
				                    <i class="fa fa-pencil"></i> 수정				                    
				                </a>				                	
				                <a href="jobstoryRegister.jobq" class="btn btn-sm btn-danger">
				                    <i class="fa fa-times"></i> 삭제				                    
				                </a> -->
								<a href="#" onclick="javascript:qnaRegister.pageSubmitFn('registerQ')"
									class="btn btn-sm btn-social-linkedin"> <i
									class="fa fa-check"></i> 등록
								</a> 
								<a href="#"
									onclick="javascript:qnaRegister.pageSubmitFn('goQnAList')"
									class="btn btn-sm btn-success"> <i class="fa fa-list"></i>
									목록
								</a>
							</div>
							<!-- //수정,삭제,등록 [E] -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- //container[E]  -->
	</section>
</section>
<!--end wrapper-->
<script type="text/javascript">
/* 글자수 세기 */
$(".lengthCh").keyup( function(){
	
	if($(this).val() == null)
		$(this).parent().children("span").text("0" + "/" + $(this).attr("maxlength") + "자")
	
	if ($(this).val().length > $(this).attr("maxlength")) {
		
		$(this).val().slice(0,-1);
		$(this).parent().children("span").text($(this).attr("maxlength") + "/" + $(this).attr("maxlength") + "자");
	}else{
		
		$(this).parent().children("span").text($(this).val().length + "/" + $(this).attr("maxlength") + "자");
	}
});

var qnaRegister = {
		pageSubmitFn : function(pageName){
			
			if($("#qnaTitle").val() == ''){
				
				alert("제목은 필수 입력사항입니다.");
				
			}else if($("#qnaContent").val() == ''){
				
				alert("문의 내용은 필 수 입력 사항입니다.");
				
			}else{
		
				$("#qnaRegisterFrm").attr("action", pageName + ".jobq");	
			
				$("#qnaRegisterFrm").attr("method", "post");

				$("#qnaRegisterFrm").submit();
			}
		}
}

</script>



