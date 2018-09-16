<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Main bar -->
<div class="mainbar">
	<!-- Page heading -->
	<div class="page-head">

		<h2 class="pull-left">
			면접 Tip 수정
		</h2>

		<div class="bread-crumb pull-right" style="text-align: right;">
			<a href="<c:url value="/admin/main.jobq" />"><i
				class="fa fa-home"></i>Home</a> <br /> <span>메인 관리&nbsp;-&nbsp;면접 Tip 관리&nbsp;-&nbsp;<strong style="font-size: 18px;">면접 Tip 수정</strong>
			</span>
		</div>
		<div class="clearfix"></div>
	</div>
	<!--/ Page heading ends -->

	<!-- Matter -->
	<div class="matter">
		<div class="container">

			<div class="widget">
				<div class="widget-content" style="border: 0px solid #ffffff;">
					<div class="padd" style="padding: 0px 15px;">
						<form>
						
							<table class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse;">
								
								<tr>
									<td class="table-name" style="vertical-align: middle;">작성자</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; width: 60%; display: inline-block;">
											<input type="email" class="form-control" value="${interview.id}" readOnly />
										</div>
									</td>

									<td class="table-name" style="vertical-align: middle;">작성일</td>
									<td width="35%">
										<div class="form-group" style="margin: 0px; width: 60%; display: inline-block;">
											<input type="date" class="form-control" id="interview-update-date" readOnly />
										</div>
									</td>
								</tr>
							
							</table>
						
						</form>
					</div>
					
					<div class="padd">
						<!-- 내용 -->
							<table class="table" style="border: solid 1px rgb(221, 221, 221); border-collapse: collapse; padding-top:10px;">
								
								<tr>
									<td class="table-name" colspan="4" style="vertical-align: middle;">내용</td>
								</tr>
								
								<tr>
									<td colspan="4" style="border: solid 1px rgb(221, 221, 221);">
										<div class="form-group" style="margin: 0px;">
											<textarea name="update-editor" id="update-editor" rows="10" style="width : 100%;">${interview.content}
											</textarea>
										</div>
									</td>
								</tr>
								
							</table>
						<!-- 내용 끝 -->
					</div>
				</div>

				<div class="widget-foot" style="text-align: center; padding: 4px 0px; background-color: #ffffff; border: 0px;">
					<div class="padd" style="padding-top:0px;">
						<button type="button" class="btn btn-default" id="interview-update-btn">수정</button>
						<button type="button" class="btn btn-default" id="interview-update-cancle-btn">취소</button>
						
						<div class="pull-right">
							<button type="button" class="btn btn-default" id="interview-list-btn">리스트</button>
						</div>
					</div>
				</div>
			</div>


		</div>
	</div>
	<!--/ Matter ends -->
</div>
<!--/ Mainbar ends -->
