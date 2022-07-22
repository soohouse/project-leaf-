<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
                        <a class="navbar-brand" href="#"><span class="fa fa-leaf">        Leaf MainPage</span></a>
                    </div>
                    <div id="navbar-collapse" class="collapse navbar-collapse">
                        <form class="navbar-form navbar-left" role="search">
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
                               <li><a href="#">로그인</a></li>
                            </ul>
                            
                              <li class="dropdown">
                                  <a class="dropdown-toggle" data-toggle="dropdown" href="#">마이페이지
                                      <span class="caret"></span>
                                  </a>
                                  <ul class="dropdown-menu">
                                      <li><a href="#">내 정보</a></li>
                                      <li><a href="#">지원 현황</a></li>
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
                          </ul>
                                </ul>
                            </li>
                        </ul>
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
                            <li class="sidebar-contents1"><a href="#" class="sidebar-contents2"><i class="fa fa-caret-right"></i>프로젝트 목록</a></li>
                        </ul>
                    </li>
                    
                    <li>
	                    <a id="mainmenu-2" class="accordion-toggle collapsed toggle-switch" data-toggle="collapse" href="#submenu-2">
	                        <span class="sidebar-icon"><i class="fa fa-users"></i></span>
	                        <span class="sidebar-title">게시판</span>
	                        <b class="caret"></b>
	                    </a>
	                    <ul id="submenu-2" class="panel-collapse collapse panel-switch" role="menu">
	                        <li><a href="/board/notice_list"><i class="fa fa-caret-right"></i>공지사항</a></li>
	                        <li><a href="#"><i class="fa fa-caret-right"></i>Q&A</a></li>
	                        <li><a href="#"><i class="fa fa-caret-right"></i>자유게시판</a></li>
	                        <li><a href="#"><i class="fa fa-caret-right"></i>자료실</a></li>
	                    </ul>
                    </li>
                    <li>
                        <a id="mainmenu-3" class="accordion-toggle collapsed toggle-switch" data-toggle="collapse" href="#submenu-3">
                            <span class="sidebar-icon"><i class="fa fa-newspaper-o"></i></span>
                            <span class="sidebar-title">마이페이지</span>
                            <b class="caret"></b>
                        </a>
                        <ul id="submenu-3" class="panel-collapse collapse panel-switch" role="menu">
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