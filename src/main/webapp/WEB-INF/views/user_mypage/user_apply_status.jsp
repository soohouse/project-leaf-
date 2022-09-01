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
			
			
			
			<div style="padding: 0; margin-left: 0; float:left;">
				
				<!-- 검색 -->
				<form class="form-inline d-flex justify-content-end" action="<c:url value='/userapply/applystatus'/>" >
					<div class="form-group mx-sm-3 mb-2 pull-right">
						<select class="foot-control search-select form-control" name="condition" style="height: 30px; font-size: 13px;">
		                    <option value="id" ${pc.paging.condition == 'id' ? 'selected' : ''}>프로젝트명</option>
		                    <option value="name" ${pc.paging.condition == 'name' ? 'selected' : ''}>회사명</option>
						</select>
						<input type="text" name="keyword" class="form-control search-input" value="${pc.paging.keyword}" style="height: 30px; font-size: 13px;" placeholder="검색어를 입력하세요.">
						<button type="submit" class="btn btn-default" style="height: 30px; background: #d3d3d3; font-size: 13px;">검색 </button>
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
	                           
	                           <c:choose>
	                           <c:when test="${applyStatusList.commonValue == '확인 대기중'}">
	                           <div><p style="color:#2b7d10; font-weight:bold;">${applyStatusList.commonValue}</p></div>
	                           </c:when>
	                           <c:when test="${applyStatusList.commonValue == '1차 서류 합격'}">
	                           <div><p style="color:#034fab; font-weight:bold;">${applyStatusList.commonValue}</p></div>
	                           </c:when>
	                           <c:when test="${applyStatusList.commonValue == '2차 면접 인터뷰 합격'}">
	                           <div><p style="color:#51b5a4; font-weight:bold;">${applyStatusList.commonValue}</p></div>
	                           </c:when>
	                           <c:when test="${applyStatusList.commonValue == '최종 합격'}">
	                           <div><p style="color:#0400ff; font-weight:bold;">${applyStatusList.commonValue}</p></div>
	                           </c:when>
	                            <c:when test="${applyStatusList.commonValue == '불합격'}">
	                           <div><p style="color:#ed1117; font-weight:bold;">${applyStatusList.commonValue}</p></div>
	                           </c:when>

	                           
	                           </c:choose>
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
			
			<!-- 지원현황 페이징 -->
            <div class="text-center">
				<form action="<c:url value='/user_mypage/user_apply_status'/>" name="pageForm">
	                <ul class="pagination pagination-sm">
						<c:if test="${pc.prev }"><!-- 이전버튼 -->
		                    <li><a href="/userapply/applystatus?pageNum=${pc.beginPage-1}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}" data-pagenum="${pc.beginPage-1 }"> << </a></li>
						</c:if>
						<c:forEach var="num" begin="${pc.beginPage }" end="${pc.endPage}">
							<li class="${pc.paging.pageNum == num ? 'active' : '' }"><a href="/userapply/applystatus?pageNum=${num}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}" data-pagenum='${num }'>${num }</a></li>
						</c:forEach>
						<c:if test="${pc.next }"><!-- 다음버튼 -->
		                    <li><a href="/userapply/applystatus?pageNum=${pc.endPage+1}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}" data-pagenum="${pc.endPage-1 }"> >> </a></li>
						</c:if>
					</ul>
                    <input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
                    <input type="hidden" name="cpp" value="${pc.paging.cpp}">
                    <input type="hidden" name="condition" value="${pc.paging.condition}">
                    <input type="hidden" name="keyword" value="${pc.paging.keyword}">
				</form>
			</div>
			

		</div>
	
		<%@ include file="../include/footer.jsp" %>
	   
	</div>
   
</body>
</html>


<script>


//페이징
$(function() {
	const msg = '${msg}';
	if(msg !== '') {
		alert(msg);
	}
	$('#pagination').on('click', 'a', function(e) {
		e.preventDefault(); //a태그의 고유기능 중지.
		const value = $(this).data('pagenum'); //-> jQuery
		console.log(value);
		document.pageForm.pageNum.value = value;
		document.pageForm.submit();
	});
}); //end jQuery
	
</script>
