<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
<head>

   <meta charset="UTF-8">

   <title>RunWith</title>
   
   <!-- jQuery -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   
   <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
   
   <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
   
   <!-- 합쳐지고 최소화된 최신 CSS -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
   
   <!-- 개인 디자인 추가, ?after를 붙이면 기존에 동일한 이름의 파일을 인식하는것이 아닌 새로운 파일을 인식하게 된다. -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainstyle.css">
   
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/project-list.css">
   
   <!-- 여기다가 나만의 새로운 css 만들기 -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainpage-style.css">

   <style>

		body {
			
			background-image: url("${pageContext.request.contextPath}/resources/img/chat-back.jpg");
			background-repeat : no-repeat;
       		background-size : cover;
		}
		
		
		#chatRoom::-webkit-scrollbar {
 			width: 3px;
  			background-color: #C7C7C7;
		}
	
	
		#chatRoom::-webkit-scrollbar-thumb {
			background: #535353;
		}

   </style>
   
</head>
<body>

		<div id="navbar-wrapper">
		        <header>
		            <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="background: white; border: 1px solid #E9E9E9; position: relative; margin-bottom: 0;">
		                <div class="container-fluid">
		                    <div class="navbar-header">
		                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
		                            <span class="sr-only">Toggle navigation</span>
		                            <span class="icon-bar"></span>
		                            <span class="icon-bar"></span>
		                            <span class="icon-bar"></span>
		                        </button>
		                        <a class="navbar-brand" href="<c:url value='/' />"><img class="header-img-logo" alt="로고" src="${pageContext.request.contextPath}/resources/img/RunWith5.png"></a>
		                    </div>
		                </div>
		            </nav>
		        </header>
		</div>
		    

	   
		<div class="sections clearfix" style="width: 100%; margin: 0 auto; padding-left: 5%; padding-right: 5%;">

			
			<!--콘텐츠부분-->
			<section style="float: left; width: 100%; height: 90%; background: white; border: 1px solid #E9E9E9;">
				
				<div style="padding: 5px; border-bottom: 2px solid #E9E9E9; background: #FCFCFC;">
					<a href="#" class="list-group-item active notice-list-top" style="width: 100%; border: 0; background: #FCFCFC; cursor: default;"> 
						<span class="main-board-title" style="color: #5A2B23; font-size: 16px; font-family: sans-serif;">채팅방 목록</span>
						<button class="btn btn-info pull-right" type="button" id="btn-create-room" style="height: 32px; font-size: 12px; position: relative; bottom: 6px;">방 만들기</button>
					</a>
				</div>
				
				<div id="chatRoom" style="height: 82%; overflow: auto;">
				
					<table class="table table-striped table-hover" style="font-size: 13px; font-family: sans-serif; cursor: pointer;">
					
						<thead>
							<tr>
								<th>번호</th>
								<th>방제목</th>
								<th>방장</th>
							</tr>
						</thead>
						
						<tbody id="chatRoomList">
							
							
							
						</tbody>
					
					</table>
				
				</div>
				
				<div style="height: 8%; border-top: 2px solid #E9E9E9; background: #FCFCFC;">
					
				</div>

			</section>

		</div>
		
		
		
		
		<!-- 모달 -->
		<div class="modal fade" id="modal-chat-create" role="dialog" data-backdrop="static">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					
					<div class="modal-body modal-body-sections" style="padding-bottom: 0;">
						
						<div style="width: 264px;">
							  <div class="form-group">
							    <label class="control-label" style="display: block; font-family: none; font-weight: 500; font-size: 14px;">생성할 방 제목을 입력해주세요.</label>
							    <input id="roomName" name="roomName" class="form-control" type="text" maxlength="20" style="width: 100%; margin-top: 10px;">
							  </div>
						</div>
					
				    </div>
				    
				    <div class="modal-footer" style="clear: both;">
				   		<button type="button" id="btn-modal-create-room" class="btn btn-primary">생성</button>
				        <button type="button" id="btn-modal-create-close" class="btn btn-default" data-dismiss="modal">취소</button>
				    </div>
					
						
				</div>
			</div>
		</div>
   
</body>
</html>


<script>

	var ws;
	
	window.onload = function(){
		getRoom();
		createRoom();
	}
	
	function getRoom(){
		commonAjax('/chat/chatRoomList', "", 'post', function(result){
			createChatingRoom(result);
		});
	}
	
	function createRoom() {
		$("#btn-modal-create-room").click(function() {
			var msg = {	roomName : $('#roomName').val()	};
	
			commonAjax('/chat/chatCreateRoom', msg, 'post', function(result){
				createChatingRoom(result);
				$('#roomName').val('');
				
				$('#modal-chat-create').modal('hide');
				
				goRoom(result[result.length - 1].roomNumber, result[result.length - 1].roomName);
			});
		});
	}
	
	function goRoom(number, name){
		location.href='/chat/chatMove?roomName=' + name + '&' + 'roomNO=' + number;
	}
	
	function createChatingRoom(res){
		if(res != null){

			var strAdd = '';
			res.forEach(function(d, idx){
				var roomName = d.roomName.trim();
				var roomNO = d.roomNumber;
				var roomOwner = d.roomOwner;
				strAdd += `<tr>
						    	<td style="width: 10%;" onclick='goRoom(\"` + roomNO + `\", \"` + roomName + `\")'>` + (idx + 1) + `</td>
						    	<td style="width: 70%;" onclick='goRoom(\"` + roomNO + `\", \"` + roomName + `\")'>` + roomName + `</td>
						    	<td style="width: 20%;" onclick='goRoom(\"` + roomNO + `\", \"` + roomName + `\")'>` + roomOwner + `</td>
						  </tr>`;
			});
			
			$("#chatRoomList").empty().append(strAdd);
		}
	}
	
	function commonAjax(url, parameter, type, calbak, contentType){
		$.ajax({
			url: url,
			data: parameter,
			type: type,
			contentType : contentType!=null?contentType:'application/x-www-form-urlencoded; charset=UTF-8',
			success: function (res) {
				calbak(res);
			},
			error : function(err){
				console.log('error');
				calbak(err);
			}
		});
	}
	
	
	$(function() {
		
		$('#btn-create-room').click(function() {
			$('#modal-chat-create').modal('show');
		});
		
	});

</script>
