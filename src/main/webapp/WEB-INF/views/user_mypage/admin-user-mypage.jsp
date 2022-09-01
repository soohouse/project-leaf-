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

	#div-user-intro::-webkit-scrollbar {
 		width: 3px;
  		background-color: #C7C7C7;
	}
	
	
	#div-user-intro::-webkit-scrollbar-thumb {
		background: #535353;
	}
	
</style>

</head>
<body>

	<%@ include file="../include/header.jsp"%>

	<div class="mainbox">

		<section>

<!-- 일반회원 마이페이지 내 정보 화면 -->
					<div class="container">
						<div class="row">
							<!-- 메인화면 공지사항 상단 -->
							<a href="#" class="list-group-item active notice-list-top"
								style="margin-top: 20px;"> <span class="main-notice-title">내
									정보</span>
							</a>

							<div class="card" style="width: 20%; transform: translate(0, -90px); text-align: center;">
								<img src="<c:url value='/user/userProfileGet?userNO=${userDetail.userNO}' />" alt="profile" class="img-circle" style="height: 250px;">
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
										<p class="mb-0" >소개</p>
									</div>
									<div class="col-sm-9" id="div-user-intro" style="height: 120px; overflow: auto;">
										<p class="text-muted mb-0">${fn:replace(userDetail.userIntro, replaceChar, "<br/>")}</p>
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
											
											<c:if test="${userDetail.resumeRealname != null}">
												<p class="text-muted mb-0" id="btn-user-mypage-resume" style="text-decoration: underline; color: blue; cursor: pointer;"><a class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></a> ${userDetail.resumeRealname}</p>
											</c:if>
										</div>
									</div>
								</div>

								<hr>

								<div class="row">
									<div class="col-sm-3"></div>
									<div class="col-sm-9">
										<div class="form-group btn-profile">
											<a id="btn-user-delete" style="position: relative; right: 800px; cursor: pointer; color: #970000; text-decoration: underline;">강제회원탈퇴</a>
											<button type="button" class="btn btn-warning" id="btn-mypage-user-modify2">정보수정</button>
											
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
												<button type="button" class="btn btn-default" data-dismiss="modal">취소하기</button>
											</div>
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
		$('#btn-mypage-user-modify2').click(function() {
			const userNO = $('#hidden-user-mypage-userno').val();
			location.href="/adminmypage/adminusermypagemod?userNO=" + userNO;
		});
		
		
		// 기업회원 정보수정 버튼 클릭 시 수정 페이지로 이동
		$('#btn-mypage-company-modify').click(function() {
			location.href="<c:url value='/usermypage/companymypagemod' />";
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
		$('#btn-password-change2').click(function() {
			
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
		$('#btn-password-change-company').click(function() {
			
			if(${user != null}) {
				$('#btn-modal-password-change').css('display', 'inline-block');
				$('#btn-modal-password-change-company').css('display', 'none');
			} else {
				$('#btn-modal-password-change').css('display', 'none');
				$('#btn-modal-password-change-company').css('display', 'inline-block');
			}
			
			$('#modal-password-change').modal('show');
		});
		
		
		// 일반회원 회원탈퇴 버튼 클릭 시 회원탈퇴 진행
		$('#btn-user-delete').click(function() {
			
			if(confirm('해당 사용자를 강제탈퇴 처리하시겠습니까?')) {
					
					const userNO = $('#hidden-user-mypage-userno').val();
					
					$.ajax({
						type: 'POST',
						url: '<c:url value="/adminmypage/adminuserdelete" />',
						
						dataType: 'text',
						data : {
							'userNO': userNO
						},
						
						success: function(result) {
							if(result == 'YesUserDelete') {
								
								alert('해당 사용자를 강제탈퇴 처리했습니다.');
								
								location.replace("<c:url value='/membersList/membersList' />");
								
							}
						},
						
						error: function() {
							alert('회원 탈퇴 처리 중 서버오류가 발생했습니다.');
							return;
						}
					});
				
			} else {
				return false;
			}
		});
		
	});

</script>
