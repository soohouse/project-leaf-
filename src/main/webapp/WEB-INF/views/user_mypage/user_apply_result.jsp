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
				<select class="form-control" name="condition" style="height: 30px; font-size: 13px;">
                            <option value="id">프로젝트명</option>
                </select>
			
				<div class="input-group"> 
					<input type="text" class="form-control" placeholder="검색어를 입력하세요" style="height: 30px; font-size: 13px;">
					<span class="input-group-btn">
						<button class="btn btn-default" type="submit" style="height: 30px; background: #d3d3d3; font-size: 13px;">검색</button>
					</span>
				</div>
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
							<td>${applyResultList.applyNO}</td>
							<td>${applyResultList.projectName}</td>
							<td><fmt:formatDate value="${applyResultList.applyDate}" pattern="yyyy-MM-dd" /></td>
							<td><fmt:formatDate value="${applyResultList.projectRequireDate1}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${applyResultList.projectRequireDate2}" pattern="yyyy-MM-dd" /></td>
							<td>${applyResultList.commonValue}</td>
						</tr>
												
					</c:forEach>

				</tbody>
			</table>

		</div>
	
		<%@ include file="../include/footer.jsp" %>
	   
	</div>
   
</body>
</html>


<script>

	

</script>
