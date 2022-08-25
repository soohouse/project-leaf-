<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainpage-style.css">
   
   <!-- 여기다가 나만의 새로운 css 만들기 -->
   <style>

 
   </style>
   
</head>
<body>

<%@ include file="../include/header.jsp" %>
	   
	<div class="mainbox">
	
		<section>
			<div class="container">
				<div class="row">
					 <!-- 메인화면 공지사항 상단 -->
			            <a href="#" class="list-group-item active notice-list-top" style="margin-top: 20px;">
			            	<span class="main-notice-title">자유게시판</span>
			            </a>
					<div class="col-lg-8 col-md-10 col-sm-12">
					  <form action="<c:url value='/board/boardWrite'/>" method="post" name="boardWriteForm">
		    			<table class= "table table-stripped" style= "text-align: center; boarder: 1px solid #dddddd">
			    	    	<thead>
				    	    	<tr>
				    	    		<th colspan= "2">게시글 제목</th>
				    	    	</tr>
				    	    	<tr>
					    			<td><input type="text" name="boardTitle" id="boardTitle" class="form-control" placeholder="제목을 입력하세요." maxlength="45" ></td>

					    			<c:if test="${user.userID != null }">
					    				<td><input type="hidden" name="boardWriter" value="${user.userID}"></td>
					    			</c:if>
					    			<c:if test="${company.companyID != null }">
					    				<td><input type="hidden" name="boardWriter" value="${company.companyID}"></td>
					    			</c:if>

					    		</tr>
			    	    	</thead>
					    	<tbody>
					    		<tr>
				    	    		<th colspan= "2">게시글 내용</th>
				    	    	</tr>
					    		<tr>
					    			<td><textarea class="form-control" id="boardContent"  name="boardContent" placeholder="내용을 입력하세요." maxlength="2048" style= "height:350px; resize:none;" ></textarea></td>
					    		</tr>
					    	</tbody>
		    	    	</table>
    	    			<input type="button" id="btn-board-write"  class="btn btn-success pull-right" style="margin-right:20px;" onclick="location.href='free_list'" value="등록">
    	    			<button type="button" id="btn-board-list" class="btn btn-primary pull-right" style="margin-right:10px;">목록</button>
    	    		  </form>
					</div>
				</div>
			</div>		   
		</section>
	    <%@ include file="../include/footer.jsp" %>
	</div>
	
   
   
  
</body>
</html>


<script>

	//목록 이동 버튼
	$(function() {
		$('#btn-board-list').click(function() {
			location.href='<c:url value="/board/boardList" />';
		})
		
		$('#btn-board-write').click(function() {
			document.boardWriteForm.submit();
		})
	});
	
	
	//등록버튼 연속클릭 방지
	var bbw = document.querySelector("#btn-board-write");
	bbw.addEventListener("click", function (e) {
	    this.setAttribute("disabled", true);
	});
	
	
	
	//제목이 공백일시 '제목을 입력하세요!'문구와 글 등록 문구.

	

</script>
