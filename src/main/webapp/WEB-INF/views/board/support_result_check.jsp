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
			            	<span class="main-notice-title">지원 결과 조회</span>
			            </a>
                 <select class="head-control mx-sm-3 mb-2 pull-left" >
                    <option>10개씩</option>
                    <option>20개씩</option>
                 </select>

                 
                <table class="table table-bordered"  style="text-align: center;">
                    <thead>
                        <tr>
                            <th style="background-color: #bbd0e7; text-align: center;">번호</th>
                            <th style="background-color: #bbd0e7; text-align: center;">프로젝트 명</th>
                            <th style="background-color: #bbd0e7; text-align: center;">지원날짜</th>
                            <th style="background-color: #bbd0e7; text-align: center;">모집기간</th>
                            <th style="background-color: #bbd0e7; text-align: center;">결과</th>
                            
                        </tr>
                    </thead>
                    
                    <tbody>
                    
                        <tr>
                            <td>1</td>
                            <td style="text-align: left;"><a>2022년 환경 푸르미 프로젝트 개발자 모집</a></td>
                            <td>2022.07.14</td>
                            <td>2022.07.10 ~ 2022.07.22</td>
                            <td style="color:green;">1차 서류 심사중</td>
                        </tr>

                        <tr>
                            <td>2</td>
                            <td style="text-align: left;"><a>2022년 환경 푸르미 프로젝트 개발자 모집</a></td>
                            <td>2022.07.14</td>
                            <td>2022.07.10 ~ 2022.07.22</td>
                            <td style="color:blue;" >2차 면접 인터뷰 심사중</td>
                        </tr>

                        <tr>
                            <td>3</td>
                            <td style="text-align: left;"><a>2022년 환경 푸르미 프로젝트 개발자 모집</a></td>
                            <td>2022.07.14</td>
                            <td>2022.07.10 ~ 2022.07.22</td>
                            <td style="color:red;">불합격</td>
                        </tr>
                        
                         <tr>
                            <td>4</td>
                            <td style="text-align: left;"><a>2022년 환경 푸르미 프로젝트 개발자 모집</a></td>
                            <td>2022.07.14</td>
                            <td>2022.07.10 ~ 2022.07.22</td>
                            <td style="color:lightpurple;">진행중</td>
                        </tr>
                      
									
                   
                       
                    </tbody>
                </table>
                
                <form class="form-inline d-flex justify-content-end" method="GET", th:action="@{/board/boardList}" th:value="${param.searchText}">
				            <div class="form-group mx-sm-3 mb-2 pull-right">
				                <select class="foot-control" >
                                    <option>프로젝트 명</option>
                                    <option>지원날짜</option>
                                    <option>결과</option>
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
