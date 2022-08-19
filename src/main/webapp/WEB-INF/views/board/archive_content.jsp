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
                       <form action="<c:url value='/archive/archiveDelete'/>" method="post" name="archiveDeleteForm"> 
                        <div class="row" style="margin-bottom:50px;">
                        	<div class="archive_content" >
                                    <div class="archive_content_up" style="margin-left:30px;" >
                                        <div class="archive_title_up" scope="col" style="width: 100%;  margin-top:10px;">
                                        	<input type="hidden" id="hidden-archiveNo" name="archiveNo" value="${archive.archiveNo}">
                                        	<h4 style="display:inline-block;">${archive.archiveTitle}</h4>
                                        	<c:if test="${archive.archiveWriter eq user.userID || archive.archiveWriter eq company.companyID}">
	                                        	<a type="submit" id="btn-archive-delete" class="btn mb-2" style="display: inline-block; float:right; margin-right:50px;">삭제</a>
	                                        </c:if>
                                        </div>
                                        
                                        <div class="archive-title-down" style="margin-top:30px;">
	                                        <div class="archive_writer" style="display: inline-block;">
	                                            <img src="<c:url value='/user/userProfileGet?userNO=${user.userNO}'/>" width="40px" height="40px" style="border-radius: 30px; margin-left: 10px; margin-right: -5px;" >
	                                            <div style="display: inline-block; font-size: 14px; font-weight: bold; font-family: sans-serif; margin-left:15px;">
	                                            	${archive.archiveWriter}
		                                            <c:if test="${archive.archiveWriter eq user.userID }">
	                                            		<span style="background:lightgray; font-size:13px; color:#202020; padding:5px;">내가 작성한 글</span>
	                                            	</c:if>
		                                            <c:if test="${archive.archiveWriter eq company.companyID }">
	                                            		<span style="background:lightgray; font-size:13px; color:#202020; padding:5px;">내가 작성한 글</span>
	                                            	</c:if>
	                                            </div>
                                       		</div>
                                       		<div style="display:inline-block; float:right; margin-top:10px; margin-right:40px; color:gray;">
		                                        <div style="display:inline-block;" >
		                                            <fmt:formatDate value="${archive.archiveDate}" pattern="yyyy-MM-dd HH:mm" />
		                                        </div>
		                                        <div style="display:inline-block;">
		                                        	조회수 : ${archive.archiveViews }
		                                        </div>
	                                        </div>
                                        </div>
                                    </div>

							<div class="archive_content_down" style="min-height:300px; margin-top:50px; margin-left:30px; font-size:15px; margin-bottom: 30px;">
								<div>
									${fn:replace(archive.archiveContent, newLineChar, '<br/>')}
								</div>   
								
								<div style="margin-top:30px;">
									<a class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></a>
									<a id="archive-file-download">${archive.archiveFileRealname}</a>
								</div>
							</div>
							
						</div>
					</form>
                        
                        	
					<!-- 댓글입력부분 -->
					<div style="background-color:#bbd0e7; height: 120px; ">
						<div style="text-align:left; margin: 10px 10px 10px 10px; padding-top:10px;">회원만 댓글 작성이 가능합니다.</div>
						<div>
							<div>
								<input type="hidden" id="archiveNo" name="archiveNo" value="${archive.archiveNo}">
								
								<c:if test="${user != null}">
									<input type="hidden" id="archiveReplyWriter" name="archiveReplyWriter" value="${user.userID}" >
								</c:if>
								<c:if test="${company != null}">
									<input type="hidden" id="archiveReplyWriter" name="archiveReplyWriter" value="${company.companyID}" >
								</c:if>
								
								<c:if test="${user != null || company != null}">																									
									<textarea id="archiveReplyContent" type="text" class="form-control col-md-8 col-sm-10" placeholder="댓글을 입력하세요." name="archiveReplyContent" maxlength="2048" style="float:left; width:85%; margin-left:30px; resize:none;"></textarea>
								</c:if>
								<c:if test="${user == null && company == null}">
									<textarea id="archiveReplyContent" type="text" class="form-control col-md-8 col-sm-10" placeholder="로그인 한 후 댓글을 입력하세요." name="archiveReplyContent" maxlength="2048" style="float:left; width:85%; margin-left:30px; resize:none;" readonly="readonly"></textarea>
								</c:if>
								
							</div>
							<div style=" margin-bottom:10px; float:right; margin-right: 40px; width:5%;">
								<input type="button" id="btn-comment-write" class="btn" value="댓글입력" style="height:54px;">
							</div>
						</div>
					</div>
                       
                                
                            <table class="table table-borderless"  style="text-align: center; font-size:12px;">
			                    <thead>
			                    	<div style="background-color: #bbd0e7;" >
			                            <div style=" text-align: left; margin-left:10px; padding-top:10px;">전체댓글
		                            	<p style="color:red; display:inline-block; ">
											${archiveReplyCount}
										</p>
			                        </div>
			                    </thead>
			                  	
			                  	<!-- 댓글이 보여지는 부분 (여기서댓글이 반복됨) -->
								<div id="boardReplyList" style="width=100%; background:#FAFAFA; padding:5px 15px 5px 15px;">
									ㅋㅋㅋ<br>ㅋㅋㅋ
								</div>
								
								<!-- 댓글 페이징 -->
								<button class="form-control" id="moreList">댓글 더보기</button>
			                </table>
			                
			                
			                <div class="text-center">
			                
	                            <div style="margin-top:20px;">
		                             <button type="submit" class="btn btn-light mb-2 pull-left">신고하기 </button>
		                             <c:if test="${archive.archiveWriter eq user.userID || archive.archiveWriter eq company.companyID}">
		                             	<button type="button" class="btn btn-info mb-2 pull-right btn-boardReply-Modify"  style="margin-left:10px;" onclick="location.href='<c:url value="/archive/archiveModify?archiveNo=${archive.archiveNo}"/>'">수정 </button>
		                             </c:if>
		                             <button type="button" id="btn-archive-list" class="btn btn-primary mb-2 pull-right"  style="margin-left:10px;">목록 </button>
								</div>
                            
                        	</div>
                        
                        
                    </div>
                    
                    
				</div>
			</div> 
        </section> 
		
	   
	   
	    <%@ include file="../include/footer.jsp" %>
	</div><!-- mainbox end. -->
   
   
  
</body>
</html>


<script>
	
	const msg = '${msg}';
	if(msg != '') {
		alert(msg);
	}
	
	//목록 이동 버튼
	$(function() {
		$('#btn-archive-list').click(function() {
			location.href='<c:url value="/archive/archiveList"/>';
		});
		
	});
	
	//삭제 버튼 처리
	$(function(){
	 	$('#btn-archive-delete').click(function() {
	 		if(confirm('정말 삭제하시겠습니까?')) {
				document.archiveDeleteForm.submit();
			}
	 	});
	});


	//파일 이름 클릭 시 다운로드 되도록
	$(function(){
	 	$('#archive-file-download').click(function() {
	 		const archiveNo = $('#hidden-archiveNo').val();
	 		location.href = "/archive/archiveFile/download?archiveNo=" + archiveNo;
	 	});
	});
	
	
	//댓글 등록
	$(document).ready(function () {
		
		$('#btn-comment-write').click(function () {
			const archiveNo = $('#hidden-archiveNo').val(); //컨트롤러에서 넘어온 글 번호
			const archiveReplyContent = $('#archiveReplyContent').val(); //댓글 내용
			const archiveReplyWriter = $('#archiveReplyWriter').val(); //작성자
			
			console.log(archiveReplyContent);
			
			//댓글 내용이 비어있으면.
			if($('#archiveReplyContent').val() == '') {
				alert('내용을 입력하세요!');
				return;
			}
			
			$.ajax({
				type: 'post',
				url:  '<c:url value="/archivereply/archiveReplyWrite" />',
				contentType: 'application/json',
				data: JSON.stringify(
					{
						"archiveNo" : archiveNo,
						"archiveReplyContent" : archiveReplyContent,
						"archiveReplyWriter" : archiveReplyWriter,
					}
				),
				dataType: 'text',
				success : function(result) {
					console.log('통신 성공 : ' + result);
					alert('댓글 등록이 완료되었습니다.');
					$('#archiveReplyContent').vla('');
					archiveReplyList(1, true);
				},
				error : function() {
					alert('error: 댓글 등록에 실패하였습니다. 관리자에게 문의하세요.');
				}
			});//비동기끝.
			
		});//('#btn-comment-write').click 끝.
		
	});//댓글등록 끝.
	
	
	//더보기 버튼 처리(클릭 시 전역 변수 page에 +1 한 값을 전달)
	$('#moreList').click(function() {
		//왜 false를 주었죠?, 더보기잖아요. 누적해야 하지 않을까요? -> 1페이지의 댓글 내용 밑에다가 2페이지를 줘야지, 1페이지를 없애고 2페이지를 보여주자 는 게 아니니까요.
		boardReplyList(++page, false);
	});
	
	
	//댓글 목록 조회
	let page = 1; //페이지 번호
	let strAdd = ''; //화면에 넣을 태그를 문자열 형태로 추가할 변수
	
	archiveReplyList(1, true); //상세보기 화면에 처음 진입 시 댓글 리스트 불러오기
	
	//목록 불러오기
	function archiveReplyList(pageNum, reset) {
		
		const archiveNo = '${archive.archiveNo}';
		strAdd = '';
		
		$.getJSON(
			"<c:url value='' />" + boardNO, //+ '/' + pageNum,
			function(result) {
				let archiveReplyTotal = result.boardReplyTotal; //총 댓글 수
				
			}//function(result) 끝.
		);//getJSON 끝.
		
	}//function archiveReplyList 끝.
	
	
	
</script>
