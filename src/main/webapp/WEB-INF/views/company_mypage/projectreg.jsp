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
.projectReg {
	text-align: left;
	margin-bottom: 20px;
}

.projectFont {
	font-weight: bold;
}

input.form-control {
    width: 100%;
    display: inline-block;
}

.img-circle {
    padding: 0px;
}
</style>
</head>
<body>

	<%@ include file="../include/header.jsp"%>

	<div class="mainbox">

		<section>
        
       
        
        <form action="<c:url value='/project/projectputin' />" method="post" name="projectRegisterForm">
        <div class="container">
            <div class="row">
				<!-- 메인화면 공지사항 상단 -->
			             <a href="#" class="list-group-item active notice-list-top" style="margin-top: 20px;">
			            	<span class="main-notice-title">프로젝트 등록</span>
			            </a>

			<div class="col-sm-2"></div>
			<div class="col-sm-8" style="padding-top: 40px; background: #F5F5F5;">
				<div class="projectReg">
					<div>
						<p class="projectFont">프로젝트 이름 *</p>
					</div>
					<div>
						<input type="text" id="project-name" class="form-control" name="projectName"
							placeholder="프로젝트 이름을 입력하세요." style="width: 700px;">
							<span id="span-name"></span>
					</div>
				</div>
				<div class="projectReg">
					<div>
						<p class="projectFont">프로젝트 기간 *</p>
					</div>
					<div>
						<div>
							<div style="width:500px;">
							시작일자: <input name="projectRequireDate1" type="date" class="form-control" id="exampleInputdate" 
								placeholder="0000/00/00"> 
							</div>
							<div style="width:500px;">
							종료일자: <input
								name="projectRequireDate2" type="date" class="form-control" id="exampleInputdate"
								placeholder="0000/00/00">
							</div>
						</div>
					</div>

				</div>

				<div class="projectReg">
					<div>
						<p class="projectFont">협력사</p>
					</div>
					<div>
						<input type="hidden" value="${company.companyNO}" name="companyNO">
						<input class="form-control" id="disabledInput" type="text" 
							value="${company.companyName}" style="width: 300px;" disabled>
					</div>
				</div>
				<div class="projectReg">
					<div>
						<p class="projectFont">협력사 전화번호</p>
					</div>
					<div>
						<input class="form-control" id="disabledInput" type="text"
							value="${company.companyPhone1} - ${company.companyPhone2} - ${company.companyPhone3}" style="width: 200px;" disabled>
					</div>
				</div>
				<div class="projectReg">
					<div>
						<p class="projectFont">협력사 주소</p>
					</div>
					<div>
						<div>
							<input class="form-control" id="disabledInput" type="text"
								value="${company.companyAddress1}" style="width: 300px;" disabled>
						</div>
						<div>
							<input class="form-control" id="disabledInput" type="text"
								value="${company.companyAddress2}" style="width: 300px;" disabled>
						</div>
						<div>
							<input class="form-control" id="disabledInput" type="text"
								value="${company.companyAddress3}" style="width: 300px;" disabled>
						</div>
					</div>
				</div>
				<div class="projectReg">
					<div>
						<p class="projectFont">프로젝트 설명 *</p>
					</div>
					<div>
						<textarea class="form-control" rows="10" id="project-desc" name="projectDesc"
							placeholder="프로젝트 설명을 간략하게 입력하세요."></textarea>
							<span id="span-desc"></span>
					</div>
				</div>
				<div class="projectReg">
					<div>
						<p class="projectFont">담당자 이름 *</p>
					</div>
					<div>
						<input type="text" class="form-control" id="project-manager" name="projectManager"
							placeholder="담당자 이름을 입력하세요." style="width: 300px;">
							<span id="span-manager"></span>
					</div>
				</div>
				<div class="projectReg">
					<div>
						<p class="projectFont">담당자 전화번호 *</p>
					</div>
					<div>
						<input type="text" class="form-control" id="project-mg-phone" name="projectManagerPhone"
							placeholder="전화번호를 입력하세요." style="width: 300px;">
							<span id="span-phone"></span>
					</div>
				</div>
				<div class="projectReg">
					<div>
						<p class="projectFont">담당자 이메일 *</p>
					</div>
					<div>
						<input type="text" class="form-control" id="project-mg-email" name="projectManagerEmail"
							placeholder="담당자 이메일을 입력해주세요." style="width: 230px;"> <span id="span-email"></span> <select
							class="form-control" style="width: 145px;">
							<option>@naver.com</option>
							<option>@gmail.com</option>
							<option>@daum.net</option>
						</select>
					</div>
				</div>
				<div class="projectReg">
					<div>
						<p class="projectFont">지원자격 *</p>
					</div>
					<div>
						<textarea class="form-control" rows="5" id="project-license" name="projectRequireLicense"
							placeholder="지원자격을 간략하게 입력하세요."></textarea>
							<span id="span-license"></span>
					</div>
				</div>
				<div class="projectReg">
					<div>
						<p class="projectFont">모집역할 *</p>
					</div>
					<div>
						<input type="text" class="form-control" id="project-role" name="projectRequireRole"
							placeholder="모집하는 역할을 간단하게 입력하세요." style="width: 700px;">
							<span id="span-role"></span>
					</div>
				</div>
				<div class="projectReg">
					<div>
						<p class="projectFont">모집인원 *</p>
					</div>
					<div>
						<input type="text" class="form-control" id="project-people" name="projectRequirePeople"
							placeholder="모집 인원을 입력하세요." style="width: 700px;">
							<span id="span-people"></span>
					</div>
				</div>
				<div class="projectReg">
					<div>
						<p class="projectFont">기업 소개 배너</p>
					</div>
					<div>
						<img src="../resources/img/logo.png" alt="comlogo" class="img-circle"
							style="width: 300px;">
					</div>
					<div class="form-group" style="margin-bottom: 50px;">
						<input type="file" id="exampleInputFile">
					</div>
				</div>

				<div>
					<div style="text-align: center; margin-bottom: 5px;">
						<button type="button" id="project-putin" class="btn btn-primary btn-lg"  
							style="width: 300px;">등록하기</button>
					</div>
					<div style="text-align: center; margin-bottom: 20px;">
						<button type="button" id="go-back-btn" class="btn btn-default btn-lg"
							style="width: 300px;">취소하기</button>
					</div>
				</div>

			</div>
			<div class="col-sm-2"></div>

		</div>
		</div>
		</form>
		</section>
		<%@ include file="../include/footer.jsp"%>
		
		</div>
	
</body>
</html>


<script>

$(function() {
	$('#go-back-btn').click(function() {
		location.href='<c:url value="/project/projectadmin" />';
	})
	
});


	
$('#project-putin').click(function() {
	
	if(confirm('프로젝트를 등록 하시겠습니까?')) {
		
		// 이름 입력 여부 체크
		if($('#project-name').val() == '') {
					alert('이름을 입력해주세요.');
					$('#span-name').text('프로젝트 이름을 입력해주세요.');
					$('#span-name').css('color', 'red');
					
					$('#user-name').focus();
					return;
				}
		
		//프로젝트 설명 입력 여부 체크
		if($('#project-desc').val() == '') {
			alert('프로젝트 설명을 입력해주세요.');
			$('#span-desc').text('설명을 입력해주세요.');
			$('#span-desc').css('color', 'red');
			
			$('#project-desc').focus();
			return;
		}
		
		//담당자 이름 입력 여부
		if($('#project-manager').val() == '') {
			alert('담당자 이름을 입력해주세요.');
			$('#span-manager').text('이름을 입력해주세요.');
			$('#span-manager').css('color', 'red');
			
			$('#project-manager').focus();
			return;
		}
		
		// 담당자 전화번호 입력 여부
		if($('#project-mg-phone').val() == '') {
			alert('전화번호를 입력해주세요.');
			$('#span-phone').text('담당자 전화번호를 입력해주세요.');
			$('#span-phone').css('color', 'red');
			
			$('#project-mg-phone').focus();
			return;
		}
		
		// 담당자 이메일 입력 여부 체크
		if($('#project-mg-email').val() == '') {
			alert('이메일을 입력해주세요.');
			$('#span-email').text('담당자 이메일을 입력해주세요.');
			$('#span-email').css('color', 'red');
			
			$('#project-mg-email').focus();
			return;
		}
		
		// 지원자격 입력 여부 체크
		if($('#project-license').val() == '') {
			alert('지원자격을 입력해주세요.');
			$('#span-license').text('지원자격을 입력해주세요.');
			$('#span-license').css('color', 'red');
			
			$('#project-license').focus();
			return;
		}
		
		// 모집역할 입력 여부 체크
		if($('#project-role').val() == '') {
			alert('모집역할을 입력해주세요.');
			$('#span-role').text('모집역할을 입력해주세요.');
			$('#span-role').css('color', 'red');
			
			$('#project-role').focus();
			return;
		}
		
		// 모집 인원 입력 여부 체크
		if($('#project-people').val() == '') {
			alert('이메일을 입력해주세요.');
			$('#span-people').text('담당자 이메일을 입력해주세요.');
			$('#span-people').css('color', 'red');
			
			$('#project-people').focus();
			return;
		}
		
		// 자바스크립트의 파일 확장자 체크 검색 (문서 파일만 받을 수 있도록)
		let image = $('#exampleInputFile').val();
		
		// . 을 제거한 확장자만 얻어낸 후 그것을 소문자로 일괄 변경 후 비교한다.
		// +1을 한 것은 점 바로 이후 문자부터 잘라서 추출하기 위해
		image = image.slice(image.indexOf('.') + 1).toLowerCase();
		
		if(image !== 'png' && img !== 'jpg' && img !== 'jpeg' && resume !== '') {
			alert('이미지 파일 형식만 등록이 가능합니다.');
			$('#image').val('');
			return;
		}
		
	document.projectRegisterForm.submit();
	}	
	});
	

	
</script>
