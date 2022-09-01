<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>

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


<style>
	input.form-control {
		width: 100%;
		display: inline-block;
	}

	#div-company-intro::-webkit-scrollbar {
 		width: 3px;
  		background-color: #C7C7C7;
	}
	
	
	#div-company-intro::-webkit-scrollbar-thumb {
		background: #535353;
	}
</style>

</head>
<body>

	<%@ include file="../include/header.jsp"%>

	<div class="mainbox">

		<section>

<!-- 기업회원 기업페이지 기업 정보 화면 -->
					<div class="container">
						<div class="row">
							<!-- 메인화면 공지사항 상단 -->
							<a href="#" class="list-group-item active notice-list-top"
								style="margin-top: 20px;"> <span class="main-notice-title">기업정보</span>
							</a>

							<div class="com_card" style="width: 20%; transform: translate(0, -520px); text-align: center;">
								<img src="<c:url value='/company/companyLogoGet?companyNO=${companyDetail.companyNO}' />" alt="profile" class="img-circle" style="height: 250px;">
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
									<div class="col-sm-9" id="div-company-intro" style="height: 120px; overflow: auto;">
										<p class="text-muted mb-0">${fn:replace(companyDetail.companyIntro, replaceChar, "<br/>")}</p>
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
										
											
											<p class="text-muted mb-0" id="btn-company-mypage-intro" style="text-decoration: underline; color: blue; cursor: pointer;"><a class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></a> ${companyDetail.companyIntroRealname}</p>
										</div>
									</div>
								</div>

								<hr>

								<div class="row">
									<div class="col-sm-3"></div>
									<div class="col-sm-9">
										<div class="form-group btn-profile">
											<a id="btn-company-delete" style="position: relative; right: 800px; cursor: pointer; color: #970000; text-decoration: underline;">강제회원탈퇴</a>
											<button type="button" class="btn btn-warning" id="btn-mypage-company-modify2">정보수정</button>
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>



		</section>
		
		<%@ include file="modal-password-change.jsp" %>
		<%@ include file="modal-delete-check.jsp" %>
		<%@ include file="modal-delete-check-company.jsp" %>
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
		
		// 일반회원 정보수정 버튼 클릭 시 수정 페이지로 이동
		$('#btn-mypage-user-modify').click(function() {
			const userNO = $('#hidden-user-mypage-userno').val();
			location.href="<c:url value='/adminmypage/adminusermypagemod' />";
		});
		
		
		// 기업회원 정보수정 버튼 클릭 시 수정 페이지로 이동
		$('#btn-mypage-company-modify2').click(function() {
			const companyNO = $('#hidden-company-mypage-companyno').val();
			location.href="/adminmypage/admincompanymypagemod?companyNO=" + companyNO;
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
		
		
		// 일반회원 비밀번호 변경 클릭 시 비밀번호 변경 모달 창 오픈
		$('#btn-password-change').click(function() {
			
			if(${user != null}) {
				$('#btn-modal-password-change').css('display', 'inline-block');
				$('#btn-modal-password-change-company').css('display', 'none');
			} else {
				$('#btn-modal-password-change').css('display', 'none');
				$('#btn-modal-password-change-company').css('display', 'inline-block');
			}
			
			$('#modal-password-change').modal('show');
		});
		
		
		// 기업회원 비밀번호 변경 클릭 시 비밀번호 변경 모달 창 오픈
		$('#btn-password-change-company2').click(function() {
			
			if(${user != null}) {
				$('#btn-modal-password-change').css('display', 'inline-block');
				$('#btn-modal-password-change-company').css('display', 'none');
			} else {
				$('#btn-modal-password-change').css('display', 'none');
				$('#btn-modal-password-change-company').css('display', 'inline-block');
			}
			
			$('#modal-password-change').modal('show');
		});
		
		
		// 기업회원 회원탈퇴 버튼 클릭 시 회원탈퇴 진행
		$('#btn-company-delete').click(function() {
			
			if(confirm('해당 기업을 강제탈퇴 처리하시겠습니까?')) {
			
					const companyNO = $('#hidden-company-mypage-companyno').val();
					
					$.ajax({
						type: 'POST',
						url: '<c:url value="/company/companyProjectCheck" />',
						
						data: {
							'companyNO': companyNO
						},
						
						success: function(result) {
							if(result == 'CheckZero') {
								
								$.ajax({
									type: 'POST',
									url: '<c:url value="/adminmypage/admincompanydelete" />',
									
									dataType: 'text',
									data : {
										'companyNO': companyNO
									},
									
									success: function(result) {
										if(result == 'YesCompanyDelete') {
											
											alert('해당 기업을 강제탈퇴 처리했습니다.');
											
											location.replace("<c:url value='/membersList/membersListCompany' />");
						    			
										}
									},
									
									error: function() {
										alert('회원 탈퇴 처리 중 서버오류가 발생했습니다.');
										return;
									}
								});
								
							} else {
								alert('모집중인 프로젝트가 있어 탈퇴할 수 없습니다. 모집이 끝난 후 탈퇴해주세요.');
								return;
							}
						},
						
						error: function() {
							alert('해당 기업의 등록 프로젝트 존재 여부를 확인 중 서버오류가 발생했습니다.');
							return;
						}
					});
					
			} else {
				return false;
			}

		});
		
	});

</script>
