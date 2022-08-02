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
			            	<span class="main-notice-title">자료실</span>
			            </a>
				
                     <div class="container my-1">
                        <div class="row" style="margin-bottom:50px;">
                        	<div class="data_content" >
                                    <div class="data_content_up" style="margin-left:30px;" >
		                                        <div class="data_title" scope="col" style="width: 100%;  margin-top:10px;">
		                                        	<h4 style="display:inline-block;">Eclipse 공유합니다. </h4>
			                                        <a type="submit" class="btn mb-2" style="display: inline-block; float:right; margin-right:50px;">삭제</a>
		                                        </div>
		                                        
		                                        <div style="margin-top:30px;">
			                                        <div class="data_writer" style="display: inline-block;">
			                                            <img src="resources/img/logo2.png" width="50px" > test22
		                                       		</div>
		                                       		<div style="display:inline-block; float:right; margin-top:10px; margin-right:40px; color:gray;">
				                                        <div style="display:inline-block;" >
				                                            2022.07.10
				                                        </div>
				                                        <div style="display:inline-block;">
				                                        	조회수 : 211
				                                        </div>
			                                        </div>
		                                        </div>
                                    </div>

                                    <div class="data_content_down" style="margin-top:30px; margin-left:30px; font-size:15px; margin-bottom: 30px;">
                                        <div>
                                        	대표적인 Java 개발 툴인 Eclipse 0.0.0 버전 공유합니다.<br>
											<br>
                                            유용하게 사용하셨으면 좋겠습니다 ^^<br>
                                            <br>
                                            2차 배포는 금지합니다<br>
                                        </div>   
                                    
	                                    <div style="margin-top:30px;">
	                                    	<a class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></a>
	                                        <a>Eclipse-0.0.0.zip</a>
	                                    </div>
                                    </div>
                            </div>
                        
                        
                       
                                
                                <table class="table table-borderless"  style="text-align: center; font-size:12px;">
				                    <thead>
				                    	<div style="background-color: #bbd0e7;" >
				                            <div style=" text-align: left; margin-left:10px; padding-top:10px;">전체댓글
				                            	<p style="color:red; display:inline-block; ">4</p></div>
				                        </div>  
				                       
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
						                
						                <div style="background-color:#bbd0e7; height: 120px; ">
				                        		<div style="text-align:left; margin: 10px 10px 10px 10px; padding-top:10px;">회원만 댓글 작성이 가능합니다.</div>
				                        		<div>
				                        			<div>
						                        		<textarea type="text" class="form-control col-md-8 col-sm-10" placeholder="댓글을 입력하세요." name="replyContent" maxlength="2048" style="float:left; width:85%;  margin-left:30px;"></textarea>
													</div>
													<div style=" margin-bottom:10px; float:right; margin-right: 40px; width:5%;">
														<button type="submit" class="btn btn-light" style="height:54px;">댓글입력</button>
													</div>
												</div>
										</div>
							               
                                

	                            <div style="margin-top:20px;">
		                             <button type="submit" class="btn btn-light mb-2 pull-left">신고하기 </button>
		                             <button type="submit" class="btn btn-info mb-2 pull-right" onclick="location.href='data_modify'">수정 </button>
		                             <button type="submit" class="btn btn-primary mb-2 pull-right" onclick="location.href='data_list'">목록 </button>
								</div>
                            
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
