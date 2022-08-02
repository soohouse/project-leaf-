<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/project-view.css">

   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainpage-style.css">
  
   <link rel="stylesheet" href="./css/bootstrap-theme.css">


</head>
<body>

<%@ include file="include/header.jsp" %>
	   
	   
<div class="container">
  <div id="main-box">
    <div class="first-box">
      <p>(주) 성진하이텍</p>
    </div> <br>
    <div class="container-top-icons">
      <div class="project-name">
      <p>2022년 환경 푸르미 프로젝트 개발자 모집 </p>
      </div>
      <div class="project-user">
        <p>신청자 : 3명 </p>
      </div>
      <div class="project-heart">
        <a href="#"><span href="#" class="fa fa-heart"></a>3</span>
      </div>
      <div class="project-seen">
        <p>조회수 : 12</p>
      </div>
      <div class="project-jiwon">
        <button type="button" class="btn btn-success">지원하기</button>
      </div>
      <div class="mojibjung">
        <p>현재 모집중</p>
      </div>
    </div>
  </div>
  <div class="project-img-box">
    <div class="image-intro"> 
      <img src="resources/img/main4.jpg" alt="사진">
      </div> <br>
      <div class="project-myeng">
        프로젝트 명
      </div>
      <div class="project-myeng1">
        <p>2022년 환경 푸르미 프로젝트 개발자 모집</p>
      </div>
      <div class="project-dt">
        프로젝트 기간
      </div>
      <div class="project-dt1">
        <p>2022.07.10 ~ 2022.07.22</p>
      </div>
      <div class="project-friend">
       협력사 
      </div>
      <div class="project-friend1">
        <p>(주) 그린컴퍼니</p> 
      </div>
      <div class="project-phone">
       협력사 전화번호 
      </div>
      <div class="project-phone1">
        <p>02-000-0000</p> 
      </div>
      <div class="project-fr-lo">
        협력사 위치 
      </div>
      <div class="project-fr-lo1">
        <p>서울특별시 강남구 역삼동 649*5 에스코 빌딩 6층 그린컴퍼니 사무실</p> 
      </div>
      <div class="project-container-right">
        <button type="button" class="btn btn-primary" href="/project-map.html" onclick="window.open(this.href, '_blank', 'width=600px, height=400px,toolbars=no,scrollbars=no');">
          지도
          </button>
      </div> <br>
      
      
      
      <div class="project-int">
        프로젝트 설명 
      </div>
      <div class="project-int1">
       <p>2022년 환경 푸르미 프로젝트 개발자 모집 <br>

        최근 환경이 파괴되는 우리 지구를 위한 분리수거 및 다양한 친환경 방식을 제공하고,
        환경을 지키고 마일리지를 적립하여 소정의 상품을 제공할 수 있는 지구가 더 이상 아프지 않도록
        지구를 지킬 수 있도록 사용자들에게 제공하는 애플리케이션을 제작하는 프로젝트입니다. <br>

        맡으실 주요 업무는 안드로이드 환경에서 UI 설계 및 구현,
        서버/백엔드 로직 구현,
        Java 및 Android Studio를 이용한 애플리케이션 제작이 되겠습니다. <br>

        함께 환경을 보호하고 지구를 지키자는 분들은 망설임 없이 지원 바랍니다. <br>

        개발자분들의 많은 지원 바랍니다.
        </p>
      </div>
        <div class="damdang-master">
          <div class="damdang">
           담당자 
          </div>
          <div class="damdang1">
            <p>홍길동</p> 
          </div>
          <div class="damdang-phone">
           담당자 번호 
          </div>
          <div class="damdang-phone1">
           <p>010-0000-0000</p> 
          </div>
      </div>
      <div class="damdang-email">
        담당자 이메일 
      </div>
      <div class="damdang-email1">
        <p>hongkil123@gmail.com</p> 
      </div>
      <div class="skills">
        지원 자격
      </div>
      <div class="skills1">
        <p>
          경력 무관<br>
          학력 무관<br>
          프로젝트 경험이 있으신 분<br>
          안드로이드 환경을 자주 사용하신 분<br>
        </p>
      </div>
      <div class="mojib-master">
        <div class="mojib">
          모집 역할
        </div>
        <div class="mojib1">
         <p>안드로이드 애플리케이션 설계/ 제작</p> 
        </div>
        <div class="mojib-user">
          모집 인원
        </div>
        <div class="mojib-user1">
          <p>
            10명
          </p>
        </div>
      </div> <br>
      <div class="below-but">
      <div class="singo">
        <a href="#">신고하기</a>
      </div>
      <div class="project-container-bottom">
        <button type="button" id="jiwon-btn" class="btn btn-success">지원하기</button>
        <button type="button" id="mokrok-btn" class="btn btn-primary">목록</button>
      </div>
      </div>
    </div>

    
    
    
 
	<%@ include file="include/footer.jsp" %>
</div>


</body>
</html>
<script>


</script> 
                 






