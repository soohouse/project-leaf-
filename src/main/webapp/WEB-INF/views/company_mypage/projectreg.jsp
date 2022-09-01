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
        
        <div class="container">
            <div class="row" style="margin-bottom: 60px;">
				<!-- 메인화면 공지사항 상단 -->
			             <a href="#" class="list-group-item active notice-list-top" style="margin-top: 20px;">
			            	<span class="main-notice-title">프로젝트 등록</span>
			            </a>

			<div class="col-sm-2"></div>
			<div class="col-sm-8" style="padding-top: 40px; background: #F5F5F5;">
			
				<form action="<c:url value='/project/projectputin' />" method="post" name="projectRegisterForm">
			
				<div class="projectReg">
					<div>
						<p class="projectFont">프로젝트 이름 *</p>
					</div>
					<div>
						<input type="text" id="project-name" class="form-control" name="projectName"
							placeholder="프로젝트 이름을 입력하세요." style="width: 700px;" maxlength="50"><br>
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
                     시작일자: <input name="projectRequireDate1" id="project-require-date1" type="date" class="form-control"
                        placeholder="0000/00/00">
                        <span id="span-date1"></span>                
                     </div>
                     <div style="width:500px;">
                     종료일자: <input
                        name="projectRequireDate2" id="project-require-date2" type="date" class="form-control"
                        placeholder="0000/00/00">
                        <span id="span-date2"></span>
						</div>
					</div>

				</div>

				<div class="projectReg">
					<div>
						<p class="projectFont">협력사</p>
					</div>
					<div>
						<input type="hidden" value="${company.companyNO}" name="companyNO">
						<input class="form-control" type="text" 
							value="${company.companyName}" style="width: 300px;" disabled>
					</div>
				</div>
				<div class="projectReg">
					<div>
						<p class="projectFont">협력사 전화번호</p>
					</div>
					<div>
						<input class="form-control" type="text"
							value="${company.companyPhone1} - ${company.companyPhone2} - ${company.companyPhone3}" style="width: 200px;" disabled>
					</div>
				</div>
				<div class="projectReg">
					<div>
						<p class="projectFont">협력사 주소</p>
					</div>
					<div>
						<div>
							<input class="form-control" type="text" maxlength="20"
								value="${company.companyAddress1}" style="width: 300px;" disabled>
						</div>
						<div>
							<input class="form-control" type="text" maxlength="20"
								value="${company.companyAddress2}" style="width: 300px;" disabled>
						</div>
						<div>
							<input class="form-control" type="text" maxlength="20"
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
							placeholder="프로젝트 설명을 간략하게 입력하세요." style="resize: none;" maxlength="4000"></textarea>
							<span id="span-desc"></span>
					</div>
				</div>
				<div class="projectReg">
					<div>
						<p class="projectFont">담당자 이름 *</p>
					</div>
					<div>
						<input type="text" class="form-control" id="project-manager" name="projectManager"
							placeholder="담당자 이름을 입력하세요." style="width: 300px;" maxlength="10"><br>
							<span id="span-manager"></span>
					</div>
				</div>
				<div class="projectReg">
					<div>
						<p class="projectFont">담당자 전화번호 *</p>
					</div>
					<div>
						<input type="text" class="form-control" id="project-mg-phone" name="projectManagerPhone"
							placeholder="전화번호를 입력하세요." style="width: 300px;"  maxlength="11"><br>
							<span id="span-phone"></span>
					</div>
				</div>
				<div class="projectReg">
					<div>
						<p class="projectFont">담당자 이메일 *</p>
					</div>
					<div>
						<input type="text" class="form-control" id="project-mg-email" name="projectManagerEmail" placeholder="담당자 이메일을 입력해주세요." style="width: 230px;"  maxlength="20"><br> <span id="span-email"></span> 
					</div>
				</div>
				<div class="projectReg">
					<div>
						<p class="projectFont">지원자격 *</p>
					</div>
					<div>
						<textarea class="form-control" rows="5" id="project-license" name="projectRequireLicense"
							placeholder="지원자격을 간략하게 입력하세요." style="resize: none;" maxlength="1000"></textarea>
							<span id="span-license"></span>
					</div>
				</div>
				<div class="projectReg">
					<div>
						<p class="projectFont">모집역할 *</p>
					</div>
					<div>
						<input type="text" class="form-control" id="project-role" name="projectRequireRole"
							placeholder="모집하는 역할을 간단하게 입력하세요." style="width: 700px;" maxlength="200"><br>
							<span id="span-role"></span>
					</div>
				</div>
				<div class="projectReg">
					<div>
						<p class="projectFont">모집인원 *</p>
					</div>
					<div>
						<input type="text" class="form-control" id="project-people" name="projectRequirePeople"
							placeholder="모집 인원을 입력하세요." style="width: 700px;" maxlength="5"><br>
							<span id="span-people"></span>
					</div>
				</div>
				
				</form>

				<div class="projectReg">
					<div>
						<p class="projectFont">기업 소개 배너</p>
					</div>
					<div>
						<img src="${pageContext.request.contextPath}/resources/img/gray.png" alt="comlogo" id="img-project" style="width: 750px; height: 320px; margin-bottom: 10px;">
					</div>
					<div class="form-group" style="margin-bottom: 50px;">
						<input type="file" id="project-image" class="file-upload">
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
		
		</section>
		<%@ include file="../include/footer.jsp"%>
		
		</div>
	
</body>
</html>


<script>

//프로젝트 사진 파일 미리보기 자바스크립트 함수
function readURL(input) {
	if (input.files && input.files[0]) {
		
    	var reader = new FileReader(); //비동기처리를 위한 파일을 읽는 자바스크립트 객체
    	
    	//readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
    	reader.readAsDataURL(input.files[0]); 
    	
    	reader.onload = function(e) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
        	$('#img-project').attr("src", e.target.result); 
        	console.log(event.target)//event.target은 이벤트로 선택된 요소를 의미
    	}
	} else {
		$('#img-project').attr("src", '${pageContext.request.contextPath}/resources/img/gray.png');
	}
}

$(function() {
	
	// 프로젝트 사진 파일 선택 시 미리보기 기능
	$('#project-image').change(function () {
		readURL(this);
	});
	
	
	$('#go-back-btn').click(function() {
		location.href='<c:url value="/project/projectadmin" />';
	})
	
	
	$('#project-putin').click(function() {
		
		if(confirm('프로젝트를 등록 하시겠습니까?')) {
			
			// 이름 입력 여부 체크
			if($('#project-name').val() == '') {
						alert('이름을 입력해주세요.');
						$('#span-name').text('프로젝트 이름을 입력해주세요.');
						$('#span-name').css('color', 'red');
						
						$('#project-name').focus();
						return;
					}
			

			// 프로젝트 기간1 입력 여부 체크
	         if($('#project-require-date1').val() == '') {
	                  alert('기간을 입력해주세요.');
	                  $('#span-date1').text('프로젝트 기간을 입력해주세요.');
	                  $('#span-date1').css('color', 'red');
	                  
	                  $('#project-require-date1').focus();
	                  return;
	               }
	         
	         // 프로젝트 기간2 입력 여부 체크
	         if($('#project-require-date2').val() == '') {
	                  alert('기간을 입력해주세요.');
	                  $('#span-date2').text('프로젝트 기간을 입력해주세요.');
	                  $('#span-date2').css('color', 'red');
	                  
	                  $('#project-require-date2').focus();
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
				$('#span-people').text('모집인원을 입력해주세요.');
				$('#span-people').css('color', 'red');
				
				$('#project-people').focus();
				return;
			}
			
			// 자바스크립트의 파일 확장자 체크 검색 (문서 파일만 받을 수 있도록)
			let image = $('#project-image').val();
			
			// . 을 제거한 확장자만 얻어낸 후 그것을 소문자로 일괄 변경 후 비교한다.
			// +1을 한 것은 점 바로 이후 문자부터 잘라서 추출하기 위해
			image = image.slice(image.indexOf('.') + 1).toLowerCase();
			
			if(image !== 'png' && image !== 'jpg' && image !== 'jpeg' && image !== 'bmp') {
				alert('이미지 파일 형식만 등록이 가능합니다.');
				$('#image').val('');
				return;
			}
			
			// 자바스크립트의 파일 크기 체크 (5MB 이내의 크기만 첨부할 수 있도록)
			if($('#project-image').val() != '') {
				let maxResumeSize = 5 * 1024 * 1024;		// 5MB
				let resumeSize = $('#project-image')[0].files[0].size;
				
				if(resumeSize > maxResumeSize) {
					alert("이력서 첨부파일은 5MB 이내로 첨부가 가능합니다.");
					$('#image').val('');
					return;
				}
			}
			
			
			document.projectRegisterForm.submit();
			
			// 프로젝트 다음번호 얻어오기
			$.ajax({
				type: 'POST',
				url: '<c:url value="/project/projectNOGet" />',
				contentType: false,
				processData: false,
				
				success: function(projectNO) {
					// 가상 Form을 생성한다.
					const formData = new FormData();
				
					const data = $('#project-image');
					
					// 가상 Form에 받은 파일을 projectImage이라는 이름으로 넣는다.
					formData.append('projectImage', data[0].files[0]);
					
					// 프로젝트 사진 파일을 등록하는 projectImage를 비동기로 처리
					$.ajax({
						type: 'POST',
						url: '<c:url value="/project/projectImage/" />' + projectNO,
						contentType: false,
						processData: false,
						
						data: formData,
						
						success: function(result) {
							if(result == 'YesImage') {
								console.log('프로젝트 사진 등록 성공');
							} else {
								alert('프로젝트 사진 등록 중 오류가 발생했습니다.');
								return;
							}
						},
						
						error: function() {
							alert('프로젝트 사진 등록 중 서버오류가 발생했습니다.');
							return;
						}
					});		
				},
				
				error: function() {
					alert("프로젝트 번호를 얻어오는 중 서버오류가 발생했습니다.");
					return;
				}
			});		
			
		}	
		});
	
});


	

	

	
</script>
