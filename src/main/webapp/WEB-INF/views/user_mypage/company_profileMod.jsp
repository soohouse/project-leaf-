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

		<section>


			<div class="container">
				<div class="row">
					<!-- 메인화면 공지사항 상단 -->
					<a href="#" class="list-group-item active notice-list-top"
						style="margin-top: 20px;"> <span class="main-notice-title">기업정보</span>
					</a>
					<form action="<c:url value='/usermypage/companyUpdate' />" method="post" name="companyUpdateForm">
					<div class="com_card"
						style="width: 20%; transform: translate(0, -620px); text-align: center;">
						<img id="img-mypage-logo" src="<c:url value='/company/companyLogoGet?companyNO=${companyDetail.companyNO}' />" alt="logo" class="img-circle" style="height: 250px;">
						
						<div class="container1">
							<div style="margin-bottom:-20px;">
							<input type="file" id="file-mypage-logo" style="display: none;">
							<button type="button" class="btn btn-link" id="btn-mypage-logo">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 기업 로고 수정
							</button>
							</div>
							<h3>
								<input type="hidden" value="${companyDetail.companyNO}" id="hidden-company-mypage-companyno" name="companyNO" />
								<b class="card-title">${companyDetail.companyID} </b>
							</h3>
							<h6>
								<b class="card-name">${companyDetail.companyName}</b><br> <b
									class="card-email">${companyDetail.companyEmail1}@${companyDetail.companyEmail2}</b><br>
								<b class="card-phone">${companyDetail.companyPhone1} - ${companyDetail.companyPhone2} - ${companyDetail.companyPhone3}</b>
							</h6>
						</div>
					</div>
				
					<div class="card-body">
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">ID</p>
							</div>
							<div class="col-sm-9">
								<input class="form-control" id="disabledInput" type="text" placeholder="${companyDetail.companyID}" disabled>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">기업명</p>
							</div>
							<div class="col-sm-9">
								<input type="text" name="userName" class="form-control" id="exampleInputName2" value="${companyDetail.companyName}" disabled>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">이메일</p>
							</div>
							<div class="col-sm-9">
								<input class="form-control" id="disabledInput" type="text"
									placeholder="${companyDetail.companyEmail1}@${companyDetail.companyEmail2}" disabled>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">Call</p>
							</div>
							<div class="col-sm-9">
								<select class="form-control" style="width: 20%;" value="${companyDetail.companyPhone1}" name="companyPhone1">
									<option>010</option>
									<option>011</option>
									<option>017</option>
									<option>018</option>
									<option>019</option>
								</select> 
								<input type="text" class="form-control" id="mypage-modify-company-phone2" value="${companyDetail.companyPhone2}" maxlength="4" style="width:90px;" name="companyPhone2">
								<input type="text" class="form-control" id="mypage-modify-company-phone3" value="${companyDetail.companyPhone3}" maxlength="4" style="width:90px;" name="companyPhone3">
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">기업소개</p>
							</div>
							<div class="col-sm-9">
								<textarea id="w3review" rows="5" cols="50" style="resize: none;" name="companyIntro">${companyDetail.companyIntro}</textarea>
							</div>
						</div>
						<hr>

						<div class="row">
								<div class="col-sm-3">
									<p class="mb-0">주소</p>
								</div>
								<div class="col-sm-9">
									<input class="form-control" id="disabledInput" type="text" placeholder="${companyDetail.companyAddress1}" disabled>
									<input class="form-control" id="disabledInput" type="text" placeholder="${companyDetail.companyAddress2}" disabled>
									<input class="form-control" id="disabledInput" type="text" placeholder="${companyDetail.companyAddress3}" disabled>
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
								<p class="mb-0">회사 소개서</p>
							</div>
							<div class="col-sm-9">
								<div class="form-group">
									<input type="file" id="file-mypage-company-intro" style="display: none;">
									<button type="button" id="btn-mypage-company-intro">파일 선택</button>
									<label for="file-mypage-company-intro" id="file-company-intro" style="font-weight: 500;">${companyDetail.companyIntroRealname}</label>
								</div>
							</div>
						</div>

						<hr>
					</form>
						<div class="row">
							<div class="col-sm-3"></div>
							<div class="col-sm-9">
								<div class="form-group btn-profile">
									<input type="button" class="btn" id="btn-company-mypage-update" value="수정완료">
									<button type="button" class="btn btn-default" onclick="history.back();">돌아가기</button>
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

	//로고사진 미리보기 자바스크립트 함수
	function readURL(input) {
		if (input.files && input.files[0]) {
			
	    	var reader = new FileReader(); //비동기처리를 위한 파일을 읽는 자바스크립트 객체
	    	
	    	//readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
	    	reader.readAsDataURL(input.files[0]); 
	    	
	    	reader.onload = function(e) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
	        	$('#img-mypage-logo').attr("src", e.target.result); 
	        	console.log(event.target)//event.target은 이벤트로 선택된 요소를 의미
	    	}
		}
	}

	
	$(function() {
		
		// 로고 사진 수정 버튼을 누르면 파일 요소를 클릭한 것으로 인식
		$('#btn-mypage-logo').click(function() {
			$('#file-mypage-logo').click();
		});
		
		
		// 파일 요소가 변경되면 기존에 있던 로고사진을 바꿀 사진 미리보기로 교체한다.
		$('#file-mypage-logo').change(function() {
			readURL(this);
		});
		
		
		// 파일 찾기 버튼을 누르면 숨겨져 있는 파일 요소가 클릭된 것으로 인식
		$('#btn-mypage-company-intro').click(function() {
			$('#file-mypage-company-intro').click();
		});
		
		
		// 파일 요소가 변경되면 파일의 이름을 추출해서 버튼 옆에 파일 이름을 띄워준다.
		$('#file-mypage-company-intro').change(function() {
			var fileValue = $('#file-mypage-company-intro').val().split('\\');
			var fileName = fileValue[fileValue.length - 1];
			
			$('#file-company-intro').text(fileName);
		});
		
		
		// 수정완료 버튼 클릭 시
		$('#btn-company-mypage-update').click(function() {
			
			// 전화번호 앞 자리 입력 여부 체크
			if($('#mypage-modify-company-phone2').val() == '') {
				alert('기업 전화번호를 입력해주세요.');				
				$('#mypage-modify-company-phone2').focus();
				return;
			}
			
			
			// 전화번호 뒷 자리 입력 여부 체크
			if($('#mypage-modify-company-phone3').val() == '') {
				alert('기업 전화번호를 입력해주세요.');				
				$('#mypage-modify-company-phone3').focus();
				return;
			}
			
			
			// 자바스크립트의 파일 확장자 체크 검색 (문서 파일만 받을 수 있도록)
			let intro = $('#file-mypage-company-intro').val();
			
			// . 을 제거한 확장자만 얻어낸 후 그것을 소문자로 일괄 변경 후 비교한다.
			// +1을 한 것은 점 바로 이후 문자부터 잘라서 추출하기 위해
			intro = intro.slice(intro.indexOf('.') + 1).toLowerCase();
			
			if(intro !== 'hwp' && intro !== 'doc' && intro !== 'pdf' && intro !== 'ppt' && intro !== 'pptx' && intro !== 'docx' && intro !== 'xlsx' && intro !== 'xls' && intro !== '') {
				alert('문서 파일 형식만 등록이 가능합니다.');
				$('#file-mypage-company-intro').val('');
				$('#file-company-intro').text('${companyDetail.companyIntroRealname}');
				return;
			}
			
			
			// 자바스크립트의 파일 크기 체크 (5MB 이내의 크기만 첨부할 수 있도록)
			if($('#file-mypage-company-intro').val() != '') {
				let maxIntroSize = 5 * 1024 * 1024;		// 5MB
				let introSize = $('#file-mypage-company-intro')[0].files[0].size;
				
				if(introSize > maxIntroSize) {
					alert("회사 소개서 첨부파일은 5MB 이내로 첨부가 가능합니다.");
					$('#file-mypage-company-intro').val('');
					$('#file-company-intro').text('${companyDetail.companyIntroRealname}');
					return;
				}
			}
			
			
			// 자바스크립트의 파일 확장자 체크 검색 (이미지 파일만 받을 수 있도록)
			let logo = $('#file-mypage-logo').val();
			
			// . 을 제거한 확장자만 얻어낸 후 그것을 소문자로 일괄 변경 후 비교한다.
			// +1을 한 것은 점 바로 이후 문자부터 잘라서 추출하기 위해
			logo = logo.slice(logo.indexOf('.') + 1).toLowerCase();
			
			if(logo !== 'jpg' && logo !== 'png' && logo !== 'jpeg' && logo !== 'bmp' && logo !== '') {
				alert('이미지 파일 형식만 등록이 가능합니다.');
				$('#file-mypage-logo').val('');
				$('#img-mypage-logo').attr('src', '<c:url value="/company/companyLogoGet?companyNO=${companyDetail.companyNO}" />');
				return;
			}
			
			
			// 자바스크립트의 파일 크기 체크 (5MB 이내의 크기만 첨부할 수 있도록)
			if($('#file-mypage-logo').val() != '') {
				let maxLogoSize = 5 * 1024 * 1024;		// 5MB
				let logoSize = $('#file-mypage-logo')[0].files[0].size;
				
				if(logoSize > maxLogoSize) {
					alert("로고사진 첨부파일은 5MB 이내로 첨부가 가능합니다.");
					$('#file-mypage-logo').val('');
					$('#img-mypage-logo').attr('src', '<c:url value="/company/companyLogoGet?companyNO=${companyDetail.companyNO}" />');
					return;
				}
			}
			
			
			// 기업회원 번호와 로고사진과 회사 소개서 파일을 새로 등록했는지 확인하기 위해 값을 가져온다.
			const companyNO = $('#hidden-company-mypage-companyno').val();
			const logoCheck = $('#file-mypage-logo').val();
			const companyIntroCheck = $('#file-mypage-company-intro').val();
			
			// 만약 수정창에서 회사 소개서만 새로 등록했다면
			if(companyIntroCheck && !logoCheck) {
				
				// 처리 될 동안 중복클릭을 방지
				$('#btn-company-mypage-update').attr('disabled', true);
				
				// 이미 올렸던 회사 소개서 파일을 서버에서 삭제한 후에
				$.ajax({
					type: 'POST',
					url: '<c:url value="/company/companyIntroDelete/" />' + companyNO,
					contentType: false,
					processData: false,
					
					success: function(result) {
						if(result == 'YesCompanyIntroDelete') {

							const formData = new FormData();
							
							const data = $('#file-mypage-company-intro');
							
							formData.append('newCompanyIntro', data[0].files[0]);
							
							// 수정창에서 업로드한 파일로 새로 적용한다.
							$.ajax({
								type: 'POST',
								url: '<c:url value="/company/companyIntroUpdate/" />' + companyNO,
								contentType: false,
								processData: false,
								
								data: formData,
								
								success: function(result) {
									if(result == 'YesCompanyIntroUpdate') {
										console.log('회사 소개서 수정 성공');
										
										// 회사 소개서 수정이 완료되면 나머지 정보도 수정한다.
										document.companyUpdateForm.submit();
									} else {
										alert('회사 소개서 수정 중 오류가 발생했습니다.');
										return;
									}
								},
								
								error: function() {
									alert('회사 소개서 수정 중 서버오류가 발생했습니다.');
									return;
								}
							});
							
						} else {
							alert('회사 소개서 삭제 중 오류가 발생했습니다.');
							return;
						}
					},
					
					error: function() {
						alert('회사 소개서 삭제 중 서버오류가 발생했습니다.');
						return;
					}
				});
				
			} else if(logoCheck && !companyIntroCheck) {
				
				// 처리 될 동안 중복클릭을 방지
				$('#btn-company-mypage-update').attr('disabled', true);
				
				// 만약 사용자가 로고 사진만 새로 등록했다면
				// 사용자가 이미 올렸던 로고 사진이 있는지 체크한다.
				$.ajax({
					type: 'POST',
					url: '<c:url value="/company/companyLogoCheck/" />' + companyNO,
					contentType: false,
					processData: false,
					
					success: function(result) {
						
						// 사용자가 이미 올렸던 로고 사진이 있었다면
						if(result == 'YesLogoCheck') {
							
							// 이미 올렸던 로고 사진을 서버에서 삭제한 후에
							$.ajax({
								type: 'POST',
								url: '<c:url value="/company/companyLogoDelete/" />' + companyNO,
								contentType: false,
								processData: false,
								
								success: function(result) {
									if(result == 'YesLogoDelete') {

										const formData = new FormData();
										
										const data = $('#file-mypage-logo');
										
										formData.append('newLogo', data[0].files[0]);
										
										// 수정창에서 업로드한 파일로 새로 적용한다.
										$.ajax({
											type: 'POST',
											url: '<c:url value="/company/companyLogoUpdate/" />' + companyNO,
											contentType: false,
											processData: false,
											
											data: formData,
											
											success: function(result) {
												if(result == 'YesLogoUpdate') {
													console.log('로고 사진 수정 성공');
													
													// 로고 사진 수정이 완료되면 나머지 정보도 수정한다.
													document.companyUpdateForm.submit();
												} else {
													alert('로고 사진 수정 중 오류가 발생했습니다.');
													return;
												}
											},
											
											error: function() {
												alert('로고 사진 수정 중 서버오류가 발생했습니다.');
												return;
											}
										});
										
									} else {
										alert('로고 사진 삭제 중 오류가 발생했습니다.');
										return;
									}
								},
								
								error: function() {
									alert('로고 사진 삭제 중 서버오류가 발생했습니다.');
									return;
								}
							});
						} else {
							
							// 사용자가 이미 올렸던 로고 사진이 없었던 경우라면
							const formData = new FormData();
							
							const data = $('#file-mypage-logo');
							
							formData.append('newLogo', data[0].files[0]);
							
							// 수정창에서 업로드한 파일로 새로 등록한다.
							$.ajax({
								type: 'POST',
								url: '<c:url value="/company/companyLogoUpdate/" />' + companyNO,
								contentType: false,
								processData: false,
								
								data: formData,
								
								success: function(result) {
									if(result == 'YesLogoUpdate') {
										console.log('로고 사진 수정 성공');
										
										// 로고 사진 수정이 완료되면 나머지 정보도 수정한다.
										document.companyUpdateForm.submit();
									} else {
										alert('로고 사진 수정 중 오류가 발생했습니다.');
										return;
									}
								},
								
								error: function() {
									alert('로고 사진 수정 중 서버오류가 발생했습니다.');
									return;
								}
							});
							
						}
					},
					
					error: function() {
						alert('로고 사진 존재 여부 확인 중 서버오류가 발생했습니다.');
						return;
					}
				}); 
				
			} else if(logoCheck && companyIntroCheck) {
				
				// 처리 될 동안 중복클릭을 방지
				$('#btn-company-mypage-update').attr('disabled', true);
				
				// 사용자가 둘 다 새로 등록했다면
				// 이미 올렸던 회사 소개서 파일을 서버에서 삭제한 후에
				$.ajax({
					type: 'POST',
					url: '<c:url value="/company/companyIntroDelete/" />' + companyNO,
					contentType: false,
					processData: false,
					
					success: function(result) {
						if(result == 'YesCompanyIntroDelete') {

							const formData = new FormData();
							
							const data = $('#file-mypage-company-intro');
							
							formData.append('newCompanyIntro', data[0].files[0]);
							
							// 수정창에서 업로드한 파일로 새로 적용한다.
							$.ajax({
								type: 'POST',
								url: '<c:url value="/company/companyIntroUpdate/" />' + companyNO,
								contentType: false,
								processData: false,
								
								data: formData,
								
								success: function(result) {
									if(result == 'YesCompanyIntroUpdate') {
										console.log('회사 소개서 수정 성공');
										
										// 만약 사용자가 로고 사진도 새로 등록했다면
										// 사용자가 이미 올렸던 로고 사진이 있는지 체크한다.
										$.ajax({
											type: 'POST',
											url: '<c:url value="/company/companyLogoCheck/" />' + companyNO,
											contentType: false,
											processData: false,
											
											success: function(result) {
												
												// 사용자가 이미 올렸던 로고 사진이 있었다면
												if(result == 'YesLogoCheck') {
													
													// 이미 올렸던 로고 사진을 서버에서 삭제한 후에
													$.ajax({
														type: 'POST',
														url: '<c:url value="/company/companyLogoDelete/" />' + companyNO,
														contentType: false,
														processData: false,
														
														success: function(result) {
															if(result == 'YesLogoDelete') {

																const formData = new FormData();
																
																const data = $('#file-mypage-logo');
																
																formData.append('newLogo', data[0].files[0]);
																
																// 수정창에서 업로드한 파일로 새로 적용한다.
																$.ajax({
																	type: 'POST',
																	url: '<c:url value="/company/companyLogoUpdate/" />' + companyNO,
																	contentType: false,
																	processData: false,
																	
																	data: formData,
																	
																	success: function(result) {
																		if(result == 'YesLogoUpdate') {
																			console.log('로고 사진 수정 성공');
																			
																			// 모두 변경되면 나머지 정보도 수정한다.
																			document.companyUpdateForm.submit();
																		} else {
																			alert('로고 사진 수정 중 오류가 발생했습니다.');
																			return;
																		}
																	},
																	
																	error: function() {
																		alert('로고사진 수정 중 서버오류가 발생했습니다.');
																		return;
																	}
																});
																
															} else {
																alert('로고 사진 삭제 중 오류가 발생했습니다.');
																return;
															}
														},
														
														error: function() {
															alert('로고 사진 삭제 중 서버오류가 발생했습니다.');
															return;
														}
													});
												} else {
													
													// 사용자가 이미 올렸던 로고 사진이 없었던 경우라면
													const formData = new FormData();
													
													const data = $('#file-mypage-logo');
													
													formData.append('newLogo', data[0].files[0]);
													
													// 수정창에서 업로드한 파일로 새로 등록한다.
													$.ajax({
														type: 'POST',
														url: '<c:url value="/company/companyLogoUpdate/" />' + companyNO,
														contentType: false,
														processData: false,
														
														data: formData,
														
														success: function(result) {
															if(result == 'YesLogoUpdate') {
																console.log('로고 사진 수정 성공');
																
																// 모두 변경되면 나머지 정보도 수정한다.
																document.companyUpdateForm.submit();
															} else {
																alert('로고 사진 수정 중 오류가 발생했습니다.');
																return;
															}
														},
														
														error: function() {
															alert('로고 사진 수정 중 서버오류가 발생했습니다.');
															return;
														}
													});
													
												}
											},
											
											error: function() {
												alert('로고 사진 존재 여부 확인 중 서버오류가 발생했습니다.');
												return;
											}
										}); 
									} else {
										alert('회사 소개서 수정 중 오류가 발생했습니다.');
										return;
									}
								},
								
								error: function() {
									alert('회사 소개서 수정 중 서버오류가 발생했습니다.');
									return;
								}
							});
							
						} else {
							alert('회사 소개서 삭제 중 오류가 발생했습니다.');
							return;
						}
					},
					
					error: function() {
						alert('회사 소개서 삭제 중 서버오류가 발생했습니다.');
						return;
					}
				});
				
			} else {
				
				// 처리 될 동안 중복클릭을 방지
				$('#btn-company-mypage-update').attr('disabled', true);
				
				// 아무 파일을 선택하지 않았다면 그냥 나머지 정보만 수정을 진행한다.
				document.companyUpdateForm.submit();
			}
		});
		
	});
	
</script>
