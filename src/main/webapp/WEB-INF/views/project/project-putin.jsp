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
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/project-putin.css">

   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainpage-style.css">
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
      <div class="mojibjung">
        <p>현재 모집중</p>
      </div>
    </div>
    <br>
    </div>

    <div class="user-profile-intro">
        
            <div class="username-input-box">
                <div class="project-user-name">
                    <p>이름</p>
                    <input type="search" id="project-user-name" class="input-all input1" placeholder="이름을 입력해 주세요." maxlength="40" name="userName">
                    <span id="span-name"></span>
                </div>
                <div class="project-e-mail">
                    <p>이메일</p>
                    <input type="search" id="project-user-email" class="input-all input2" placeholder="이메일을 입력해 주세요." maxlength="40"  name="userEmail1">
                    <span id="span-email"></span>
                </div>
                <div class="project-phone">
                    <p>전화번호</p>
                    <select name="userPhone1" id="project-user-phone1" class="regi-droup-down input4-1">
                        <option value="010" selected>010</option>
                        <option value="010" >011</option>
                        <option value="010" >016</option>
                    </select>&nbsp;-
                    <input type="search" id="user-phone2" class="input-all input4-2" placeholder="전화번호 앞 4자" maxlength="4" name="userPhone2">&nbsp;-
                       <input type="search" id="user-phone3" class="input-all input4-3" placeholder="전화번호 뒷 4자" maxlength="4" name="userPhone3">
                    <br><span id="span-phone"></span>
                </div>
                <div class="resume-user">  
                    <p>이력서 등록</p>
                    <input type="file" name="profile_pt" id="user-profile" onchange="previewImage(this,'View_area')" accept="file/hwp, file/docx" >
                </div>
                <div class="user-saying">
                  <p>담당자에게 전할 메세지</p>
                  <textarea name="user-say" id="user-textarea" cols="30" rows="10"></textarea>
                </div>
            </div>
       
        
        <div class="jechul-button">
            <div class="project-container-bottom">
                <button type="button" id="jiwon-btn" class="btn btn-success">제출하기</button>
                <button type="button" id="chwiso-btn" class="btn btn-danger">취소</button>
              </div>
        </div>
        <div class="user-check-box">
          <label>
            <input type="checkbox"> 개인정보 제공 동의
          </label>
        </div>




  </div>


  <%@ include file="../include/footer.jsp" %>
  </div>
</body>
</div>
</html>