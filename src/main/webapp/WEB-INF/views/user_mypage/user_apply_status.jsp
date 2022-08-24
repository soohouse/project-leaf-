<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/project-list.css">
   <!-- 여기다가 나만의 새로운 css 만들기 -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainpage-style.css">
   
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
   
</head>
<body>

<%@ include file="../include/header.jsp" %>
	   
	<div class="mainbox">
	
		<div class="sections">

			<a href="#" class="list-group-item active notice-list-top" style="margin-top: 20px;"> 
				<span class="main-board-title" style="color: #2C4F22;">지원현황</span>
			</a>
			
			<div>
			<form class="navbar-form navbar-left navbar-main-top pull-left" role="search" style="padding: 0; margin-left: 0;">
				<select class="form-control" name="condition" style="height: 30px; font-size: 13px;">
                            <option value="id">프로젝트명</option>
                            <option value="name">회사명</option>
                </select>
			
				<div class="input-group"> 
					<input type="text" class="form-control" placeholder="검색어를 입력하세요" style="height: 30px; font-size: 13px;">
					<span class="input-group-btn">
						<button class="btn btn-default" type="submit" style="height: 30px; background: #d3d3d3; font-size: 13px;">검색</button>
					</span>
				</div>
			</form>
			</div>

			<div style="clear: both;">
			
				<br>
				<p style="font-size: 14px; font-weight: bold; margin-top: 20px; margin-left: 16px; margin-bottom: -10px;">지원한 프로젝트<span style="color: red;">&nbsp;&nbsp;${projectApplyCount}</span></p>
				<hr>
					
				<c:forEach var="applyStatusList" items="${applyStatusList}" varStatus="index">
              
	           <div class="project-list" style="margin-left: 0; width: 100%; border: 1px solid #C7C7C7;">
	                   <div class="project-list-col-md-8" >
	                     <div class="project-listbox">
	                       <div class="image-intro"> 
	                         <a href="#"><img src="<c:url value='/project/projectImageGet?projectNO=${applyStatusList.projectNO}' />" alt="사진" style="width: 200px; height: 100px; object-fit: cover; vertical-align: text-bottom; margin-left: 20px; margin-top: 16px;"></a>
	                         </div>
	                       <div class="project-form" style="margin-left: 30px;">
	                         <div class="project-title" id="project-view-icon2${index.index}" style="cursor: pointer;">
	                           <p style="width: 400px;" >${applyStatusList.projectName}</p>
	                           <input type="hidden" value="${applyStatusList.projectNO}" id="hidden-project-no${index.index}">
	                         </div >
	                         <div class="project-content1">
	                           <p style="width: 400px;">${applyStatusList.projectRequireRole}</p>
	                         </div>
	                         <div class="project-date">
	                           <p><fmt:formatDate value="${applyStatusList.projectRequireDate1}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${applyStatusList.projectRequireDate2}" pattern="yyyy-MM-dd" /></p>
	                         </div>
	                       </div>
	                       <div class="project-source">
	                         <div class="project-content" style="position: relative; left: 180px;">
	                           <p style="font-size: 14px;">${applyStatusList.companyName}</p>
	                         </div>
	                       </div>
	                       
	                       <div class="project-in" style="position: relative; right: 10px;">
	                      	
	                         <div class="project-container-right"> 
	                           <div style="margin-bottom:20px;"><a id="project-view-icon${index.index}" style="cursor:pointer;">프로젝트 상세보기</a></div>
	                           <div><p style="text-decoration:underline;">${applyStatusList.commonValue}</p></div>
	                         </div><br>	                         
	                       </div>
	                     </div>
	                   </div>
	                 </div>
	          
	          <script>
				$(function() {
					$('#project-view-icon${index.index}').click(function() {
						var projectNO = $('#hidden-project-no${index.index}').val();
						
						location.href='<c:url value="/project/projectview?projectNO=" />' + projectNO;
					})
					
				});
				
				$(function() {
					$('#project-view-icon2${index.index}').click(function() {
					var projectNO = $('#hidden-project-no${index.index}').val();
						
						location.href='<c:url value="/project/projectview?projectNO=" />' + projectNO;
					})
				});
				
			</script>
	              
	        </c:forEach>
					
			</div>

			

		</div>
	
		<%@ include file="../include/footer.jsp" %>
	   
	</div>
   
</body>
</html>


<script>

	
</script>
