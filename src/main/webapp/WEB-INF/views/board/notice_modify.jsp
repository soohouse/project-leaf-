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
			            	<span class="main-notice-title">공지사항</span>
			            </a>
									                
					<div class="col-lg-8 col-md-10 col-sm-12">
						<form action="<c:url value='/notice/noticeUpdate'/>" method="post" name="noticeUpdateForm">
			    			<table class= "table table-stripped" style= "text-align: center; boarder: 1px solid #dddddd">
				    	    	<thead>
					    	    	<tr>
					    	    		<th colspan= "2">공지사항 제목</th>
					    	    		<th><input type="hidden" name="noticeNo" id="noticeNo" value="${notice.noticeNo}"></th>
					    	    	</tr>
					    	    	<tr>
						    			<td><input type="text" name="noticeTitle" class="form-control" value="${notice.noticeTitle}" maxlength="50" ></td>
						    			
						    		</tr>
				    	    	</thead>
						    	<tbody>
						    		<tr>
					    	    		<th colspan= "2">공지사항 내용</th>
					    	    	</tr>
						    		<tr>
						    			<td><textarea class="form-control" name="noticeContent" maxlength="2048" style= "height:350px" >${notice.noticeContent}</textarea></td>
						    		</tr>
						    	</tbody>
			    	    	</table>
	    	    			<button type="submit" id="btn-notice-update" class="btn btn-info pull-right" style="margin-left:10px;">수정하기</button>
	    	    			<input type="button" class="btn btn-primary pull-right" onclick="location.href='<c:url value="/notice/noticeList"/>'" value="목록">
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

/*//수정하기 버튼 이벤트
$('#btn-notice-update').click(function() {
	if($('input[name=noticeTitle]').val() === '') {
		alert('제목을 필수로 작성해주세요.');
		$('input[name=noticeTitle]').focus();
		return;
	} else if($('textarea[name=noticeContent]').val() === '') {
		alert('내용을 필수로 작성해주세요.');
		$('textarea[name=noticeContent]').focus();
		return;
	} else {
		document.noticeUpdateForm.submit();
	}
});
*/
	

</script>
