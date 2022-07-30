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

		<!-- 이곳에다가 div 생성해서 만드시면 될겁니다~~ -->
		<div class="mydiv">
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary btn-lg"
				data-toggle="modal" data-target="#myModal">개발자 정보</button>

			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content" style="height: 600px; width: 700px;">
						<div class="modal-header" style="background: #92bce0;">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h5 class="modal-title" id="myModalLabel" style="font-weight:bold;">개발자 정보</h5>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-md-5">
									<div style="background: #fff; height: 250px;">
										<img src="resources/img/profile.png" alt="profile"
											width="140px" style="transform: translate(60px, 35px);">
										<div style="margin-top: 60px;">
											<h3 style="text-align: center;">semiy1101</h3>
											<ul style="text-align: center; padding-left: 0px;">최준영
											</ul>
										</div>
									</div>
								</div>

								<div class="col-md-7">
									<div style="margin-bottom:7px;">
										<div style="font-weight:bold; display:inline-block; width:30%;">ID</div>
										<div style="display:inline-block; width:100px;">semiy1101</div>
									</div>
									<div style="margin-bottom:7px;">
										<div style="font-weight:bold; display:inline-block; width:30%;">이름</div>
										<div style="display:inline-block; width:100px;">최준영</div>
									</div>
									<div style="margin-bottom:7px;">
										<div style="font-weight:bold; display:inline-block; width:30%;">이메일</div>
										<div style="display:inline-block; width:100px;">pl1909@naver.com</div>
									</div>
									<div style="margin-bottom:9px;">
										<div style="font-weight:bold; display:inline-block; width:30%;">Phone</div>
										<div style="display:inline-block; width:200px;">010 - 8995 - 2486</div>
									</div>
									<div style="margin-bottom:15px;">
										<div style="font-weight:bold; display:inline-block; width:30%; float:left;">소개</div>
										<div style="display:inline-block; width:260px;">안녕하십니까. 끈기있는 개발자 ooo입니다. 사용할 수 있는
							언어로는 Java, JS, Python, C++, C언어 등 다양하게 사용 가능합니다.</div>
									</div>
									<div style="margin-bottom:7px;">
										<div style="font-weight:bold; display:inline-block; width:30%;">이력서</div>
										<div style="display:inline-block; width:150px;">최준영 이력서.hwp</div>
									</div>
									<div style="margin-bottom:7px;">
										<div style="font-weight:bold; display:inline-block; width:30%;">회원구분</div>
										<div style="display:inline-block; width:100px;">일반회원</div>
									</div>
								</div>
							
								<div class="col-md-12">
									<textarea placeholder="쪽지 내용을 입력하세요." rows="8"
										style="width: 670px; margin-top: 20px;"></textarea>
								</div>
							</div>
							
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-warning" style="float:left;">강제수정</button>
							<button type="button" class="btn btn-danger" style="float:left;">강제탈퇴</button>
							<button type="button" class="btn btn-success">개별쪽지발송</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>


		</div>
		<%@ include file="../include/footer.jsp"%>
	</div>
</body>
</html>


<script>
	
</script>
