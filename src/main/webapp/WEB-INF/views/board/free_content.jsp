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

 	.tbody {
 		width: 100%;
 	
 	}

    .td{
        
        height:350px;
    }
    
    .freetitle {
    
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
			            	<span class="main-notice-title">자유게시판</span>
			            </a>
				
                     <div class="container my-1" >
                       <form action="<c:url value='/board/boardDelete'/>" method="post" name="boardDeleteForm">
	                        <div class="row" style="margin-bottom:50px;">
	                        	<div class="free_content" >
	                                   <div class="free_content_up" style="margin-left:30px;" >
			                                        <div class="free_title_up" scope="col" style="width: 100%;  margin-top:10px;">
			                                        	<input type="hidden" name="boardNo" value="${board.boardNo}">
			                                        	<h4 style="display:inline-block;">${board.boardTitle}</h4>
				                                        <a type="submit" id="btn-board-delete" class="btn mb-2" style="display: inline-block; float:right; margin-right:50px;">삭제</a>
			                                        </div>
			                                        
			                                        <div class="free_title_down" style="margin-top:30px;">
				                                        <div class="free_writer" style="display: inline-block;">
				                                            <img src="resources/img/logo2.png" width="50px" > ${board.boardWriter}
			                                       		</div>
			                                       		<div style="display:inline-block; float:right; margin-top:10px; margin-right:40px; color:gray;">
					                                        <div style="display:inline-block;" >
					                                            <fmt:formatDate value="${board.boardDate}" pattern="yyyy-MM-dd HH:mm" />
					                                        </div>
					                                        <div style="display:inline-block;">
					                                        	조회수 : 2
					                                        </div>
				                                        </div>
			                                        </div>
	                                    </div>
	
	                                    <div class="free_content_down" style="margin-top:30px; margin-left:30px; font-size:15px; margin-bottom: 30px;">
	                                        
	                                        	${board.boardContent}
	                                           
	                                    </div>
	                            </div>
	                 			
	                        </div>
                        </form>
                        <table class="table table-borderless"  style="text-align: center; font-size:12px;">
					                    <thead>
					                        <div style="background-color: #bbd0e7; " >
					                            <div style=" text-align: left; margin-left:10px; padding-top:10px; ">전체댓글
					                            	<p style="color:red; display:inline-block; ">4</p>
					                            </div>
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
														<input type="submit" class="btn" value="댓글입력" style="height:54px;">
													</div>
												</div>
												
										</div>
						                <div style="margin-top:20px;">
							                 <button type="submit" class=" mb-2 pull-left">신고하기 </button>
							                 <button type="button" id="btn-board-modify" class="btn btn-info mb-2 pull-right" onclick="location.href='<c:url value="/board/boardModify?boardNo=${board.boardNo}"/>'">수정하기</button>
				                             <button type="button" id="btn-board-list" class="btn btn-primary mb-2 pull-right" onclick="location.href='free_list'">목록 </button>
			                    		</div>
                    
                    
							</div>
						
				</div> 
	        </section> 
		
	   
	   
	    <%@ include file="../include/footer.jsp" %>
	</div>
   
   
  
</body>
</html>


<script>

	//목록 이동 버튼
	$(function() {
		$('#btn-board-list').click(function() {
			location.href='<c:url value="/board/boardList"/>';
		})
		
	});
		
		//삭제 버튼 처리
		$(function(){
	 	$('#btn-board-delete').click(function() {
	 		
	 		if(confirm('정말 삭제하시겠습니까?')) {
				document.boardDeleteForm.submit();
			}
	 	})
	});

</script>
