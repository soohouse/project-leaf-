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
			            	<span class="main-notice-title">자료실</span>
			            </a>
				
					<div class="col-lg-8 col-md-10 col-sm-12"></div>
					  <form action="<c:url value='/archive/archiveWrite'/>" method="post" name="archiveWriteForm" >
		    			<table class= "table table-stripped" style= "text-align: center; boarder: 1px solid #dddddd">
			    	    	<thead>
				    	    	<tr>
				    	    		<th colspan= "2">게시글 제목</th>
				    	    	</tr>
				    	    	<tr>
					    			<td><input type="text" name="archiveTitle" class="form-control" placeholder="게시글 제목을 입력하세요." maxlength="50" ></td>
					    			<td><input type="hidden" name="archiveWriter" value="${user.userID}"></td>
					    		</tr>
			    	    	</thead>
					    	<tbody>
					    		<tr>
				    	    		<th colspan= "2">게시글 내용</th>
				    	    	</tr>
					    		<tr>
					    			<td><textarea class="form-control" name="archiveContent" placeholder="게시글 내용을 입력하세요." maxlength="2048" style= "height:350px" ></textarea></td>
					    		</tr>
					    		
					    	</tbody>
					    	
					    		
		    	    	</table>
		    	    	
		    	    			<div class="filebox pull-left">
						    		<label for="file">파일업로드</label>
									<input type="file" id="archive-file" class="archive-file-upload">	
								</div>
		    	    		
					  		</form>
    	    			<input type="button" id="btn-archive-write" class="btn btn-success pull-right" value="등록">
    	    			<button type="button" id="btn-archive-list" class="btn btn-primary pull-right">목록</button>
					
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
		$('#btn-archive-list').click(function() {
			location.href='<c:url value="/archive/archiveList" />';
		});
		
		
		$('#btn-archive-write').click(function(){
			document.archiveWriteForm.submit();
			
			$.ajax({
				type: 'POST',
				url: '<c:url value="/archive/archiveNoGet" />',
				contentType: false,
				processData: false,
				
				success: function(archiveNo) {
					// 가상 Form을 생성한다.
					const formData = new FormData();
				
					const data = $('#archive-file');
					
					// 가상 Form에 받은 파일을 companyIntro이라는 이름으로 넣는다.
					formData.append('archiveFile', data[0].files[0]);
					
					// 회사 소개서 파일을 등록하는 companyIntro를 비동기로 처리
					$.ajax({
						type: 'POST',
						url: '<c:url value="/archive/archiveFile/" />' + archiveNo,
						contentType: false,
						processData: false,
						
						data: formData,
						
						success: function(result) {
							if(result == 'YesArchiveFile') {
								console.log('회사 소개서 등록 성공');
							} else {
								alert('회사 소개서 등록 중 오류가 발생했습니다.');
								return;
							}
						},
						
						error: function() {
							alert('회사 소개서 등록 중 서버오류가 발생했습니다.');
							return;
						}
					});		// ajax(userProfile) 끝
				},
				
				error: function() {
					alert("기업회원 회원번호를 얻어오는 중 서버오류가 발생했습니다.");
					return;
				}
			});		// ajax(userNOGet) 끝
			
			
		});
		
		
	});
	
	//
	
	


</script>
