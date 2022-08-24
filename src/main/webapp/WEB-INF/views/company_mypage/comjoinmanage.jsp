<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>

<meta charset="UTF-8">

<title>RunWith</title>

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">

<!-- 개인 디자인 추가, ?after를 붙이면 기존에 동일한 이름의 파일을 인식하는것이 아닌 새로운 파일을 인식하게 된다. -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mainstyle.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jystyle.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/mainpage-style.css">

<!-- 여기다가 나만의 새로운 css 만들기 -->

</head>
<body>

	<%@ include file="../include/header.jsp"%>

	<div class="mainbox">
<section>
        
       
        
        
        <div class="container">
            <div class="row">
				<!-- 메인화면 공지사항 상단 -->
			            <a href="#" class="list-group-item active notice-list-top" style="margin-top: 20px;">
			            	<span class="main-notice-title">기업 가입 관리</span><br>
			            	<span class="main-notice-title" style="font-size:12px;">(주) 그린컴퍼니</span>
			            </a>

				<div class="com_card" style="background: #fff; width:20%; transform:translate(-35px, -140px);">
					<h6 style="text-align: center; color: #950000;">기업 상세 정보</h6>
					<img src="resources/img/profile.png" alt="profile"
						class="img-circle" style="padding: 30px;">
					<div class="container1">
						<h3>
							<b class="card-title">green123 님</b>
						</h3>
						<h6>
							<b class="card-name">(주)Green.corp</b><br>
						</h6>
					</div>
				</div>

				<div class="card-body">
					<div class="row">
						<div class="col-sm-3">
							<p class="mb-0">ID</p>
						</div>
						<div class="col-sm-9">
							<p class="text-muted mb-0">green123</p>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-3">
							<p class="mb-0">기업명</p>
						</div>
						<div class="col-sm-9">
							<p class="text-muted mb-0">(주)Green.corp</p>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-3">
							<p class="mb-0">이메일</p>
						</div>
						<div class="col-sm-9">
							<p class="text-muted mb-0">green123@gmail.com</p>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-3">
							<p class="mb-0">Call</p>
						</div>
						<div class="col-sm-9">
							<p class="text-muted mb-0">(02) - 123 - 4567</p>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-sm-3">
							<p class="mb-0">기업소개</p>
						</div>
						<div class="col-sm-9">
							<p class="text-muted mb-0">환경을 생각하는 기업! 환경을 위한, 환경을 위해 앞장서는
								기업이 되겠습니다. 자바/제이쿼리 사용자 우대.</p>
						</div>
					</div>
					<hr>

					<div class="row">
						<div class="col-sm-3">
							<p class="mb-0">회사소개서</p>
						</div>
						<div class="col-sm-9">
							<div class="form-group">
								<input type="file" id="exampleInputFile">
							</div>
						</div>
					</div>

					<hr>

					<div class="row">
						<div class="col-sm-3">
							<p class="mb-0">상태</p>
						</div>
						<div class="col-sm-9">
							<p class="text-muted mb-0">승인 대기중</p>
						</div>
					</div>
					
					<hr>
					<div class="row">
						<div class="col-sm-3"></div>
						<div class="col-sm-9">
							<div class="form-group btn-profile">
								<button type="button" class="btn btn-success">가입 승인</button>
								<button type="button" class="btn btn-danger">승인 취소</button>
								<button type="button" class="btn btn-primary">목록으로</button>
							</div>
						</div>
					</div>



				</div>
				</section>
				<%@ include file="../include/footer.jsp"%>
			</div>
</body>
</html>


<script>
	
</script>
