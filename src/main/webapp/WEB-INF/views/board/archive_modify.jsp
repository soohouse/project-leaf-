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
					<div class="col-lg-8 col-md-10 col-sm-12">

					  <form action="<c:url value='/archive/archiveUpdate'/>" method="post" name="archiveUpdateForm">
		    			<table class= "table table-stripped" style= "text-align: center; boarder: 1px solid #dddddd">
			    	    	<thead>
				    	    	<tr>
				    	    		<th colspan= "2">게시글 제목</th>
				    	    		<th><input type="hidden" name="archiveNo" id="archiveNo" value="${archive.archiveNo}"></th>
				    	    	</tr>
				    	    	<tr>
					    			<td><input type="text" id="archiveTitle" name="archiveTitle" class="form-control" value="${archive.archiveTitle}" maxlength="100" ></td>
					    		</tr>
			    	    	</thead>
					    	<tbody>
					    		<tr>
				    	    		<th colspan= "2">게시글 내용</th>
				    	    	</tr>
					    		<tr>
					    			<td><textarea class="form-control" id="archiveContent" name="archiveContent" maxlength="2048" style= "height:350px" >${archive.archiveContent}</textarea></td>
					    		</tr>
					    	</tbody>
		    	    	</table>
		    	    	
		    	    		<div class="filebox pull-left">
		    	    				<input type="file" id="file-archive-file" class="archive-file-upload" style="display: none;">
		    	    				<button type="button" id="btn-archive-file">파일 선택</button>
						    		<label for="file-archive-file" id="file-archive" style="font-weight: 500;">${archive.archiveFileRealname}</label>
									
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
		
		// 파일 찾기 버튼을 누르면 숨겨져 있는 파일 요소가 클릭된 것으로 인식
		$('#btn-archive-file').click(function() {
			$('#file-archive-file').click();
		});
		
		// 파일 요소가 변경되면 파일의 이름을 추출해서 버튼 옆에 파일 이름을 띄워준다.
		$('#file-archive-file').change(function() {
			var fileValue = $('#file-archive-file').val().split('\\');
			var fileName = fileValue[fileValue.length - 1];
			
			$('#file-archive').text(fileName);
		});
		
		
		//수정하기 버튼을 클릭할 때
		$('#btn-archive-update').click(function(){
			
			
			//제목 작성 여부 체크
			if($('#archiveTitle').val() == '') {
				alert('제목을 입력해주세요.');
				$('#archiveTitle').css('border-color', 'red');
        $('#archiveTitle').focus();
				return;
			} 
			
			//게시글 작성 여부 체크
			if($('#archiveContent').val() == '') {
				alert('내용을 입력해주세요.');
				$('#archiveContent').css('border-color', 'red');
       			$('#archiveContent').focus();
				return;
			} 

			
			// 자바스크립트의 파일 크기 체크 (5MB 이내의 크기만 첨부할 수 있도록)
			if($('#file-archive-file').val() != '') {
				let maxIntroSize = 5 * 1024 * 1024;		// 5MB
				let introSize = $('#file-archive-file')[0].files[0].size;
				
				if(introSize > maxIntroSize) {
					alert("자료실 첨부파일은 5MB 이내로 첨부가 가능합니다.");
					$('#file-archive-file').val('');
					$('#file-archive').text('${archive.archiveFileRealname}');
					return;
				}
			}
			

			//자료실 게시글 번호와 자료파일을 새로 등록했는지 확인하기 위해 값을 가져온다.
			const archiveNo = $('#archiveNo').val();
			const archiveFileCheck = $('#file-archive-file').val();
			
						// 사용자가 이미 올렸던 이력서 파일이 있었다면
						if(archiveFileCheck != '') {
							
							// 이미 올렸던 이력서 파일을 서버에서 삭제한 후에
							$.ajax({
								type: 'POST',
								url: '<c:url value="/archive/archiveDeleteAsync/" />' + archiveNo,
								contentType: false,
								processData: false,
								
								success: function(result) {
									if(result == 'YesArchiveFileDelete') {

										const formData = new FormData();
										
										const data = $('#file-archive-file');
										
										formData.append('newArchiveFile', data[0].files[0]);
										
										// 수정창에서 업로드한 파일로 새로 적용한다.
										$.ajax({
											type: 'POST',
											url: '<c:url value="/archive/archiveUpdate/" />' + archiveNo,
											contentType: false,
											processData: false,
											
											data: formData,
											
											success: function(result) {
												if(result == 'YesArchiveFileUpdate') {
													console.log('자료실 파일 수정 성공');
													
													// 이력서 수정이 완료되면 나머지 정보도 수정한다.
													if(confirm('글을 수정하시겠습니까?')) { //예->등록성공
													alert('글이 성공적으로 수정되었습니다!');
													return;
													document.archiveUpdateForm.submit();
												} else {
													alert('자료실 파일 수정 중 오류가 발생했습니다.');
													return;
												}
											},
											
											error: function() {
												alert('자료실 파일 수정 중 서버오류가 발생했습니다.');
												return;
											}
										});
										
									} else {
										alert('자료실 파일 삭제 중 오류가 발생했습니다.');
										return;
									}
								},
								
								error: function() {
									alert('자료실 파일 삭제 중 서버오류가 발생했습니다.');
									return;
								}
							});
						} else {
							// 아무 파일을 선택하지 않았다면 그냥 나머지 정보만 수정을 진행한다.
							if(confirm('글을 수정하시겠습니까?')) { //예->등록성공
							alert('글이 성공적으로 수정되었습니다!');
							return;
							document.archiveUpdateForm.submit();
						
						
						}
		});
		
	});

</script>
