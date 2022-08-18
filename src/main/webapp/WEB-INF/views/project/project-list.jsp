<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/project-list.css">

   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainpage-style.css">
   </head>
   
   <style>
   
   		.sections {
   			width: 1200px;
   			margin: 0 auto;
   		}
   		
   		.modal-body-sections {
   			width: 560px;
   			margin: 0 auto;
   		}
   
   </style>
   
<body>

<%@ include file="../include/header.jsp" %>
	   
	<div class="mainbox">
	
		<div class="sections">

			<a href="#" class="list-group-item active notice-list-top" style="margin-top: 20px;"> 
				<span class="main-board-title" style="color: #098391;">프로젝트 목록</span>
			</a>

			<div class="project-search-box" style="border: 1px solid #B1B1B1; padding: 20px; font-family: sans-serif; background: #FCFCFC;">
		            <div class="firstbox">
		             	 <p>지역</p>
		            </div>
		            
		            <div class="checkbox">
		            	<label><input type="checkbox"> 서울</label>
		             	<label><input type="checkbox"> 경기</label>
		              	<label><input type="checkbox"> 인천</label>
		              	<label><input type="checkbox"> 부산</label>
		              	<label><input type="checkbox"> 강원</label>
		              	<label><input type="checkbox"> 제주</label>
		            </div>
		            
		            <div class="container-right">
		             	<button type="button" class="btn btn-primary">선택 항목 검색</button>
		            </div>
		            
		            <div class="intro-date">
		           		<p>개발기간</p>
		            </div>
		            
		            <div class="date">
		                <input type="date" class="form-control" id="exampleInputdate" placeholder="0000/00/00" style="height: 30px;">
		                <p>&nbsp; ~ &nbsp;</p>
		                <input type="date" class="form-control" id="exampleInputdate" placeholder="0000/00/00" style="height: 30px;">
		            </div>
		              	
		            <div class="input-group1">
		            	<input type="text" class="form-control" placeholder="검색어를 입력하세요">
		            </div>
		            <br>
		    </div> 
			
			<%--	우측 버튼인데 아직 사용 안해서 주석처리
			<form class="navbar-form navbar-left navbar-main-top pull-right" role="search" style="padding: 0; margin-left: 0;">
				<div class="input-group"> 
					<span class="input-group-btn">
						<button id="btn-apply-check" class="btn btn-success" type="button" style="height: 30px; font-size: 13px;">버튼</button>
					</span>
				</div>
			</form>
			--%>

			<div class="project-myproject-apply" style="clear: both;">
				
				<br>
				<p style="font-size: 14px; font-weight: bold; margin-top: 20px; margin-left: 16px; margin-bottom: -10px;">모집중인 프로젝트<span style="color: red;">&nbsp;&nbsp;${myProjectCount}</span></p>
				<hr>
				
				
				<c:forEach var="project" items="${projectlist}" varStatus="index">
				
				
				<div class="project-list" style="margin-left: 0; width: 100%; border: 1px solid #C7C7C7;">
			          <div class="project-list-col-md-8" >
			            <div class="project-listbox">
			              <div class="image-intro"> 
			                <a href="#"><img src="<c:url value='/project/projectImageGet?projectNO=${project.projectNO}' />" alt="사진" style="width: 200px; height: 100px; object-fit: cover; vertical-align: text-bottom; margin-left: 20px; margin-top: 16px;"></a>
			              </div>
			              <div class="project-form" style="margin-left: 30px;">
			                <div class="project-title" id="" style="cursor: pointer;">
			                  <p style="width: 400px;" >${project.projectName}</p>
			                  <input type="hidden" value="${project.projectNO}" id="project-list-content${index.index}">
			              	</div>
			                <div class="project-content1">
			                  <p style="width: 400px;">${project.projectRequireRole}</p>
			                </div>
			                <div class="project-date">
			                  <p style="font-size: 12px;"><fmt:formatDate value="${project.projectRequireDate1}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${project.projectRequireDate2}" pattern="yyyy-MM-dd" /></p>
			                </div>
			              </div>
			              <div class="project-source">
			                <div class="project-content" style="position: relative; left: 180px;">
			                  <p style="font-size: 14px;">${project.companyName}</p>
			                </div>
			              </div>
			              
			              <div class="project-in" style="position: relative; right: 10px;">
			                <div class="project-container-right">
			                  <button type="button" class="btn btn-success" disabled>${project.commonValue}</button>
			                </div><br>
			                <a href="#" id="project-view-icon2${index.index}" style="position: relative; top: 10px;">상세보기</a>
			              </div>
			              
			            </div>
			          </div>
			    </div>
				
				<script>
				
					$(function() {

						$('#project-view-icon${index.index}').click(function() {
							var projectNO = $('#project-list-content${index.index}').val();
							
							location.href='<c:url value="/project/projectview?projectNO=" />' + projectNO;
						})
						
						
						$('#project-view-icon2${index.index}').click(function() {
						var projectNO = $('#project-list-content${index.index}').val();
							
							location.href='<c:url value="/project/projectview?projectNO=" />' + projectNO;
						})
						
					});
			
				</script>
				
				
				</c:forEach>
				
			</div>

		</div>
	
		<%@ include file="../include/footer.jsp" %>
	   
	</div>
	
	   
	
      <%-- 
        <a href="" class="list-group-item active notice-list-top" style="width: 900px; margin-left: 200px; border-radius: 0;">
          <span class="main-board-title"> <span class="glyphicon glyphicon-book">프로젝트 목록</span></span>
        </a>
			
				
			
			
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
                  <p style="width: 116px; text-align: center; ">${project.companyName}</p>
                </div>
              </div>
              <div class="project-in">
                <div class="project-container-right">
                  <button type="button" class="btn btn-success" disabled>${project.commonValue}</button>
                </div><br>
                <a href="#" id="project-view-icon2${index.index}">상세보기</a>
              </div>
            </div>
          </div>
          </div>
          
          <script>
			$(function() {
				$('#project-view-icon${index.index}').click(function() {
					var projectNO = $('#project-list-content${index.index}').val();
					
					location.href='<c:url value="/project/projectview?projectNO=" />' + projectNO;
				})
				
			});
			
			$(function() {
				$('#project-view-icon2${index.index}').click(function() {
				var projectNO = $('#project-list-content${index.index}').val();
					
					location.href='<c:url value="/project/projectview?projectNO=" />' + projectNO;
				})
			});
			
		</script>
              
        </c:forEach>
          
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
        --%>

</body>
</html>



