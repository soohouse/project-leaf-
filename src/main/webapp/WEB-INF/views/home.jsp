<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

	<meta charset="UTF-8">

	<title>프로야구 커뮤니티</title>
	
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	
	<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	
	<!-- 개인 디자인 추가, ?after를 붙이면 기존에 동일한 이름의 파일을 인식하는것이 아닌 새로운 파일을 인식하게 된다. -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mystyle.css">
	
</head>
<body>

	<%@ include file="include/header.jsp" %>

	<div id="pagewr">
	<!-- 사이드바 -->
			<div id="wrapper">
				<div id="sidebar-wrapper">
					<aside id="sidebar">
						<ul id="sidemenu" class="sidebar-nav">
							<li>
								<a href="#">
									<span class="sidebar-icon"><i class="fa fa-dashboard"></i></span>
									<span class="sidebar-title">Home</span>
								</a>
							</li>
							<li>
								<a class="accordion-toggle collapsed toggle-switch" data-toggle="collapse" href="#submenu-2">
									<span class="sidebar-icon"><i class="fa fa-users"></i></span>
									<span class="sidebar-title">프로젝트</span>
									<b class="caret"></b>
								</a>
								<ul id="submenu-2" class="panel-collapse collapse panel-switch" role="menu">
									<li><a href="#"><i class="fa fa-caret-right"></i>프로젝트 목록</a></li>
								</ul>
							</li>
							<li>
								<a class="accordion-toggle collapsed toggle-switch" data-toggle="collapse" href="#submenu-3">
									<span class="sidebar-icon"><i class="fa fa-newspaper-o"></i></span>
									<span class="sidebar-title">게시판</span>
									<b class="caret"></b>
								</a>
								<ul id="submenu-3" class="panel-collapse collapse panel-switch" role="menu">
									<li><a href="#"><i class="fa fa-caret-right"></i>공지사항</a></li>
									<li><a href="#"><i class="fa fa-caret-right"></i>Q&A</a></li>
									<li><a href="#"><i class="fa fa-caret-right"></i>자유게시판</a></li>
									<li><a href="#"><i class="fa fa-caret-right"></i>자료실</a></li>
								</ul>
							</li>
							<li>
								<a class="accordion-toggle collapsed toggle-switch" data-toggle="collapse" href="#submenu-4">
									<span class="sidebar-icon"><i class="fa fa-newspaper-o"></i></span>
									<span class="sidebar-title">마이페이지</span>
									<b class="caret"></b>
								</a>
								<ul id="submenu-4" class="panel-collapse collapse panel-switch" role="menu">
									<li><a href="#"><i class="fa fa-caret-right"></i>내 정보</a></li>
									<li><a href="#"><i class="fa fa-caret-right"></i>쪽지함</a></li>
									<li><a href="#"><i class="fa fa-caret-right"></i>지원 현황</a></li>
									<li><a href="#"><i class="fa fa-caret-right"></i>지원 결과 조회</a></li>
									<li><a href="#"><i class="fa fa-caret-right"></i>이력서 관리</a></li>
								</ul>
							</li>
						</ul>
					</aside>            
				</div>
				<main id="page-content-wrapper" role="main">
				</main>
			</div>
	<!-- 사이드바 끝 -->
	
	<!-- 본문 -->
		<div id="page-wrapper">
			<div class="container">
			
				<h1 class="page-header">
					Hello world!  
				</h1>
				
				<P class="lead">  The time on the server is ${serverTime}. </P>
				
			</div>
			<div class="container">
			
				<h1 class="page-header">
					Hello world!  
				</h1>
				
				<P class="lead">  The time on the server is ${serverTime}. </P>
				
			</div>
			<div class="container">
			
				<h1 class="page-header">
					Hello world!  
				</h1>
				
				<P class="lead">  The time on the server is ${serverTime}. </P>
				
			</div>
			<div class="container">
			
				<h1 class="page-header">
					Hello world!  
				</h1>
				
				<P class="lead">  The time on the server is ${serverTime}. </P>
				
			</div>
			<div class="container">
			
				<h1 class="page-header">
					Hello world!  
				</h1>
				
				<P class="lead">  The time on the server is ${serverTime}. </P>
				
			</div>
			<div class="container">
			
				<h1 class="page-header">
					Hello world!  
				</h1>
				
				<P class="lead">  The time on the server is ${serverTime}. </P>
				
			</div>
			<div class="container">
			
				<h1 class="page-header">
					Hello world!  
				</h1>
				
				<P class="lead">  The time on the server is ${serverTime}. </P>
				
			</div>
		</div>
	<!-- 본문 끝 -->
	
		</div>
	
	<%@ include file="include/footer.jsp" %>
	
</body>
</html>


<script>

	const msg = '${msg}';
	
	if(msg != '') {
		alert(msg);
	}

</script>


