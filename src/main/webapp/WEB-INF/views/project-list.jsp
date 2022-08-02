<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">

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
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/project-list.css">

   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainpage-style.css">
   </head>
<body>

<%@ include file="include/header.jsp" %>
	   
	<div class="container">
        <div id="main-box">
            <div class="firstbox">
              지역
            </div>
            <div class="checkbox">
              <label>
                <input type="checkbox"> 서울
              </label>
              <label>
                <input type="checkbox"> 경기
              </label>
              <label>
                <input type="checkbox"> 인천
              </label>
              <label>
                <input type="checkbox"> 부산
              </label>
              <label>
                <input type="checkbox"> 강원
              </label>
              <label>
                <input type="checkbox"> 제주
              </label>
            </div>
            <div class="container-right">
              <button type="button" class="btn btn-primary btn-lg">선택 항목 검색</button>
            </div>
            <div class="intro-date">
              개발기간
            </div>
            <div class="date">
              <label for="exampleInputdate"></label>
                <input type="date" class="form-control" id="exampleInputdate" placeholder="0000/00/00">
              <div>
                ~
              </div>
                <input type="date" class="form-control" id="exampleInputdate" placeholder="0000/00/00">
              </div>
              <div class="input-group1">
                <input type="text" class="form-control" placeholder="검색어를 입력하세요">
                </div>
        </div> <br>
      
        <a href="" class="list-group-item active notice-list-top" style="width: 900px; margin-left: 200px; border-radius: 0;">
          <span class="main-board-title"> <span class="glyphicon glyphicon-book">프로젝트 목록</span></span>
        </a>
        
        <!--여기에 div 만들어서 페이지 만들기-->

        <div class="project-list">
          <div class="project-list-col-md-8">
            <div class="project-listbox">
              <div class="image-intro"> 
                <a href="#"><img src="resources/img/main4.jpg" alt="사진"></a>
                </div>
              <div class="project-form">
                <div class="project-title">
                  <p>환경 푸르미 프로젝트 개발자 모집</p>
                </div >
                <div class="project-content1">
                  <p>C++, Java, 백엔드/서버개발, 유지보수 등</p>
                </div>
                <div class="project-date">
                  <p>개발자 모집기간 : 2022.06.10 ~ 2022.07.10</p>
                </div>
              </div>
              <div class="project-source">
                <div class="project-content">
                  <p>(주) 성진하이텍</p>
                </div>
              </div>
              <div class="project-in">
                <div class="project-container-right">
                  <button type="button" class="btn btn-danger" disabled>마감 임박</button>
                </div><br>
                <a href="#">상세보기</a>
              </div>
            </div>
          </div>
          </div>
          <div class="project-list">
            <div class="project-list-col-md-8">
              <div class="project-listbox">
                <div class="image-intro"> 
                  <a href="#"><img src="resources/img/main4.jpg" alt="사진"></a>
                </div>
                <div class="project-form">
                  <div class="project-title">
                    <p>환경 푸르미 프로젝트 개발자 모집</p>
                  </div >
                  <div class="project-content1">
                    <p>C++, Java, 백엔드/서버개발, 유지보수 등</p>
                  </div>
                  <div class="project-date">
                    <p>개발자 모집기간 : 2022.06.10 ~ 2022.07.10</p>
                  </div>
                </div>
                <div class="project-source">
                  <div class="project-content">
                    <p>(주) 성진하이텍</p>
                  </div>
                </div>
                <div class="project-in">
                  <div class="project-container-right">
                    <button type="button" class="btn btn-success" disabled>현재 모집</button>
                  </div><br>
                  <a href="#">상세보기</a>
                </div>
              </div>
            </div>            
          </div>
          <div class="project-list">
            <div class="project-list-col-md-8">
              <div class="project-listbox">
                <div class="image-intro"> 
                  <a href="#"><img src="resources/img/main4.jpg" alt="사진"></a>
                </div>
                <div class="project-form">
                  <div class="project-title">
                    <p>환경 푸르미 프로젝트 개발자 모집</p>
                  </div >
                  <div class="project-content1">
                    <p>C++, Java, 백엔드/서버개발, 유지보수 등</p>
                  </div>
                  <div class="project-date">
                    <p>개발자 모집기간 : 2022.06.10 ~ 2022.07.10</p>
                  </div>
                </div>
                <div class="project-source">
                  <div class="project-content">
                    <p>(주) 성진하이텍</p>
                  </div>
                </div>
                <div class="project-in">
                  <div class="project-container-right">
                    <button type="button" class="btn btn-danger" disabled>마감 임박</button>
                  </div><br>
                  <a href="#">상세보기</a>
                </div>
              </div>
            </div>
          
          </div>
          <div class="project-list">
            <div class="project-list-col-md-8">
              <div class="project-listbox">
                <div class="image-intro"> 
                  <a href="#"><img src="resources/img/main4.jpg" alt="사진"></a>
                </div>
                <div class="project-form">
                  <div class="project-title">
                    <p>환경 푸르미 프로젝트 개발자 모집</p>
                  </div >
                  <div class="project-content1">
                    <p>C++, Java, 백엔드/서버개발, 유지보수 등</p>
                  </div>
                  <div class="project-date">
                    <p>개발자 모집기간 : 2022.06.10 ~ 2022.07.10</p>
                  </div>
                </div>
                <div class="project-source">
                  <div class="project-content">
                    <p>(주) 성진하이텍</p>
                  </div>
                </div>
                <div class="project-in">
                  <div class="project-container-right">
                    <button type="button" class="btn btn-success" disabled>현재 모집</button>
                  </div> <br>
                  <a href="#">상세보기</a>
                </div>
              </div>
            </div>
          </div>
          <div class="project-list">
            <div class="project-list-col-md-8">
              <div class="project-listbox">
                <div class="image-intro"> 
                  <a href="#"><img src="resources/img/main4.jpg" alt="사진"></a>
                  </div>
                <div class="project-form">
                  <div class="project-title">
                    <p>환경 푸르미 프로젝트 개발자 모집</p>
                  </div >
                  <div class="project-content1">
                    <p>C++, Java, 백엔드/서버개발, 유지보수 등</p>
                  </div>
                  <div class="project-date">
                    <p>개발자 모집기간 : 2022.06.10 ~ 2022.07.10</p>
                  </div>
                </div>
                <div class="project-source">
                  <div class="project-content">
                    <p>(주) 성진하이텍</p>
                  </div>
                </div>
                <div class="project-in">
                  <div class="project-container-right">
                    <button type="button" class="btn btn-danger" disabled>마감 임박</button>
                  </div><br>
                  <a href="#">상세보기</a>
                </div>
              </div>
            </div>
            </div>
          
          <div class="project-pagination">
            <nav>

              <ul class="pagination">
            
                <li><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
            
                <li><a href="#">1</a></li>
            
                <li><a href="#">2</a></li>
            
                <li><a href="#">3</a></li>
            
                <li><a href="#">4</a></li>
            
                <li><a href="#">5</a></li>
            
                <li><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
            
              </ul>
            
            </nav>
            </div>

          

  
	
  
  <%@ include file="include/footer.jsp" %>
          </div>
</body>
</html>


<script>



</script>
