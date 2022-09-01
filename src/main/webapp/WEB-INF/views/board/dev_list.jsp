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
   		
   		
   		#modal-user-intro::-webkit-scrollbar {
 			width: 3px;
  			background-color: #C7C7C7;
		}
	
	
		#modal-user-intro::-webkit-scrollbar-thumb {
			background: #535353;
		}
   
   </style>
   
</head>
<body>

<%@ include file="../include/header.jsp" %>
	   
	<div class="mainbox">
	
		<div class="sections">

			<a href="#" class="list-group-item active notice-list-top" style="margin-top: 20px;"> 
				<span class="main-board-title" style="color: #2C4F22;">개발자 목록</span>
			</a>
			
				<select id="pageUnit" name="pageUnit" onchange="Change(1)" class="head-control mx-sm-3 mb-2" style="float:right;">
			        <option value="10" <c:if test="${pc.paging.cpp == 10}">selected</c:if>>10개씩 보기</option>
			        <option value="15" <c:if test="${pc.paging.cpp == 15}">selected</c:if>>15개씩 보기</option>
			        <option value="20" <c:if test="${pc.paging.cpp == 20}">selected</c:if>>20개씩 보기</option>
			    </select>
			
			<form class="navbar-form navbar-left navbar-main-top pull-left" action="<c:url value='/userList/userList'/>" style="padding: 0; margin-left: 0;">
				<select class="form-control" name="condition" style="height: 30px; font-size: 13px;">
                            <option value="title" ${pc.paging.condition == 'title' ? 'selected' : ''}>개발자 ID</option>
                            <option value="writer" ${pc.paging.condition == 'writer' ? 'selected' : ''}>이름</option>
                     		<option value="date" ${pc.paging.condition == 'date' ? 'selected' : ''}>이메일</option>
                </select>
			
				<div class="input-group"> 
					<input type="text" name="keyword" value="${pc.paging.keyword}" class="form-control" placeholder="검색어를 입력하세요" style="height: 30px; font-size: 13px;">
					<span class="input-group-btn">
						<button class="btn btn-default" type="submit" style="height: 30px; background: #d3d3d3; font-size: 13px;">검색</button>
					</span>
				</div>
			</form>
			


			<table class="table table-bordered" style="margin-top: 20px;">
				<thead style="width: 10px; font-size: 13px; background: #89C578;">
					<tr style="font-family: sans-serif;">
						<th style="width: 6%;">회원번호</th>
						<th style="width: 12%;">개발자 ID</th>
						<th style="width: 30%;">개발자 이름</th>
						<th style="width: 20%;">개발자 전화번호</th>
						<th style="width: 20%;">개발자 이메일</th>
						<th style="width: 12%;">비고</th>
					</tr>
				</thead>
				<tbody style="width: 10px; font-size: 13px; background: #FCFCFC;">
					
					<c:forEach var="userList" items="${userList}" varStatus="index">
						<tr id="userListDetail${index.index}" style="cursor: pointer;">
							<td>${userList.userNO}</td>
							<td>${userList.userID}</td>
							<td>${userList.userName}</td>
							<td>${userList.userPhone}</td>
							<td>${userList.userEmail}</td>
							<td>${userList.commonValue}</td>
							
						</tr>
						
				<%@ include file="../modal_mypage/developerInfo.jsp" %>
						
						<script>
							
							$(function() {
								
								$('#userListDetail${index.index}').click(function() {
									
									$.ajax({
										type: 'GET',
										url: '<c:url value="/userList/userListDetail?userNO=" />' + '${userList.userNO}',
										
										success: function(user) {
											console.log(user.userNO);
											
											$('#modal-user-id').text(user.userID);
											$('#modal-user-name').text(user.userName);
											$('#modal-user-phone').text(user.userPhone);
											$('#modal-user-email').text(user.userEmail);
											
											if(user.userIntro == null || user.userIntro == '') {
												$('#modal-user-intro').text('');
											} else {
												let str = user.userIntro.replaceAll("\n", "<br/>");
												$('#modal-user-intro').empty().append(str);
											}
											
											if(user.resumeRealname == null || user.resumeRealname == '') {
												$('#modal-user-resume-realname').css('color', '#A4A4A4');
												$('#modal-user-resume-realname').css('font-weight', '500');
												$('#modal-user-resume-realname').css('text-decoration', 'none');
												$('#modal-user-resume-realname').text('등록된 이력서가 없습니다.');
											} else {
												$('#modal-user-resume-realname').css('color', 'blue');
												$('#modal-user-resume-realname').css('font-weight', '500');
												$('#modal-user-resume-realname').css('text-decoration', 'underline');
												
												$('#modal-user-resume-realname').text(user.resumeRealname);
											}
											
											$('#modal-user-logo').attr('src', '<c:url value="/user/userProfileGet?userNO=" />' + user.userNO);
											$('#hidden-user-no').val(user.userNO);
											$('#modal-main-user-id').text(user.userID);
											$('#modal-main-user-name').text(user.userName);
										},
										
										error: function() {
											alert('개발자 목록 상세보기 요청 처리 중 서버오류가 발생했습니다.');
											return;
										}
									});
									
									$('#modal-user-detail').modal('show');
								});
								
							});
						
						</script>
						
					</c:forEach>

				</tbody>
			</table>
			<!-- 페이징 -->
            <div class="text-center">
				<form action="<c:url value='/board/dev_list'/>" name="pageForm">
	                <ul class="pagination pagination-sm">
						<c:if test="${pc.prev }"><!-- 이전버튼 -->
		                    <li><a href="/userList/userList?pageNum=${pc.beginPage-1}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}" data-pagenum="${pc.beginPage-1 }"> << </a></li>
						</c:if>
						<c:forEach var="num" begin="${pc.beginPage }" end="${pc.endPage }">
							<li class="${pc.paging.pageNum == num ? 'active' : '' }"><a href="/userList/userList?pageNum=${num}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}" data-pagenum='${num }'>${num }</a></li>
						</c:forEach>
						<c:if test="${pc.next }"><!-- 다음버튼 -->
		                    <li><a href="/userList/userList?pageNum=${pc.endPage+1}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}" data-pagenum="${pc.endPage-1 }"> >> </a></li>
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

	//특정 메시지 표현을 위한 스크립트
	const msg = '${msg}';
	
	if(msg != '') {
		alert(msg);
	}
	
	
	$(function() {
		
		$('#btn-common-regist').click(function() {
			$('#modal-common-regist').modal('show');
		});
		
	});
	
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
	
	//n개씩 보기  https://chobopark.tistory.com/95 참고
	function Change(idx){
	    var pagenum = idx;
	    var nowPaging = $("#pageUnit option:selected").val();
	    
	    if(nowPaging == 10){
	        location.href="${path}/userList/userList?pageIndex="+pagenum+"&cpp="+nowPaging;    
	    }else if(nowPaging == 15){
	        location.href="${path}/userList/userList?pageIndex="+pagenum+"&cpp="+nowPaging;    
	    }else if(nowPaging == 20){
	        location.href="${path}/userList/userList?pageIndex="+pagenum+"&cpp="+nowPaging;    
	    }
	}

</script>
