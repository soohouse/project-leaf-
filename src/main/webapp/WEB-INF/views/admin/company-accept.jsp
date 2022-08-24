<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

   <meta charset="UTF-8">

   <title>RunWith</title>
   
   <!-- jQuery -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   
   <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
   
   <!-- 합쳐지고 최소화된 최신 CSS -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
   
   <!-- 개인 디자인 추가, ?after를 붙이면 기존에 동일한 이름의 파일을 인식하는것이 아닌 새로운 파일을 인식하게 된다. -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainstyle.css">
   
   <!-- 여기다가 나만의 새로운 css 만들기 -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainpage-style.css">
   
   <style>
   
   		.sections {
   			width: 1200px;
   			margin: 0 auto;
   		}
   		
   		.modal-body-sections {
   			width: 560px;
   			margin: 0 auto;
   		}
   
   </style>
   
</head>
<body>

<%@ include file="../include/header.jsp" %>
	   
	<div class="mainbox">
	
		<div class="sections">

			<a href="#" class="list-group-item active notice-list-top" style="margin-top: 20px;"> 
				<span class="main-board-title" style="color: #2C4F22;">기업 가입 관리</span>
			</a>

			<form class="navbar-form navbar-left navbar-main-top pull-left" role="search" style="padding: 0; margin-left: 0;">
				<select class="form-control" name="condition" style="height: 30px; font-size: 13px;">
                            <option value="title">코드</option>
                            <option value="content">상위코드</option>
                </select>
			
				<div class="input-group"> 
					<input type="text" class="form-control" placeholder="검색어를 입력하세요" style="height: 30px; font-size: 13px;">
					<span class="input-group-btn">
						<button class="btn btn-default" type="submit" style="height: 30px; background: #d3d3d3; font-size: 13px;">검색</button>
					</span>
				</div>
			</form>
			
			<form class="navbar-form navbar-left navbar-main-top pull-right" role="search" style="padding: 0; margin-left: 0;">
				<div class="input-group"> 
					<span class="input-group-btn">
						<button id="btn-common-regist" class="btn btn-success" type="button" style="height: 30px; font-size: 13px;">11111</button>
					</span>
				</div>
			</form>


			<table class="table table-bordered" style="margin-top: 20px;">
				<thead style="width: 10px; font-size: 13px; background: #89C578;">
					<tr style="font-family: sans-serif;">
						<th style="width: 6%;">회원번호</th>
						<th style="width: 12%;">ID</th>
						<th style="width: 30%;">기업이름</th>
						<th style="width: 20%;">기업 전화번호</th>
						<th style="width: 20%;">기업 이메일</th>
						<th style="width: 12%;">비고</th>
					</tr>
				</thead>
				<tbody style="width: 10px; font-size: 13px; background: #F7F7F7;">
					
					<c:forEach var="companyList" items="${companyAcceptList}" varStatus="index">
						<tr id="companyDetail${index.index}" style="cursor: pointer;">
							<td>${companyList.companyNO}</td>
							<td>${companyList.companyID}</td>
							<td>${companyList.companyName}</td>
							<td>${companyList.companyPhone}</td>
							<td>${companyList.companyEmail}</td>
							<td>${companyList.commonValue}</td>
						</tr>
						
						<%@ include file="modal-company-detail.jsp" %>
						
						<script>
							
							$(function() {
								
								$('#companyDetail${index.index}').click(function() {
									
									$.ajax({
										type: 'GET',
										url: '<c:url value="/admin/companyDetail?companyNO=" />' + '${companyList.companyNO}',
										
										success: function(company) {
											$('#modal-company-id').text(company.companyID);
											$('#modal-company-name').text(company.companyName);
											$('#modal-company-phone').text(company.companyPhone);
											$('#modal-company-email').text(company.companyEmail);
											
											if(company.companyIntro == null || company.companyIntro == '') {
												$('#modal-company-intro').text('');
											} else {
												$('#modal-company-intro').text(company.companyIntro);
											}
											
											if(company.companyIntroRealname == null || company.companyIntroRealname == '') {
												$('#modal-company-intro-realname').text('');
											} else {
												$('#modal-company-intro-realname').text(company.companyIntroRealname);
											}
											
											$('#modal-company-common-value').text(company.commonValue);
											$('#modal-company-logo').attr('src', '<c:url value="/company/companyLogoGet?companyNO=" />' + company.companyNO);
											$('#hidden-company-no').val(company.companyNO);
											$('#modal-main-company-id').text(company.companyID);
											$('#modal-main-company-name').text(company.companyName);
										},
										
										error: function() {
											alert('기업 상세 보기 요청 처리 중 서버오류가 발생했습니다.');
											return;
										}
									});
									
									$('#modal-company-detail').modal('show');
								});
								
							});
						
						</script>
						
					</c:forEach>

				</tbody>
			</table>

		</div>
	
		<%@ include file="../include/footer.jsp" %>
	   
	</div>
   
</body>
</html>


<script>

	//특정 메시지 표현을 위한 스크립트
	const msg = '${msg}';
	
	if(msg != '') {
		alert(msg);
	}
	
	
	$(function() {
		
		$('#btn-common-regist').click(function() {
			$('#modal-common-regist').modal('show');
		});
		
	});

</script>
