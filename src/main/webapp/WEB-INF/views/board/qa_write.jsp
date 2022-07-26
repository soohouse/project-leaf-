<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

   <meta charset="UTF-8">

   <title>오신것을 환영합니다</title>
   
   <!-- jQuery -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   
   <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
   
   <!-- 합쳐지고 최소화된 최신 CSS -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
   
   <!-- 개인 디자인 추가, ?after를 붙이면 기존에 동일한 이름의 파일을 인식하는것이 아닌 새로운 파일을 인식하게 된다. -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainstyle.css">
   
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
					 <h2>Q&A</h2>
                	 <hr class="headline">
				
					<div class="col-lg-8 col-md-10 col-sm-12">
		    			<table class= "table table-stripped" style= "text-align: center; boarder: 1px solid #dddddd">
			    	    	<thead>
				    	    	<tr>
				    	    		<th colspan= "2">질문 제목</th>
				    	    	</tr>
				    	    	<tr>
					    			<td><input type="text" class="form-control" placeholder="질문 제목을 입력하세요." maxlength="50" ></td>
					    		</tr>
			    	    	</thead>
					    	<tbody>
					    		<tr>
				    	    		<th colspan= "2">질문 내용</th>
				    	    	</tr>
					    		<tr>
					    			<td><textarea class="form-control" placeholder="질문 내용을 입력하세요." maxlength="2048" style= "height:350px" ></textarea></td>
					    		</tr>
					    	</tbody>
		    	    	</table>
    	    			<input type="submit" class="btn btn-success pull-right" value="질문하기">
    	    			<input type="submit" class="btn btn-primary pull-right" onclick="location.href='qa_list'" value="목록">
					</div>
				</div>
			</div>		   
		</section>
	    <%@ include file="../include/footer.jsp" %>
	</div>
	
   
   
  
</body>
</html>


<script>



</script>
