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
				data-toggle="modal" data-target="#myModal">쪽지함</button>

			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header" style="background: #92bce0;">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h5 class="modal-title" id="myModalLabel" style="font-weight:bold;">쪽지함</h5>
						</div>
						<div class="modal-body">
							<div>
								<div>
									<h5 style="font-weight:bold;">(주) 그린컴퍼니</h5>
									<p>안녕하세요, 귀하의 이력서와 서류를 보고 쪽지를 발송하게 되었습니다. 우리 기업은...</p>
									<p>2022.07.10</p>
								</div>
								<hr>
								<div>
									<h5 style="font-weight:bold;">(주) 삼성SDS</h5>
									<p>안녕하세요, 귀하의 이력서와 서류를 보고 쪽지를 발송하게 되었습니다. 우리 기업은...</p>
									<p>2022.07.10</p>
								</div>
								<hr>
								<div>
									<h5 style="font-weight:bold;">Apple.corp</h5>
									<p>Hello, junyeong!...</p>
									<p>2022.07.10</p>
								</div>
								<hr>
								<div>
									<h5 style="font-weight:bold;">블루IT솔루션</h5>
									<p>안녕하세요, 귀하의 이력서와 서류를 보고 쪽지를 발송하게 되었습니다. 우리 기업은...</p>
									<p>2022.07.10</p>
								</div>
								<hr>
							</div>
						</div>
						<div class="modal-footer">
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
