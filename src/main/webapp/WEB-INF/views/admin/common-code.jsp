<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
   
   <!-- 여기다가 나만의 새로운 css 만들기 -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainpage-style.css">
   
   <style>
   
   		.sections {
   			width: 1200px;
   			margin: 0 auto;
   		}
   		
   		.modal-body-sections {
   			width: 560px;
   			margin: 0 auto;
   		}
   
   </style>
   
</head>
<body>

<%@ include file="../include/header.jsp" %>
	   
	<div class="mainbox">
	
		<div class="sections">

			<a href="#" class="list-group-item active notice-list-top" style="margin-top: 20px;"> 
				<span class="main-board-title" style="color: #808080;">공통코드 목록</span>
			</a>

			<form class="navbar-form navbar-left navbar-main-top pull-left" role="search" style="padding: 0; margin-left: 0;">
				<select class="form-control" name="condition" style="height: 30px; font-size: 13px;">
                            <option value="title">코드</option>
                            <option value="content">상위코드</option>
                </select>
			
				<div class="input-group"> 
					<input type="text" class="form-control" placeholder="검색어를 입력하세요" style="height: 30px; font-size: 13px;">
					<span class="input-group-btn">
						<button class="btn btn-default" type="submit" style="height: 30px; background: #d3d3d3; font-size: 13px;">검색</button>
					</span>
				</div>
			</form>
			
			<form class="navbar-form navbar-left navbar-main-top pull-right" role="search" style="padding: 0; margin-left: 0;">
				<div class="input-group"> 
					<span class="input-group-btn">
						<button id="btn-common-regist" class="btn btn-success" type="button" style="height: 30px; font-size: 13px;">공통코드 등록</button>
					</span>
				</div>
			</form>


			<table class="table table-bordered table-condensed" style="margin-top: 20px;">
				<thead style="width: 10px; font-size: 13px; background: #CFD5F5;">
					<tr style="font-family: sans-serif;">
						<th style="width: 6%;">순번</th>
						<th style="width: 20%;">분류</th>
						<th style="width: 12%;">코드명</th>
						<th style="width: 40%;">코드내용</th>
						<th style="width: 10%;">사용여부</th>
						<th style="width: 12%;">상위코드</th>
					</tr>
				</thead>
				<tbody style="width: 10px; font-size: 13px; background: #F7F7F7;">
					
					<c:forEach var="commonList" items="${commonList}" varStatus="index">
						<tr id="commonDetail${index.index}" style="cursor: pointer;">
							<td>${commonList.commonNum}</td>
							<td>${commonList.upperValue}</td>
							<td>${commonList.commonCODE}</td>
							<td>${commonList.commonValue}</td>
							<td>${commonList.commonUse}</td>
							<td>${commonList.upperCODE}</td>
						</tr>
						
						<%@ include file="modal-common-detail.jsp" %>
						
						<script>
							
							$(function() {
								
								$('#commonDetail${index.index}').click(function() {
									
									$.ajax({
										type: 'GET',
										url: '<c:url value="/admin/commonDetail?commonCODE=" />' + '${commonList.commonCODE}',
										
										success: function(common) {
											$('#modal-common-upperValue').text(common.upperValue);
											$('#modal-common-commonCODE').text(common.commonCODE);
											$('#modal-common-commonValue').text(common.commonValue);
											$('#modal-common-commonUse').text(common.commonUse);
											$('#modal-common-upperCODE').text(common.upperCODE);
											$('#hidden-common-code').val(common.commonCODE);
											$('#hidden-common-value').val(common.commonValue);
											$('#hidden-common-use').val(common.commonUse);
											$('#hidden-common-upper').val(common.upperCODE);
											
											if($('#modal-common-commonUse').text() == 'Y') {
												$('#btn-modal-common-modify-yes').css('display', 'none');
												$('#btn-modal-common-modify-no').css('display', 'inline-block');
											} else {
												$('#btn-modal-common-modify-yes').css('display', 'inline-block');
												$('#btn-modal-common-modify-no').css('display', 'none');
											}
										},
										
										error: function() {
											alert('공통코드 상세 보기 요청 처리 중 서버오류가 발생했습니다.');
											return;
										}
									});
									
									$('#modal-common-detail').modal('show');
								});
								
							});
						
						</script>
						
					</c:forEach>
					
					<%@ include file="modal-common-regist.jsp" %>

				</tbody>
			</table>

		</div>
	
		<%@ include file="../include/footer.jsp" %>
	   
	</div>
   
</body>
</html>


<script>

	//특정 메시지 표현을 위한 스크립트
	const msg = '${msg}';
	
	if(msg != '') {
		alert(msg);
	}
	
	
	$(function() {
		
		$('#btn-common-regist').click(function() {
			$('#modal-common-regist').modal('show');
		});
		
	});

</script>
