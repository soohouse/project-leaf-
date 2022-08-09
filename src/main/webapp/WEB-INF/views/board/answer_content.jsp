<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- 글 내용 줄 개행 처리를 위해 추가 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

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
			            	<span class="main-notice-title">Q&A</span>
			            </a>
                     <div class="container my-1">
                       <form action="<c:url value='/question/questionDelete'/>" methon="post" name="questionDeleteForm">
                        <div class="row">
                            <div class="qa_content" >
                                    <div class="qa_content_up" style="margin-left:30px;" >
		                                        <div class="qa_title" scope="col" style="width: 100%;  margin-top:10px;">
		                                        	<input type="hidden" id="hidden-questionNo" name="questionNo" value="${question.questionNo}">
		                                        	<h4 style="display:inline-block;">${question.questionTitle}</h4>
			                                        <a type="submit" id="btn-question-delete" class="btn mb-2" style="display: inline-block; float:right; margin-right:50px;">삭제</a>
		                                        </div>
		                                        
		                                        <div style="margin-top:30px;">
			                                        <div class="qa_writer" style="display: inline-block;">
			                                            <img src="resources/img/logo2.png" width="50px" > ${question.questionWriter}
		                                       		</div>
		                                       		<div style="display:inline-block; float:right; margin-top:10px; margin-right:40px; color:gray;">
				                                        <div style="display:inline-block;" >
				                                            <fmt:formatDate value="${question.questionDate}" pattern="yyyy-MM-dd HH:mm" />
				                                        </div>
				                                        <div style="display:inline-block;">
				                                        	조회수 : 2
				                                        </div>
			                                        </div>
		                                        </div>
                                    </div>

                                    <div class="qa_content_down" style="margin-top:30px; margin-left:30px; font-size:15px; margin-bottom: 30px;">
                                        
                                        	${fn:replace(question.questionContent, newLineChar, '<br/>')}
                                           
                                    </div>
                            </div>
                             <hr class="borderline" />
                             <a type="submit" class=" mb-2" style="margin-left:20px;">신고하기</a>
                             <button type="button" id="btn-question-list" class="btn btn-info mb-2 pull-right">목록 </button>
                             <button type="button" class="btn btn-primary mb-2 pull-right" onclick="location.href='qna_modify'">수정 </button>
                             <button type="button" class="btn btn-success mb-2 pull-right">답변하기 </button>
                           
                        </div>
                      </form>  
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
		$('#btn-question-list').click(function() {
			location.href='<c:url value="/question/questionList"/>';
		});
		
	});
	
	//삭제 버튼 처리
	$(function(){
	 	$('#btn-question-delete').click(function() {
	 		
	 		if(confirm('정말 삭제하시겠습니까?')) {
				document.questionDeleteForm.submit();
			}
	 	});
	});



</script>
