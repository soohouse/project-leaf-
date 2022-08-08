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

 	.boardReplyWrap {
 		position:relative;
 		overflow:hidden;
 		width:100%;
 		height: 40px;
 		float: none;
 		text-align:center;
 		line-height: 40px;
 		
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
			                                        	<input type="hidden" id="hidden-boardNo" name="boardNo" value="${board.boardNo}">
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
	                                        
	                                        	${fn:replace(board.boardContent, newLineChar, '<br/>')}
	                                           
	                                    </div>
	                            </div>
	                 			
	                        </div>
                        </form>
                       
                      <!-- 댓글 보여지는 부분 -->
                        <div  class="boardreply-List"  style="text-align: center; font-size:12px;">
					                    <div>
					                        <div style="background-color: #bbd0e7;" >
					                            <div style=" text-align: left; margin-left:10px; padding-top:10px; ">전체댓글
					                            	<p style="color:red; display:inline-block; ">4</p>
					                            </div>
					                        </div> 
					                    </div>
					                    
					                    <!-- 댓글 보기 모드 -->
					                    <div id="boardReplyList" style="width=100%;">
					                    
					                 
					                    <!-- 주석 
					                    <tbody>
					                    
					                        <tr>
					                            <td style="text-align: left;">${boardreply.boardReplyWriter}</td>
					                            <td style="text-align: left;">${boardreply.boardReplyContent}</td>
					                            <td>${boardreply.boardReplyDate}</td>
					                            <td><a class="glyphicon glyphicon-ok" aria-hidden="true"></a></td>
												<td><a class="glyphicon glyphicon-remove" aria-hidden="true"></a></td>
					                        </tr>
					
					                    </tbody>  
					                    
					                    -->
					                   
					                    </div> 
	   
					                   
			                 		</div>
			               
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
						                
						                <!-- 댓글 입력 부분 -->
						                <div style="background-color:#bbd0e7; height: 120px; ">
				                        		<div style="text-align:left; margin: 10px 10px 10px 10px; padding-top:10px;">회원만 댓글 작성이 가능합니다.</div>
				                        		<div>
				                        			<div>
				                        				<input type="hidden" id="boardNo" name="boardNo" value="${board.boardNo}">
				                        				<input type="hidden" id="boardReplyWriter" name="boardReplyWriter" value="${user.userID}" >
						                        		<textarea id="boardReplyContent" type="text" class="form-control col-md-8 col-sm-10" placeholder="댓글을 입력하세요." name="boardReplyContent" maxlength="2048" style="float:left; width:85%;  margin-left:30px;"></textarea>
													</div>
													<div style=" margin-bottom:10px; float:right; margin-right: 40px; width:5%;">
														<input type="button" id="btn-boardreply-write" class="btn" value="댓글입력" style="height:54px;">
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
			});
			
		});
		
		//삭제 버튼 처리
		$(function(){
		 	$('#btn-board-delete').click(function() {
		 		
		 		if(confirm('정말 삭제하시겠습니까?')) {
					document.boardDeleteForm.submit();
				}
		 	});
		});
		
		//댓글 등록
		$(document).ready(function () {
		
			$('#btn-boardreply-write').click(function(){
				
				const boardNo = $('#hidden-boardNo').val(); //컨트롤러에서 넘어온 글 번호
				const boardReplyContent = $('#boardReplyContent').val(); //댓글 내용
				
				console.log(boardReplyContent);
				
				const boardReplyWriter = $('#boardReplyWriter').val();//작성자
				
				if($('#boardReplyContent').val() == '') {
					alert('내용을 입력하세요 !');
					return;
				}
				

				$.ajax({
					type: 'post',
					url: '<c:url value="/boardreply/boardReplyWrite" />',
					contentType: 'application/json',
					data: JSON.stringify(
						{
							"boardReplyWriter": boardReplyWriter,
							"boardReplyContent": boardReplyContent,
							"boardNo": boardNo
						}		
					),
					
					dataType: 'text',
					
					success: function(result) {
						console.log('통신 성공' + result);
						
						alert('댓글 등록이 완료되었습니다.');
						
						$('#boardReplyContent').val('');
					
						boardReplyList(1,true);
					},
					
					error: function() {
						alert('댓글 등록이 실패하였습니다.');
					}
				
					
				}); //end ajax
			}); //댓글 등록 이벤트 끝
	
		
	
		//댓글 목록 조회
		
		let strAdd = ''; //화면에 넣을 태그를 문자열 형태로 추가할 변수
		
		boardReplyList(1, true); //상세보기 화면에 처음 진입 시 댓글 리스트 불러오기
		
		
		//목록 불러오기
		function boardReplyList() {
		
			const boardNo = '${board.boardNo}';

			
			$.getJSON(
				"<c:url value='/boardreply/boardReplyList/'/>" + boardNo,
				
				function(result){
					
					let boardReplyList = result.boardReplyList; //댓글 리스트
					
					if(boardReplyList.length <= 0) {
						return; //함수 종료
					}
					
					for(let i=0; i<boardReplyList.length; i++) {
						strAdd += 
							`<div class='boardReplyWrap'>
		                        <div id='boardReply-Writer' style="text-align: left; float:left; width:15%; ">&nbsp;`+ boardReplyList[i].boardReplyWriter +`</div>
		                        <div id='boardReply-Content' style="text-align: left; float:left; width:15%;">&nbsp;` + boardReplyList[i].boardReplyContent +`</div>
		                        <div style="float:left; width:50%;">`+ boardReplyList[i].boardReplyDate+`</div>
	                            <div style="float:left; width:10%; padding-top:10px;"><a href='` + boardReplyList[i].boardReplyNo +`' class="glyphicon glyphicon-ok" aria-hidden="true"></a></div>
	                            <div style="float:left; width:10%; padding-top:10px;"><a href='` + boardReplyList[i].boardReplyNo +`' class="glyphicon glyphicon-remove" aria-hidden="true"></a></div>
	                        </div>`;
					}
				
					
					
					$('#boardReplyList').html(strAdd);
					
					
			
						
					
					
				}
			); //end getJSON
			
		}//end boardReplyList()
		
		//댓글 수정
		
		
		//삭제 함수
		$('.glyphicon-remove').click(function () {
		
			const boardReplyNo = $('.glyphicon-remove').val();
			
			$.ajax({
				type: 'post',
				url: '<c:url value="/boardreply/boardReplyDelete"/>',
				data: JSON.stringify({
					"boardReplyNo": boardReplyNo
				}),
				contentType: 'application/json',
			    function (result) {
					alert('댓글이 삭제완료되었습니다.')
					boardReplyList(1, true);
				},
				error: function () {
					alert('댓글 삭제에 실패하였습니다.')
					
				}
			}); //삭제 비동기 통신 끝.
		}); //삭제 이벤트 끝.
		
	});//end jquery

</script>
