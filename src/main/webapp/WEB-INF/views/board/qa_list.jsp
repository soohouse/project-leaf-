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

	.text-center #active-button {
	background: #92bce0;
	}


   
   </style>
   
</head>
<body>

<%@ include file="../include/header.jsp" %>
	   
	<div class="mainbox">
	
		<section>
        
       
        
        
        <div class="container">
            <div class="row">

                <h2>Q&A</h2>
                <hr class="headline">
                 <select class="head-control mx-sm-3 mb-2 pull-left" >
                    <option>10개씩</option>
                    <option>20개씩</option>
                 </select>
                 <button type="submit" class="btn btn-success mb-2 pull-right" onclick="location.href='qa_write'">질문하기</button>
                 
                 
                <table class="table table-bordered"  style="text-align: center; border: 1px gray">
                    <thead>
                        <tr>
                            <th style="background-color: #bbd0e7; text-align: center;">번호</th>
                            <th style="background-color: #bbd0e7; text-align: center;">제목</th>
                            <th style="background-color: #bbd0e7; text-align: center;">작성자</th>
                            <th style="background-color: #bbd0e7; text-align: center;">등록일자</th>
                            <th style="background-color: #bbd0e7; text-align: center;">조회수</th>
                            
                        </tr>
                    </thead>
                    
                    <tbody>
                    
                        <tr>
                            <td>1</td>
                            <td style="text-align: left;"><a onclick="location.href='qa_content'">Q.경력이 없어도 프로젝트에 지원할 수 있을까요...?</a></td>
                            <td>Hong123</td>
                            <td>1시간 전</td>
                            <td>4</td>
                        </tr>

                        <tr>
                            <td></td>
                            <td style="text-align: left;"><a>A.경력이 없어도 프로젝트에 지원할 수 있을까요...?</a></td>
                            <td>kim1234</td>
                            <td>55분 전</td>
                            <td>2</td>
                        </tr>

                        <tr>
                            <td>2</td>
                            <td style="text-align: left;"><a>Q.질문 내용...</a></td>
                            <td>Hong123</td>
                            <td>2022-07-22</td>
                            <td>12</td>
                        </tr>
                        
                        <tr>
                            <td>3</td>
                            <td style="text-align: left;"><a>Q.질문 내용...</a></td>
                            <td>Hong123</td>
                            <td>2022-07-22</td>
                            <td>12</td>
                        </tr>
                        
                        <tr>
                            <td>4</td>
                            <td style="text-align: left;"><a>Q.질문 내용...</a></td>
                            <td>Hong123</td>
                            <td>2022-07-22</td>
                            <td>12</td>
                        </tr>
                      
									
                   
                       
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



</script>
