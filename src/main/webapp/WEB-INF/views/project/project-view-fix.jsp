<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>

<html>
<head>

   <meta charset="UTF-8">

   <title>RunWith</title>
   
   <!-- jQuery -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   
   <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
   
   <!-- 합쳐지고 최소화된 최신 CSS -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">

   <!-- 개인 디자인 추가, ?after를 붙이면 기존에 동일한 이름의 파일을 인식하는것이 아닌 새로운 파일을 인식하게 된다. -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainstyle.css">
   
   <!-- 여기다가 나만의 새로운 css 만들기 -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainpage-style.css">
  
  
  <style>
  
  	.sections {
   			width: 1000px;
   			margin: 0 auto;
   	}
   	
   	img[src$=".jpg"], img[src$=".png"] {
	image-rendering: -moz-crisp-edges; /* Firefox */
	image-rendering: -o-crisp-edges; /* Opera */
	image-rendering: -webkit-optimize-contrast;/* Webkit (non-standard naming) */
	image-rendering: crisp-edges;
	-ms-interpolation-mode: nearest-neighbor; /* IE (non-standard property) */
	}
   	
  </style>


</head>
<body>

<%@ include file="../include/header.jsp" %>
  
	<div class="mainbox">
  
		<div class="sections">
   
			<div class="list-group-item active notice-list-top" style="margin-top: 20px; border-radius: 0;"> 
			
				<div style="clear: both;">
					<span class="main-board-title" style="color: #909090; font-size: 14px;">${projectview.companyName}</span>
					
					<c:choose>
			      	
			      		<c:when test="${apply.commonCODE == 'SPT001'}">
			      			<button type="button" id="btn-apply-spt001" class="btn pull-right" style="background: #4F5199; color: white; margin-top: -8px;">지원 취소</button>
			      		</c:when>
			      	
			      		<c:when test="${apply.commonCODE == 'SPT002'}">
			      			<button type="button" id="btn-apply-spt002" class="btn pull-right" disabled style="background: #74733D; color: white; margin-top: -8px;">심사 진행 중</button>
			      		</c:when>
			      		
			      		<c:when test="${apply.commonCODE == 'SPT003'}">
			      			<button type="button" id="btn-apply-spt003" class="btn pull-right" disabled style="background: #585BCD; color: white; margin-top: -8px;">최종합격 검토 중</button>
			      		</c:when>
			      		
			      		<c:when test="${apply.commonCODE == 'SPT004'}">
			      			<button type="button" id="btn-apply-spt004" class="btn pull-right" disabled style="background: #0095AA; color: white; margin-top: -8px;">참여중</button>
			      		</c:when>
			      		
			      		<c:when test="${apply.commonCODE == 'SPT005'}">
			      			<button type="button" id="btn-apply-spt005" class="btn pull-right" disabled style="background: #c7c7c7; margin-top: -8px;">불합격</button>
			      		</c:when>
			      		
			      		<%--<c:when test="${companyNO != null}">
			      			<button type="button" id="jiwon-btn1" class="btn pull-right btn-success" style="margin-top: -8px;" disabled>지원하기</button>
			      		</c:when>
			      		
			      		<c:otherwise>
			      			<button type="button" id="jiwon-btn1" class="btn pull-right btn-success" style="margin-top: -8px;">지원하기</button>
			      		</c:otherwise> --%>
			      	
			      	</c:choose>
			      	
			      	<c:choose>
			      	
			      		<c:when test="${projectview.commonCODE == 'PST001'}">
			      			<span class="main-board-title pull-right" style="font-size: 14px; font-weight: 500; margin-right: 60px; color: green;">${projectview.commonValue}</span>
			      		</c:when>
			      		
			      		<c:when test="${projectview.commonCODE == 'PST002'}">
			      			<span class="main-board-title pull-right" style="font-size: 14px; font-weight: 500; margin-right: 60px; color: #970000;">${projectview.commonValue}</span>
			      		</c:when>
			      		
			      		<c:when test="${projectview.commonCODE == 'PST003'}">
			      			<span class="main-board-title pull-right" style="font-size: 14px; font-weight: 500; margin-right: 60px; color: #808080;">${projectview.commonValue}</span>
			      		</c:when>
			      	
			      	</c:choose>

				</div>
				
				<div style="clear: both;">
					<span class="main-board-title" style="color: #2B2B2B; font-size: 20px; margin-top: 10px; font-family: sans-serif;">${projectview.projectName}</span>
					<span class="pull-right" style="margin-top: 14px; font-size: 11px; color: #A0A0A0;">조회수 : ${projectview.projectViews}</span>
					<span class="pull-right" style="margin-top: 14px; font-size: 11px; color: red; margin-right: 40px;"><img alt="하트" width="16px" src="${pageContext.request.contextPath}/resources/img/like1.png"> 좋아요 3</span>
				</div>
				
			</div>
			
			
			<div class="project-view-main">
				
				<input type="hidden" value="${projectview.projectNO}" id="hidden-projectNO" name="projectNO">
				<input type="hidden" value="${user.userNO}" id="hidden-userNO" name="userNO">

				<div class="project-image-box">
					<div style="margin-bottom:-10px; border: 1px solid black; display: inline-block; background-color: #EBF3ED;">
						<input type="file" id="file-mypage-logo" style="display: none;">
							<button type="button" class="btn btn-link" id="btn-project-profile">
								<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 프로젝트사진 수정
							</button>
					</div>
					
					<img id="img-mypage-logo" src="<c:url value='/project/projectImageGet?projectNO=${projectview.projectNO}' />" alt="사진" width="1000px" height="500px" style="margin-top: 10px; object-fit: fill;">
					
				</div>
				
				<form action="<c:url value='/project/updateProjectContent' />" method="post" name="projectUpdateForm">
					<input type="hidden" value="${projectview.projectNO}" id="hidden-project-no" name="projectNO">
					<input type="hidden" value="${user.userNO}" id="hidden-user-no" name="userNO">
				
				
				<table class="table table-bordered" style="margin-top: 10px; font-size: 14px; font-family: sans-serif; border-collapse: unset; border-spacing: 0;">
					<tr>
						<td style="width: 12%; text-align: center; font-weight: 700; background: #EBF3ED;">프로젝트 명</td>
						<td style="width: 38%; background-color: #EEEEEE;">${projectview.projectName}</td>
						<td style="width: 12%; text-align: center; font-weight: 700; background: #EBF3ED;">프로젝트 기간</td>
						<td style="width: 38%; background-color: #EEEEEE;">
							<c:set var="date1" value="${projectview.projectRequireDate1}" />
				      		<c:set var="date2" value="${projectview.projectRequireDate2}" />
				        	${fn:substring(date1, 0, 10)} &nbsp; ~ &nbsp; ${fn:substring(date2, 0, 10)}
				        </td>
					</tr>
					<tr>
						<td style="width: 13%; text-align: center; font-weight: 700; background: #EBF3ED;">협력사</td>
						<td style="width: 37%; background-color: #EEEEEE;">${projectview.companyName}</td>
						<td style="width: 13%; text-align: center; font-weight: 700; background: #EBF3ED;">협력사 전화번호</td>
						<td style="width: 37%; background-color: #EEEEEE;">${projectview.companyPhone1} - ${projectview.companyPhone2} - ${projectview.companyPhone3}</td>
					</tr>
					<tr>
						<td style="width: 13%; text-align: center; font-weight: 700; background: #EBF3ED;">협력사 위치</td>
						<td colspan="3" style="width: 85%; background-color: #EEEEEE;">
							<input type="hidden" value="${projectview.companyAddress1}" id="address-no">
							${projectview.companyAddress2} ${projectview.companyAddress3}
							
				      		<a href="project-map.html" onclick="window.open(this.href, '_blank', 'width=600px, height=400px,toolbars=no,scrollbars=no'); return false;">
				        		<button type="button" class="btn btn-primary pull-right" style="display: inline; margin-top: -8px; margin-bottom: -8px; margin-right: -8px; height: 37px; width: 120px; border-radius: 0;">지도</button>
				         	</a>
						</td>
					</tr>
					<tr>
						<td style="width: 13%; text-align: center; font-weight: 700; background: #EBF3ED;">프로젝트 설명</td>
						<td colspan="3" style="width: 85%; height: 340px;">
							<!-- <input type="text" style="width: 100%; height: 100%;" name="projectDesc" value="${projectview.projectDesc}"/>  -->
							<textarea style="width: 100%; height: 100%; resize: none;" id="project-desc-update" name="projectDesc">${projectview.projectDesc}</textarea>
						</td>
					</tr>
					<tr>
						<td style="width: 13%; text-align: center; font-weight: 700; background: #EBF3ED;">담당자</td>
						<td style="width: 37%;"><input type="text" value="${projectview.projectManager}" id="project-manager-update" name="projectManager" style="width: 100%;"/></td>
						<td style="width: 13%; text-align: center; font-weight: 700; background: #EBF3ED;">담당자 전화번호</td>
						<td style="width: 37%;"><input type="text" value="${projectview.projectManagerPhone}" id="project-manager-phone-update" name="projectManagerPhone" style="width: 100%;"/></td>
					</tr>
					<tr>
						<td style="width: 13%; text-align: center; font-weight: 700; background: #EBF3ED;">담당자 이메일</td>
						<td colspan="3" style="width: 85%;"><input type="text" value="${projectview.projectManagerEmail}" id="project-manager-email-update" name="projectManagerEmail" style="width: 50%;"/></td>
					</tr>
					<tr>
						<td style="width: 13%; text-align: center; font-weight: 700; background: #EBF3ED;">지원 자격</td>
						<td colspan="3" style="width: 85%; height: 120px; background-color: #EEEEEE;">
							<c:set var="License" value="${projectview.projectRequireLicense}" />
				       		${fn:replace(License, replaceChar, "<br/>")}
						</td>
					</tr>
					<tr>
						<td style="width: 13%; text-align: center; font-weight: 700; background: #EBF3ED;">모집 역할</td>
						<td style="width: 37%; background-color: #EEEEEE;">${projectview.projectRequireRole}</td>
						<td style="width: 13%; text-align: center; font-weight: 700; background: #EBF3ED;">모집 인원</td>
						<td style="width: 37%;"><input type="text" style="width:100%;" value="${projectview.projectRequirePeople}" id="project-require-people-update" name="projectRequirePeople"/></td>
					</tr>
				</table>
			</form>
			</div>
			
			
			<div class="project-view-footer">
				<div class="singo" style="display: inline; font-size: 12px; line-height: 2.6em;">
				    <a href="#" id="singo-modal" style="color: #808080;">신고하기</a>
				</div>
			
				<div class="pull-right">
				
					<c:choose>
			      	
			      		<c:when test="${apply.commonCODE == 'SPT001'}">
			      			<button type="button" id="btn-apply-spt001-2" class="btn" style="background: #4F5199; color: white;">지원 취소</button>
			      		</c:when>
			      	
			      		<c:when test="${apply.commonCODE == 'SPT002'}">
			      			<button type="button" id="btn-apply-spt002-2" class="btn" disabled style="background: #74733D; color: white;">심사 진행 중</button>
			      		</c:when>
			      		
			      		<c:when test="${apply.commonCODE == 'SPT003'}">
			      			<button type="button" id="btn-apply-spt003-2" class="btn" disabled style="background: #585BCD; color: white;">최종합격 검토 중</button>
			      		</c:when>
			      		
			      		<c:when test="${apply.commonCODE == 'SPT004'}">
			      			<button type="button" id="btn-apply-spt004-2" class="btn" disabled style="background: #0095AA; color: white;">참여중</button>
			      		</c:when>
			      		
			      		<c:when test="${apply.commonCODE == 'SPT005'}">
			      			<button type="button" id="btn-apply-spt005-2" class="btn" disabled style="background: #c7c7c7;">불합격</button>
			      		</c:when>
			      		
			      		<c:when test="${companyNO != null}">
			      			<button type="button" id="jiwon-btn" class="btn btn-success" disabled>지원하기</button>
			      		</c:when>
			      		
			      		<c:otherwise>
			      			<button type="button" id="btn-project-content-update" class="btn btn-success">수정하기</button>
			      		</c:otherwise>
			      	
			      	</c:choose>
				
					<button type="button" id="mokrok-btn" class="btn btn-danger">돌아가기</button>
				</div>
			</div>
    
		</div>
 
	<%@ include file="../include/footer.jsp" %>
	
	</div>

</body>
</html>
<script>

	//특정 메시지 표현을 위한 스크립트
	const msg = '${msg}';
	
	if(msg != '') {
		alert(msg);
	}
	//로고사진 미리보기 자바스크립트 함수
	function readURL(input) {
		if (input.files && input.files[0]) {
			
	    	var reader = new FileReader(); //비동기처리를 위한 파일을 읽는 자바스크립트 객체
	    	
	    	//readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
	    	reader.readAsDataURL(input.files[0]); 
	    	
	    	reader.onload = function(e) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
	        	$('#img-mypage-logo').attr("src", e.target.result); 
	        	console.log(event.target) //event.target은 이벤트로 선택된 요소를 의미
	    	}
		}
	}
	
	$(function() {
			
		// 프로필 사진 수정 버튼을 누르면 파일 요소를 클릭한 것으로 인식
		$('#btn-project-profile').click(function() {
			$('#file-mypage-logo').click();
		});
		
		
		// 파일 요소가 변경되면 기존에 있던 프로필사진을 바꿀 사진 미리보기로 교체한다.
		$('#file-mypage-logo').change(function() {
			readURL(this);
		});
		
			
			//돌아가기 버튼 클릭 시
			$('#mokrok-btn').click(function() {
				location.href='<c:url value="/project/projectadmin" />';
			});
			
			
			
			//수정완료 버튼 클릭 시 
			$('#btn-project-content-update').click(function() {

					//프로젝트 설명 입력 여부 체크
					if($('#project-desc-update').val() == '') {
						alert('설명을 입력해주세요.');				
						$('#project-desc-update').focus();
						return;
					}

					//프로젝트 담당자이름 입력 여부 체크
					if($('#project-manager-update').val() == '') {
						alert('담당자 이름을 입력해주세요.');				
						$('#project-manager-update').focus();
						return;
					}

					//프로젝트 전화번호 입력 여부 체크
					if($('#project-manager-phone-update').val() == '') {
						alert('담당자 전화번호를 입력해주세요.');				
						$('#project-manager-phone-update').focus();
						return;
					}

					//프로젝트 이메일 입력 여부 체크
					if($('#project-manager-email-update').val() == '') {
						alert('담당자 이메일을 입력해주세요.');				
						$('#project-manager-email-update').focus();
						return;
					}
					
					//프로젝트 모집인원수 입력 여부 체크
					if($('#project-require-people').val() == '') {
						alert('프로젝트 모집인원을 입력해주세요.');				
						$('#project-require-people').focus();
						return;
					}
					
					// 자바스크립트의 파일 확장자 체크 검색 (이미지 파일만 받을 수 있도록)
					let image = $('#file-mypage-logo').val();
					
					// . 을 제거한 확장자만 얻어낸 후 그것을 소문자로 일괄 변경 후 비교한다.
					// +1을 한 것은 점 바로 이후 문자부터 잘라서 추출하기 위해
					image = image.slice(image.indexOf('.') + 1).toLowerCase();
					
					if(image !== 'jpg' && image !== 'png' && image !== 'jpeg' && image !== 'bmp' && image !== '') {
						alert('이미지 파일 형식만 등록이 가능합니다.');
						$('#file-mypage-logo').val('');
						$('#img-mypage-logo').attr('src', '<c:url value="/project/projectImageGet?projectNO=${projectview.projectNO}" />');
						return;
					}
					
					
					// 자바스크립트의 파일 크기 체크 (5MB 이내의 크기만 첨부할 수 있도록)
					<%--if($('#file-mypage-logo').val() != '') {
						let maxLogoSize = 5 * 1024 * 1024;		// 5MB
						let logoSize = $('#file-mypage-logo')[0].files[0].size;
						
						if(logoSize > maxLogoSize) {
							alert("로고사진 첨부파일은 5MB 이내로 첨부가 가능합니다.");
							$('#file-mypage-logo').val('');
							$('#img-mypage-logo').attr('src', '<c:url value="/project/projectImageGet?projectNO=${projectview.projectNO}" />');
							return;
						}
					}--%>
					
					// 자바스크립트의 파일 크기 체크 (5MB 이내의 크기만 첨부할 수 있도록)
					if($('#file-mypage-logo').val() != '') {
						let maxImageSize = 5 * 1024 * 1024;		// 5MB
						let ImageSize = $('#file-mypage-logo')[0].files[0].size;
						
						if(ImageSize > maxImageSize) {
							alert("프로젝트 사진 첨부파일은 5MB 이내로 첨부가 가능합니다.");
							$('#image').val('');
							return;
						}
					}
					
					// 기업회원 번호와 로고사진을 새로 등록했는지 확인하기 위해 값을 가져온다.
					const projectNO = $('#hidden-projectNO').val();
					const ImageCheck = $('#file-mypage-logo').val();
					
								// 사용자가 이미 올렸던 이력서 파일이 있었다면
								if(ImageCheck != '') {
									
									// 이미 올렸던 이력서 파일을 서버에서 삭제한 후에
									$.ajax({
										type: 'POST',
										url: '<c:url value="/project/projectImageDelete/" />' + projectNO,
										contentType: false,
										processData: false,
										
										success: function(result) {
											if(result == 'YesProjectImageDelete') {

												const formData = new FormData();
												
												const data = $('#file-mypage-logo');
												
												formData.append('newProjectImage', data[0].files[0]);
												
												// 수정창에서 업로드한 파일로 새로 적용한다.
												$.ajax({
													type: 'POST',
													url: '<c:url value="/project/projectImageUpdate/" />' + projectNO,
													contentType: false,
													processData: false,
													
													data: formData,
													
													success: function(result) {
														if(result == 'YesProjectImageUpdate') {
															console.log('프로젝트 사진 수정 성공');
															
															alert('성공적으로 프로젝트를 수정하였습니다.');
															
															// 이력서 수정이 완료되면 나머지 정보도 수정한다.
															document.projectUpdateForm.submit();
														} else {
															alert('자료실 파일 수정 중 오류가 발생했습니다.');
															return;
														}
													},
													
													error: function() {
														alert('프로젝트 사진 수정 중 서버오류가 발생했습니다.');
														return;
													}
												});
												
											} else {
												alert('프로젝트 사진 삭제 중 오류가 발생했습니다.');
												return;
											}
										},
										
										error: function() {
											alert('프로젝트 사진 삭제 중 서버오류가 발생했습니다.');
											return;
										}
									});
								} else {
									
									alert('성공적으로 프로젝트를 수정하였습니다.');
									
									// 아무 파일을 선택하지 않았다면 그냥 나머지 정보만 수정을 진행한다.
									document.projectUpdateForm.submit();
								
								}
			});
	});

</script> 
                 






 




