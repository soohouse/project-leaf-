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


<style>
input.form-control {
	width: 100%;
	display: inline-block;
}
</style>

</head>
<body>

	<%@ include file="../include/header.jsp"%>

	<div class="mainbox">

		<section>


			<c:choose>

				<c:when test="${user != null && company == null}">
					<!-- 일반회원 마이페이지 내 정보 화면 -->
					<div class="container">
						<div class="row">
							<!-- 메인화면 공지사항 상단 -->
							<a href="#" class="list-group-item active notice-list-top"
								style="margin-top: 20px;"> <span class="main-notice-title">내
									정보</span>
							</a>

							<div class="card" style="width: 20%; transform: translate(0, -70px); text-align: center;">
								<img src="<c:url value='/user/userProfileGet?userNO=${userDetail.userNO}' />" alt="profile" class="img-circle" style="height:250px;">
								<div class="container1">
									<h3>
										<input type="hidden" id="hidden-user-mypage-userno" value="${userDetail.userNO}">
										<b class="card-title">${userDetail.userID} </b>
									</h3>
									<h6>
										<b class="card-name">${userDetail.userName}</b><br> <b
											class="card-email">${userDetail.userEmail1}@${userDetail.userEmail2}</b><br>
										<b class="card-phone">${userDetail.userPhone1} - ${userDetail.userPhone2} - ${userDetail.userPhone3}</b>
									</h6>
								</div>
							</div>

							<div class="card-body">
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">ID</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0">${userDetail.userID}</p>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">이름</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0">${userDetail.userName}</p>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">이메일</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0">${userDetail.userEmail1}@${userDetail.userEmail2}</p>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">Phone</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0">(${userDetail.userPhone1}) - ${userDetail.userPhone2} - ${userDetail.userPhone3}</p>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">소개</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0">${userDetail.userIntro}</p>
									</div>
								</div>
								<hr>

								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">이력서</p>
									</div>
									<div class="col-sm-9">
										<div class="form-group">
											<c:if test="${userDetail.resumeRealname == null}">
												<p class="text-muted mb-0" id="btn-user-mypage-resume">등록한 이력서가 없습니다.</p>
											</c:if>
										
											<p class="text-muted mb-0" id="btn-user-mypage-resume" style="text-decoration: underline; color: blue; cursor: pointer;">${userDetail.resumeRealname}</p>
										</div>
									</div>
								</div>

								<hr>

								<div class="row">
									<div class="col-sm-3"></div>
									<div class="col-sm-9">
										<div class="form-group btn-profile">
											<button type="button" class="btn btn-success" id="btn-mypage-user-modify">정보수정</button>
											<button type="button" class="btn btn-primary"
												data-toggle="modal" data-target="#myModal">비밀번호 변경</button>
										</div>
									</div>
								</div>

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
												<h5 class="modal-title" id="myModalLabel"
													style="font-weight: bold;">비밀번호 변경</h5>
											</div>
											<div class="modal-body" style="width: 900px;">
												<div class="form-group" style="text-align: left;">
													<label for="exampleInputPassword1"
														style="text-align: left;">기존 비밀번호</label><br> <input
														type="password" class="form-control"
														id="exampleInputPassword1" placeholder="기존 비밀번호를 입력하세요."
														style="margin-bottom: 30px;"><br> <label
														for="exampleInputPassword1">신규 비밀번호</label><br> <input
														type="password" class="form-control"
														id="exampleInputPassword1" placeholder="신규 비밀번호를 입력하세요."
														style="margin-bottom: 30px;"><br> <label
														for="exampleInputPassword1">신규 비밀번호 확인</label><br> <input
														type="password" class="form-control"
														id="exampleInputPassword1"
														placeholder="신규 비밀번호를 다시 입력하세요.">
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
						</div>

					</div>
				</c:when>

				<c:otherwise>
					<!-- 기업회원 기업페이지 기업 정보 화면 -->
					<div class="container">
						<div class="row">
							<!-- 메인화면 공지사항 상단 -->
							<a href="#" class="list-group-item active notice-list-top"
								style="margin-top: 20px;"> <span class="main-notice-title">기업정보</span>
							</a>

							<div class="com_card" style="width: 20%; transform: translate(0, -490px); text-align: center;">
								<img src="<c:url value='/company/companyLogoGet?companyNO=${companyDetail.companyNO}' />" alt="profile"
									class="img-circle">
								<div class="container1">
									<h3>
										<b class="card-title">${companyDetail.companyID}님</b>
									</h3>
									<h6>
										<b class="card-name">${companyDetail.companyName}</b><br> <b
											class="card-email">${companyDetail.companyEmail1}@${companyDetail.companyEmail2}</b><br> <b
											class="card-phone">${companyDetail.companyPhone1} - ${companyDetail.companyPhone2} - ${companyDetail.companyPhone3}</b>
									</h6>
								</div>
							</div>

							<div class="card-body">
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">ID</p>
									</div>
									<div class="col-sm-9">
										<input type="hidden" id="hidden-company-mypage-companyno" value="${companyDetail.companyNO}">
										<p class="text-muted mb-0">${companyDetail.companyID}</p>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">기업명</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0">${companyDetail.companyName}</p>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">이메일</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0">${companyDetail.companyEmail1}@${companyDetail.companyEmail2}</p>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">Call</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0">(${companyDetail.companyPhone1}) - ${companyDetail.companyPhone2} - ${companyDetail.companyPhone3}</p>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">기업소개</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0">${companyDetail.companyIntro}</p>
									</div>
								</div>
								<hr>
								<div class="row">
									<div class="col-sm-3">
										<p class="mb-0">주소</p>
									</div>
									<div class="col-sm-9">
										<p class="text-muted mb-0 com_addr1">${companyDetail.companyAddress1}</p>
										<p class="text-muted mb-0 com_addr2">${companyDetail.companyAddress2}</p>
										<p class="text-muted mb-0 com_addr3">${companyDetail.companyAddress3}</p>
										<div id="map" style="width: 100%; height: 300px;"></div>

										<script type="text/javascript"
											src="//dapi.kakao.com/v2/maps/sdk.js?appkey=101c80782d440afe7bdde4defbe26209&libraries=services"></script>
										<script>
											var mapContainer = document
													.getElementById('map'), // 지도를 표시할 div 
											mapOption = {
												center : new kakao.maps.LatLng(
														33.450701, 126.570667), // 지도의 중심좌표
												level : 3
											// 지도의 확대 레벨
											};

											// 지도를 생성합니다    
											var map = new kakao.maps.Map(
													mapContainer, mapOption);

											// 주소-좌표 변환 객체를 생성합니다
											var geocoder = new kakao.maps.services.Geocoder();

											// 주소로 좌표를 검색합니다
											geocoder
													.addressSearch(
															'${companyDetail.companyAddress2}',
															function(result,
																	status) {
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

																	map
																			.setCenter(coords);

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
											<c:if test="${companyDetail.companyIntroRealname == null}">
												<p class="text-muted mb-0" id="btn-company-mypage-intro">등록한 회사 소개서가 없습니다.</p>
											</c:if>
										
											<p class="text-muted mb-0" id="btn-company-mypage-intro" style="text-decoration: underline; color: blue; cursor: pointer;">${companyDetail.companyIntroRealname}</p>
										</div>
									</div>
								</div>

								<hr>

								<div class="row">
									<div class="col-sm-3"></div>
									<div class="col-sm-9">
										<div class="form-group btn-profile">
											<button type="submit" class="btn btn-success">정보수정</button>
											<button type="button" class="btn btn-primary">비밀번호변경</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:otherwise>


			</c:choose>



		</section>
		<%@ include file="../include/footer.jsp"%>
	</div>
</body>
</html>


<script>

	//특정 메시지 표현을 위한 스크립트
	const msg = '${msg}';
	
	if(msg != '') {
		alert(msg);
	}


	$(function() {
		
		$('#btn-mypage-user-modify').click(function() {
			location.href="<c:url value='/usermypage/usermypagemod' />";
		});
		
		
		// 이력서 파일 클릭 시 이력서 다운로드
		$('#btn-user-mypage-resume').click(function() {
			
			const userNO = $('#hidden-user-mypage-userno').val();
			
			location.href="<c:url value='/user/userResume/download?userNO=' />" + userNO;
		});
		
		
		// 회사 소개서 파일 클릭 시 회사 소개서 다운로드
		$('#btn-company-mypage-intro').click(function() {
			
			const companyNO = $('#hidden-company-mypage-companyno').val();
			
			location.href="<c:url value='/company/companyIntro/download?companyNO=' />" + companyNO;
		});
		
	});

</script>
