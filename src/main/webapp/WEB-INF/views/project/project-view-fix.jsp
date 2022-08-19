<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>

   <meta charset="UTF-8">

   <title>나뭇잎 홈페이지</title>
   
   <!-- jQuery -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   
   <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
   
   <!-- 합쳐지고 최소화된 최신 CSS -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">

   <!-- 개인 디자인 추가, ?after를 붙이면 기존에 동일한 이름의 파일을 인식하는것이 아닌 새로운 파일을 인식하게 된다. -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainstyle.css">
   
   <!-- 여기다가 나만의 새로운 css 만들기 -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/project-view-fix.css">

   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainpage-style.css">
  
  
  <style type="text/css">
  
  
  </style>


</head>
<body>

<%@ include file="../include/header.jsp" %>
	   
	   
<div class="container">
  
  <div id="main-box">
   
   
    <div class="first-box">
      <p>(주) 성진하이텍</p>
    </div> <br>
    <div class="container-top-icons">
      <div class="project-name">
      	<input type="text" value="${projectview.projectName}" name="projectName">
      </div>
      <div class="project-user">
        <p>신청자 : 3명 </p>
      </div>
      <div class="project-heart">
      <input type="hidden" value=""${projectLike.projectLikeNO} name="projectLikeNO">
       <a href="##"><i class="glyphicon glyphicon-thumbs-up"></i>좋아요</a>
      </div>
      <div class="project-seen">
        <p>조회수 : 12</p>
      </div>
      <div class="project-jiwon">
        <label>
          <input type="checkbox"> <i style="color: red;">마감 임박</i>
        </label>
        <label>
          <input type="checkbox"> <i style="color: green;">현재 모집중</i>
        </label>
      </div>
    </div>
  </div>
  
  <form action="<c:url value='/project/projectviewfix'/>"  method="post" name="projectUpdateForm">
  
  <div class="project-img-box">
    <div class="image-intro"> 
      <img src="../resources/img/main4.jpg" alt="사진">
      </div> <br>
      <div class="project-myeng">
        	프로젝트 명
        <input type="hidden" value="${projectview.projectNO}" id="hidden-project-no" name="projectNO">
      </div>
      <div class="project-myeng1">
        <p><input type="text" id="project-myeng1" value="${projectview.projectName}" name="projectName" style="width: 335px;"></p>
      </div>
      <div class="project-dt">
     		프로젝트 기간
      </div>
      <div class="project-dt1">
       <label for="exampleInputdate"></label>
                <input type="date" class="form-control" id="project-date1" placeholder="0000/00/00" style="height: 21px; padding-bottom: 5px;">
              <div class="date12">
                ~
              </div>
                <input type="date" class="form-control" id="project-date2" placeholder="0000/00/00" style="height: 21px; padding-bottom: 5px;">
      	<!--<c:set var="date1" value="${projectview.projectRequireDate1}" />
      	<c:set var="date2" value="${projectview.projectRequireDate2}" />
        <p>${fn:substring(date1, 0, 10)} ~ ${fn:substring(date2, 0, 10)}</p>-->
      </div>
      <div class="project-friend">
       		협력사 
      </div>
      <div class="project-friend1">
        <p>${projectview.companyName}</p> 
      </div>
      <div class="project-phone">
       		협력사 전화번호 
      </div>
      <div class="project-phone1">
        <p>${projectview.companyPhone1} - ${projectview.companyPhone2} - ${projectview.companyPhone3}</p> 
      </div>
      <div class="project-fr-lo">
        	협력사 위치 
      </div>
      <div class="project-fr-lo1">
        <p>${projectview.companyAddress1} ${projectview.companyAddress2} ${projectview.companyAddress3}</p> 
      </div>
      <div class="project-container-right">
      <a href="project-map.html" onclick="window.open(this.href, '_blank', 'width=600px, height=400px,toolbars=no,scrollbars=no'); return false;">
        <button type="button" class="btn btn-primary">
          	지도
          </button>
          </a>
        
      </div> <br>
      
      
      
      <div class="project-int">
        	프로젝트 설명 
      </div>
      <div class="project-int1">
       <p><input type="text" id="project-int1" value="${projectview.projectDesc}" name="projectDesc" style="width: 750px; height: 240px;">
        </p>
      </div>
        <div class="damdang-master">
          <div class="damdang">
           	담당자 
          </div>
          <div class="damdang1">
            <p><input type="text" id="damdang1" value="${projectview.projectManager}" name="projectManager" style="width: 335px;"></p> 
          </div>
          <div class="damdang-phone">
           	담당자 번호 
          </div>
          <div class="damdang-phone1">
           <p><input type="text" id="damdang-phone1" value="${projectview.projectManagerPhone}" name="projectManagerPhone" style="width: 335px;"></p> 
          </div>
      </div>
      <div class="damdang-email">
        	담당자 이메일 
      </div>
      <div class="damdang-email1">
        <p><input type="text" id="damdang-email1" value="${projectview.projectManagerEmail}" name="projectManagerEmail" style="width: 750px;"></p> 
      </div>
      <div class="skills">
        	지원 자격
      </div>
      <div class="skills1">
        <p>
          <input type="text" id="skills1" value="${projectview.projectRequireLicense}" name="projectRequireLicense" style="width: 750px; height: 78px;">
        </p>
      </div>
      <div class="mojib-master">
        <div class="mojib">
          	모집 역할
        </div>
        <div class="mojib1">
         <p><input type="text" id="mojib1" value="${projectview.projectRequireRole}" name="projectRequireRole" style="width: 335px;"></p> 
        </div>
        <div class="mojib-user">
          	모집 인원
        </div>
        <div class="mojib-user1">
          <p>
            <input type="text" id="mojib-user1" value="${projectview.projectRequirePeople}" name="projectRequirePeople" style="width: 335px;">
          </p>
        </div>
      </div> <br>
      <div class="below-but">
      <div class="singo">
        <a href="#" id="singo-modal">신고하기</a>
      </div>
      <div class="project-container-bottom">
        <button type="button" id="btn-project-content-update" class="btn btn-success" value="수정완료">수정하기</button>
        <button type="button" id="mokrok-btn" class="btn btn-danger">돌아가기</button>
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
	
	
	$('#mokrok-btn').click(function() {
		location.href='<c:url value="/project/projectadmin" />';
	});
	
	
	
	//수정완료 버튼 클릭 시 
	$('#btn-project-content-update').click(function() {
			
			// 이름 입력 여부 체크
			if($('#project-myeng1').val() == '') {
				alert('이름을 입력해주세요.');				
				$('#project-myeng1').focus();
				return;
			}
			
			//프로젝트 기간 입력 여부 체크
			if($('#project-date1').val() == '') {
				alert('날짜를 입력해주세요.');				
				$('#project-date1').focus();
				return;
			}
			
			//프로젝트 기간 입력 여부 체크
			if($('#project-date2').val() == '') {
				alert('날짜를 입력해주세요.');				
				$('#project-date2').focus();
				return;
			}

			//프로젝트 설명 입력 여부 체크
			if($('#project-int1').val() == '') {
				alert('설명을 입력해주세요.');				
				$('#project-int1').focus();
				return;
			}

			//프로젝트 담당자이름 입력 여부 체크
			if($('#damdang1').val() == '') {
				alert('담당자 이름을 입력해주세요.');				
				$('#damdang1').focus();
				return;
			}

			//프로젝트 전화번호 입력 여부 체크
			if($('#damdang-phone1').val() == '') {
				alert('날짜를 입력해주세요.');				
				$('#damdang-phone1').focus();
				return;
			}

			//프로젝트 이메일 입력 여부 체크
			if($('#damdang-email1').val() == '') {
				alert('날짜를 입력해주세요.');				
				$('#damdang-email1').focus();
				return;
			}
			
			
			
			document.projectUpdateForm.submit();
			
	});
});





</script> 
                 






