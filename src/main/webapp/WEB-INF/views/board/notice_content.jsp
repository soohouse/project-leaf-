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

 	.tbody {
 		width: 100%;
 	
 	}

    .td{
        
        height:350px;
    }
    
    .borderline {
    	border-bottom:0.5px solid black;
    	margin-top: 10px;
    	margin-bottom: 10px;
    	
    }
    
    .maintitle {
    	margin-left : 30px;
    	margin-top : 20px;
    }
    
  
    
    .headtable {
    
    }

    
    .bottomtable {
    	margin-top:30px;
    
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
			            	<span class="main-notice-title">공지사항</span>
			            </a>
                	 
				
                     <div class="container my-1">

                        <div class="row" >
                            <div class="notice_content" >
                            	<div class="notice_content_up" style="margin-left:30px;" >
		                                        <div class="notice_title" scope="col" style="width: 100%;  margin-top:10px;">
		                                        	<h4 style="display:inline-block;">[기업] 공지사항 1 </h4>
			                                        <a type="submit" class="btn mb-2" style="display: inline-block; float:right; margin-right:50px;">삭제</a>
		                                        </div>
		                                        
		                                        <div style="margin-top:30px;">
			                                        <div class="notice_writer" style="display: inline-block;">
			                                            <img src="resources/img/logo2.png" width="50px" > kim1234
		                                       		</div>
		                                       		<div style="display:inline-block; float:right; margin-top:10px; margin-right:40px; color:gray;">
				                                        <div style="display:inline-block;" >
				                                            2022-07-22
				                                        </div>
				                                        <div style="display:inline-block;">
				                                        	조회수 : 95
				                                        </div>
			                                        </div>
		                                        </div>
                                    </div>

                                    <div class="notice_content_down" style="margin-top:30px; margin-left:30px; font-size:15px; margin-bottom: 30px;">
                                        
                                        	관리자입니다.<br>
											<br>
                                            기업 회원분들에게 알려드립니다.<br>
                                            2022년 7월 18일 기업 회원 데이터베이스 점검 예정입니다.<br>
                                            기업 회원분들께서는 해당 기간에는 로그인을 자제해주시길 바라며,<br>
                                            변경사항을 꼭 저장해주시기 바랍니다.<br>
                                            <br>
                                            감사합니다.
                                           
                                    </div>
                 			</div>
                            <hr class="borderline" />
                            <input type="submit" class="btn btn-info pull-right" onclick="location.href='notice_modify'" value="수정하기">
                            <button type="submit" class="btn btn-primary mb-2 pull-right" onclick="location.href='notice_list'">목록</button>
                            
                        </div>
                    </div>
				</div>
			</div> 
        </section> 
		
	   
	   
	    <%@ include file="../include/footer.jsp" %>
	</div>
   
   
  
</body>
</html>


<script>



</script>
