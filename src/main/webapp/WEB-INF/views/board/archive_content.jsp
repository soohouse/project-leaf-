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
	
		.archiveReplyWrap {
			position:relative;
			overflow:hidden;
			width:100%;
			min-height: 40px;
			max-height: 900px;
			float: none;
			text-align:center;
			line-height: 40px;
			border-bottom:1px solid #D8D8D8; 
			padding: 10px 0px;
		}
		
		#btn-archiveReply-Modify {
			background-color:transparent; 
			border: none;
		}
		
		#btn-archiveReply-Delete {
			background-color:transparent; 
			border: none;
		}

	</style>
   
</head>
<body>

<%@ include file="../include/header.jsp" %>
	   
	<div class="mainbox">
	
        <section >
            <div class="container">
				<div class="row">
					 <!-- 메인화면 공지사항 상단 -->
			            <a href="#" class="list-group-item active notice-list-top" style="margin-top: 20px;">
			            	<span class="main-notice-title">자료실</span>
			            </a>
				
                     <div class="container my-1">
                       <form action="<c:url value='/archive/archiveDelete'/>" method="post" name="archiveDeleteForm"> 
                        <div class="row" style="margin-bottom:50px;">
                        	<div class="archive_content" style="font-size: 14px; font-family: sans-serif;" >
                                    <div class="archive_content_up" style="margin-left:30px;" >
                                        <div class="archive_title_up" scope="col" style="width: 100%;  margin-top:10px;">
                                        	<input type="hidden" id="hidden-archiveNo" name="archiveNo" value="${archive.archiveNo}">
                                        	<h4 style="display:inline-block;">${archive.archiveTitle}</h4>
                                        	<c:if test="${archive.archiveWriter eq user.userID || archive.archiveWriter eq company.companyID}">
	                                        	<a type="submit" id="btn-archive-delete" class="btn mb-2" style="display: inline-block; float:right; margin-right:70px;">삭제</a>
	                                        </c:if>
                                        </div>
                                        
                                        <div class="archive-title-down" style="margin-top:30px;">
	                                        <div class="archive_writer" style="display: inline-block;">
	                                        
	                                        	<c:choose>
				                                        	
				                                    <c:when test="${archiveWriterNumbers.userNo != ''}">
				                              			<img src="<c:url value='/user/userProfileGet?userNO=${archiveWriterNumbers.userNo}'/>" width="40px" height="40px" style="border-radius: 30px; margin-left: 10px; margin-right: -5px;" >	
				                               		</c:when>
				                                        	
				                               		<c:when test="${archiveWriterNumbers.companyNo != ''}">
			                                			<img src="<c:url value='/company/companyLogoGet?companyNO=${archiveWriterNumbers.companyNo}'/>" width="40px" height="40px" style="border-radius: 30px; margin-left: 10px; margin-right: -5px;" >	 
				                                    </c:when>
				                                        	
				                                </c:choose>
				                                
				                                
	                                            <div style="display: inline-block; font-size: 14px; font-weight: bold; font-family: sans-serif; margin-left:15px;">
	                                            	${archive.archiveWriter}
		                                            <c:if test="${archive.archiveWriter eq user.userID }">
	                                            		<span style="background:lightgray; font-size:13px; color:#202020; padding:5px; margin-left:10px;">내가 작성한 글</span>
	                                            	</c:if>
		                                            <c:if test="${archive.archiveWriter eq company.companyID }">
	                                            		<span style="background:lightgray; font-size:13px; color:#202020; padding:5px; margin-left:10px;">내가 작성한 글</span>
	                                            	</c:if>
	                                            	
	                                            </div>
	                                            
                                       		</div>
                                       
                                       		<div style="display:inline-block; float:right; margin-top:10px; margin-right:40px; color:gray;">
		                                        
		                                        <div style=" margin-left:50px; ">
		                                        	<span style="color:black; font-style: bold;">조회수</span> ${archive.archiveViews}
		                                        </div>
		                                        <div style=" float:right; margin-top:10px; margin-right:40px; color:gray;" >
			                                            <fmt:formatDate value="${archive.archiveDate}" pattern="yyyy-MM-dd HH:mm" />
			                                    </div>
		                                    </div>
                                        </div>
                                        
                                    </div>

							<div class="archive_content_down" style="min-height:300px; margin-top:50px; margin-left:30px; font-size:15px; margin-bottom: 30px;">
								<div style="min-height:300px;">
									${fn:replace(archive.archiveContent, newLineChar, '<br/>')}
								</div>   
								
								<div style="margin-top:30px;">
									<a class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></a>
									<a id="archive-file-download">${archive.archiveFileRealname}</a>
								</div>
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
                       
                       <!-- 댓글 보여지는 부분 -->         
						<div class="archivereply-List" style="text-align: center; font-size:12px;">
							<div>
		                    	<div style="background-color: #bbd0e7;" >
									<div style=" text-align: left; margin-left:10px; padding-top:10px; ">전체댓글
										<p id="p-reply-count" style="color:red; display:inline-block; "></p>
							        </div>
		                        </div>
							</div>
				                  	
		                  	<!-- 댓글 보기 모드 (여기서댓글이 반복됨) -->
							<div id="archiveReplyList" style="width=100%; background:#FAFAFA; padding:5px 15px 5px 15px;">
								<!-- ------------------------댓글이 반복됨---------------------------- -->
								<!-- ------------------------댓글이 반복됨---------------------------- -->
								<!-- ------------------------댓글이 반복됨---------------------------- -->
								<!-- ------------------------댓글이 반복됨---------------------------- -->
								<!-- ------------------------댓글이 반복됨---------------------------- -->
							</div>
							
							<!-- 댓글 페이징 -->
							<button class="form-control" id="moreList">댓글 더보기</button>
							
							
						</div>
				                
				                
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
		
		
		
		
		<!-- 댓글 수정/삭제 모달 -->
        <div class="modal fade" id="replyModal" role="dialog">
			<div class="modal-dialog modal-md">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="btn btn-default pull-right" data-dismiss="modal">닫기</button>
						<h4 class="modal-title">댓글 수정</h4>
					</div>
					<div class="modal-body">
						<!-- 수정폼 id값을 확인하세요-->
						<input type="hidden" id="hidden-modal-replyno" name="">
						<div class="reply-content" >
							<textarea class="form-control" rows="4" id="modalReply" placeholder="내용입력" style="resize: none;">${archiveContent.archiveContent }</textarea>
							<div class="reply-group">
								<button class="right btn btn-info" id="modalModBtn" style="margin-top:10px;">수정하기</button>
								<button class="right btn btn-info" id="modalDelBtn">삭제하기</button>
							</div>
						</div>
						<!-- 수정폼 끝. -->
					</div>
				</div>
			</div>
		</div><!-- 댓글 수정 모달 끝. -->
		
		
	   
	   
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
					//alert('댓글 등록이 완료되었습니다.');
					$('#archiveReplyContent').val('');
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
		archiveReplyList(++page, false);
	});
	
	
	//연속클릭 방지
	var timer; 
	$("#btn-comment-write").click(function () {
	    if(alert("댓글을 등록하였습니다.")){
	        if(timer){
	            clearTimeout(timer);
	        }
	        timer = setTimeout(function(){
	            //수행될 프로세스를 입력하는 곳
	        },200); //2초 동안 재 수행되는 것을 방지
	    }
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
			"<c:url value='/archivereply/archiveReplyList/'/>" + archiveNo + '/' + pageNum,
			function(result) {
				let archiveReplyTotal = result.archiveReplyTotal; //총 댓글 수
				let archiveReplyList = result.archiveReplyList; //댓글 리스트
				
				//댓글수 빨간글씨
				$('#p-reply-count').text(archiveReplyTotal);
				
				if(reset === true) {
					strAdd = '';
					page = 1;
				}
				
				console.log('현재 페이지: ' + page);
				if(archiveReplyTotal <= page * 5) {
					$('#moreList').css('display', 'none');
				} else {
					$('#moreList').css('display', 'block');
				}
				
				if(archiveReplyList.length <= 0) {
					return;//함수종료
				}
				
				for(let i=0; i<archiveReplyList.length; i++) {
					
					var timestamp = archiveReplyList[i].archiveReplyDate;
					var date = new Date(timestamp).toISOString().replace("T", " ").replace(/\..*/, '');
					
					var replyWriter = archiveReplyList[i].archiveReplyWriter;
					var replyReader = ''; 
					
					var memberNo = '';
					
					if(archiveReplyList[i].userNo != '') {
						memberNo = archiveReplyList[i].userNo;
					
						if(${user != null}) {
							replyReader = '${user.userID}';
						} else {
							replyReader = '${company.companyID}';
						}
						
						if(replyWriter == replyReader) {
							strAdd +=
								`<div class='archiveReplyWrap'>
									<div><span><img src="<c:url value='/user/userProfileGet?userNO=' />` + memberNo + `" width="30px" style="margin: 5px; float:left; border-radius:50px; width:30px; height:30px;"><span>
									</div>
									<div id='archiveReply-Writer' style="text-align: left; float:left; width:10%; font-weight:bold; ">&nbsp;`+ archiveReplyList[i].archiveReplyWriter +`
									</div>
									<div id='archiveReply-Content' style="width:65%; word-break:break-all; text-align: left; float:left;">` + archiveReplyList[i].archiveReplyContent +`
									</div>
									<div style="float:right; width:13%;">`+ date +`
									</div>
									<div style="float:right; width:5%;">
	                            		<a id="btn-board-reply-delete` + i + `" class="glyphicon glyphicon-remove replyDelete" aria-hidden="true" data-value="` + archiveReplyList[i].archiveReplyNo + `"></a>
	                            		<a id="btn-board-reply-update` + i + `" class="glyphicon glyphicon-ok replyModify" aria-hidden="true" data-value="` + archiveReplyList[i].archiveReplyNo + `"></a>
									</div>
								</div>`;
						} else {
							strAdd +=
								`<div class='archiveReplyWrap'> 
									<div><span><img src="<c:url value='/user/userProfileGet?userNO=' />` + memberNo + `" width="30px" style="margin: 5px; float:left; border-radius:50px; width:30px; height:30px;"><span>
									</div>
									<div id='archiveReply-Writer' style="text-align: left; float:left; width:10%; font-weight:bold; ">&nbsp;`+ archiveReplyList[i].archiveReplyWriter +`
									</div>
									<div id='archiveReply-Content' style="width:65%; word-break:break-all; text-align: left; float:left;">` + archiveReplyList[i].archiveReplyContent +`
									</div>
									<div style="float:right; width:13%;">`+ date +`
									</div>
								</div>`;
						}
					} else {	
						memberNo = archiveReplyList[i].companyNo;
						
						if(${user != null}) {
							replyReader = '${user.userID}';
						} else {
							replyReader = '${company.companyID}';
						}
						
						if(replyWriter == replyReader) {
							strAdd +=
								`<div class='archiveReplyWrap'>
									<div><span><img src="<c:url value='/company/companyLogoGet?companyNO=' />` + memberNo + `" width="30px" style="margin: 5px; float:left; border-radius:50px; width:30px; height:30px;"><span>
									</div>
									<div id='archiveReply-Writer' style="text-align: left; float:left; width:10%; font-weight:bold; ">&nbsp;`+ archiveReplyList[i].archiveReplyWriter +`
									</div>
									<div id='archiveReply-Content' style="width:65%; word-break:break-all; text-align: left; float:left;">` + archiveReplyList[i].archiveReplyContent +`
									</div>
									<div style="float:right; width:13%;">`+ date +`
									</div>
									<div style="float:right; width:5%;">
	                            		<a id="btn-board-reply-delete` + i + `" class="glyphicon glyphicon-remove replyDelete" aria-hidden="true" data-value="` + archiveReplyList[i].archiveReplyNo + `"></a>
	                            		<a id="btn-board-reply-update` + i + `" class="glyphicon glyphicon-ok replyModify" aria-hidden="true" data-value="` + archiveReplyList[i].archiveReplyNo + `"></a>
									</div>
								</div>`;
						} else {
							strAdd +=
								`<div class='archiveReplyWrap'> 
									<div><span><img src="<c:url value='/company/companyLogoGet?companyNO=' />` + memberNo + `" width="30px" style="margin: 5px; float:left; border-radius:50px; width:30px; height:30px;"><span>
									</div>
									<div id='archiveReply-Writer' style="text-align: left; float:left; width:10%; font-weight:bold; ">&nbsp;`+ archiveReplyList[i].archiveReplyWriter +`
									</div>
									<div id='archiveReply-Content' style="width:65%; word-break:break-all; text-align: left; float:left;">` + archiveReplyList[i].archiveReplyContent +`
									</div>
									<div style="float:right; width:13%;">`+ date +`
									</div>
								</div>`;
						}
					}
					$('#archiveReplyList').html(strAdd);
					
				}//for문 끝.
				
				
			}//function(result) 끝.
		);//getJSON 끝.
		
	}//function archiveReplyList 끝.
	
	
	
	//댓글 수정/삭제 버튼 처리
	$('#archiveReplyList').on('click', 'a', function(e) {
		e.preventDefault();
		const target = e.target.getAttribute('data-value');
		
		if($(this).hasClass('replyModify')) {
			//수정 버튼을 눌렀으므로 수정 모달 형식으로 꾸며주겠다.
			$('.modal-title').html('댓글 수정');
			$('#hidden-modal-replyno').val(target);
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
		const archiveReplyNO = $('#hidden-modal-replyno').val();
		const modalReply = $('#modalReply').val();
		
		console.log(archiveReplyNO);
		console.log(modalReply);
		
		$.ajax({
			type: 'POST',
			url: '<c:url value="/archivereply/archiveReplyUpdate"/>',
			dataType:'text',
			data: {
				'archiveReplyNo': archiveReplyNO,
				'archiveReplyContent': modalReply
			},
			success: function(result) {
				if(result === 'UpdateSuccess') {
					alert('댓글이 수정되었습니다.');
					$('#modalReply').val('');
					$('#replyModal').modal('hide');
					location.reload();
				} else {
					alert('댓글이 수정되지 못했습니다.');
					return false;
				}
			}, error: function() {
				alert('error: 수정에 실패했습니다. 관리자에게 문의하세요!');
			}
		});//ajax 끝.
	});//댓글 수정 끝.
	
	
	//삭제 함수
	$('#modalDelBtn').click(function () {
		const archiveReplyNO = $('#hidden-modal-replyno').val();
		console.log(archiveReplyNO);
		
		$.ajax({
			type: 'POST',
			url: '<c:url value="/archivereply/archiveReplyDelete"/>',
			dataType: 'text',
			data: {
				'archiveReplyNO': archiveReplyNO
			},
			success: function (result) {
				if(result === 'DeleteSuccess') {
					$('#replyModal').modal('hide');
					location.reload();
				} else {
					alert('댓글이 삭제되지 못했습니다.');
					return false;
				}
			},
			error: function () {
				alert('error: 댓글 삭제에 실패하였습니다. 관리자에게 문의하세요!');
			}
		}); //삭제 비동기 통신 끝.
	}); //삭제 이벤트 끝.
	
	
</script>
