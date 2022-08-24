<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<c:choose>
	
		<c:when test="${company == null && user.commonCODE == 'ADM001'}">
			<!-- 일반회원 상단바 / 메뉴 -->
			<div id="navbar-wrapper">
		        <header>
		            <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		                <div class="container-fluid">
		                    <div class="navbar-header">
		                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
		                            <span class="sr-only">Toggle navigation</span>
		                            <span class="icon-bar"></span>
		                            <span class="icon-bar"></span>
		                            <span class="icon-bar"></span>
		                        </button>
		                        <a class="navbar-brand" href="<c:url value='/' />"><img class="header-img-logo" alt="로고" src="${pageContext.request.contextPath}/resources/img/RunWith.png"></a>
		                    </div>
		                    <div id="navbar-collapse" class="collapse navbar-collapse">
		                        <form class="navbar-form navbar-left navbar-main-top" role="search">
		                            <div class="input-group">
		                                <input type="text" class="form-control" placeholder="검색어를 입력하세요">
		                                <span class="input-group-btn">
		                                    <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
		                                </span>
		                            </div>
		                        </form>
		                        <ul class="nav navbar-nav navbar-right">
		                          <ul class="nav navbar-nav navbar-right">
		                            <ul class="nav navbar-nav">
		                            	<li style="margin-right: 40px; background: #A6CAEE;">
			                            	<img alt="프로필사진" src="<c:url value='/user/userProfileGet?userNO=${user.userNO}' />" width="30px" height="30px" style="border-radius: 15px; margin-left: 12px; margin-right: -5px;">
		                            		<a id="header-user-profile" style="display: inline-block; font-size: 14px; font-weight: bold; font-family: sans-serif;">${user.userID}</a>
		                            	</li>
		                               <li><a id="btn-user-logout" style="cursor: pointer; font-family: sans-serif;">로그아웃</a></li>
		                            </ul>
		                            
		                              <li class="dropdown">
		                                  <a class="dropdown-toggle" data-toggle="dropdown" href="#" style="font-family: sans-serif;">마이페이지
		                                      <span class="caret"></span>
		                                  </a>
		                                  <ul class="dropdown-menu">
		                                      <li><a href="<c:url value='/usermypage/usermypage' />">내 정보</a></li>
		                                      <li><a href="<c:url value='/userapply/applystatus' />">지원 현황</a></li>
		                                  </ul>
		                              </li>
		                              
		                              <li class="dropdown">
		                               <a id="bell" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                                  
		                                  <span class="fa fa-bell"></span>
		                               </a>
		                               <ul class="dropdown-menu" role="menu">
		                                  <li class="dropdown-header">쪽지</li>
		                                  <li><a href="#" id="user-receive-message2">받은 쪽지함</a></li>
		                               </ul>
		                              </li>
		                    </div>
		                </div>
		            </nav>
		        </header>
		    </div>
		    <div id="wrapper">
		        <div id="sidebar-wrapper">
		            <aside id="sidebar">
		                <ul id="sidemenu" class="sidebar-nav">
		                    <li>
		                        <a id="mainmenu" class="dropdown-toggle">
		                            <span class="sidebar-icon"><i class="fa fa-list"></i></span>
		                            <span class="sidebar-title">전체 메뉴</span>
		                        </a>
		                    </li>
		                    
		                    <li class="dropdown">
		                        <a id="mainmenu-1" class="accordion-toggle collapsed toggle-switch" data-toggle="collapse" role="button" href="#submenu-1">
		                            <span class="sidebar-icon"><i class="fa fa-book"></i></span>
		                            <span class="sidebar-title">프로젝트</span>
		                            <b class="caret"></b>
		                        </a>
		                        <ul id="submenu-1" class="panel-collapse collapse panel-switch" role="menu">
		                            <li class="sidebar-contents1"><a href="<c:url value='/project/project' />" class="sidebar-contents2"><i class="fa fa-caret-right"></i>프로젝트 목록</a></li>
		                        </ul>
		                    </li>
		                    
		                    <li>
			                    <a id="mainmenu-2" class="accordion-toggle collapsed toggle-switch" data-toggle="collapse" href="#submenu-2">
			                        <span class="sidebar-icon"><i class="fa fa-users"></i></span>
			                        <span class="sidebar-title">게시판</span>
			                        <b class="caret"></b>
			                    </a>
			                    <ul id="submenu-2" class="panel-collapse collapse panel-switch" role="menu">
			                        <li><a href="<c:url value='/notice/noticeList' />"><i class="fa fa-caret-right"></i>공지사항</a></li>
			                        <li><a href="<c:url value='/question/questionList' />"><i class="fa fa-caret-right"></i>Q&A</a></li>
			                        <li><a href="<c:url value='/board/boardList' />"><i class="fa fa-caret-right"></i>자유게시판</a></li>
			                        <li><a href="<c:url value='/archive/archiveList' />"><i class="fa fa-caret-right"></i>자료실</a></li>
			                    </ul>
		                    </li>
		                    <li>
		                        <a id="mainmenu-3" class="accordion-toggle collapsed toggle-switch" data-toggle="collapse" href="#submenu-3">
		                            <span class="sidebar-icon"><i class="fa fa-newspaper-o"></i></span>
		                            <span class="sidebar-title">마이페이지</span>
		                            <b class="caret"></b>
		                        </a>
		                        <ul id="submenu-3" class="panel-collapse collapse panel-switch" role="menu">
		                            <li><a href="<c:url value='/usermypage/usermypage' />"><i class="fa fa-caret-right"></i>내 정보</a></li>
		                            <li><a href="#" id="user-receive-message"><i class="fa fa-caret-right"></i>쪽지함</a></li>
		                            <li><a href="<c:url value='/userapply/applystatus' />"><i class="fa fa-caret-right"></i>지원 현황</a></li>
		                            <li><a href="<c:url value='/userapply/applyresult' />"><i class="fa fa-caret-right"></i>지원 결과 조회</a></li>
		                        </ul>
		                    </li>
		                </ul>
		            </aside>            
		        </div>
		        <main id="page-content-wrapper" role="main">
		        </main>
		    </div>
		</c:when>
		
		
		
		<c:when test="${user == null && company != null}">
			<!-- 기업회원 상단바 / 메뉴 -->
			<div id="navbar-wrapper">
		        <header>
		            <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="background: #6BB656;">
		                <div class="container-fluid">
		                    <div class="navbar-header">
		                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
		                            <span class="sr-only">Toggle navigation</span>
		                            <span class="icon-bar"></span>
		                            <span class="icon-bar"></span>
		                            <span class="icon-bar"></span>
		                        </button>
		                        <a class="navbar-brand" href="<c:url value='/' />"><img class="header-img-logo" alt="로고" src="${pageContext.request.contextPath}/resources/img/RunWith4.png"></a>
		                    </div>
		                    <div id="navbar-collapse" class="collapse navbar-collapse">
		                        <form class="navbar-form navbar-left navbar-main-top" role="search">
		                            <div class="input-group">
		                                <input type="text" class="form-control" placeholder="검색어를 입력하세요">
		                                <span class="input-group-btn">
		                                    <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
		                                </span>
		                            </div>
		                        </form>
		                        <ul class="nav navbar-nav navbar-right">
		                          <ul class="nav navbar-nav navbar-right">
		                            <ul class="nav navbar-nav">
		                            	<li style="margin-right: 40px; background: #84C272;">
		                            		<img alt="로고사진" src="<c:url value='/company/companyLogoGet?companyNO=${company.companyNO}' />" width="30px" height="30px" style="border-radius: 15px; margin-left: 12px; margin-right: -5px;">
		                            		<a id="header-user-profile" style="display: inline-block; font-size: 14px; font-weight: bold; font-family: sans-serif;">${company.companyID}</a>
		                            	</li>
		                               <li><a id="btn-company-logout" style="cursor: pointer; font-family: sans-serif;">로그아웃</a></li>
		                            </ul>
		                            
		                              <li class="dropdown">
		                                  <a class="dropdown-toggle" data-toggle="dropdown" href="#" style="font-family: sans-serif;">기업페이지
		                                      <span class="caret"></span>
		                                  </a>
		                                  <ul class="dropdown-menu">
		                                      <li><a href="<c:url value='/usermypage/usermypage' />">기업 정보</a></li>
		                                      <li><a href="#">지원 현황</a></li>
		                                  </ul>
		                              </li>
		                              
		                              <li class="dropdown">
		                               <a id="bell" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                                  
		                                  <span class="fa fa-bell"></span>
		                               </a>
		                               <ul class="dropdown-menu" role="menu">
		                                  <li class="dropdown-header">쪽지</li>
		                                  <li><a href="#" id="company-receive-message">받은 쪽지함</a></li>
		                                  <li><a href="<c:url value='/userList/userList' />">쪽지 쓰기</a></li>
		                               </ul>
		                              </li>
		                    </div>
		                </div>
		            </nav>
		        </header>
		    </div>
		    <div id="wrapper">
		        <div id="sidebar-wrapper" style="background: #648F5A;">
		            <aside id="sidebar">
		                <ul id="sidemenu" class="sidebar-nav">
		                    <li>
		                        <a id="mainmenu" class="dropdown-toggle" style="background: #89C578;">
		                            <span class="sidebar-icon"><i class="fa fa-list"></i></span>
		                            <span class="sidebar-title">전체 메뉴</span>
		                        </a>
		                    </li>
		                    
		                    <li class="dropdown">
		                        <a id="mainmenu-1" class="accordion-toggle collapsed toggle-switch" data-toggle="collapse" role="button" href="#submenu-1" style="background: #5FA949;">
		                            <span class="sidebar-icon"><i class="fa fa-book"></i></span>
		                            <span class="sidebar-title">프로젝트</span>
		                            <b class="caret"></b>
		                        </a>
		                        <ul id="submenu-1" class="panel-collapse collapse panel-switch" role="menu" style="background: #5FA949;">
		                            <li class="sidebar-contents1"><a href="<c:url value='/project/project' />" class="sidebar-contents2"><i class="fa fa-caret-right"></i>프로젝트 목록</a></li>
		                            <li class="sidebar-contents1"><a href="<c:url value='/project/projectputin' />" class="sidebar-contents2"><i class="fa fa-caret-right"></i>프로젝트 등록</a></li>
		                            <li class="sidebar-contents1"><a href="<c:url value='/userList/userList' />" class="sidebar-contents2"><i class="fa fa-caret-right"></i>개발자 목록</a></li>
		                        </ul>
		                    </li>
		                    
		                    <li>
			                    <a id="mainmenu-2" class="accordion-toggle collapsed toggle-switch" data-toggle="collapse" href="#submenu-2" style="background: #4A8639;">
			                        <span class="sidebar-icon"><i class="fa fa-users"></i></span>
			                        <span class="sidebar-title">게시판</span>
			                        <b class="caret"></b>
			                    </a>
			                    <ul id="submenu-2" class="panel-collapse collapse panel-switch" role="menu" style="background: #4A8639;">
			                        <li><a href="<c:url value='/notice/noticeList' />"><i class="fa fa-caret-right"></i>공지사항</a></li>
			                        <li><a href="<c:url value='/board/boardList' />"><i class="fa fa-caret-right"></i>자유게시판</a></li>
			                        <li><a href="<c:url value='/archive/archiveList' />"><i class="fa fa-caret-right"></i>자료실</a></li>
			                    </ul>
		                    </li>
		                    <li>
		                        <a id="mainmenu-3" class="accordion-toggle collapsed toggle-switch" data-toggle="collapse" href="#submenu-3" style="background: #3C6C2D;">
		                            <span class="sidebar-icon"><i class="fa fa-newspaper-o"></i></span>
		                            <span class="sidebar-title">기업페이지</span>
		                            <b class="caret"></b>
		                        </a>
		                        <ul id="submenu-3" class="panel-collapse collapse panel-switch" role="menu" style="background: #3C6C2D;">
		                            <li><a href="<c:url value='/usermypage/usermypage' />"><i class="fa fa-caret-right"></i>기업 정보</a></li>
		                            <li><a href="#" id="company-send-message"><i class="fa fa-caret-right"></i>보낸 쪽지함</a></li>
		                            <li><a href="<c:url value='/project/projectMyApply' />"><i class="fa fa-caret-right"></i>지원 현황</a></li>
		                            <li><a href="<c:url value='/project/projectadmin' />"><i class="fa fa-caret-right"></i>프로젝트 관리</a></li>
		                        </ul>
		                    </li>
		                </ul>
		            </aside>            
		        </div>
		        <main id="page-content-wrapper" role="main">
		        </main>
		    </div>
		</c:when>
		

		
		<c:when test="${company == null && user.commonCODE == 'ADM002'}">
			<!-- 관리자 상단바 / 메뉴 -->
			<div id="navbar-wrapper">
		        <header>
		            <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="background: #ccac00;">
		                <div class="container-fluid">
		                    <div class="navbar-header">
		                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
		                            <span class="sr-only">Toggle navigation</span>
		                            <span class="icon-bar"></span>
		                            <span class="icon-bar"></span>
		                            <span class="icon-bar"></span>
		                        </button>
		                        <a class="navbar-brand" href="<c:url value='/' />"><img class="header-img-logo" alt="로고" src="${pageContext.request.contextPath}/resources/img/RunWith3.png"></a>
		                    </div>
		                    <div id="navbar-collapse" class="collapse navbar-collapse">
		                        <form class="navbar-form navbar-left navbar-main-top" role="search">
		                            <div class="input-group">
		                                <input type="text" class="form-control" placeholder="검색어를 입력하세요">
		                                <span class="input-group-btn">
		                                    <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
		                                </span>
		                            </div>
		                        </form>
		                        <ul class="nav navbar-nav navbar-right">
		                          <ul class="nav navbar-nav navbar-right">
		                            <ul class="nav navbar-nav">
		                            	<li style="margin-right: 40px; background: #E1BF00;">
		                            		<img alt="프로필사진" src="<c:url value='/user/userProfileGet?userNO=${user.userNO}' />" width="30px" height="30px" style="border-radius: 15px; margin-left: 12px; margin-right: -5px;">
		                            		<a id="header-user-profile" style="display: inline-block; font-size: 14px; font-weight: bold; font-family: sans-serif;">${user.userID}</a>
		                            	</li>
		                               <li><a id="btn-user-logout" style="cursor: pointer; font-family: sans-serif;">로그아웃</a></li>
		                            </ul>
		                            
		                              <li class="dropdown">
		                                  <a class="dropdown-toggle" data-toggle="dropdown" href="#" style="font-family: sans-serif;">관리
		                                      <span class="caret"></span>
		                                  </a>
		                                  <ul class="dropdown-menu">
		                                      <li><a href="#">프로젝트 관리</a></li>
		                                      <li><a href="#">공지사항 관리</a></li>
		                                      <li><a href="#">사용자 관리</a></li>
		                                  </ul>
		                              </li>
		                              
		                              <li class="dropdown">
		                               <a id="bell" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                                  
		                                  <span class="fa fa-bell"></span>
		                               </a>
		                               <ul class="dropdown-menu" role="menu">
		                                  <li class="dropdown-header">쪽지</li>
		                                  <li><a href="#">받은 쪽지함</a></li>
		                                  <li><a href="#">쪽지 쓰기</a></li>
		                               </ul>
		                              </li>
		                    </div>
		                </div>
		            </nav>
		        </header>
		    </div>
		    <div id="wrapper">
		        <div id="sidebar-wrapper" style="background: #BDAE68;">
		            <aside id="sidebar">
		                <ul id="sidemenu" class="sidebar-nav">
		                    <li>
		                        <a id="mainmenu" class="dropdown-toggle" style="background: #D7C449;">
		                            <span class="sidebar-icon"><i class="fa fa-cog"></i></span>
		                            <span class="sidebar-title">관리 메뉴</span>
		                        </a>
		                    </li>
		                    
		                    <li class="dropdown">
		                        <a id="mainmenu-1" class="accordion-toggle collapsed toggle-switch" data-toggle="collapse" role="button" href="#submenu-1" style="background: #C0A703;">
		                            <span class="sidebar-icon"><i class="fa fa-cogs"></i></span>
		                            <span class="sidebar-title">시스템 관리</span>
		                            <b class="caret"></b>
		                        </a>
		                        <ul id="submenu-1" class="panel-collapse collapse panel-switch" role="menu" style="background: #C0A703;">
		                            <li><a href="#"><i class="fa fa-caret-right"></i>프로젝트 관리</a></li>
			                        <li><a href="#"><i class="fa fa-caret-right"></i>공지사항 관리</a></li>
			                        <li><a href="<c:url value='/membersList/membersList' />"><i class="fa fa-caret-right"></i>사용자 관리</a></li>
		                        </ul>
		                    </li>
		                    
		                    <li>
			                    <a id="mainmenu-2" class="accordion-toggle collapsed toggle-switch" data-toggle="collapse" href="#submenu-2" style="background: #A48E00;">
			                        <span class="sidebar-icon"><i class="fa fa-wrench"></i></span>
			                        <span class="sidebar-title">데이터 관리</span>
			                        <b class="caret"></b>
			                    </a>
			                    <ul id="submenu-2" class="panel-collapse collapse panel-switch" role="menu" style="background: #A48E00;">
			                        <li><a href="<c:url value='/admin/companyAccept' />"><i class="fa fa-caret-right"></i>기업 가입 관리</a></li>
			                        <li><a href="<c:url value='/admin/commonCODE' />"><i class="fa fa-caret-right"></i>공통코드 관리</a></li>
			                    </ul>
		                    </li>
		                    <li>
		                        <a id="mainmenu-3" class="accordion-toggle collapsed toggle-switch" data-toggle="collapse" href="#submenu-3" style="background: #7A6A00;">
		                            <span class="sidebar-icon"><i class="fa fa-users"></i></span>
		                            <span class="sidebar-title">게시판 관리</span>
		                            <b class="caret"></b>
		                        </a>
		                        <ul id="submenu-3" class="panel-collapse collapse panel-switch" role="menu" style="background: #7A6A00;">
		                            <li><a href="#"><i class="fa fa-caret-right"></i>Q&A 관리</a></li>
		                            <li><a href="#"><i class="fa fa-caret-right"></i>자유게시판 관리</a></li>
		                            <li><a href="#"><i class="fa fa-caret-right"></i>자료실 관리</a></li>
		                        </ul>
		                    </li>
		                    <li>
		                        <a id="mainmenu-4" class="accordion-toggle collapsed toggle-switch" data-toggle="collapse" href="#submenu-4" style="background: #574D00; color: white;">
		                            <span class="sidebar-icon"><i class="fa fa-bar-chart"></i></span>
		                            <span class="sidebar-title">통계</span>
		                            <b class="caret"></b>
		                        </a>
		                        <ul id="submenu-4" class="panel-collapse collapse panel-switch" role="menu" style="background: #574D00;">
		                            <li><a href="#" style="color: white;"><i class="fa fa-caret-right"></i>개발자 통계</a></li>
		                            <li><a href="#" style="color: white;"><i class="fa fa-caret-right"></i>기업 통계</a></li>
		                            <li><a href="#" style="color: white;"><i class="fa fa-caret-right"></i>프로젝트 통계</a></li>
		                        </ul>
		                    </li>
		                </ul>
		            </aside>            
		        </div>
		        <main id="page-content-wrapper" role="main">
		        </main>
		    </div>
		</c:when>
		
		
		
		<c:otherwise>
			<!-- 로그인 하지 않은 상태의 상단바 / 메뉴 -->
			<div id="navbar-wrapper">
		        <header>
		            <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
		                <div class="container-fluid">
		                    <div class="navbar-header">
		                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
		                            <span class="sr-only">Toggle navigation</span>
		                            <span class="icon-bar"></span>
		                            <span class="icon-bar"></span>
		                            <span class="icon-bar"></span>
		                        </button>
		                        <a class="navbar-brand" href="<c:url value='/' />"><img class="header-img-logo" alt="로고" src="${pageContext.request.contextPath}/resources/img/RunWith.png"></a>
		                    </div>
		                    <div id="navbar-collapse" class="collapse navbar-collapse">
		                        <form class="navbar-form navbar-left navbar-main-top" role="search">
		                            <div class="input-group">
		                                <input type="text" class="form-control" placeholder="검색어를 입력하세요">
		                                <span class="input-group-btn">
		                                    <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
		                                </span>
		                            </div>
		                        </form>
		                        <ul class="nav navbar-nav navbar-right">
		                          <ul class="nav navbar-nav navbar-right">
		                            <ul class="nav navbar-nav">
		                               <li><a id="btn-login" style="cursor: pointer; font-family: sans-serif;">로그인</a></li>
		                            </ul>
		                              
		                            <ul class="nav navbar-nav">
		                               <li><a href="<c:url value='/user/userRegist' />" id="btn-register" style="font-family: sans-serif;">회원가입</a></li>
		                            </ul>
		                              
		                              <li class="dropdown">
		                               <a id="bell" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
		                                  
		                                  <span class="fa fa-bell"></span>
		                               </a>
		                               <ul class="dropdown-menu" role="menu">
		                                  <li class="dropdown-header">쪽지</li>
		                                  <li><a href="#" onclick="alert('로그인이 필요한 서비스입니다.');">받은 쪽지함</a></li>
		                               </ul>
		                              </li>
		                    </div>
		                </div>
		            </nav>
		        </header>
		    </div>
		    <div id="wrapper">
		        <div id="sidebar-wrapper">
		            <aside id="sidebar">
		                <ul id="sidemenu" class="sidebar-nav">
		                    <li>
		                        <a id="mainmenu" class="dropdown-toggle">
		                            <span class="sidebar-icon"><i class="fa fa-list"></i></span>
		                            <span class="sidebar-title">전체 메뉴</span>
		                        </a>
		                    </li>
		                    
		                    <li class="dropdown">
		                        <a id="mainmenu-1" class="accordion-toggle collapsed toggle-switch" data-toggle="collapse" role="button" href="#submenu-1">
		                            <span class="sidebar-icon"><i class="fa fa-book"></i></span>
		                            <span class="sidebar-title">프로젝트</span>
		                            <b class="caret"></b>
		                        </a>
		                        <ul id="submenu-1" class="panel-collapse collapse panel-switch" role="menu">
		                            <li class="sidebar-contents1"><a href="<c:url value='/project/project' />" class="sidebar-contents2"><i class="fa fa-caret-right"></i>프로젝트 목록</a></li>
		                        </ul>
		                    </li>
		                    
		                    <li>
			                    <a id="mainmenu-2" class="accordion-toggle collapsed toggle-switch" data-toggle="collapse" href="#submenu-2">
			                        <span class="sidebar-icon"><i class="fa fa-users"></i></span>
			                        <span class="sidebar-title">게시판</span>
			                        <b class="caret"></b>
			                    </a>
			                    <ul id="submenu-2" class="panel-collapse collapse panel-switch" role="menu">
			                        <li><a href="<c:url value='/notice/noticeList' />"><i class="fa fa-caret-right"></i>공지사항</a></li>
			                        <li><a href="<c:url value='/question/questionList' />"><i class="fa fa-caret-right"></i>Q&A</a></li>
			                        <li><a href="<c:url value='/board/boardList' />"><i class="fa fa-caret-right"></i>자유게시판</a></li>
			                        <li><a href="<c:url value='/archive/archiveList' />"><i class="fa fa-caret-right"></i>자료실</a></li>
			                    </ul>
		                    </li>
		                    <li>
		                        <a id="mainmenu-3" class="accordion-toggle collapsed toggle-switch" data-toggle="collapse" href="#submenu-3">
		                            <span class="sidebar-icon"><i class="fa fa-newspaper-o"></i></span>
		                            <span class="sidebar-title">마이페이지</span>
		                            <b class="caret"></b>
		                        </a>
		                        <ul id="submenu-3" class="panel-collapse collapse panel-switch" role="menu">
		                            <li><a href="<c:url value='/usermypage/usermypage' />"><i class="fa fa-caret-right"></i>내 정보</a></li>
		                            <li><a href="#" onclick="alert('로그인이 필요한 서비스입니다.');"><i class="fa fa-caret-right"></i>쪽지함</a></li>
		                            <li><a href="<c:url value='/userapply/applystatus' />"><i class="fa fa-caret-right"></i>지원 현황</a></li>
		                            <li><a href="<c:url value='/userapply/applyresult' />"><i class="fa fa-caret-right"></i>지원 결과 조회</a></li>
		                        </ul>
		                    </li>
		                </ul>
		            </aside>            
		        </div>
		        <main id="page-content-wrapper" role="main">
		        </main>
		    </div>
		    	
		</c:otherwise>
	
	</c:choose>

	
    
    <%@ include file="../login/modal-login.jsp" %>
    <%@ include file="../modal_mypage/receiveMailList.jsp" %>
    <%@ include file="../modal_mypage/sendMailList.jsp" %>
    <%@ include file="../modal_mypage/userMessageContent.jsp" %>
    <%@ include file="../modal_mypage/companyReceiveMessageList.jsp" %>
    <%@ include file="../modal_mypage/companyReceiveMessageContent.jsp" %>
    <%@ include file="../login/modal-ID-PW-find.jsp" %>
    <%@ include file="../login/modal-ID-PW-find-company.jsp" %>
    <%@ include file="../login/modal-password-new.jsp" %>
    <%@ include file="../login/modal-password-new-company.jsp" %>
      
    
    <script>
    
    	// jQuery 시작
    	$(function() {
    		
    		// 로그인 버튼 클릭 시 로그인 모달 창 오픈
    		$('#btn-login').click(function() {
    			$('#modal-login').modal('show');
    		});
    		
    		// 일반회원 ID/PW 찾기 버튼 클릭 시 찾기 모달 창 오픈
    		$('#btn-modal-id-pw-find').click(function() {
    			$('#modal-ID-PW-find').modal('show');
    		});
    		
    		// 기업회원 ID/PW 찾기 버튼 클릭 시 찾기 모달 창 오픈
    		$('#btn-modal-company-id-pw-find').click(function() {
    			$('#modal-ID-PW-find-company').modal('show');
    		});
    		
    		// 유저 쪽지함 버튼 클릭 시 받은 쪽지함 모달 창 오픈
    		$('#user-receive-message').click(function() {
    			
    			const userNO = '${user.userNO}';
    			let strAdd = '';
    			
    			$.ajax({
    				type: 'POST',
    				url: '<c:url value="/usermessage/userMessageList" />',
    				
    				dataType: 'json',
    				data: {
    					'userNO': userNO
    				},
    				
    				success: function(result) {
    					
    					let mailList = result.list;
    					
    					for(let i = 0; i < mailList.length; i++) {
    						var timestamp = mailList[i].userMessageDate;
    		                var date = new Date(timestamp).toISOString().replace("T", " ").replace(/\..*/, '');
    		                
    		                var len = 30;
    						var last = "...";
    						var txt = '';
    						
    						if(mailList[i].userMessageContent.length > len) {
    							txt = mailList[i].userMessageContent.substring(0,len) + last;
    						} else {
    							txt = mailList[i].userMessageContent;
    						}
    						
    						strAdd +=
	    						`<div data-value="` + mailList[i].userMessageNO + `" style="cursor: pointer;">
    								<a 	class="list-group-item main-notice-list-under" data-value="` + mailList[i].userMessageNO + `">
	    							<h5 style="font-weight: bold; color: royalblue; margin-top:0px;" data-value="` + mailList[i].userMessageNO + `">` + mailList[i].userMessageWriter + `</h5>
	    							<p data-value="` + mailList[i].userMessageNO + `">` + txt + `</p>
	    							<p style="margin-bottom:-20px;" data-value="` + mailList[i].userMessageNO + `">` + date + `</p>
	    							</a>
	    						</div>
	    						<hr>`;
    					}
 
    					$('#mailList').html(strAdd);
    				},
    				
    				error: function() {
    					alert('쪽지 목록을 불러오는 중 서버오류가 발생했습니다.');
    					return;
    				}
    			});
    			
    			$('#modal-user-receive-message').modal('show');
    		});
    		
    		
    		// 유저 쪽지함 버튼 클릭 시 받은 쪽지함 모달 창 오픈(상위메뉴)
    		$('#user-receive-message2').click(function() {
    			
    			const userNO = '${user.userNO}';
    			let strAdd = '';
    			
    			$.ajax({
    				type: 'POST',
    				url: '<c:url value="/usermessage/userMessageList" />',
    				
    				dataType: 'json',
    				data: {
    					'userNO': userNO
    				},
    				
    				success: function(result) {
    					
    					let mailList = result.list;
    					
    					for(let i = 0; i < mailList.length; i++) {
    						var timestamp = mailList[i].userMessageDate;
    		                var date = new Date(timestamp).toISOString().replace("T", " ").replace(/\..*/, '');
    		                
    		                var len = 30;
    						var last = "...";
    						var txt = '';
    						
    						if(mailList[i].userMessageContent.length > len) {
    							txt = mailList[i].userMessageContent.substring(0,len) + last;
    						} else {
    							txt = mailList[i].userMessageContent;
    						}
    						
    						strAdd +=
	    						`<div data-value="` + mailList[i].userMessageNO + `" style="cursor: pointer;">
    								<a class="list-group-item main-notice-list-under" data-value="` + mailList[i].userMessageNO + `">
	    							<h5 style="font-weight: bold;" data-value="` + mailList[i].userMessageNO + `">` + mailList[i].userMessageWriter + `</h5>
	    							<p data-value="` + mailList[i].userMessageNO + `">` + txt + `</p>
	    							<p data-value="` + mailList[i].userMessageNO + `">` + date + `</p>
	    							</a>
	    						</div>
	    						<hr>`;
    					}
 
    					$('#mailList').html(strAdd);
    				},
    				
    				error: function() {
    					alert('쪽지 목록을 불러오는 중 서버오류가 발생했습니다.');
    					return;
    				}
    			});
    			
    			$('#modal-user-receive-message').modal('show');
    		});
    		
    		
    		// 기업 쪽지함 버튼 클릭 시 보낸 쪽지함 모달 창 오픈
    		$('#company-send-message').click(function() {
    			
    			const companyName = '${company.companyName}';
    			
    			let strAdd = '';
    			
    		
    			$.ajax({
    				type: 'POST',
    				url: '<c:url value="/companyMessage/companySendList" />',
    				
    				dataType: 'json',
    				data: {
    					'companyName': companyName
    				},
    				
    				success: function(result) {
    					
    					let sendmailList = result.list;
    					
    					for(let i = 0; i < sendmailList.length; i++) {
    						var timestamp = sendmailList[i].userMessageDate;
    		                var date = new Date(timestamp).toISOString().replace("T", " ").replace(/\..*/, '');
    						
    						strAdd +=
	    						`<div data-value="` + sendmailList[i].userMessageNO + `" style="cursor: pointer;">
    								<a class="list-group-item main-notice-list-under" data-value="` + sendmailList[i].userMessageNO + `">
	    							<h5 style="font-weight: bold;" data-value="` + sendmailList[i].userMessageNO + `">` + sendmailList[i].userID + ` (` + sendmailList[i].userName + `)` + `</h5>
	    							<p data-value="` + sendmailList[i].userMessageNO + `">` + sendmailList[i].userMessageContent + `</p>
	    							<p data-value="` + sendmailList[i].userMessageNO + `">` + date + `</p>
	    							</a>
	    						</div>
	    						<hr>`;
    					}
 
    					$('#sendmailList').html(strAdd);
    				},
    				
    				error: function() {
    					alert('쪽지 목록을 불러오는 중 서버오류가 발생했습니다.');
    					return;
    				}
    			});
    			$('#modal-company-send-message').modal('show');
    		});
    		
    		// 기업 쪽지함 버튼 클릭 시 관리자로부터 받은 쪽지함 모달 창 오픈
    		$('#company-receive-message').click(function() {
    			
    			const companyNO = '${company.companyNO}';
    			let strAdd = '';
    			
    			$.ajax({
    				type: 'POST',
    				url: '<c:url value="/companyMessage/companyMessageList" />',
    				
    				dataType: 'json',
    				data: {
    					'companyNO': companyNO
    				},
    				
    				success: function(result) {
    					
    					let companyMessageList = result.list;
    					
    					for(let i = 0; i < companyMessageList.length; i++) {
    						var timestamp = companyMessageList[i].companyMessageDate;
    		                var date = new Date(timestamp).toISOString().replace("T", " ").replace(/\..*/, '');
    		                
    		                var len = 30;
    						var last = "...";
    						var txt = '';
    						
    						if(companyMessageList[i].companyMessageContent.length > len) {
    							txt = companyMessageList[i].companyMessageContent.substring(0,len) + last;
    						} else {
    							txt = companyMessageList[i].companyMessageContent;
    						}
    						
    						strAdd +=
	    						`<div data-value="` + companyMessageList[i].companyMessageNO + `" style="cursor: pointer;">
    								<a class="list-group-item main-notice-list-under" data-value="` + companyMessageList[i].companyMessageNO + `">
	    							<h5 style="font-weight: bold;" data-value="` + companyMessageList[i].companyMessageNO + `">` + companyMessageList[i].companyMessageWriter + `</h5>
	    							<p data-value="` + companyMessageList[i].companyMessageNO + `">` + txt + `</p>
	    							<p data-value="` + companyMessageList[i].companyMessageNO + `">` + date + `</p>
	    							</a>
	    						</div>
	    						<hr>`;
    					}
 
    					$('#companyMessageList').html(strAdd);
    				},
    				
    				error: function() {
    					alert('쪽지 목록을 불러오는 중 서버오류가 발생했습니다.');
    					return;
    				}
    			});
    			
    			$('#modal-company-receive-message').modal('show');
    		});
    		
    		// 유저 쪽지함 리스트 클릭시 쪽지 상세보기
    		$('#modal-user-receive-message').on('click', 'a', function(e) {

    			const userMessageNO = e.target.getAttribute('data-value');
    			
    			
    			$.ajax({
    				type: 'POST',
    				url: '<c:url value="/usermessage/userMessageContent" />',
    				
    				dataType: 'json',
    				data: {
    					'userMessageNO': userMessageNO
    				},
    				
    				success: function(result) {
    					
    					var date = new Date(result.userMessageDate).toISOString().replace("T", " ").replace(/\..*/, '');
    					
						$('#modal-message-detail-from').text(result.userMessageWriter);
						$('#modal-message-detail-date').text(date);
						$('#modal-message-detail-content').text(result.userMessageContent);
	 	
						$('#modal-user-message-content').modal('show');
					
    				},
    				
    				error: function() {
    					alert('쪽지 상세보기를 불러오는 중 서버오류가 발생했습니다.');
    					return;
    				}
    			});
    			
    		});
    		
    		// 기업 보낸 쪽지함 리스트 클릭시 보낸쪽지 상세보기
    		$('#modal-company-send-message').on('click', 'a', function(e) {

    			const userMessageNO = e.target.getAttribute('data-value');
    			
    			
    			$.ajax({
    				type: 'POST',
    				url: '<c:url value="/companyMessage/sendMessageContent" />',
    				
    				dataType: 'json',
    				data: {
    					'userMessageNO': userMessageNO
    				},
    				
    				success: function(result) {
    					
    					var date = new Date(result.userMessageDate).toISOString().replace("T", " ").replace(/\..*/, '');
    					
						$('#modal-message-detail-from').text(result.userMessageWriter);
						$('#modal-message-detail-date').text(date);
						$('#modal-message-detail-content').text(result.userMessageContent);
	 	
						$('#modal-user-message-content').modal('show');
					
    				},
    				
    				error: function() {
    					alert('쪽지 상세보기를 불러오는 중 서버오류가 발생했습니다.');
    					return;
    				}
    			});
    			
    		});
    		
    		// 기업 받은 쪽지함 리스트 클릭시 쪽지 상세보기
    		$('#modal-company-receive-message').on('click', 'a', function(e) {

    			const companyMessageNO = e.target.getAttribute('data-value');
    			
    			$.ajax({
    				type: 'POST',
    				url: '<c:url value="/companyMessage/companyMessageContent" />',
    				
    				dataType: 'json',
    				data: {
    					'companyMessageNO': companyMessageNO
    				},
    				
    				success: function(result) {
    					
    					var date = new Date(result.companyMessageDate).toISOString().replace("T", " ").replace(/\..*/, '');
    					
						$('#modal-message-detail-from2').text(result.companyMessageWriter);
						$('#modal-message-detail-date2').text(date);
						$('#modal-message-detail-content2').text(result.companyMessageContent);
	 	
						$('#modal-company-message-content').modal('show');
					
    				},
    			
    				error: function() {
    					alert('쪽지 상세보기를 불러오는 중 서버오류가 발생했습니다.');
    					return;
    				}
    			});
    			
    			
    		});
    		
    		// 일반회원 로그아웃 버튼 클릭 시 로그아웃 처리 (비동기 방식)
    		$('#btn-user-logout').click(function() {
    			if(confirm('로그아웃 하시겠습니까?')) {
    				// 로그아웃 처리 비동기 ajax
    				$.ajax({
    					type: 'POST',
    					url: '<c:url value="/user/userLogout" />',
    					contentType: 'application/json',
    					
    					success: function(result) {
    						if(result == 'logoutSuccess') {
    							alert('성공적으로 로그아웃 되었습니다.');
    							
    							// location.href는 단순 페이지 이동이라면, location.replace()는 해당 주소를 redirect하는 것과 비슷하다.
    							location.replace('/');
    						} else {
    							alert('로그아웃이 정상적으로 이루어지지 않았습니다. 관리자에게 문의하세요.');
    							return;
    						}
    					},
    					
    					error: function() {
    						alert('로그아웃 처리 중 서버 오류가 발생했습니다.');
    						return;
    					}
    				});		// ajax 끝
    			} else {
    				return;
    			}
    		});
    		
    		
    		// 기업회원 로그아웃 버튼 클릭 시 로그아웃 처리 (비동기 방식)
    		$('#btn-company-logout').click(function() {
    			if(confirm('로그아웃 하시겠습니까?')) {
    				// 로그아웃 처리 비동기 ajax
    				$.ajax({
    					type: 'POST',
    					url: '<c:url value="/company/companyLogout" />',
    					contentType: 'application/json',
    					
    					success: function(result) {
    						if(result == 'logoutSuccess') {
    							alert('성공적으로 로그아웃 되었습니다.');
    							
    							// location.href는 단순 페이지 이동이라면, location.replace()는 해당 주소를 redirect하는 것과 비슷하다.
    							location.replace('/');
    						} else {
    							alert('로그아웃이 정상적으로 이루어지지 않았습니다. 관리자에게 문의하세요.');
    							return;
    						}
    					},
    					
    					error: function() {
    						alert('로그아웃 처리 중 서버 오류가 발생했습니다.');
    						return;
    					}
    				});		// ajax 끝
    			} else {
    				return;
    			}
    		});
    		
    	});    // jQuery 끝
    	
    </script>