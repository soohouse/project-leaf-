<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
<head>

   <meta charset="UTF-8">

   <title>RunWith</title>
   
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
   .container { min-height: 500px; }
   
   .mainbox .hr .headline {
   	text-align: left;
   	color : black;
   	border: 1px;
   	min-height: 2000px;
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
   
   </style>
   
</head>
<body>

<%@ include file="../include/header.jsp" %>
	   
	<div class="mainbox">
	
		<section>
        
       
        
        
        <div class="container" style="width: 90%;">
            <div class="row">
				<!-- 메인화면 공지사항 상단 -->
			            <a href="#" class="list-group-item active notice-list-top" style="margin-top: 20px;">
			            	<span class="main-notice-title">자료실</span>
			            </a>
                  
                <select id="pageUnit" name="pageUnit" onchange="Change(1)" class="head-control mx-sm-3 mb-2" style="float:left;">
			        <option value="10" <c:if test="${pc.paging.cpp == 10}">selected</c:if>>10개씩 보기</option>
			        <option value="15" <c:if test="${pc.paging.cpp == 15}">selected</c:if>>15개씩 보기</option>
			        <option value="20" <c:if test="${pc.paging.cpp == 20}">selected</c:if>>20개씩 보기</option>
				</select>
			    <c:if test="${user.userID != null || company.companyID != null }">
					<button type="submit" class="btn btn-success mb-2 pull-right" id="btn-archive-write">글쓰기</button>
	            </c:if>
                 
                <table class="table table-bordered"  style="text-align: center; font-size:14px; font-family:Helvetica Neue, Helvetica, Arial, sans-serif;">
                    <thead>
                        <tr>
                            <th style="background-color: #bbd0e7; text-align: center; width:5%">번호</th>
                            <th style="background-color: #bbd0e7; text-align: center; width:62%">제목</th>
                            <th style="background-color: #bbd0e7; text-align: center; width:10%">작성자</th>
                            <th style="background-color: #bbd0e7; text-align: center; width:15%">등록일자</th>
                            <th style="background-color: #bbd0e7; text-align: center; width:8%">조회수</th>
                            
                        </tr>
                    </thead>
                    
                    <tbody>
                      <c:forEach var="archive" items="${archiveList}">
                        <tr>
                            <td>${archive.rn}</td>
                            <td style="text-align: left;">
                            	<a href="<c:url value='/archive/archiveContent/${archive.archiveNo}${pc.makeURI(pc.paging.pageNum)}'/>">
                            		${archive.archiveTitle}
                            		<!-- new마크 -->
                            		<c:if test="${archive.archiveDate>=nowday }">
	                            		<img alt="newmark" src="<c:url value='/resources/img/newmark.gif' />">
									</c:if>
									<!-- 댓글수 -->
									<c:if test="${archive.archiveReplyCount >= 1}">
										<span style="color:red; font-size:15px;">[${archive.archiveReplyCount}]</span>
									</c:if>
                            	</a>
                            	<a class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></a>
                            </td>
                            <td <c:if test="${archive.archiveWriter eq user.userID || archive.archiveWriter eq company.companyID}">style="color:#042894;"</c:if>>
                            	${archive.archiveWriter}
                            </td>
                            <td><fmt:formatDate value="${archive.archiveDate}" pattern="yyyy-MM-dd HH:mm" /></td>
                            <td>${archive.archiveViews }</td>
                        </tr>
					  </c:forEach>
                    </tbody>
                </table>
                
				<!-- 검색  https://rsorry.tistory.com/270참고-->
				<form class="form-inline d-flex justify-content-end" action="<c:url value='/archive/archiveList'/>" >
					<div class="form-group mx-sm-3 mb-2 pull-right">
						<select class="foot-control search-select" name="condition">
							<option value="title" ${pc.paging.condition == 'title' ? 'selected' : ''}>제목</option>
							<option value="writer" ${pc.paging.condition == 'writer' ? 'selected' : ''}>작성자</option>
							<option value="date" ${pc.paging.condition == 'date' ? 'selected' : ''}>등록일자</option>
						</select>
						<input type="text" name="keyword" class="form-control search-input" value="${pc.paging.keyword}" placeholder="검색어를 입력하세요.">
						<button type="submit" class="btn btn-primary mb-2">검색 </button>
					</div>
				</form>
           
            </div>

			<!-- 자료실 페이징 -->
            <div class="text-center">
				<form action="<c:url value='/board/archive_list'/>" name="pageForm">
	                <ul class="pagination pagination-sm">
						<c:if test="${pc.prev }"><!-- 이전버튼 -->
		                    <li><a href="/archive/archiveList?pageNum=${pc.beginPage-1}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}" data-pagenum="${pc.beginPage-1 }"> < </a></li>					
						</c:if>
						<c:forEach var="num" begin="${pc.beginPage }" end="${pc.endPage }">
							<li class="${pc.paging.pageNum == num ? 'active' : '' }"><a href="/archive/archiveList?pageNum=${num}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}" data-pagenum='${num }'>${num }</a></li>
						</c:forEach>
						<c:if test="${pc.next }"><!-- 다음버튼 -->
		                    <li><a href="/archive/archiveList?pageNum=${pc.endPage+1}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}" data-pagenum="${pc.endPage-1 }"> > </a></li>
						</c:if>
					</ul>
                    <input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
                    <input type="hidden" name="cpp" value="${pc.paging.cpp}">
                    <input type="hidden" name="condition" value="${pc.paging.condition}">
                    <input type="hidden" name="keyword" value="${pc.paging.keyword}">
				</form>
			</div>
            
        </div> 
    </section>
    
    <%@ include file="../include/footer.jsp" %>
		  
	   
	</div>
	
		
   
</body>
</html>


<script>

	//글쓰기 페이지 이동 버튼
	$(function() {
		$('#btn-archive-write').click(function() {
			location.href='<c:url value="/archive/archiveWrite" />';
		})
	});
	
	//페이징
	$(function() {
		const msg = '${msg}';
		if(msg !== '') {
			alert(msg);
		}
		$('#pagination').on('click', 'a', function(e) {
			e.preventDefault(); //a태그의 고유기능 중지.
			const value = $(this).data('pagenum'); //-> jQuery
			console.log(value);
			document.pageForm.pageNum.value = value;
			document.pageForm.submit();
		});
	}); //end jQuery
	
	//n개씩 보기  https://chobopark.tistory.com/95 참고
	function Change(idx){
	    var pagenum = idx;
	    var nowPaging = $("#pageUnit option:selected").val();
	    
	    if(nowPaging == 10){
	        location.href="${path}/archive/archiveList?pageIndex="+pagenum+"&cpp="+nowPaging;    
	    }else if(nowPaging == 15){
	        location.href="${path}/archive/archiveList?pageIndex="+pagenum+"&cpp="+nowPaging;    
	    }else if(nowPaging == 20){
	        location.href="${path}/archive/archiveList?pageIndex="+pagenum+"&cpp="+nowPaging;    
	    }
	}
	


</script>
