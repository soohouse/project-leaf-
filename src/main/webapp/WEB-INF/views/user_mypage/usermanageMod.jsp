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
				            	<span class="main-notice-title">사용자 관리</span>
				            </a>

			<div class="card" style="width:20%; transform: translate(0, -70px);">
				<img src="resources/img/profile.png" alt="profile"
					class="img-circle">
				<div class="container1">
					<div>
						<button type="button" class="btn btn-link">
							<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>프로필사진수정
						</button>
					</div>
					<br>
					<h3>
						<b class="card-title">semiy1101 님 </b>
					</h3>
					<h6>
						<b class="card-name">최준영</b><br> <b class="card-email">pl1909@naver.com</b><br>
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
						<input class="form-control" id="disabledInput" type="text"
							placeholder="semiy1101" disabled>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-3">
						<p class="mb-0">이름</p>
					</div>
					<div class="col-sm-9">
						<input type="text" class="form-control" id="exampleInputName2"
							value="Junyeong Choi">
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-3">
						<p class="mb-0">이메일</p>
					</div>
					<div class="col-sm-9">
						<input class="form-control" id="disabledInput" type="text"
							placeholder="pl1909@naver.com" disabled>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-3">
						<p class="mb-0">Phone</p>
					</div>
					<div class="col-sm-9">
						<select class="form-control" style="width:20%;">
							<option>010</option>
							<option>011</option>
							<option>017</option>
							<option>018</option>
							<option>019</option>
						</select> <input type="text" class="form-control" id="exampleInputName2"
							value="8995 - 2486">
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-3">
						<p class="mb-0">소개</p>
					</div>
					<div class="col-sm-9">
						<textarea id="w3review" name="w3review" rows="5" cols="50"
							style="resize: none;">안녕하십니까. 끈기있는 개발자 ooo입니다. 사용할 수 있는 언어로는 Java, JS, Python, C++, C언어 등 다양하게 사용 가능합니다.  </textarea>
					</div>
				</div>
				<hr>

				<div class="row">
					<div class="col-sm-3"></div>
					<div class="col-sm-9">
						<div class="form-group btn-profile">
							<button type="button" class="btn btn-warning">강제수정</button>
							<button type="button" class="btn btn-default">돌아가기</button>
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
