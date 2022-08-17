<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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

	.text-center #active-button {
	background: #92bce0;
	}


   
   </style>
   
</head>
<body>

<%@ include file="../include/header.jsp" %>
	   
	<div class="mainbox">
	
		<section>
        
       
        
        
        <div class="container" style="width: 90%;">
            <div class="row">
						<!-- 메인화면 공지사항 상단 -->
			            <a href="#" class="list-group-item active notice-list-top" style="margin-top: 20px;">
			            	<span class="main-notice-title">Q&A</span>
			            </a>
                 <select class="head-control mx-sm-3 mb-2 pull-left" >
                    <option>10개씩</option>
                    <option>20개씩</option>
                 </select>
                 <button type="submit" class="btn btn-success mb-2 pull-right" id="btn-question-write">질문하기</button>
                 
                 
                <table class="table table-bordered"  style="text-align: center; font-size:15px;">
                    <thead>
                        <tr>
                            <th style="background-color: #bbd0e7; text-align: center; width:5%">번호</th>
                            <th style="background-color: #bbd0e7; text-align: center; width:62%">제목</th>
                            <th style="background-color: #bbd0e7; text-align: center; width:10%">작성자</th>
                            <th style="background-color: #bbd0e7; text-align: center; width:15%">등록일자</th>
                            <th style="background-color: #bbd0e7; text-align: center; width:8%">조회수</th>
                            
                        </tr>
                    </thead>
                    
                    <tbody>
                      <!-- 질문글 목록 -->
                      <c:forEach var="question" items="${questionList}">
                        <tr>
                            <td>${question.questionNo}</td>
                            <td style="text-align: left;">
                            	<a href="<c:url value='/question/questionContent/${question.questionNo}'/>">${question.questionTitle}</a>
                            </td>
                            <td>${question.questionWriter}</td>
                            <td><fmt:formatDate value="${question.questionDate}" pattern="yyyy-MM-dd HH:mm" /></td>
                            <td>4</td>
                        </tr>
					</c:forEach>
                       
                    </tbody>
                </table>
                
                <form class="form-inline d-flex justify-content-end" method="GET", th:action="@{/board/boardList}" th:value="${param.searchText}">
				            <div class="form-group mx-sm-3 mb-2 pull-right">
				                <select class="foot-control" >
                                    <option>제목</option>
                                    <option>작성자</option>
                                    <option>등록일자</option>
                                 </select>
				                <input type="text" class="form-control" id="searchText" name="searchText" placeholder="검색어를 입력하세요.">
				            	<button type="submit" class="btn btn-primary mb-2">검색 </button>
				            </div>
                        </form>
                
            </div>

            <div class="text-center">
                <ul class="pagination pagination-sm">
                    <li id="active-button"><a href="#"><<</a></li>
                    <li class="active"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li id="active-button"><a href="#">>></a></li>
                </ul>
            </div>
        </div> 
    </section>
    
    <%@ include file="../include/footer.jsp" %>
		  
	   
	</div>
	
		
   
</body>
</html>


<script>

//글쓰기 페이지 이동 버튼
$(function() {
	$('#btn-question-write').click(function() {
		location.href='<c:url value="/question/questionWrite" />';
	})
	
});


</script>
