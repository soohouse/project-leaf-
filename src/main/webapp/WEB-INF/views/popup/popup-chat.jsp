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
		
		
		#chating::-webkit-scrollbar {
 			width: 3px;
  			background-color: #C7C7C7;
		}
	
	
		#chating::-webkit-scrollbar-thumb {
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
		    
		<input type="hidden" id="hidden-session-id" />
		<input type="hidden" id="hidden-room-no" value="${roomNO}" />
		<input type="hidden" id="hidden-session-count" value="0" />
		<input type="hidden" name="userName" id="hidden-user-id" />
	
	   
		<div class="sections clearfix" style="width: 100%; margin: 0 auto; padding-left: 5%; padding-right: 5%;">

			<!--콘텐츠부분-->
			<section style="float: left; width: 100%; height: 90%; background: white; border: 1px solid #E9E9E9;">
				
				<div style="padding: 5px; border-bottom: 2px solid #E9E9E9; background: #FCFCFC;">
					<a href="#" class="list-group-item active notice-list-top" style="width: 100%; border: 0; background: #FCFCFC; cursor: default;"> 
						<button class="btn btn-danger pull-right" type="button" id="btn-create-room" onclick="exit()" style="height: 32px; font-size: 12px; position: relative; bottom: 6px;">나가기</button>
						<span class="main-board-title" style="color: #4965FE; font-size: 16px; font-family: sans-serif;">${roomName}&nbsp;&nbsp;
							<span class="pull-right" style="line-height: 2.0em; margin-right: 40px; font-size: 11px; font-weight: 500;">현재 참여자 : <span id="onlineCount" style="color: #EA00AA; font-weight: 500; font-size: 12px;"></span></span>
						</span>
						
					</a>
				</div>
				
				
				<div id="chating" style="width: 100%; height: 82%; overflow: auto; padding: 20px; font-size: 13px; font-family: sans-serif;">
				
					
				
				</div>
				
				<div style="height: 8%; border-top: 2px solid #E9E9E9; background: #FCFCFC;">

					<div class="input-group" style="padding: 5px;">
						<input type="text" class="form-control" id="chatting" maxlength="40">
						<span class="input-group-btn">
							<button class="btn btn-primary" type="button" id="sendBtn" onclick="send()">전송</button>
						</span>
					</div>

				</div>

			</section>


		</div>

</body>
</html>

<script>

	var ws;

	var checkUser = '${user.userID}';
	var checkCompany = '${company.companyName}';
	
	var userName = '';
	
	if(checkUser == 'admin') {
		userName = '관리자';
	} else if(checkUser != '') {
		userName = checkUser;
	} else {
		userName = checkCompany + 'ⓒ';
	}
	
	$('#hidden-user-id').val(userName);
	
	
	function wsOpen(){
		ws = new WebSocket("ws://" + location.host + "/chat/" + $('#hidden-room-no').val());

		wsEvt();
	}
		
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 동작
			console.log(data);
			enter();
		}
		
		ws.onmessage = function(data) {
			//메시지를 받으면 동작
			var msg = data.data;
			
			if(msg != null && msg.trim() != ''){
				
				var d = JSON.parse(msg);
				
				if(d.type == "getId"){
					
					$('#onlineCount').empty().text(d.sessionCount);
					
					var si = d.sessionId != null ? d.sessionId : "";
					
					if(si != ''){
						$("#hidden-session-id").val(si);
					}
				} else if(d.type == "message") {
					
					if(d.sessionId == $("#hidden-session-id").val()) {
						
						$("#chating").append("<p class='me' style='text-align: right; margin-top: 20px; font-family: sans-serif;'><span style='background: #68DD28; border-radius: 8px; padding: 8px;'>" + "<span style='font-weight: bold;'>" + d.userName + "</span> : " + d.msg + "</span></p>");	
					
					} else {
						
						if(d.userName == '관리자') {
							$("#chating").append("<p class='others' style='text-align: left; margin-top: 20px; font-family: sans-serif;'><span style='background: #FFD5D5; border-radius: 8px; padding: 8px;'>" + "<span style='font-weight: bold;'>" + "관리자" + "</span> : " + d.msg + "</span></p>");
						} else {
							$("#chating").append("<p class='others' style='text-align: left; margin-top: 20px; font-family: sans-serif;'><span style='background: #E9E9E9; border-radius: 8px; padding: 8px;'>" + "<span style='font-weight: bold;'>" + d.userName + "</span> : " + d.msg + "</span></p>");
						}
						
					}
						
				} else if(d.type == "enter") {
					
					$('#onlineCount').empty().text(d.sessionCount);
					$("#chating").append("<p class='me' style='text-align: left; color: red;'> 알림 : " + d.userName + "님이 입장하셨습니다.</p>");
					
				} else if(d.type == "exit") {
					
					$('#onlineCount').empty().text(d.sessionCount - 1);
					$("#chating").append("<p class='me' style='text-align: left; color: red;'> 알림 : " + d.userName + "님이 퇴장하셨습니다.</p>");
					
				} else{
					
					console.warn("unknown type!");
					
				}
			}
		}
	
		ws.onclose = function(data) {
			exit();
		}
		
		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}
	
	function send() {
		var option ={
			type: "message",
			roomNO : $('#hidden-room-no').val(),
			sessionId : $("#hidden-session-id").val(),
			userName : $("#hidden-user-id").val(),
			msg : $("#chatting").val()
		}
		ws.send(JSON.stringify(option))
		$('#chatting').val("");
	}
	
	
	function enter() {
		var option ={
			type: "enter",
			roomNO : $('#hidden-room-no').val(),
			sessionId : $("#hidden-session-id").val(),
			userName : $("#hidden-user-id").val(),
			msg : $("#chatting").val()
		}
		ws.send(JSON.stringify(option))
		$('#chatting').val("");
	}
	
	
	function exit() {
		var option ={
			type: "exit",
			roomNO : $('#hidden-room-no').val(),
			sessionId : $("#hidden-session-id").val(),
			userName : $("#hidden-user-id").val(),
			msg : $("#chatting").val()
		}
		ws.send(JSON.stringify(option))
		$('#chatting').val("");
		
		location.href='/chat/chatMain';
		ws.close();
	}
	
	
	//  채팅이 많아져 스크롤바가 넘어가더라도 자동적으로 스크롤바가 내려가게함
    window.setInterval(function() {
        var elem = document.getElementById('chating');
        elem.scrollTop = elem.scrollHeight;
    }, 0);
	
	
	// 윈도우 창을 닫으면 나가기로 처리
    window.addEventListener('unload', (event) => {
    	  // 표준에 따라 기본 동작 방지
    	  event.preventDefault();
    	  // Chrome에서는 returnValue 설정이 필요함
    	  event.returnValue = '';
    	  
    	  exit();
    	});
	
	
	$(document).ready(function() {
		wsOpen();
	});

</script>