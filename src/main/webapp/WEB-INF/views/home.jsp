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

	<div class="container">

		<section>
	        <div class="container-fluid">
	            <div class="row">
	                <div class="col-xs-12 slide-list">
	                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
	                        <!-- Indicators -->
	                        <ol class="carousel-indicators">
	                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	                            <li data-target="#myCarousel" data-slide-to="1"></li>
	                            <li data-target="#myCarousel" data-slide-to="2"></li>
	                            <li data-target="#myCarousel" data-slide-to="3"></li>
	                        </ol>
	
	                        <!-- Wrapper for slides -->
	                        <div class="carousel-inner">
	                            <div class="item active">
	                                <a href="###">
	                                <img src="resources/img/main3.png" alt="슬라이드1">
	                                </a>
	                            </div>
	                            <div class="item">
	                                <a href="##">
	                                <img src="resources/img/main2.png" alt="슬라이드2">
	                                </a>
	                            </div>
	                            <div class="item">
	                                <a href="##">
	                                <img src="resources/img/main1.png" alt="슬라이드3">
	                                </a>
	                            </div>
	                            <div class="item">
	                                <a href="##">
	                                <img src="resources/img/main4.jpg" alt="슬라이드4">
	                                </a>
	                            </div>
	                        </div>
	
	                        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
	                            <span class="glyphicon glyphicon-chevron-left"></span>
	                            <span class="sr-only">Previous</span>
	                        </a>
	                        <a class="right carousel-control" href="#myCarousel" data-slide="next">
	                            <span class="glyphicon glyphicon-chevron-right"></span>
	                            <span class="sr-only">Next</span>
	                        </a>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <!--슬라이드 끝-->
	        
	    </section>
	
	</div>
	
	
	<div id="wrapper">
    <div class="page-header">
        <h1>주요사항</h1>
      </div>
      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
          <li data-target="#carousel-example-generic" data-slide-to="1"></li>
          <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <div class="item active">
            <img src="./img/gaebalja.jpg" alt="First slide">
          </div>
          <div class="item">
            <img src="./img/gaebalja2.jpg" alt="Second slide">
          </div>
          <div class="item">
            <img src="./img/naver.jpg" alt="Third slide">
          </div>
        </div>
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </div>
</div>
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
      <h1 class="page-header">프로젝트 목록</h1>

      <div class="row placeholder">
        <div class="col-xs-6 col-sm-3 placeholder"><a href="#">
          <img src="./img/earth.jpg" width="200" height="200" class="img-responsive" alt="사진"></a>
          <br> <a href="#"><h4>환경 푸르미 <br>프로젝트 개발자 모집</h4></a>
          <span class="text-muted">(주)그린컴퍼니</span><br>
          <span class="text-muted">모집기간 6.10 ~ 7.22</span>
        </div>
        <div class="col-xs-6 col-sm-3 placeholder"><a href="#">
          <img src="./img/road.jpg" width="200" height="200" class="img-responsive" alt="사진"></a>
          <a href="#"><h4>도로 안내 프로젝트 <br> 개발자 모집</h4></a>
          <span class="text-muted">(주)조은도로</span><br>
          <span class="text-muted">모집기간 6.31 ~ 7.31</span>
        </div>
        <div class="col-xs-6 col-sm-3 placeholder"><a href="#">
          <img src="./img/car.jpg" width="200" height="200" class="img-responsive" alt="사진"></a>
          <a href="#"><h4>중고 자동차 <br>거래 페이지</h4></a>
          <span class="text-muted">(주)나이스딜러</span><br>
          <span class="text-muted">모집기간 6.31 ~ 7.31</span>
        </div>
        <div class="col-xs-6 col-sm-3 placeholder"><a href="#">
          <img src="./img/trumpet.jpg" width="200" height="200" class="img-responsive" alt="사진"></a>
          <a href="#"><h4>음원 제작 프로그램 <br> 개발자 모집</h4></a>
          <span class="text-muted">(주)가나다라</span><br>
          <span class="text-muted">모집기간 6.10 ~ 7.22</span>
          
        </div>
        
      </div>
      <div class="container">
        <h1 class="text-primary">공지사항</h1>
        <table class="table table-hover table-bordered table-condensed">
            <thead>
                <tr class="warning">
                    <th>번호</th>
                    <th>제목</th>
                    <th>글쓴이</th>
                </tr>
            </thead>
            <tbody>
                <tr class="info">
                    <td>1</td>
                    <td>7월 개발자 모집 공고 공지사항</td>
                    <td>관리자</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>이력서 관리 및 지원 방법</td>
                    <td>관리자</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>2022년 7월 17일 공지사항</td>
                    <td>관리자</td>
                </tr>
            </tbody>
        </table>
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


