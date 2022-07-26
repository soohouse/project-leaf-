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
					 <h2>자료실</h2>
                	 <hr class="headline">
				
                     <div class="container my-1 col-lg-8 col-md-10 col-sm-12">
                        <div class="row">
                            <table class="table">
                                <thead>
                                    <tr class="table-active">
                                        <th scope="col" style="width: 60%"><h4>Eclipse 공유합니다.</h4>
                                            <br>
                                            <img src="img/logo2.png"> test22
											</th>
                                        <th scope="col" style="width: 40%" class="text-right">
                                            2022.07.10 &nbsp;&nbsp; 조회수 : 211
                                            <br> </th>
                                    </tr>
                                </thead>
                 
                                <tbody>
                                    <tr>
                                        
                                        <td style="width: 70%" class="text-left">
                                        
                                        	대표적인 Java 개발 툴인 Eclipse 0.0.0 버전 공유합니다.<br>
											<br>
                                            유용하게 사용하셨으면 좋겠습니다 ^^<br>
                                            <br>
                                            2차 배포는 금지합니다<br>
                                           
                                         </td>
                                         
                                    </tr>
                                    
                                    	 <td>
                                         	<a class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></a>
                                         	<a>Eclipse-0.0.0.zip</a>
                                         </td>
                                </tbody>
                                
                                 <table class="table table-borderless"  style="text-align: center;">
			                    <thead>
			                        <tr>
			                            <th style="background-color: #bbd0e7; text-align: left;">전체댓글</th>
			                            <th style="background-color: #bbd0e7; text-align: center;"></th>
			                            <th style="background-color: #bbd0e7; text-align: center;"></th>
			                            <th style="background-color: #bbd0e7; text-align: center;"></th>
			                            <th style="background-color: #bbd0e7; text-align: center;"></th>
			                        </tr>
			                    </thead>
			                    
			                    <tbody>
			                    
			                        <tr>
			                            <td style="text-align: left;">kim1234</td>
			                            <td style="text-align: left;">안녕하세요~ 저도 잘 부탁드려요!</td>
			                            <td>2022.07.17</td>
			                            <td><a class="glyphicon glyphicon-ok" aria-hidden="true"></a></td>
										<td><a class="glyphicon glyphicon-remove" aria-hidden="true"></a></td>
			                        </tr>
			
			                        <tr>
			                            <td style="text-align: left;">Test22</td>
			                            <td style="text-align: left;">반갑습니다! 새로운 얼굴이네요~</td>
			                            <td>2022.07.17</td>
			                            <td><a class="glyphicon glyphicon-ok" aria-hidden="true"></a></td>
										<td><a class="glyphicon glyphicon-remove" aria-hidden="true"></a></td>
			                        </tr>
			
			                        <tr>
			                            <td style="text-align: left;">Asdf555</td>
			                            <td style="text-align: left;">저도 방금 왔어요! 함께 잘 나가봅시다~</td>
			                            <td>2022.07.17</td>
			                            <td><a class="glyphicon glyphicon-ok" aria-hidden="true"></a></td>
										<td><a class="glyphicon glyphicon-remove" aria-hidden="true"></a></td>
			                        </tr>
			                        
			                        <tr>
			                            <td style="text-align: left;">hong123</td>
			                            <td style="text-align: left;">모두들 환영해주셔서 감사합니다!</td>
			                            <td>2022.07.17</td>
			                            <td><a class="glyphicon glyphicon-ok" aria-hidden="true"></a></td>
										<td><a class="glyphicon glyphicon-remove" aria-hidden="true"></a></td>
			                        </tr>
			                        


			                    </tbody>
			                    
			                    
			                  
			                    	
			                        
			                          
			                </table>
			                
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
						                
						                <ul>
			                        	<li style="text-align:left;">회원만댓글 작성이 가능합니다.</li>
			                        </ul>
						              </div>
                                
                            </table>
                             <button type="submit" class="btn btn-light mb-2 pull-left">신고하기 </button>
                             <button type="submit" class="btn btn-info mb-2 pull-right" onclick="location.href='data_modify'">수정 </button>
                             <button type="submit" class="btn btn-primary mb-2 pull-right" onclick="location.href='data_list'">목록 </button>
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
