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

                <h2>개발자 목록</h2>
                <hr class="headline">
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
                    
                        <tr>
                            <td>1</td>
                            <td style="text-align: left;"><a>kim1234</a></td>
                            <td>김철수</td>
                            <td>010-1111-1111</td>
                            <td>kim1234@naver.com</td>
                            <td></td>
                        </tr>

                        <tr>
                            <td>2</td>
                            <td style="text-align: left;"><a>hong123</a></td>
                            <td>홍길동</td>
                            <td>010-2222-2222</td>
                            <td>hong123@gmail.com</td>
                            <td></td>
                        </tr>

                        <tr>
                            <td>3</td>
                            <td style="text-align: left;"><a>kim1234</a></td>
                            <td>김철</td>
                            <td>010-1111-1111</td>
                            <td>kim123@naver.com</td>
                            <td></td>
                        </tr>
                      
									
                   
                       
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
                    <li><a href="#"><<</a></li>
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
