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
					  <form action="<c:url value='/board/boardUpdate'/>" method="post" name="boardUpdateForm">
		    			<table class= "table table-stripped" style= "text-align: center; boarder: 1px solid #dddddd">
			    	    	<thead>
				    	    	<tr>
				    	    		<th colspan= "2">게시글 제목</th>
				    	    		<th><input type="hidden" name="boardNo" id="boardNo" value="${board.boardNo}"></th>
				    	    	</tr>
				    	    	<tr>
					    			<td><input type="text" id="boardTitle" name="boardTitle" class="form-control" value="${board.boardTitle}" maxlength="50" ></td>
					    		</tr>
			    	    	</thead>
					    	<tbody>
					    		<tr>
				    	    		<th colspan= "2">게시글 내용</th>
				    	    	</tr>
					    		<tr>
					    			<td>
					    				<textarea class="form-control" id="boardContent" name="boardContent" maxlength="2048" style= "height:350px; resize:none;" >${board.boardContent}</textarea>
					    			</td>
					    		</tr>
					    	</tbody>
		    	    	</table>
		    	    	<button type="submit" id="btn-board-update" class="btn btn-info pull-right" style="margin-left:10px;">수정하기</button>
    	    			<input type="button" class="btn btn-primary pull-right" onclick="location.href='<c:url value="/board/boardList"/>'" value="목록">
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

//제목이 공백일시 '제목을 입력하세요!'문구와 글 등록 문구.
$('#btn-board-update').click(function() { 
	const title = $('#boardTitle').val();
	const content = $('#boardContent').val();
	
	if(title == '') {
		alert('제목을 입력해주세요.');
		$('#boardTitle').css('border-color', 'red');
		return false;
	} else if(content == '') {
		alert('내용을 입력해주세요.');
		$('#boardContent').css('border-color', 'red');
		return false;
	} else {
		if(confirm('글을 등록하시겠습니까?')) { //예->등록성공
			alert('글이 성공적으로 등록되었습니다!');
			return;
		} else {return false;} //아니요->등록실패
	}
});


</script>
