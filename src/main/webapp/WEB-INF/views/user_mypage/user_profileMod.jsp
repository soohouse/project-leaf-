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
					<a href="#" class="list-group-item active notice-list-top"
						style="margin-top: 20px;"> <span class="main-notice-title">내
							정보</span>
					</a>
					<form action="<c:url value='/usermypage/userUpdate'/>" method="post" name="UpdateForm">
					<div class="card"
						style="width: 20%; transform: translate(0, -140px);">
						<img src="<c:url value='/user/userProfileGet?userNO=${user.userNO}' />" alt="profile" class="img-circle" style="height: 250px;">
						
						<div class="container1">
							<div style="margin-bottom:-20px;">
							<button type="button" class="btn btn-link">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>프로필사진수정
							</button>
							</div>
							<h3>
								<b class="card-title">${user.userID} </b>
							</h3>
							<h6>
								<b class="card-name">${user.userName}</b><br> <b
									class="card-email">${user.userEmail1}@${user.userEmail2}</b><br>
								<b class="card-phone">${user.userPhone1} - ${user.userPhone2} - ${user.userPhone3}</b>
							</h6>
						</div>
					</div>
				
					<div class="card-body">
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">ID</p>
							</div>
							<div class="col-sm-9">
								<input class="form-control" id="disabledInput" type="text" placeholder="${user.userID}" disabled>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">이름</p>
							</div>
							<div class="col-sm-9">
								<input type="text" name="userName" class="form-control" id="exampleInputName2" value="${user.userName}">
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">이메일</p>
							</div>
							<div class="col-sm-9">
								<input class="form-control" id="disabledInput" type="text"
									placeholder="${user.userEmail1}@${user.userEmail2}" disabled>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">Phone</p>
							</div>
							<div class="col-sm-9">
								<select class="form-control" style="width: 20%;" value="${user.userPhone1}">
									<option>010</option>
									<option>011</option>
									<option>017</option>
									<option>018</option>
									<option>019</option>
								</select> 
								<input type="text" class="form-control" id="exampleInputName2" value="${user.userPhone2}" style="width:90px;">
								<input type="text" class="form-control" id="exampleInputName2" value="${user.userPhone3}" style="width:90px;">
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">소개</p>
							</div>
							<div class="col-sm-9">
								<textarea id="w3review" name="w3review" rows="5" cols="50"
									style="resize: none;">${user.userIntro}</textarea>
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
					</form>
						<div class="row">
							<div class="col-sm-3"></div>
							<div class="col-sm-9">
								<div class="form-group btn-profile">
									<button class="btn" id="updateBtn">수정완료</button>
									<button type="button" class="btn btn-default" onclick="location.href='<c:url value="/usermypage/userprofile"/>'">돌아가기</button>
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
