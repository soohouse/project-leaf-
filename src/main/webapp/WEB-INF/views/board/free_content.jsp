<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 글 내용 줄 개행 처리를 위해 추가 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
    
    #btn-boardReply-Modify {
    	background-color:transparent; 
    	border: none;
    }
    
    #btn-boardReply-Delete {
    	background-color:transparent; 
    	border: none;
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
			                                        	<c:if test="${board.boardWriter eq user.userID }">
				                                        	<a type="submit" id="btn-board-delete" class="btn mb-2" style="display: inline-block; float:right; margin-right:50px;">삭제</a>
				                                        </c:if>
			                                        </div>
			                                        
			                                        <div class="free_title_down" style="margin-top:30px;">
				                                        <div class="free_writer" style="display: inline-block;">
				                                            <img src="resources/img/logo2.png" width="50px" >
				                                            <span>&nbsp; ${board.boardWriter} &nbsp;</span>
				                                            <c:if test="${board.boardWriter eq user.userID }">
			                                            		<span style="background:lightgray; font-size:13px; color:#202020; padding:5px;">내가 작성한 글</span>
			                                            	</c:if>
			                                       		</div>
			                                       		<div style="display:inline-block; float:right; margin-top:10px; margin-right:40px; color:gray;">
					                                        <div style="display:inline-block;" >
					                                            <fmt:formatDate value="${board.boardDate}" pattern="yyyy-MM-dd HH:mm" />
					                                        </div>
					                                        <div style="display:inline-block;">
					                                        	조회수 : ${board.boardViews }
					                                        </div>
				                                        </div>
			                                        </div>
	                                    </div>
	
	                                    <div class="free_content_down" style="min-height:300px; margin-top:30px; margin-left:30px; font-size:15px; margin-bottom: 30px;">
	                                        
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
									<p style="color:red; display:inline-block; ">
										${boardReplyCount}
									</p>
						        </div>
						    </div> 
						</div>
					
						<!-- 댓글 보기 모드 -->
						<div id="boardReplyList" style="width=100%;">
							<form action="<c:url value='/board/boardReplyDelete'/>" method="post" name="boardReplyDeleteForm">
								<!-- 주석 
								<tbody>
									<tr>
										<td style="text-align: left;">${boardreply.boardReplyWriter}</td>
										<td style="text-align: left;">${boardreply.boardReplyContent}</td>
										<td>${boardreply.boardReplyDate}</td>
										<td><a class="glyphicon glyphicon-ok" aria-hidden="true"></a></td>
										<td><a class="glyphicon glyphicon-remove" aria-hidden="true"></a></td>
									</tr>
								</tbody>-->
							</form>
					     </div> 
					</div>

					<div class="text-center">
						
						<!-- 댓글 페이징 --> ${pc.beginPage }/${pc.endPage }
						<button class="form-control" id="moreList">댓글 더보기</button>
			            <div class="text-center">
							<form action="<c:url value='/board/free_content'/>" name="pageForm">
				                <ul class="pagination pagination-sm">
									<c:if test="${pc.prev }"><!-- 이전버튼 -->
					                    <li><a href="/board/boardContent/${board.boardNo}?pageNum=${pc.beginPage-1}&cpp=${pc.paging.cpp }" data-pagenum="${pc.beginPage-1 }"> << </a></li>					
									</c:if>
									<c:forEach var="num" begin="${pc.beginPage }" end="${pc.endPage }">
										<li class="${pc.paging.pageNum == num ? 'active' : '' }"><a href="/board/boardContent/${board.boardNo}?pageNum=${num}&cpp=${pc.paging.cpp }" data-pagenum='${num }'>${num }</a></li>
									</c:forEach>
									<c:if test="${pc.next }"><!-- 다음버튼 -->
					                    <li><a href="/board/boardContent/${board.boardNo}?pageNum=${pc.endPage+1}&cpp=${pc.paging.cpp }" data-pagenum="${pc.endPage-1 }"> >> </a></li>
									</c:if>
								</ul>
			                    <input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
			                    <input type="hidden" name="cpp" value="${pc.paging.cpp}">
							</form>
						</div>
						
						<!-- 댓글 입력 부분 -->
						<div style="background-color:#bbd0e7; height: 120px; ">
							<div style="text-align:left; margin: 10px 10px 10px 10px; padding-top:10px;">회원만 댓글 작성이 가능합니다.</div>
				    		<div>
				    			<div>
				    				<input type="hidden" id="boardNo" name="boardNo" value="${board.boardNo}">
				    				<input type="hidden" id="boardReplyWriter" name="boardReplyWriter" value="${user.userID}" >
				    				<c:if test="${user.userID != null}">
						      			<textarea id="boardReplyContent" type="text" class="form-control col-md-8 col-sm-10" placeholder="댓글을 입력하세요." name="boardReplyContent" maxlength="2048" style="float:left; width:85%; margin-left:30px; resize:none;"></textarea>
					      			</c:if>
					      			<c:if test="${user.userID eq null}">
						      			<textarea id="boardReplyContent" type="text" class="form-control col-md-8 col-sm-10" placeholder="로그인 한 후 댓글을 입력하세요." name="boardReplyContent" maxlength="2048" style="float:left; width:85%; margin-left:30px; resize:none;" readonly="readonly"></textarea>
					      			</c:if>
								</div>
								<div style=" margin-bottom:10px; float:right; margin-right: 40px; width:5%;">
									<input type="button" id="btn-boardreply-write" class="btn" value="댓글입력" style="height:54px;">
								</div>

							</div>
						</div>
						
						<div style="margin-top:20px;">
							<button type="submit" class=" mb-2 pull-left">신고하기 </button>
							<c:if test="${board.boardWriter eq user.userID }">
								<button type="button" id="btn-board-modify" class="btn btn-info mb-2 pull-right" onclick="location.href='<c:url value="/board/boardModify?boardNo=${board.boardNo}"/>'" style="margin-left:10px;">수정하기</button>
							</c:if>
							<button type="button" id="btn-board-list" class="btn btn-primary mb-2 pull-right" onclick="location.href='free_list'">목록 </button>
						</div>
						<!-- 날짜${boardReply.boardReplyDate} -->
						
					</div>
						
				</div> 
	        </section> 
	        
	        
	        <!-- 댓글 수정 모달 -->
	        <div class="modal fade" id="replyModal" role="dialog">
				<div class="modal-dialog modal-md">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="btn btn-default pull-right" data-dismiss="modal">닫기</button>
							<h4 class="modal-title">댓글 수정</h4>
						</div>
						<div class="modal-body">
							<!-- 수정폼 id값을 확인하세요-->
							<input type="hidden" id="hidden-modal-replyno">
							<div class="reply-content">
								<textarea class="form-control" rows="4" id="modalReply" placeholder="내용입력" style="resize: none;"></textarea>
								<div class="reply-group">
									<button class="right btn btn-info" id="modalModBtn">수정하기</button>
									<button class="right btn btn-info" id="modalDelBtn">삭제하기</button>
								</div>
							</div>
							<!-- 수정폼 끝. -->
						</div>
					</div>
				</div>
			</div><!-- 댓글 수정 모달 끝. -->
			
	   
	   
	    <%@ include file="../include/footer.jsp" %>
	</div>
   
   
  
</body>
</html>


<script language="javaScript">
		
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
		
		////////////////////
	
		//댓글 목록 조회
		//let page = 1; //페이지 번호
		let strAdd = ''; //화면에 넣을 태그를 문자열 형태로 추가할 변수
		
		boardReplyList(1, true); //상세보기 화면에 처음 진입 시 댓글 리스트 불러오기
		
		
		//목록 불러오기
		function boardReplyList() {
		
			const boardNo = '${board.boardNo}';
			strAdd = '';
			
			$.getJSON(
				"<c:url value='/boardreply/boardReplyList/'/>" + boardNo,
				function(result){
					
					let boardReplyList = result.boardReplyList; //댓글 리스트
					
					if(boardReplyList.length <= 0) {
						return; //함수 종료
					}
					
					
					
					for(let i=0; i<boardReplyList.length; i++) {
						
						var timestamp = boardReplyList[i].boardReplyDate;
						var date = new Date(timestamp).toISOString().replace("T", " ").replace(/\..*/, '');
						
						var replyWriter = boardReplyList[i].boardReplyWriter;
						var replyReader = '${user.userID}';
						
						if(replyWriter == replyReader) {
							strAdd += 
								`<div class='boardReplyWrap' style="border-bottom:1px solid lightgray;"> 
			                        <div id='boardReply-Writer' style="text-align: left; float:left; width:10%; font-weight:bold; <c:if test="${board.boardWriter eq user.userID }">color: blue;</c:if>">&nbsp;`+ boardReplyList[i].boardReplyWriter +`</div>
			                        <div id='boardReply-Content' style="text-align: left; float:left; width:73%;">&nbsp;` + boardReplyList[i].boardReplyContent +`</div>
			                        <div style="float:right; width:10%;">`+ date +`</div> 
		                            <div style="float:right; width:3%; padding-top:10px;">
		                            	<a id="btn-board-reply-delete` + i + `" class="glyphicon glyphicon-remove replyDelete" aria-hidden="true" data-value="` + boardReplyList[i].boardReplyNo + `"></a>
		                            </div> 
		                            <div style="float:right; width:3%; padding-top:10px;" id="cm_update">
		                            	<a class="glyphicon glyphicon-ok replyModify" aria-hidden="true"></a>
		                            </div>  
		                        </div>`;
						} else {
							strAdd += 
								`<div class='boardReplyWrap' style="border-bottom:1px solid lightgray;"> 
			                        <div id='boardReply-Writer' style="text-align: left; float:left; width:10%; font-weight:bold; <c:if test="${board.boardWriter eq user.userID }">color: blue;</c:if>">&nbsp;`+ boardReplyList[i].boardReplyWriter +`</div>
			                        <div id='boardReply-Content' style="text-align: left; float:left; width:73%;">&nbsp;` + boardReplyList[i].boardReplyContent +`</div>
			                        <div style="float:right; width:10%;">`+ date +`</div> 
		                        </div>`;
						}
					
						
						$('#boardReplyList').html(strAdd);	

					}	

				}
			); //end getJSON
			
		}//end boardReplyList()
		


		//댓글 수정/삭제 버튼 처리
		$('#boardReplyList').on('click', 'a', function(e) {
			e.preventDefault();
			const target = e.target.getAttribute('data-value');
			
			console.log(target);
			
			if($(this).hasClass('replyModify')) {
				//수정 버튼을 눌렀으므로 수정 모달 형식으로 꾸며주겠다.
				$('.modal-title').html('댓글 수정');
				$('#modalReply').css('display', 'inline');
				$('#modalModBtn').css('display', 'inline'); //수정버튼 보이기
				$('#modalDelBtn').css('display', 'none'); 
				$('#replyModal').modal('show');
			} else if($(this).hasClass('replyDelete')) { //('replyDelete')
				//삭제 버튼을 눌렀으므로 삭제 모달 형식으로 변경
				$('.modal-title').html('댓글을 삭제하시겠습니까?');
				$('#modalReply').css('display', 'none');
				$('#modalModBtn').css('display', 'none');
				$('#modalDelBtn').css('display', 'inline'); //삭제버튼 보이기
				$('#hidden-modal-replyno').val(target);
				$('#replyModal').modal('show');
			}
		}); //수정 or 삭제 버튼 클릭 이벤트 처리 끝.

		
		//댓글 수정
		$('#modalModBtn').click(function () {
			alert('수정');
			const boardReplyNO = $('#hidden-modal-replyno').val();
		});
		
		//삭제 함수
		$('#modalDelBtn').click(function () {
			const boardReplyNO = $('#hidden-modal-replyno').val();

			
			$.ajax({
				type: 'POST',
				url: '<c:url value="/boardreply/boardReplyDelete"/>',

				
				dataType: 'text',
				data: {
					'boardReplyNO': boardReplyNO
				},
				
				success: function (result) {
					if(result === 'DeleteSuccess') {
						alert('댓글이 삭제완료되었습니다.');
						$('#replyModal').modal('hide');
						location.reload();
					} else {
						alert('댓글이 삭제되지 못했습니다.');
						return false;
					}
				},
				error: function () {
					alert('error: 댓글 삭제에 실패하였습니다.')

				}
			}); //삭제 비동기 통신 끝.
		}); //삭제 이벤트 끝.
		
		
		
		
	});//end jquery (댓글등록 끝)
	

</script>