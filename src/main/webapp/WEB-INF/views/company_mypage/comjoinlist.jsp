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
			            	<span class="main-notice-title">기업 가입 관리</span>
			            </a>
                 <select class="head-control mx-sm-3 mb-2 pull-left" >
                    <option>10개씩</option>
                    <option>20개씩</option>
                    <option>30개씩</option>
                    <option>50개씩</option>
                    <option>100개씩</option>
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
                    
                        <tr href="#" style="cursor:pointer;">
                            <td>1</td>
                            <td style="text-align: left;">green123</td>
                            <td>(주) 그린컴퍼니</td>
                            <td>02-111-1111</td>
                            <td><a style="text-decoration:underline;">green123@co.kr</a></td>
                            <td>가입신청</td>
                       </tr>
                       <tr href="#" style="cursor:pointer;">
                            <td>2</td>
                            <td style="text-align: left;">samsung99</td>
                            <td>samsung</td>
                            <td>02-1333-9291</td>
                            <td><a style="text-decoration:underline;">samsung99@samsung.com</a></td>
                            <td>가입신청</td>
                        </tr>
                       <tr href="#" style="cursor:pointer;">
                            <td>3</td>
                            <td style="text-align: left;">gavia33</td>
                            <td>gavia</td>
                            <td>070-1234-0000</td>
                            <td><a style="text-decoration:underline;">gavia33@gavia.com</a></td>
                            <td>가입신청</td>
                        </tr>
                         <tr href="#" style="cursor:pointer;">
                            <td>4</td>
                            <td style="text-align: left;">sungjin123</td>
                            <td>(주) 성진하이텍</td>
                            <td>010-5555-7777</td>
                            <td><a style="text-decoration:underline;">sungjin123@naver.com</a></td>
                            <td>가입신청</td>
                        </tr>
                         <tr href="#" style="cursor:pointer;">
                            <td>5</td>
                            <td style="text-align: left;">naver99</td>
                            <td>NAVER</td>
                            <td>02-4111-1111</td>
                            <td><a style="text-decoration:underline;">naver99@naver.com</a></td>
                            <td>가입신청</td>
                        </tr>
                         <tr href="#" style="cursor:pointer;">
                            <td>6</td>
                            <td style="text-align: left;">pl1909</td>
                            <td>kakao</td>
                            <td>010-3333-1411</td>
                            <td><a style="text-decoration:underline;">pl1909@daum.net</a></td>
                            <td>가입신청</td>
                        </tr>
                        <tr href="#" style="cursor:pointer;">
                            <td>7</td>
                            <td style="text-align: left;">qwe1234</td>
                            <td>배달의민족</td>
                            <td>070-331-1211</td>
                            <td><a style="text-decoration:underline;">baemin@naver.com</a></td>
                            <td>가입신청</td>
                       </tr>
                      
									
                   
                       
                    </tbody>
                </table>
                
                <form class="form-inline d-flex justify-content-end" method="GET", th:action="@{/board/boardList}" th:value="${param.searchText}">
				            <div class="form-group mx-sm-3 mb-2 pull-right">
				                <select class="foot-control" >
                                    <option>ID</option>
                                    <option>이름</option>
                                    <option>전화번호</option>
                                    <option>비고</option>
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
