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
			            	<span class="main-notice-title">기업 정보</span>
			            </a>

			<div class="com_card" style="width:20%; transform:translate(0,-510px);">
				<img src="resources/img/logo2.png" alt="profile"
					class="img-circle">
				<div class="container1">
					<h3>
						<b class="card-title">Green123 님</b>
					</h3>
					<h6>
						<b class="card-name">(주)Green.corp</b><br>
						<b class="card-email">green123@gmail.com</b><br>
						<b class="card-phone">02 - 123 - 4567</b>
					</h6>
				</div>
			</div>

			<div class="card-body">
				<div class="row">
					<div class="col-sm-3">
						<p class="mb-0">ID</p>
					</div>
					<div class="col-sm-9">
						<p class="text-muted mb-0">Green123</p>
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
						<p class="text-muted mb-0">환경을 생각하는 기업! 환경을 위한, 환경을 위해 앞장서는 기업이 되겠습니다. 자바/제이쿼리 사용자 우대.</p>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="col-sm-3">
						<p class="mb-0">주소</p>
					</div>
					<div class="col-sm-9">
						<p class="text-muted mb-0 com_addr1">10575</p>
						<p class="text-muted mb-0 com_addr2">서울 강남구 테헤란로7길 7 에스코빌딩 6층((지번)역삼동 649-5))</p>
						<p class="text-muted mb-0 com_addr3">4실습실</p>
						<div id="map" style="width: 100%; height: 300px;"></div>

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
								geocoder.addressSearch('서울 강남구 강남대로120길 33', function(result, status) {
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
					<div class="col-sm-3"></div>
					<div class="col-sm-9">
						<div class="form-group btn-profile">
							<button type="button" class="btn btn-success">정보수정</button>
							<button type="button" class="btn btn-primary">비밀번호 변경</button>
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
