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
				data-toggle="modal" data-target="#myModal">지원자 목록 상세보기</button>

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
							<h5 class="modal-title" id="myModalLabel" style="font-weight:bold;">지원자 목록</h5>
						</div>
						<div class="modal-body">
							<div style="padding:5px 10px 5px 10px;">
								<h5>(주)그린컴퍼니</h5>
								<h4>2022년 환경 푸르미 프로젝트 개발자 모집</h4>
								<h6 style="float: right; transform: translate(0, -30px);">지원자
									3명</h6>
							</div>
							<hr>
							<select class="form-control" style="width:100px;">
								<option>10개씩</option>
								<option>20개씩</option>
								<option>30개씩</option>
								<option>50개씩</option>
							</select>
							
							<input class="btn btn-default" type="submit" value="검색" style="float:right;">
							<input type="text" class="form-control" id="exampleInputName2" placeholder="검색어를 입력하세요." style="width:200px; float:right;">
							
							<select class="form-control" style="width:100px; float:right;">
								<option>ID</option>
								<option>번호</option>
								<option>이름</option>
								<option>전화번호</option>
								<option>합격여부</option>
							</select>

							<table class="table table-striped">
								<thead>
									<tr>
										<th style="font-size:12px;">번호</th>
										<th style="font-size:12px;">ID</th>
										<th style="font-size:12px;">이름</th>
										<th style="font-size:12px;">전화번호</th>
										<th style="font-size:12px;">합격여부</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>semiy1101</td>
										<td>최준영</td>
										<td>010-8995-2486</td>
										<td>1차 서류 합격</td>
									</tr>
									<tr>
										<td>2</td>
										<td>abc1234</td>
										<td>신짱구</td>
										<td>010-1234-5678</td>
										<td>서류 검토중</td>
									</tr>
									<tr>
										<td>3</td>
										<td>cs1004</td>
										<td>김철수</td>
										<td>010-4414-8899</td>
										<td>1차 서류 합격</td>
									</tr>
								</tbody>
							</table>

							<nav aria-label="Page navigation" style="text-align:center;">
								<ul class="pagination pagination-sm" >
									<li><a href="#" aria-label="Previous"> <span
											aria-hidden="true">&laquo;</span>
									</a></li>
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#" aria-label="Next"> <span
											aria-hidden="true">&raquo;</span>
									</a></li>
								</ul>
							</nav>


						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>

			<!-- --------------------------- -->
			

		</div>
		<%@ include file="../include/footer.jsp"%>
	</div>
</body>
</html>


<script>
	
</script>
