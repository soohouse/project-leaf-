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
						style="margin-top: 20px;"> <span class="main-notice-title">내
							정보</span>
					</a>
					<form action="<c:url value='/adminmypage/adminuserupdate'/>" method="post" name="userUpdateForm">
					<div class="card"
						style="width: 20%; transform: translate(0, -180px); text-align: center;">
						<img id="img-mypage-profile" src="<c:url value='/user/userProfileGet?userNO=${userDetail.userNO}' />" alt="profile" class="img-circle" style="height: 250px;">
						
						<div class="container1">
							<div style="margin-bottom:-20px;">
							<input type="file" id="file-mypage-profile" style="display: none;">
							<button type="button" class="btn btn-link" id="btn-mypage-profile">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 프로필사진 수정
							</button>
							</div>
							<h3>
								<input type="hidden" value="${userDetail.userNO}" id="hidden-user-mypage-userno" name="userNO" />
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
								<input class="form-control" id="disabledInput" type="text" placeholder="${userDetail.userID}" disabled>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">이름</p>
							</div>
							<div class="col-sm-9">
								<input type="text" name="userName" class="form-control" id="mypage-modify-user-name" value="${userDetail.userName}">
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">이메일</p>
							</div>
							<div class="col-sm-9">
								<input class="form-control" id="disabledInput" type="text"
									placeholder="${userDetail.userEmail1}@${userDetail.userEmail2}" disabled>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">Phone</p>
							</div>
							<div class="col-sm-9">
								<select class="form-control" style="width: 20%;" value="${user.userPhone1}" name="userPhone1">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select> 
								<input type="text" id="mypage-modify-user-phone2" class="form-control" value="${userDetail.userPhone2}" style="width:90px;" maxlength="4" name="userPhone2">
								<input type="text" id="mypage-modify-user-phone3" class="form-control" value="${userDetail.userPhone3}" style="width:90px;" maxlength="4" name="userPhone3">
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">소개</p>
							</div>
							<div class="col-sm-9">
								<textarea id="w3review" rows="5" cols="50" style="resize: none;" name="userIntro">${userDetail.userIntro}</textarea>
							</div>
						</div>
						<hr>

						<div class="row">
							<div class="col-sm-3">
								<p class="mb-0">이력서</p>
							</div>
							<div class="col-sm-9">
								<div class="form-group">
									<input type="file" id="file-mypage-resume" style="display: none;">
									<button type="button" id="btn-mypage-resume">파일 선택</button>
									<label for="file-mypage-resume" id="file-resume" style="font-weight: 500;">
										<c:if test="${userDetail.resumeRealname == null}">
											등록된 이력서가 없습니다.
										</c:if>
										<c:if test="${userDetail.resumeRealname != null}">
											${userDetail.resumeRealname}
										</c:if>
									</label>
								</div>
							</div>
						</div>

						<hr>
					</form>
						<div class="row">
							<div class="col-sm-3"></div>
							<div class="col-sm-9">
								<div class="form-group btn-profile">
									<input type="button" class="btn" id="btn-user-mypage-update" value="수정완료">
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
	
	// 프로필사진 미리보기 자바스크립트 함수
	function readURL(input) {
		if (input.files && input.files[0]) {
			
	    	var reader = new FileReader(); //비동기처리를 위한 파일을 읽는 자바스크립트 객체
	    	
	    	//readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
	    	reader.readAsDataURL(input.files[0]); 
	    	
	    	reader.onload = function(e) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
	        	$('#img-mypage-profile').attr("src", e.target.result); 
	        	console.log(event.target)//event.target은 이벤트로 선택된 요소를 의미
	    	}
		}
	}
	
	
	$(function() {
		
		// 프로필 사진 수정 버튼을 누르면 파일 요소를 클릭한 것으로 인식
		$('#btn-mypage-profile').click(function() {
			$('#file-mypage-profile').click();
		});
		
		
		// 파일 요소가 변경되면 기존에 있던 프로필사진을 바꿀 사진 미리보기로 교체한다.
		$('#file-mypage-profile').change(function() {
			readURL(this);
		});
		
		
		// 파일 찾기 버튼을 누르면 숨겨져 있는 파일 요소가 클릭된 것으로 인식
		$('#btn-mypage-resume').click(function() {
			$('#file-mypage-resume').click();
		});
		
		
		// 파일 요소가 변경되면 파일의 이름을 추출해서 버튼 옆에 파일 이름을 띄워준다.
		$('#file-mypage-resume').change(function() {
			var fileValue = $('#file-mypage-resume').val().split('\\');
			var fileName = fileValue[fileValue.length - 1];
			
			$('#file-resume').text(fileName);
		});
		
		
		// 수정완료 버튼 클릭 시
		$('#btn-user-mypage-update').click(function() {
			
			// 이름 입력 여부 체크
			if($('#mypage-modify-user-name').val() == '') {
				alert('이름을 입력해주세요.');				
				$('#mypage-modify-user-name').focus();
				return;
			}
			
			
			// 전화번호 앞 자리 입력 여부 체크
			if($('#mypage-modify-user-phone2').val() == '') {
				alert('전화번호를 입력해주세요.');				
				$('#mypage-modify-user-phone2').focus();
				return;
			}
			
			
			// 전화번호 뒷 자리 입력 여부 체크
			if($('#mypage-modify-user-phone3').val() == '') {
				alert('전화번호를 입력해주세요.');				
				$('#mypage-modify-user-phone3').focus();
				return;
			}
			
			
			// 자바스크립트의 파일 확장자 체크 검색 (문서 파일만 받을 수 있도록)
			let resume = $('#file-mypage-resume').val();
			
			// . 을 제거한 확장자만 얻어낸 후 그것을 소문자로 일괄 변경 후 비교한다.
			// +1을 한 것은 점 바로 이후 문자부터 잘라서 추출하기 위해
			resume = resume.slice(resume.indexOf('.') + 1).toLowerCase();
			
			if(resume !== 'hwp' && resume !== 'doc' && resume !== 'pdf' && resume !== 'ppt' && resume !== 'pptx' && resume !== 'docx' && resume !== 'xlsx' && resume !== 'xls' && resume !== '') {
				alert('문서 파일 형식만 등록이 가능합니다.');
				$('#file-mypage-resume').val('');
				$('#file-resume').text('${userDetail.resumeRealname}');
				return;
			}
			
			
			// 자바스크립트의 파일 크기 체크 (5MB 이내의 크기만 첨부할 수 있도록)
			if($('#file-mypage-resume').val() != '') {
				let maxResumeSize = 5 * 1024 * 1024;		// 5MB
				let resumeSize = $('#file-mypage-resume')[0].files[0].size;
				
				if(resumeSize > maxResumeSize) {
					alert("이력서 첨부파일은 5MB 이내로 첨부가 가능합니다.");
					$('#file-mypage-resume').val('');
					$('#file-resume').text('${userDetail.resumeRealname}');
					return;
				}
			}
			
			
			// 자바스크립트의 파일 확장자 체크 검색 (이미지 파일만 받을 수 있도록)
			let profile = $('#file-mypage-profile').val();
			
			// . 을 제거한 확장자만 얻어낸 후 그것을 소문자로 일괄 변경 후 비교한다.
			// +1을 한 것은 점 바로 이후 문자부터 잘라서 추출하기 위해
			profile = profile.slice(profile.indexOf('.') + 1).toLowerCase();
			
			if(profile !== 'jpg' && profile !== 'png' && profile !== 'jpeg' && profile !== 'bmp' && profile !== '') {
				alert('이미지 파일 형식만 등록이 가능합니다.');
				$('#file-mypage-profile').val('');
				$('#img-mypage-profile').attr('src', '<c:url value="/user/userProfileGet?userNO=${userDetail.userNO}" />');
				return;
			}
			
			
			// 자바스크립트의 파일 크기 체크 (5MB 이내의 크기만 첨부할 수 있도록)
			if($('#file-mypage-profile').val() != '') {
				let maxProfileSize = 5 * 1024 * 1024;		// 5MB
				let profileSize = $('#file-mypage-profile')[0].files[0].size;
				
				if(profileSize > maxProfileSize) {
					alert("프로필사진 첨부파일은 5MB 이내로 첨부가 가능합니다.");
					$('#file-mypage-profile').val('');
					$('#img-mypage-profile').attr('src', '<c:url value="/user/userProfileGet?userNO=${userDetail.userNO}" />');
					return;
				}
			}
			
			
			// 일반회원 번호와 프로필사진과 이력서 파일을 새로 등록했는지 확인하기 위해 값을 가져온다.
			const userNO = $('#hidden-user-mypage-userno').val();
			const profileCheck = $('#file-mypage-profile').val();
			const resumeCheck = $('#file-mypage-resume').val();
			
			// 만약 수정창에서 이력서만 새로 등록했다면
			if(resumeCheck && !profileCheck) {
				
				// 처리 될 동안 중복클릭을 방지
				$('#btn-user-mypage-update').attr('disabled', true);
				
				// 사용자가 이미 올렸던 이력서 파일이 있는지 체크한다.
				$.ajax({
					type: 'POST',
					url: '<c:url value="/user/userResumeCheck/" />' + userNO,
					contentType: false,
					processData: false,
					
					success: function(result) {
						
						// 사용자가 이미 올렸던 이력서 파일이 있었다면
						if(result == 'YesResumeCheck') {
							
							// 이미 올렸던 이력서 파일을 서버에서 삭제한 후에
							$.ajax({
								type: 'POST',
								url: '<c:url value="/user/userResumeDelete/" />' + userNO,
								contentType: false,
								processData: false,
								
								success: function(result) {
									if(result == 'YesResumeDelete') {

										const formData = new FormData();
										
										const data = $('#file-mypage-resume');
										
										formData.append('newResume', data[0].files[0]);
										
										// 수정창에서 업로드한 파일로 새로 적용한다.
										$.ajax({
											type: 'POST',
											url: '<c:url value="/user/userResumeUpdate/" />' + userNO,
											contentType: false,
											processData: false,
											
											data: formData,
											
											success: function(result) {
												if(result == 'YesResumeUpdate') {
													console.log('이력서 수정 성공');
													
													// 이력서 수정이 완료되면 나머지 정보도 수정한다.
													document.userUpdateForm.submit();
												} else {
													alert('이력서 수정 중 오류가 발생했습니다.');
													return;
												}
											},
											
											error: function() {
												alert('이력서 수정 중 서버오류가 발생했습니다.');
												return;
											}
										});
										
									} else {
										alert('이력서 삭제 중 오류가 발생했습니다.');
										return;
									}
								},
								
								error: function() {
									alert('이력서 삭제 중 서버오류가 발생했습니다.');
									return;
								}
							});
						} else {
							
							// 사용자가 이미 올렸던 이력서 파일이 없었던 경우라면
							const formData = new FormData();
							
							const data = $('#file-mypage-resume');
							
							formData.append('newResume', data[0].files[0]);
							
							// 수정창에서 업로드한 파일로 새로 등록한다.
							$.ajax({
								type: 'POST',
								url: '<c:url value="/user/userResumeUpdate/" />' + userNO,
								contentType: false,
								processData: false,
								
								data: formData,
								
								success: function(result) {
									if(result == 'YesResumeUpdate') {
										console.log('이력서 수정 성공');
										
										// 이력서 수정이 완료되면 나머지 정보도 수정한다.
										document.userUpdateForm.submit();
									} else {
										alert('이력서 수정 중 오류가 발생했습니다.');
										return;
									}
								},
								
								error: function() {
									alert('이력서 수정 중 서버오류가 발생했습니다.');
									return;
								}
							});
							
						}
					},
					
					error: function() {
						alert('이력서 존재 여부 확인 중 서버오류가 발생했습니다.');
						return;
					}
				}); 
				
			} else if(profileCheck && !resumeCheck) {
				
				// 처리 될 동안 중복클릭을 방지
				$('#btn-user-mypage-update').attr('disabled', true);
				
				// 만약 사용자가 프로필 사진만 새로 등록했다면
				// 사용자가 이미 올렸던 프로필 사진이 있는지 체크한다.
				$.ajax({
					type: 'POST',
					url: '<c:url value="/user/userProfileCheck/" />' + userNO,
					contentType: false,
					processData: false,
					
					success: function(result) {
						
						// 사용자가 이미 올렸던 프로필 사진이 있었다면
						if(result == 'YesProfileCheck') {
							
							// 이미 올렸던 프로필 사진을 서버에서 삭제한 후에
							$.ajax({
								type: 'POST',
								url: '<c:url value="/user/userProfileDelete/" />' + userNO,
								contentType: false,
								processData: false,
								
								success: function(result) {
									if(result == 'YesProfileDelete') {

										const formData = new FormData();
										
										const data = $('#file-mypage-profile');
										
										formData.append('newProfile', data[0].files[0]);
										
										// 수정창에서 업로드한 파일로 새로 적용한다.
										$.ajax({
											type: 'POST',
											url: '<c:url value="/user/userProfileUpdate/" />' + userNO,
											contentType: false,
											processData: false,
											
											data: formData,
											
											success: function(result) {
												if(result == 'YesProfileUpdate') {
													console.log('프로필 사진 수정 성공');
													
													// 프로필 사진 수정이 완료되면 나머지 정보도 수정한다.
													document.userUpdateForm.submit();
												} else {
													alert('프로필 사진 수정 중 오류가 발생했습니다.');
													return;
												}
											},
											
											error: function() {
												alert('프로필 사진 수정 중 서버오류가 발생했습니다.');
												return;
											}
										});
										
									} else {
										alert('프로필 사진 삭제 중 오류가 발생했습니다.');
										return;
									}
								},
								
								error: function() {
									alert('프로필 사진 삭제 중 서버오류가 발생했습니다.');
									return;
								}
							});
						} else {
							
							// 사용자가 이미 올렸던 프로필 사진이 없었던 경우라면
							const formData = new FormData();
							
							const data = $('#file-mypage-profile');
							
							formData.append('newProfile', data[0].files[0]);
							
							// 수정창에서 업로드한 파일로 새로 등록한다.
							$.ajax({
								type: 'POST',
								url: '<c:url value="/user/userProfileUpdate/" />' + userNO,
								contentType: false,
								processData: false,
								
								data: formData,
								
								success: function(result) {
									if(result == 'YesProfileUpdate') {
										console.log('프로필 사진 수정 성공');
										
										// 프로필 사진 수정이 완료되면 나머지 정보도 수정한다.
										document.userUpdateForm.submit();
									} else {
										alert('프로필 사진 수정 중 오류가 발생했습니다.');
										return;
									}
								},
								
								error: function() {
									alert('프로필 사진 수정 중 서버오류가 발생했습니다.');
									return;
								}
							});
							
						}
					},
					
					error: function() {
						alert('프로필 사진 존재 여부 확인 중 서버오류가 발생했습니다.');
						return;
					}
				}); 
				
			} else if(profileCheck && resumeCheck) {
				
				// 처리 될 동안 중복클릭을 방지
				$('#btn-user-mypage-update').attr('disabled', true);
				
				// 사용자가 둘 다 새로 등록했다면
				// 사용자가 이미 올렸던 이력서 파일이 있는지 체크한다.
				$.ajax({
					type: 'POST',
					url: '<c:url value="/user/userResumeCheck/" />' + userNO,
					contentType: false,
					processData: false,
					
					success: function(result) {
						
						// 사용자가 이미 올렸던 이력서 파일이 있었다면
						if(result == 'YesResumeCheck') {
							
							// 이미 올렸던 이력서 파일을 서버에서 삭제한 후에
							$.ajax({
								type: 'POST',
								url: '<c:url value="/user/userResumeDelete/" />' + userNO,
								contentType: false,
								processData: false,
								
								success: function(result) {
									if(result == 'YesResumeDelete') {

										const formData = new FormData();
										
										const data = $('#file-mypage-resume');
										
										formData.append('newResume', data[0].files[0]);
										
										// 수정창에서 업로드한 파일로 새로 적용한다.
										$.ajax({
											type: 'POST',
											url: '<c:url value="/user/userResumeUpdate/" />' + userNO,
											contentType: false,
											processData: false,
											
											data: formData,
											
											success: function(result) {
												if(result == 'YesResumeUpdate') {
													console.log('이력서 수정 성공');
													
													// 만약 사용자가 프로필 사진도 새로 등록했다면
													// 사용자가 이미 올렸던 프로필 사진이 있는지 체크한다.
													$.ajax({
														type: 'POST',
														url: '<c:url value="/user/userProfileCheck/" />' + userNO,
														contentType: false,
														processData: false,
														
														success: function(result) {
															
															// 사용자가 이미 올렸던 프로필 사진이 있었다면
															if(result == 'YesProfileCheck') {
																
																// 이미 올렸던 프로필 사진을 서버에서 삭제한 후에
																$.ajax({
																	type: 'POST',
																	url: '<c:url value="/user/userProfileDelete/" />' + userNO,
																	contentType: false,
																	processData: false,
																	
																	success: function(result) {
																		if(result == 'YesProfileDelete') {

																			const formData = new FormData();
																			
																			const data = $('#file-mypage-profile');
																			
																			formData.append('newProfile', data[0].files[0]);
																			
																			// 수정창에서 업로드한 파일로 새로 적용한다.
																			$.ajax({
																				type: 'POST',
																				url: '<c:url value="/user/userProfileUpdate/" />' + userNO,
																				contentType: false,
																				processData: false,
																				
																				data: formData,
																				
																				success: function(result) {
																					if(result == 'YesProfileUpdate') {
																						console.log('프로필 사진 수정 성공');
																						
																						// 모두 변경되면 나머지 정보도 수정한다.
																						document.userUpdateForm.submit();
																					} else {
																						alert('프로필 사진 수정 중 오류가 발생했습니다.');
																						return;
																					}
																				},
																				
																				error: function() {
																					alert('프로필 사진 수정 중 서버오류가 발생했습니다.');
																					return;
																				}
																			});
																			
																		} else {
																			alert('프로필 사진 삭제 중 오류가 발생했습니다.');
																			return;
																		}
																	},
																	
																	error: function() {
																		alert('프로필 사진 삭제 중 서버오류가 발생했습니다.');
																		return;
																	}
																});
															} else {
																
																// 사용자가 이미 올렸던 프로필 사진이 없었던 경우라면
																const formData = new FormData();
																
																const data = $('#file-mypage-profile');
																
																formData.append('newProfile', data[0].files[0]);
																
																// 수정창에서 업로드한 파일로 새로 등록한다.
																$.ajax({
																	type: 'POST',
																	url: '<c:url value="/user/userProfileUpdate/" />' + userNO,
																	contentType: false,
																	processData: false,
																	
																	data: formData,
																	
																	success: function(result) {
																		if(result == 'YesProfileUpdate') {
																			console.log('프로필 사진 수정 성공');
																			
																			// 모두 변경되면 나머지 정보도 수정한다.
																			document.userUpdateForm.submit();
																		} else {
																			alert('프로필 사진 수정 중 오류가 발생했습니다.');
																			return;
																		}
																	},
																	
																	error: function() {
																		alert('프로필 사진 수정 중 서버오류가 발생했습니다.');
																		return;
																	}
																});
																
															}
														},
														
														error: function() {
															alert('프로필 사진 존재 여부 확인 중 서버오류가 발생했습니다.');
															return;
														}
													}); 
												} else {
													alert('이력서 수정 중 오류가 발생했습니다.');
													return;
												}
											},
											
											error: function() {
												alert('이력서 수정 중 서버오류가 발생했습니다.');
												return;
											}
										});
										
									} else {
										alert('이력서 삭제 중 오류가 발생했습니다.');
										return;
									}
								},
								
								error: function() {
									alert('이력서 삭제 중 서버오류가 발생했습니다.');
									return;
								}
							});
						} else {
							
							// 사용자가 이미 올렸던 이력서 파일이 없었던 경우라면
							const formData = new FormData();
							
							const data = $('#file-mypage-resume');
							
							formData.append('newResume', data[0].files[0]);
							
							// 수정창에서 업로드한 파일로 새로 등록한다.
							$.ajax({
								type: 'POST',
								url: '<c:url value="/user/userResumeUpdate/" />' + userNO,
								contentType: false,
								processData: false,
								
								data: formData,
								
								success: function(result) {
									if(result == 'YesResumeUpdate') {
										console.log('이력서 수정 성공');
										
										// 만약 사용자가 프로필 사진도 새로 등록했다면
										// 사용자가 이미 올렸던 프로필 사진이 있는지 체크한다.
										$.ajax({
											type: 'POST',
											url: '<c:url value="/user/userProfileCheck/" />' + userNO,
											contentType: false,
											processData: false,
											
											success: function(result) {
												
												// 사용자가 이미 올렸던 프로필 사진이 있었다면
												if(result == 'YesProfileCheck') {
													
													// 이미 올렸던 프로필 사진을 서버에서 삭제한 후에
													$.ajax({
														type: 'POST',
														url: '<c:url value="/user/userProfileDelete/" />' + userNO,
														contentType: false,
														processData: false,
														
														success: function(result) {
															if(result == 'YesProfileDelete') {

																const formData = new FormData();
																
																const data = $('#file-mypage-profile');
																
																formData.append('newProfile', data[0].files[0]);
																
																// 수정창에서 업로드한 파일로 새로 적용한다.
																$.ajax({
																	type: 'POST',
																	url: '<c:url value="/user/userProfileUpdate/" />' + userNO,
																	contentType: false,
																	processData: false,
																	
																	data: formData,
																	
																	success: function(result) {
																		if(result == 'YesProfileUpdate') {
																			console.log('프로필 사진 수정 성공');
																			
																			// 모두 변경되면 나머지 정보도 수정한다.
																			document.userUpdateForm.submit();
																		} else {
																			alert('프로필 사진 수정 중 오류가 발생했습니다.');
																			return;
																		}
																	},
																	
																	error: function() {
																		alert('프로필 사진 수정 중 서버오류가 발생했습니다.');
																		return;
																	}
																});
																
															} else {
																alert('프로필 사진 삭제 중 오류가 발생했습니다.');
																return;
															}
														},
														
														error: function() {
															alert('프로필 사진 삭제 중 서버오류가 발생했습니다.');
															return;
														}
													});
												} else {
													
													// 사용자가 이미 올렸던 프로필 사진이 없었던 경우라면
													const formData = new FormData();
													
													const data = $('#file-mypage-profile');
													
													formData.append('newProfile', data[0].files[0]);
													
													// 수정창에서 업로드한 파일로 새로 등록한다.
													$.ajax({
														type: 'POST',
														url: '<c:url value="/user/userProfileUpdate/" />' + userNO,
														contentType: false,
														processData: false,
														
														data: formData,
														
														success: function(result) {
															if(result == 'YesProfileUpdate') {
																console.log('프로필 사진 수정 성공');
																
																// 모두 변경되면 나머지 정보도 수정한다.
																document.userUpdateForm.submit();
															} else {
																alert('프로필 사진 수정 중 오류가 발생했습니다.');
																return;
															}
														},
														
														error: function() {
															alert('프로필 사진 수정 중 서버오류가 발생했습니다.');
															return;
														}
													});
													
												}
											},
											
											error: function() {
												alert('프로필 사진 존재 여부 확인 중 서버오류가 발생했습니다.');
												return;
											}
										}); 
									} else {
										alert('이력서 수정 중 오류가 발생했습니다.');
										return;
									}
								},
								
								error: function() {
									alert('이력서 수정 중 서버오류가 발생했습니다.');
									return;
								}
							});
							
						}
					},
					
					error: function() {
						alert('이력서 존재 여부 확인 중 서버오류가 발생했습니다.');
						return;
					}
				}); 
				
			} else {
				
				// 처리 될 동안 중복클릭을 방지
				$('#btn-user-mypage-update').attr('disabled', true);
				
				// 아무 파일을 선택하지 않았다면 그냥 나머지 정보만 수정을 진행한다.
				document.userUpdateForm.submit();
			}
		});
		
	});
	
</script>
