<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
   			width: 1200px;
   			margin: 0 auto;
   			min-height: 480px;
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
				<span class="main-board-title" style="color: #2C4F22;">지원자 결과조회</span>
			</a>

			<form class="navbar-form navbar-left navbar-main-top pull-left" role="search" style="padding: 0; margin-left: 0;">
				
				<!-- 검색 -->
				<form class="form-inline d-flex justify-content-end" action="<c:url value='/userapply/applyresult'/>" >
					<div class="form-group mx-sm-3 mb-2 pull-right">
							<select class="foot-control search-select form-control" name="condition"  style="height: 30px; font-size: 13px;">
			                    <option value="id" ${pc.paging.condition == 'id' ? 'selected' : ''}>프로젝트명</option>
							</select>
							<input type="text" name="keyword" class="form-control search-input" value="${pc.paging.keyword}"  style="height: 30px; font-size: 13px;" placeholder="검색어를 입력하세요.">
							<button type="submit" class="btn btn-default" style="height: 30px; background: #d3d3d3; font-size: 13px;">검색 </button>
					</div>
				</form>
				
			</form>
			


			<table class="table table-bordered" style="margin-top: 20px;">
				<thead style="width: 10px; font-size: 13px; background: #A6CAEE;">
					<tr style="font-family: sans-serif;">
						<th style="width: 6%;">번호</th>
						<th style="width: 40%;">프로젝트명</th>
						<th style="width: 12%;">지원날짜</th>
						<th style="width: 30%;">모집기간</th>
						<th style="width: 12%;">조회결과</th>
					</tr>
				</thead>
				<tbody style="width: 10px; font-size: 13px; background: #F7F7F7;">
					
					<c:forEach var="applyResultList" items="${applyResultList}" varStatus="index">
						<tr>
							<td>${applyResultList.rn}</td>
							<td>${applyResultList.projectName}</td>
							<td><fmt:formatDate value="${applyResultList.applyDate}" pattern="yyyy-MM-dd" /></td>
							<td><fmt:formatDate value="${applyResultList.projectRequireDate1}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${applyResultList.projectRequireDate2}" pattern="yyyy-MM-dd" /></td>
							
							<c:choose>
							<c:when test="${applyResultList.commonValue == '확인 대기중'}">
							<td style="color:#2b7d10; font-weight:bold;">${applyResultList.commonValue}</td>
							</c:when>
							<c:when test="${applyResultList.commonValue == '1차 서류 합격'}">
							<td style="color:#034fab; font-weight:bold;">${applyResultList.commonValue}</td>
							</c:when>
							<c:when test="${applyResultList.commonValue == '2차 면접 인터뷰 합격'}">
							<td style="color:#51b5a4; font-weight:bold;">${applyResultList.commonValue}</td>
							</c:when>
							<c:when test="${applyResultList.commonValue == '최종 합격'}">
							<td style="color:#0400ff; font-weight:bold;">${applyResultList.commonValue}</td>
							</c:when>
							<c:when test="${applyResultList.commonValue == '불합격'}">
							<td style="color:#ed1117; font-weight:bold;">${applyResultList.commonValue}</td>
							</c:when>
							</c:choose>
						</tr>
												
					</c:forEach>
		
				</tbody>
			</table>
			
			
			<!-- 지원결과조회 페이징 -->
            <div class="text-center">
				<form action="<c:url value='/user_mypage/user_apply_result'/>" name="pageForm">
	                <ul class="pagination pagination-sm">
						<c:if test="${pc.prev }"><!-- 이전버튼 -->
		                    <li><a href="/userapply/applyresult?pageNum=${pc.beginPage-1}&cpp=${pc.paging.cpp}&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}" data-pagenum="${pc.beginPage-1 }"> << </a></li>
						</c:if>
						<c:forEach var="num" begin="${pc.beginPage }" end="${pc.endPage}">
							<li class="${pc.paging.pageNum == num ? 'active' : '' }"><a href="/userapply/applyresult?pageNum=${num}&cpp=${pc.paging.cpp}&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}" data-pagenum='${num }'>${num }</a></li>
						</c:forEach>
						<c:if test="${pc.next }"><!-- 다음버튼 -->
		                    <li><a href="/userapply/applyresult?pageNum=${pc.endPage+1}&cpp=${pc.paging.cpp}&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}" data-pagenum="${pc.endPage-1 }"> >> </a></li>
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
