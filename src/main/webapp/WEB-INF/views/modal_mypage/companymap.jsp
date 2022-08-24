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

		<!-- 이곳에다가 div 생성해서 만드시면 될겁니다~~ -->
		<div class="mydiv">
			<!-- Button trigger modal -->
			<button type="button" class="btn btn-primary btn-lg"
				data-toggle="modal" data-target="#myModal">지도</button>

			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content" style="width: 650px; height: 500px;">
						<div class="modal-header" style="background: #92bce0;">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h5 class="modal-title" id="myModalLabel"
								style="font-weight: bold;">지도</h5>
						</div>
						<div class="modal-body">
							<div id="map" style="width: 100%; height: 350px;"></div>

							<script type="text/javascript"
								src="//dapi.kakao.com/v2/maps/sdk.js?appkey=101c80782d440afe7bdde4defbe26209&libraries=services"></script>
							<script>
								var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
								mapOption = {
									center : new kakao.maps.LatLng(33.450701,
											126.570667), // 지도의 중심좌표
									level : 3
								// 지도의 확대 레벨
								};

								// 지도를 생성합니다    
								var map = new kakao.maps.Map(mapContainer, mapOption);

								// 주소-좌표 변환 객체를 생성합니다
								var geocoder = new kakao.maps.services.Geocoder();
								
								
								// 주소로 좌표를 검색합니다
								geocoder.addressSearch(
												'서울 강남구 강남대로120길 33',
												function(result, status) {

													// 정상적으로 검색이 완료됐으면 
													if (status === kakao.maps.services.Status.OK) {

														var coords = new kakao.maps.LatLng(
																result[0].y,
																result[0].x);

														// 결과값으로 받은 위치를 마커로 표시합니다
														var marker = new kakao.maps.Marker(
																{
																	map : map,
																	position : coords
																});


														// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
														
														map.setCenter(coords);
															
													}
												});
														
							</script>
							
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
