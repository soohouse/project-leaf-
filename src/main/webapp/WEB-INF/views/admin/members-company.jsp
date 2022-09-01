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
   		
   		.nav-tabs>li>a {
   			font-weight: 700;
   		}
   
   		.modal-body-sections {
   			width: 560px;
   			margin: 0 auto;
   		}
   		
   		#members-company-intro::-webkit-scrollbar {
 			width: 3px;
  			background-color: #C7C7C7;
		}
	
	
		#members-company-intro::-webkit-scrollbar-thumb {
			background: #535353;
		}
   		
   </style>
   
</head>
<body>

<%@ include file="../include/header.jsp" %>
	   
	<div class="mainbox">
	
		<div class="sections">

			<a href="#" class="list-group-item active notice-list-top" style="margin-top: 20px;"> 
				<span class="main-board-title" style="color: #2C4F22;">개발자 목록</span>
			</a>

			
			
			<ul class="nav nav-tabs" style="text-align: center;">
			  <li role="presentation" class="nav-item">
			  	<a href="#" id="btn-user-tab" data-toggle="tab" style="color: #3071A9;">일반회원</a>
			  </li>
			  <li role="presentation" class="nav-item active" id="li-company-tab">
			  	<a href="#" id="btn-company-tab" data-toggle="tab" style="color: #3071A9;">기업회원</a>
			  </li>
			</ul>
			
			
					
					<form class="navbar-form navbar-left navbar-main-top pull-left" role="search" action="<c:url value='/membersList/membersListCompany'/>" style="padding: 0; margin-left: 0; margin-top: 30px;">
						<select class="form-control" name="condition" style="height: 30px; font-size: 13px;">
		                            <option value="CID" ${pc.paging.condition == 'CID' ? 'selected' : ''}>기업 ID</option>
		                            <option value="Cname" ${pc.paging.condition == 'Cname' ? 'selected' : ''}>기업명</option>
		                </select>
					
						<div class="input-group"> 
							<input type="text" name="keyword" class="form-control" value="${pc.paging.keyword}" placeholder="검색어를 입력하세요" style="height: 30px; font-size: 13px;">
							<span class="input-group-btn">
								<button class="btn btn-default" id="btn-company-search" type="submit" style="height: 30px; background: #d3d3d3; font-size: 13px;">검색</button>
							</span>
						</div>
					</form>
				
					<table class="table table-bordered" style="margin-top: 20px;">
						<thead style="width: 10px; font-size: 13px; background: #ccac00;">
							<tr style="font-family: sans-serif;">
								<th style="width: 6%;">회원번호</th>
								<th style="width: 12%;">기업 ID</th>
								<th style="width: 30%;">기업명</th>
								<th style="width: 20%;">기업 전화번호</th>
								<th style="width: 20%;">기업 이메일</th>
								<th style="width: 12%;">비고</th>
							</tr>
						</thead>
						<tbody style="width: 10px; font-size: 13px; background: #FCFCFC;">
							
							<c:forEach var="companyMembers" items="${companyMembers}" varStatus="index">
							<tr id="companyMembersDetail${index.index}" style="cursor: pointer;">
								<td>${companyMembers.companyNO}</td>
								<td>${companyMembers.companyID}</td>
								<td>${companyMembers.companyName}</td>
								<td>${companyMembers.companyPhone}</td>
								<td>${companyMembers.companyEmail}</td>
								<td>${companyMembers.commonValue}</td>
							</tr>
							
							<%@ include file="../modal_mypage/members-company.jsp" %>
						
						<script>
							
							$(function() {
								
								$('#companyMembersDetail${index.index}').click(function() {
									
									$.ajax({
										type: 'GET',
										url: '<c:url value="/membersList/membersCompany?companyNO=" />' + '${companyMembers.companyNO}',
										
										success: function(company) {
											console.log(company.companyNO);
											
											$('#members-company-id').text(company.companyID);
											$('#members-company-name').text(company.companyName);
											$('#members-company-phone').text(company.companyPhone);
											$('#members-company-email').text(company.companyEmail);
											
											if(company.companyIntro == null || company.companyIntro == '') {
												$('#members-company-intro').text('');
											} else {
												$('#members-company-intro').text(company.companyIntro);
											}
											
											if(company.companyIntroRealname == null || company.companyIntroRealname == '') {
												$('#members-company-intro-realname').text('');
											} else {
												$('#members-company-intro-realname').text(company.companyIntroRealname);
											}
											
											$('#members-company-logo').attr('src', '<c:url value="/company/companyLogoGet?companyNO=" />' + company.companyNO);
											$('#hidden-members-company-no').val(company.companyNO);
											$('#members-main-company-id').text(company.companyID);
											$('#members-main-company-name').text(company.companyName);
										},
										
										error: function() {
											alert('기업 목록 상세보기 요청 처리 중 서버오류가 발생했습니다.');
											return;
										}
									});
									
									$('#modal-members-company').modal('show');
								});
								
							});
						
						</script>
							
							</c:forEach>
						</tbody>
					</table>
					<!-- 기업회원 탭 페이징 -->
					<div class="text-center">
						<form action="<c:url value='/membersList/membersListCompany'/>" name="pageForm">
							<ul class="pagination pagination-sm">
								<c:if test="${pc.prev }">
									<!-- 이전버튼 -->
									<li><a
										href="/membersList/membersListCompany?pageNum=${pc.beginPage-1}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}"
										data-pagenum="${pc.beginPage-1 }"> << </a></li>
								</c:if>
								<c:forEach var="num" begin="${pc.beginPage }"
									end="${pc.endPage }">
									<li class="${pc.paging.pageNum == num ? 'active' : '' }"><a
										href="/membersList/membersListCompany?pageNum=${num}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}"
										data-pagenum='${num }'>${num }</a></li>
								</c:forEach>
								<c:if test="${pc.next }">
									<!-- 다음버튼 -->
									<li><a
										href="/membersList/membersListCompany?pageNum=${pc.endPage+1}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}"
										data-pagenum="${pc.endPage-1 }"> >> </a></li>
								</c:if>
							</ul>
							<input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
							<input type="hidden" name="cpp" value="${pc.paging.cpp}">
							<input type="hidden" name="condition"
								value="${pc.paging.condition}"> <input type="hidden"
								name="keyword" value="${pc.paging.keyword}">
						</form>
					</div>

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
	
	//페이징
	$(function() {
		$('#pagination').on('click', 'a', function(e) {
			e.preventDefault(); //a태그의 고유기능 중지.
			const value = $(this).data('pagenum'); //-> jQuery
			console.log(value);
			document.pageForm.pageNum.value = value;
			document.pageForm.submit();
		});
		
		
		$('#btn-user-tab').click(function() {
			location.href = '<c:url value="/membersList/membersList" />';
		});
		
		
		$('#btn-company-tab').click(function() {
			location.href = '<c:url value="/membersList/membersListCompany" />';
		});
		
	}); //end jQuery
	

</script>
