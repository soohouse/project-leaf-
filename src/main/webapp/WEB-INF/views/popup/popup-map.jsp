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

	<div id="map" style="width: 100%; height: 100%;">

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=101c80782d440afe7bdde4defbe26209&libraries=services"></script>
		<script>
											var mapContainer = document
													.getElementById('map'), // 지도를 표시할 div 
											mapOption = {
												center : new kakao.maps.LatLng(
														33.450701, 126.570667), // 지도의 중심좌표
												level : 3
											// 지도의 확대 레벨
											};

											// 지도를 생성합니다    
											var map = new kakao.maps.Map(
													mapContainer, mapOption);

											// 주소-좌표 변환 객체를 생성합니다
											var geocoder = new kakao.maps.services.Geocoder();

											// 주소로 좌표를 검색합니다
											geocoder
													.addressSearch(
															'${address}',
															function(result,
																	status) {
																// 정상적으로 검색이 완료됐으면 
																if (status === kakao.maps.services.Status.OK) {

																	var coords = new kakao.maps.LatLng(
																			result[0].y,
																			result[0].x);

																	// 결과값으로 받은 위치를 마커로 표시합니다
																	var marker = new kakao.maps.Marker(
																			{
																				map : map,
																				position : coords
																			});

																	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다

																	map
																			.setCenter(coords);

																}
															});
										</script>

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
