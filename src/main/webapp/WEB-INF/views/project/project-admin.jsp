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
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/project-admin.css">

   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainpage-style.css">
   </head>
<body>

<%@ include file="../include/header.jsp" %>
	   
	<div class="container">
              <a href="" class="list-group-item active notice-list-top" style="width: 900px; margin-left: 200px; border-radius: 0;">
          <span class="main-board-title"> <span class="glyphicon glyphicon-book">내 프로젝트 목록</span></span>
        </a>
        
        <!--여기에 div 만들어서 페이지 만들기-->
			
			
		<c:forEach var="project" items="${projectlist}" varStatus="index">
              
              <div class="project-list">
          <div class="project-list-col-md-8" >
            <div class="project-listbox">
              <div class="image-intro"> 
                <a href="#"><img src="../resources/img/main4.jpg" alt="사진" style="width: 200px; height: 100px; object-fit: cover; vertical-align: text-bottom;"></a>
                </div>
              <div class="project-form">
                <div class="project-title" id="project-view-icon${index.index}" style="cursor: pointer;">
                  <p>${project.projectName}</p>
                  <input type="hidden" value="${project.projectNO}" id="project-list-content${index.index}">
                </div >
                <div class="project-content1">
                  <p>${project.projectRequireLicense}</p>
                </div>
                <div class="project-date">
                  <p>${project.projectRequireDate1} ~ ${project.projectRequireDate2}</p>
                </div>
              </div>
              <div class="project-source">
                <div class="project-content">
                  <a href="#" id="project-view-icon3${index.index}">상세보기</a>
                </div>
              </div>
              <div class="project-in">
                <div class="project-container-right">
                  <button type="button" class="btn btn-success" id="project-view-icon2${index.index}">수정</button>
                </div><br>
                  <button type="button" class="btn btn-danger">삭제</button>
                <!-- <a href="#" id="project-view-icon2${index.index}">상세보기</a> -->
              </div>
            </div>
          </div>
          </div>
          
          <script>
			$(function() {
				$('#project-view-icon${index.index}').click(function() {
					var projectNO = $('#project-list-content${index.index}').val();
					
					location.href='<c:url value="/project/projectviewfix?projectNO=" />' + projectNO;
				})
				
			});
			
			$(function() {
				$('#project-view-icon2${index.index}').click(function() {
				var projectNO = $('#project-list-content${index.index}').val();
					
					location.href='<c:url value="/project/projectviewfix?projectNO=" />' + projectNO;
				})
			});
			
			$(function() {
				$('#project-view-icon3${index.index}').click(function() {
					var projectNO = $('#project-list-content${index.index}').val();
					
					location.href='<c:url value="/project/projectview?projectNO=" />' + projectNO;
				})
				
			});
			
		</script>
              
        </c:forEach>


       <!--  <div class="project-list">
          <div class="project-list-col-md-8">
            <div class="project-listbox">
              <div class="image-intro"> 
                <a href="#"><img src="../resources/img/main4.jpg" alt="사진"></a>
                </div>
              <div class="project-form">
                <div class="project-title" id="project-title-title" style="cursor: pointer;">
                  <p>환경 푸르미 프로젝트 개발자 모집</p>
                  <input type="hidden">
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
                  <a href="#"><img src="../resources/img/main4.jpg" alt="사진"></a>
                </div>
                <div class="project-form">
                  <div class="project-title" id="project-title-title" style="cursor: pointer;">
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
          </div>  -->
         
            
          
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

          

  
	
  
  <%@ include file="../include/footer.jsp" %>
          </div>
</body>
</html>



