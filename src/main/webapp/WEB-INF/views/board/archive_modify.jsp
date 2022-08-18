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
					<div class="col-lg-8 col-md-10 col-sm-12">
					  <form action="<c:url value='/archive/archiveUpdate'/>" method="post" name="archiveUpdateForm">
		    			<table class= "table table-stripped" style= "text-align: center; boarder: 1px solid #dddddd">
			    	    	<thead>
				    	    	<tr>
				    	    		<th colspan= "2">게시글 제목</th>
				    	    		<th><input type="hidden" name="archiveNo" id="archiveNo" value="${archive.archiveNo}"></th>
				    	    	</tr>
				    	    	<tr>
					    			<td><input type="text" name="archiveTitle" class="form-control" value="${archive.archiveTitle}" maxlength="50" ></td>
					    		</tr>
			    	    	</thead>
					    	<tbody>
					    		<tr>
				    	    		<th colspan= "2">게시글 내용</th>
				    	    	</tr>
					    		<tr>
					    			<td><textarea class="form-control" name="archiveContent" maxlength="2048" style= "height:350px" >${archive.archiveContent}</textarea></td>
					    		</tr>
					    	</tbody>
		    	    	</table>
		    	    	
		    	    		<div class="filebox pull-left">
						    		<label for="file" id="archive-file">파일업로드</label>
									<input type="file" id="archive-file" class="archive-file-upload">${archive.archiveFileRealname}	
							</div>
		    	       </form>
		    	    <button type="button" id="btn-archive-update" class="btn btn-primary pull-right" style="margin-right:20px;">수정하기</button>
    	    		<input type="button" class="btn btn-info pull-right" onclick="location.href='<c:url value="/archive/archiveList"/>'" style="margin-right:10px;" value="목록">
					 
					</div>
				</div>
			</div>		   
		</section>
	    <%@ include file="../include/footer.jsp" %>
	</div>
	
   
   
  
</body>
</html>


<script>

	$(function(){
		
		//수정하기 버튼을 클릭할 때
		$('#btn-archive-update').click(function(){
		
			//자료실 게시글 번호와 자료파일을 새로 등록했는지 확인하기 위해 값을 가져온다.
			const archiveNo = $('#archiveNo').val();
			const archiveFileCheck = $('#archive-file').val();
			
			//사용자가 이미 올렸던 자료 파일을 삭제한 후에
			$.ajax({
				type: 'POST',
				url: '<c:url value="/archive/archiveFileDelete/"/>' + archiveNo,
				contentType: false,
				processData: false,
				
				success: function(result) {
					if(result == 'deleteSuccess') {
						
						const formData = new FormData();
						
						const data = $('#archive-file');
						
						formData.append('newarchiveFile', data[0].files[0]); 
						
						//수정창에서 업로드한 파일로 새로 적용한다.
						$.ajax({
							type: 'POST',
							url: '<c:url value="/archive/archiveFileUpdate/"/>' + archiveNo,
							contentType: false,
							processData: false,
							
							data: formData,
							
							success: function(result) {
								if(result == 'updateSuccess') {
									console.log('자료실 파일 수정 성공');
									
									//자료실 파일 수정이 완료되면 나머지 정보도 수정한다.
									document.archiveUpdateForm.submit();
								} else {
									alert('자료실 파일 수정 중 오류가 발생했습니다.');
									return;
								}
							},
							error: function() {
								alert('자료실 파일 수정 중 서버오류가 발생했습니다.');
							}
						}); //ajax(archiveFileModify) 끝
					}
				},
				error: function() {
					alert('자료실 파일 삭제 중 서버오류가 발생했습니다.');
					return;
				}
			});// ajax(archiveFileDelete) 끝
				
			document.archiveUpdateForm.submit();
			
			
		});
			
	});

</script>
