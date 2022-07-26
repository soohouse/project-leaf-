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

 	.tbody {
 		width: 100%;
 	
 	}

    .td{
        
        height:350px;
    }
 
   </style>
   
</head>
<body>

<%@ include file="../include/header.jsp" %>
	   
	<div class="mainbox">
	
        <section>
            <div class="container">
				<div class="row">
					 <h2>공지사항</h2>
                	 <hr class="headline">
				
                     <div class="container my-1 col-lg-8 col-md-10 col-sm-12">
                        <div class="row">
                            <table class="table">
                                <thead>
                                    <tr class="table-active">
                                        <th scope="col" style="width: 60%"><h4>[기업] 공지사항 1 </h4>
                                            <br><br><br>
                                            <img src="img/logo2.png"> 관리자
</th>
                                        <th scope="col" style="width: 40%" class="text-right">
                                        <a type="submit" class="btn mb-2" style="color:red;">삭제</a>
                                        <br><br><br>
                                            2022-07-22 &nbsp;&nbsp; 조회수 : 95
                                            <br> </th>
                                    </tr>
                                </thead>
                 
                                <tbody>
                                    <tr>
                                        
                                        <td style="width: 70%" class="text-left">
                                        
                                        	관리자입니다.<br>
											<br>
                                            기업 회원분들에게 알려드립니다.<br>
                                            2022년 7월 18일 기업 회원 데이터베이스 점검 예정입니다.<br>
                                            기업 회원분들께서는 해당 기간에는 로그인을 자제해주시길 바라며,<br>
                                            변경사항을 꼭 저장해주시기 바랍니다.<br>
                                            <br>
                                            감사합니다.
                                         </td>
                                    </tr>
                                </tbody>
                            </table>
                            <input type="submit" class="btn btn-info pull-right" onclick="location.href='notice_modify'" value="수정하기">
                            <button type="submit" class="btn btn-primary mb-2 pull-right" onclick="location.href='notice_list'">목록</button>
                            <hr />
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
