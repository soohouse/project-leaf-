<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	// 줄바꿈
	pageContext.setAttribute("br", "<br>");
	pageContext.setAttribute("cn", "\n");
%>
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
					 <!-- 공지사항 상단 -->
			            <a href="#" class="list-group-item active notice-list-top" style="margin-top: 20px;">
			            	<span class="main-notice-title">공지사항</span>
			            </a>
                	 
				
                     <div class="container my-1">
						<form action="<c:url value='/notice/noticeDelete'/>" method="post" name="noticeDeleteForm" >
                        <div class="row" >
                      		<!-- 공지사항 글 상세보기  -->
                            <div class="notice_content" >
                            	<div class="notice_content_up" style="margin-left:30px;" >
		                                        <div class="notice_title" scope="col" style="width: 100%;  margin-top:10px;">
		                                        	<input type="hidden" value="${notice.noticeNo}" name="noticeNo">
		                                        	<h4 style="display:inline-block;">${notice.noticeTitle}</h4>
		                                        	<c:if test="${notice.noticeWriter eq user.userID }">
				                                        <button type="button" id="btn-notice-delete" class="btn mb-2" style="display: inline-block; float:right; margin-right:50px;">삭제</button>
		                                        	</c:if>
		                                        </div>
		                                        
		                                        <div style="margin-top:30px;">
			                                        <div class="notice_writer" style="display: inline-block;">
			                                            <img src="<c:url value='/user/userProfileGet?userNO=${user.userNO}'/>" width="40px" height="40px" style="border-radius: 30px; margin-left: 10px; margin-right: -5px;" >
			                                            <span> 
			                                            	<span style="display: inline-block; font-size: 14px; font-weight: bold; font-family: sans-serif; margin-left:15px;">&nbsp; ${notice.noticeWriter} &nbsp;</span>
			                                            	<c:if test="${notice.noticeWriter eq user.userID }">
			                                            		<span style="background:lightgray; font-size:13px; color:#202020; padding:5px;">내가 작성한 글</span>
			                                            	</c:if>
			                                            </span>
		                                       		</div>
		                                       		<div style="display:inline-block; float:right; margin-top:10px; margin-right:40px; color:gray;">
				                                        <div style="display:inline-block;" >
				                                            <fmt:formatDate value="${notice.noticeDate}" pattern="yyyy-MM-dd HH:mm" />
				                                        </div>
				                                        <div style="display:inline-block;">
				                                        	조회수 : ${notice.noticeViews }
				                                        </div>
			                                        </div>
		                                        </div>
                                    </div>
								
                                    <div class="notice_content_down" style="min-height:300px; margin-top:50px; margin-left:30px; font-size:15px; margin-bottom: 30px;">
										${fn:replace(notice.noticeContent, cn, br) }
                                    </div>
	                 		</div>
	                            <hr class="borderline" />
	                            <c:if test="${notice.noticeWriter eq user.userID }">
		                            <button type="button" id="btn-notice-modify" class="btn btn-info pull-right" onclick="location.href='<c:url value="/notice/noticeModify?noticeNo=${notice.noticeNo}"/>'" style="margin-left:10px;">수정하기</button>
	                            </c:if>
	                            <button type="button" id="btn-notice-list" class="btn btn-primary mb-2 pull-right" onclick="location.href='<c:url value="/notice/noticeList"/>'" style="margin-left:10px;">목록</button>
                       	</form>
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

	const msg = '${msg}';
	if(msg !== '') {
		alert(msg);
	}

 	// 목록 이동 버튼
	$(function() {
		$('#btn-notice-list').click(function() {
			location.href='<c:url value="/notice/noticeList"/>';
		})
		
		$('#btn-notice-delete').click(function() {
			if(confirm('정말 삭제하시겠습니까?')) {
				document.noticeDeleteForm.submit();
			} else {
				return false;
			}
		});
	});
 	
</script>
