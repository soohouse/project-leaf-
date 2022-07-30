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
				            	<span class="main-notice-title">내 정보</span>
				            </a>

			<div class="card" style="width:20%; transform:translate(0,-100px);">
				<img src="resources/img/profile.png" alt="profile"
					class="img-circle">
				<div class="container1">
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
						<p class="text-muted mb-0">안녕하십니까. 끈기있는 개발자 ooo입니다. 사용할 수 있는
							언어로는 Java, JS, Python, C++, C언어 등 다양하게 사용 가능합니다.</p>
					</div>
				</div>
				<hr>

				<div class="row">
					<div class="col-sm-3">
						<p class="mb-0">이력서</p>
					</div>
					<div class="col-sm-9">
						<div class="form-group">
							<input type="file" id="exampleInputFile">
						</div>
					</div>
				</div>

				<hr>

				<div class="row">
					<div class="col-sm-3"></div>
					<div class="col-sm-9">
						<div class="form-group btn-profile">
							<button type="button" class="btn btn-success"
								onclick="location.href='/user_profileMod'">정보수정</button>
							<button type="button" class="btn btn-primary" data-toggle="modal"
								data-target="#myModal">비밀번호 변경</button>
						</div>
					</div>
				</div>

				<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header" style="background:#92bce0;">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h5 class="modal-title" id="myModalLabel" style="font-weight:bold;">비밀번호 변경</h5>
							</div>
							<div class="modal-body" style="width:900px;">
								<div class="form-group" style="text-align: left;">
									<label for="exampleInputPassword1" style="text-align: left;">기존 비밀번호</label><br> 
									<input
										type="password" class="form-control"
										id="exampleInputPassword1" placeholder="기존 비밀번호를 입력하세요."
										style="margin-bottom: 30px;"><br> 
									<label
										for="exampleInputPassword1">신규 비밀번호</label><br> 
									<input
										type="password" class="form-control"
										id="exampleInputPassword1" placeholder="신규 비밀번호를 입력하세요."
										style="margin-bottom: 30px;"><br> 
									<label
										for="exampleInputPassword1">신규 비밀번호 확인</label><br>
									<input
										type="password" class="form-control"
										id="exampleInputPassword1" placeholder="신규 비밀번호를 다시 입력하세요."
										>
								</div>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary">변경하기</button>

								<button type="button" class="btn btn-default"
									data-dismiss="modal">취소하기</button>
							</div>
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
