<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
   
   </style>
   
</head>
<body>

<%@ include file="../include/header.jsp" %>
  
	<div class="mainbox">
  
		<div class="sections">
   
			<div class="list-group-item active notice-list-top" style="margin-top: 20px; border-radius: 0;"> 
			
				<div style="clear: both;">
					<span class="main-board-title" style="color: #909090; font-size: 14px;">${projectInfo.companyName}</span>
			      	
					<span class=" main-board-title pull-right" style="font-size: 14px; font-weight: 500; color: green;">현재 모집 중</span>
				</div>
				
				<div style="clear: both; margin-top: 6px;">
					<span class="main-board-title" style="color: #2B2B2B; font-size: 20px; margin-top: 10px; font-family: sans-serif;">${projectInfo.projectName}</span>
				</div>
				
			</div>
			
			<form action="<c:url value='/project/projectapply' />" method="post" name="projectApplyForm">
			
				<div class="project-apply-main" style="padding: 15px;">
				
					<input type="hidden" name="projectNO" value="${projectInfo.projectNO}">
					<input type="hidden" name="userNO" value="${user.userNO}">
			
					<div class="form-group">
						<label>지원자 이름</label>
						<input type="text" class="form-control" value="${user.userName}" readonly style="width: 40%;">
					</div>
					
					<div class="form-group">
						<label>지원자 이메일</label>
						<input type="text" class="form-control" value="${user.userEmail1}@${user.userEmail2}" readonly style="width: 40%;">
					</div>
					
					<div class="form-group">
						<label>지원자 전화번호</label>
						<input type="text" class="form-control" value="${user.userPhone1} - ${user.userPhone2} - ${user.userPhone3}" readonly style="width: 40%;">
					</div>
					
					<div class="form-group">
						<label>담당자에게 전할 메세지</label>
						<textarea name="applyMsg" class="form-control" rows="5" style="width: 50%; resize: none;"></textarea>
					</div>
					
					<div class="form-group">
						<label>등록된 이력서</label>
						
						<c:if test="${resumeRealname == null}">
							<span id="btn-user-profile-modify" style="font-size: 10px; margin-left: 280px; cursor: pointer; text-decoration: underline; color: #00036A;"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 이력서 등록하러 가기</span>
							<p id="btn-user-mypage-resume-no" style="font-family: sans-serif; width: max-content;">등록한 이력서가 없습니다.</p>
						</c:if>
												
						<c:if test="${resumeRealname != null}">
							<span id="btn-user-profile-modify" style="font-size: 10px; margin-left: 280px; cursor: pointer; text-decoration: underline; color: #00036A;"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>이력서 수정하러 가기</span>
							<p id="btn-user-mypage-resume" style="text-decoration: underline; color: blue; cursor: pointer; margin-left: 4px; width: max-content;"><a class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></a> ${resumeRealname}</p>
						</c:if>				
					</div>
					
				</div>
				
				<div class="project-apply-footer" style="padding: 15px; display: block;">
					<div class="form-group pull-left">
						<label style="font-size: 10px; font-weight: 500; color: #8C8C8C;">
							<input type="checkbox" value="">
							개인정보 제공 동의
						</label>
					</div>
				
					<div class="form-group pull-right">
						<button type="button" id="btn-apply" class="btn btn-success" style="height: 30px; font-size: 12px;">지원하기</button>
	                	<button type="button" id="chwiso-btn" onclick="history.back();" class="btn" style="height: 30px; font-size: 12px;">취소</button>
					</div>
				</div>
	    
			</div>
			
		</form>
			
 
	<%@ include file="../include/footer.jsp" %>
	
	</div>

</body>

</html>
<script>

	$(function() {
		
		// 이력서 파일 클릭 시 이력서 다운로드
		$('#btn-user-mypage-resume').click(function() {
			
			const userNO = '${user.userNO}';
			
			location.href="<c:url value='/user/userResume/download?userNO=' />" + userNO;
		});
		
		
		// 이력서 수정하기 버튼 또는 이력서 등록하기 버튼 클릭 시 내 정보 수정 페이지로 이동
		$('#btn-user-profile-modify').click(function() {
			location.href="<c:url value='/usermypage/usermypagemod' />";
		});
		
		
		// 지원하기 버튼 클릭 시
		$('#btn-apply').click(function() {
			
			if(confirm('해당 프로젝트에 지원하시겠습니까?')) {
					
				const resumeCheck = '${resumeRealname}';
				
				if(resumeCheck == '') {
					alert('등록된 이력서가 없습니다. 이력서를 먼저 등록해주세요.');
					location.href="<c:url value='/usermypage/usermypagemod' />";
					return;
				}
				
				$('#btn-apply').attr('disabled', true);
				
				document.projectApplyForm.submit();
				
			} else {
				return false;
			}
		});
		
	});

</script> 