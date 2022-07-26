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
					 <h2>Q&A</h2>
                	 <hr class="headline">
				
                     <div class="container my-1 col-lg-8 col-md-10 col-sm-12">
                        <div class="row">
                            <table class="table">
                                <thead>
                                    <tr class="table-active">
                                        <th scope="col" style="width: 60%"><h4>A. 경력이 없어도 프로젝트에 지원할 수 있을까요...?
											<br><br><br>
                                            <img src="/img/logo2.png"> kim1234
										</th>
                                        <th scope="col" style="width: 40%" class="text-right">
                                        <a type="submit" class="btn mb-2" style="color:red;">삭제</a> </h4>
                                        <br><br><br>
                                            55분전 &nbsp;&nbsp; 조회수 : 2
                                            <br> </th>
                                    </tr>
                                </thead>
                 
                                <tbody>
                                    <tr>
                                        
                                        <td style="width: 70%" class="text-left">
                                        
                                        	물론입니다!!<br>
											<br>
                                            비전공자라도 충분히 프로젝트에 지원할 수 있습니다.<br>
                                            부담갖지 마시고 얼른 지원해보세요~<br>
                                           
                                         </td>
                                    </tr>
                                </tbody>
                            </table>
                             <a type="submit" class=" mb-2 pull-left">신고하기</a>
                             <button type="submit" class="btn btn-info mb-2 pull-right" onclick="location.href='qa_list'">목록 </button>
                             <button type="submit" class="btn btn-primary mb-2 pull-right" onclick="location.href='qa_modify'">수정 </button>
                             <button type="submit" class="btn btn-success mb-2 pull-right">답변하기 </button>
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
