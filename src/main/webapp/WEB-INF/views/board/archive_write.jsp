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
			            	<span class="main-notice-title">자료실</span>
			            </a>
				
					<div class="col-lg-8 col-md-10 col-sm-12" >
					  <form action="<c:url value='/archive/archiveWrite'/>" method="post" name="archiveWriteForm" >
		    			<table class= "table table-stripped" style= "text-align: center; boarder: 1px solid #dddddd">
			    	    	<thead>
				    	    	<tr>
				    	    		<th colspan= "2">게시글 제목</th>
				    	    	</tr>
				    	    	<tr>
					    			<td><input type="text" id="archiveTitle" name="archiveTitle" class="form-control" placeholder="게시글 제목을 입력하세요." maxlength="100" ></td>
					    			<c:if test="${user.userID != null}">
					    				<td><input type="hidden" name="archiveWriter" value="${user.userID}"></td>
					    			</c:if>
					    			<c:if test="${company.companyID != null}">
					    				<td><input type="hidden" name="archiveWriter" value="${company.companyID}"></td>
					    			</c:if>
					    		</tr>
			    	    	</thead>
					    	<tbody>
					    		<tr>
				    	    		<th colspan= "2">게시글 내용</th>
				    	    	</tr>
					    		<tr>
					    			<td><textarea class="form-control" id="archiveContent" name="archiveContent" placeholder="게시글 내용을 입력하세요." maxlength="2048" style= "height:350px; resize:none;" ></textarea></td>
					    		</tr>
					    		
					    	</tbody>
					    	
					    		
		    	    	</table>
		    	    	
		    	    			<div class="filebox pull-left">
						    		<label for="file">파일업로드</label>
									<input type="file" id="archive-file" class="archive-file-upload">	
								</div>
		    	    		
					  		</form>
    	    			<input type="button" id="btn-archive-write" class="btn btn-success pull-right" style="margin-right:20px;" value="등록">
    	    			<button type="button" id="btn-archive-list" class="btn btn-primary pull-right" style="margin-right:10px;">목록</button>
					
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
		

		//자료실 글쓰기
		$('#btn-archive-write').click(function(){
			
			//제목공백 방지
			if($('#archiveTitle').val() == '') {
				alert('제목을 입력해주세요.');
				$('#archiveTitle').css('border-color', 'red');
				$('#archiveTitle').focus();
				return;
			} 
			
			//내용공백 방지
			if($('#archiveContent').val() == '') {
				alert('내용을 입력해주세요.');
				$('#archiveContent').css('border-color', 'red');
				$('#archiveContent').focus();
				return;
			} 

			
			// 자바스크립트의 파일 크기 체크 (5MB 이내의 크기만 첨부할 수 있도록)
			if($('#archive-file').val() != '') {
				let maxIntroSize = 10 * 1024 * 1024;		// 10MB
				let introSize = $('#archive-file')[0].files[0].size;
				
				if(introSize > maxIntroSize) {
					alert("자료실 첨부파일은 10MB 이내로 첨부가 가능합니다.");
					$('#archive-file').val('');
					$('#file-archive').text('${archive.archiveFileRealname}');
					return;
				}
			}
			
			
			// 자료실 파일 첨부 여부 체크
			if($('#archive-file').val() == '') {
				alert('자료실 파일 첨부는 필수입니다.');
				return;
			}

			
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
					
					// 가상 Form에 받은 파일을 archiveFile이라는 이름으로 넣는다.
					formData.append('archiveFile', data[0].files[0]);
					
					// 자료실 파일을 등록하는 archiveFile를 비동기로 처리
					$.ajax({
						type: 'POST',
						url: '<c:url value="/archive/archiveFile/" />' + archiveNo,
						contentType: false,
						processData: false,
						
						data: formData,
						
						success: function(result) {
							if(result == 'YesArchiveFile') {
								console.log('자료실 파일 등록 성공');
							} else {
								alert('자료실 파일 등록 중 오류가 발생했습니다.');
								return;
							}
						},
						
						error: function() {
							alert('자료실 파일 등록 중 서버오류가 발생했습니다.');
							return;
						}
					});		// ajax(archiveFile) 끝
				},
				
				error: function() {
					alert("자료실 파일번호를 얻어오는 중 서버오류가 발생했습니다.");
					return;
				}
			});		// ajax(archiveNOGet) 끝
			
			
		});
		
		
	});
	
	//
	
	


</script>
