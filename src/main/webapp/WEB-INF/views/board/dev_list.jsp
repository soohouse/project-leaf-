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
   
   .mainbox .hr .headline {
   	text-align: left;
   	color : black;
   	border: 1px;
   }
   
   .head-control {
    background: white;
    margin-bottom: 15px;
    width: 100px;
    display: inline;
    height: 32px;
    border-radius: 5px;
   }

   .foot-control {
    width: 100px;
    display: inline;
    height: 32px;
    float:left;
    margin-top: 1px;
    border-radius: 5px;
   }

 


   
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
			            	<span class="main-notice-title">개발자 목록</span>
			            </a>
                 <select class="head-control mx-sm-3 mb-2 pull-left" >
                    <option>10개씩</option>
                    <option>20개씩</option>
                 </select>

                 
                <table class="table table-bordered"  style="text-align: center;">
                    <thead>
                        <tr>
                            <th style="background-color: #bbd0e7; text-align: center;">번호</th>
                            <th style="background-color: #bbd0e7; text-align: center;">ID</th>
                            <th style="background-color: #bbd0e7; text-align: center;">이름</th>
                            <th style="background-color: #bbd0e7; text-align: center;">전화번호</th>
                            <th style="background-color: #bbd0e7; text-align: center;">이메일</th>
                            <th style="background-color: #bbd0e7; text-align: center;">비고</th>
                            
                        </tr>
                    </thead>
                    
                    <tbody>
                    <!-- 개발자 목록 -->
                    <c:forEach var="userlist" items="${userlist}" varStatus="index">
                        <tr class="userListContent" style="cursor:pointer;">
                            <td>${userlist.userNO}</td>
                            <td id="userListContent${index.index}">${userlist.userID}</td>
                            <td>${userlist.userName}</td>
                            <td>${userlist.userPhone1}-${userlist.userPhone2}-${userlist.userPhone3}</td>
                            <td>${userlist.userEmail1}@${userlist.userEmail2}</td>
                            <td></td>
                        </tr>
                        
                         <%@ include file="../modal_mypage/developerInfo.jsp" %>
                  
                  <script>
                     
                     $(function() {
                        
                        $('#userListContent${index.index}').click(function() {
                           
                           $.ajax({
                              type: 'GET',
                              url: '<c:url value="/userList/userListContent?userNO=" />' + '${userList.userNO}',
                              
                              success: function(user) {
                                 $('#modal-user-id').text(user.userID);
                                 $('#modal-user-name').text(user.userName);
                                 $('#modal-user-email').text(user.userEmail1);
                                 $('#modal-user-phone').text(user.userPhone1);
                                 $('#modal-user-intro').text(user.userIntro);
                               
                                 
                                
                              },
                              
                              error: function() {
                                 alert('개발자 목록 상세 보기 요청 처리 중 서버오류가 발생했습니다.');
                                 return;
                              }
                           });
                           
                           $('#myModal').modal('show');
                        });
                        
                     });
                  
                  </script>
                  
               </c:forEach>
                   
                       
                    </tbody>
                </table>
                
                <form class="form-inline d-flex justify-content-end" method="GET", th:action="@{/board/boardList}" th:value="${param.searchText}">
				            <div class="form-group mx-sm-3 mb-2 pull-right">
				                <select class="foot-control" >
                                    <option>ID</option>
                                    <option>이름</option>
                                    <option>전화번호</option>
                                 </select>
				                <input type="text" class="form-control" id="searchText" name="searchText" placeholder="검색어를 입력하세요.">
				            	<button type="submit" class="btn btn-primary mb-2">검색 </button>
				            </div>
                        </form>
                
            </div>

            <div class="text-center">
                <ul class="pagination pagination-sm">
                    <li class="disabled"><a href="#""><<</a></li>
                    <li class="active"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">>></a></li>
                </ul>
            </div>
        </div> 
    </section>
    
    <%@ include file="../include/footer.jsp" %>
		  
	   
	</div>
	
		
   
</body>
</html>


<script>

		


</script>
