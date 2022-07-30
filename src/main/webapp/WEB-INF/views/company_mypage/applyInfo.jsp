<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>

<meta charset="UTF-8">

<title>오신것을 환영합니다</title>

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
			            	<span class="main-notice-title" style="font-size:12px;">(주) 그린컴퍼니</span><br>
			            	<span class="main-notice-title" >2022년 환경 푸르미 프로젝트 개발자 모집</span>
			            </a>

			<div class="card" style="width:20%; transform:translate(-60px, -55px);">
				<h6 style="text-align:center; color:green;">개발자 상세정보</h6>
				<img src="resources/img/profile.png" alt="profile"
					class="img-circle">
				<div class="container1">
					<h3>
						<b class="card-title">semiy1101 님 </b>
					</h3>
					<h6>
						<b class="card-name">최준영</b><br>
						<b class="card-email">pl1909@naver.com</b><br>
						<b class="card-phone">010 - 8995 - 2486</b>
					</h6>
				</div>
			</div>

			<div class="card-body">
				<div class="row">
					<div class="col-sm-3">
						<p class="mb-0">ID</p>
					</div>
					<div class="col-sm-9">
						<p class="text-muted mb-0">semiy1101</p>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-3">
						<p class="mb-0">이름</p>
					</div>
					<div class="col-sm-9">
						<p class="text-muted mb-0">최준영</p>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-3">
						<p class="mb-0">이메일</p>
					</div>
					<div class="col-sm-9">
						<p class="text-muted mb-0">pl1909@naver.com</p>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-3">
						<p class="mb-0">Phone</p>
					</div>
					<div class="col-sm-9">
						<p class="text-muted mb-0">(010) - 8995 - 2486</p>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-3">
						<p class="mb-0">소개</p>
					</div>
					<div class="col-sm-9">
						<p class="text-muted mb-0">안녕하십니까. 끈기있는 개발자 ooo입니다. 사용할 수 있는 언어로는 Java, JS, Python, C++, C언어 등 다양하게 사용 가능합니다.</p>
					</div>
				</div>
				<hr>

				<div class="row">
					<div class="col-sm-3">
						<p class="mb-0">이력서</p>
					</div>
					<div class="col-sm-9">
						<div class="form-group">
							<input type="file" id="exampleInputFile" class="file-upload">
						</div>
					</div>
				</div>

				<hr>
				<div class="row">
					<div class="col-sm-3">
						<p class="mb-0">합격여부</p>
					</div>
					<div class="col-sm-9" style="margin-bottom:20px;">
						<p class="text-muted mb-0">서류 검토중</p>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-3"></div>
					<div class="col-sm-9">
						<div class="form-group btn-profile">
						
							<button type="button" class="btn btn-success">합격 통보</button>
							<button type="button" class="btn btn-danger">불합격</button>
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
