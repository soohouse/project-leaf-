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
			            
			         <!-- 질문글 상세보기 -->
                     <div class="container my-1">
                       <form action="<c:url value='/question/questionDelete'/>" method="post" name="questionDeleteForm">
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
			                                            <img src="<c:url value='/user/userProfileGet?userNO=${user.userNO}'/>" width="40px" height="40px" style="border-radius: 30px; margin-left: 10px; margin-right: -5px;" > 
			                                            <div style="display: inline-block; font-size: 14px; font-weight: bold; font-family: sans-serif; margin-left:15px;">${question.questionWriter}</div>
			                                            
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

                                    <div class="qa_content_down" style="min-height:300px; margin-top:30px; margin-left:30px; font-size:15px; margin-bottom: 30px;">
                                        
                                        	${fn:replace(question.questionContent, newLineChar, '<br/>')}
                                           
                                    </div>
                            </div>
                             <hr class="borderline" style="margin-bottom:40px;" />
                             <a type="submit" class=" mb-2" style="margin-left:20px;">신고하기</a>
                             <button type="button" id="btn-question-list" class="btn btn-info mb-2 pull-right">목록 </button>
                             <button type="button" class="btn btn-primary mb-2 pull-right" onclick="location.href='<c:url value="/question/questionModify?questionNo=${question.questionNo}"/>'">수정 </button>
                             <button type="button" id="btn-go-answer" class="btn btn-success mb-2 pull-right">답변하기 </button>
                           
                        </div>
                      </form>  
                    </div>
                    
                    <div id="answerList">
                    
                    	
                    
                    </div>
                    
              		
				</div>
			</div> 
        </section> 
		
	   
	   
	    <%@ include file="../include/footer.jsp" %>
	</div>
   
   
  
</body>
</html>


<script>

	
	$(function() {
		 
		
		//답글 목록(상세보기) 시작
		let questionNo = $('#hidden-questionNo').val();
		let strAdd = '';
		
		$.ajax({
			type: 'POST',
			url: '<c:url value="/question/answerList/" />',
			
			dataType: 'json',
			
			data: {
				'questionNo': questionNo
			},
			
			success: function(result) {
				
				let answerList = result.answerList;
				
				for(let i = 0; i < answerList.length; i++) {
					
					var timestamp = answerList[i].answerDate;
					var date = new Date(timestamp).toISOString().replace("T", "").replace(/\..*/, "");
					
					strAdd +=
						`<hr class="borderline" style="margin-bottom:15px; margin-top:25px;" />
		                    <div class="row">
		                            <div class="qa_content" >
		                                    <div class="qa_content_up" style="margin-left:30px;" >
				                                   <div class="qa_title" scope="col" style="width: 100%;  margin-top:10px;">
				                                       
				                                       	<h4 style="display:inline-block;">` + answerList[i].answerTitle + `</h4>
					                                    <a type="submit" id="btn-answer-delete" class="btn mb-2" style="display: inline-block; float:right; margin-right:50px;">삭제</a>
				                                       	<a type="button" id="btn-answer-update`+answerList[i].answerNo+`" class="btn mb-2" style="display: inline-block; float:right;">수정</a>
				                                   </div>
				                                   
				                                   <div style="margin-top:30px;">
					                                    <div class="qa_writer" style="display: inline-block;">
					                                        <img src="<c:url value='/user/userProfileGet?userNO=${user.userNO}'/>" width="40px" height="40px" style="border-radius: 30px; margin-left: 10px; margin-right: -5px;" > 
					                                        <div style="display: inline-block; font-size: 14px; font-weight: bold; font-family: sans-serif; margin-left:15px;">` + answerList[i].answerWriter + `</div>
					                                            
				                                        </div>
				                                       	<div style="display:inline-block; float:right; margin-top:10px; margin-right:40px; color:gray;">
						                                    <div style="display:inline-block;" >
						                                        ` + date + `
						                                    </div>
					                                    </div>
				                                   </div>
		                                    </div>
		
		                                    <div class="qa_content_down" style="min-height:300px; margin-top:30px; margin-left:30px; font-size:15px; margin-bottom: 30px;">
		                                        
		                                        	` + answerList[i].answerContent + `
		                                           
		                                    </div>
		                            </div>
		                             <hr class="borderline" style="margin-bottom:40px;" />
		                        </div>`;
						
				}
				
				$('#answerList').html(strAdd);
 				
			},
			
			error: function() {
				alert('답변 글을 불러오는 중 서버오류가 발생했습니다.');
				return;
			}
			
			
			
		}); //답글 목록(상세보기) 끝
		
		
		//답글 수정 이동 버튼
		$('#btn-answer-update${answer.answerNo}').click(function(){
				
				location.href='<c:url value="/question/answerModify?answerNo=${answer.answerNo}"/>';
			});
		
		
		
		
		
		//목록 이동 버튼
		$('#btn-question-list').click(function() {
			location.href='<c:url value="/question/questionList"/>';
		});

	
		//질문글 삭제 버튼 처리
	 	$('#btn-question-delete').click(function() {
	 		
	 		if(confirm('정말 삭제하시겠습니까?')) {
				document.questionDeleteForm.submit();
			}
	 	});
		
	
		//답변글 작성 페이지로 이동 버튼
		$('#btn-go-answer').click(function() {
			const questionNo = $('#hidden-questionNo').val();
			
			location.href='<c:url value="/question/answerWrite/"/>' + questionNo;
		});
		
		
	});	//끝
	
	
	

	



</script>
