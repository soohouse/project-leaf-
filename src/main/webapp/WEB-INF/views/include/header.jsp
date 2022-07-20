<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
                        <a class="navbar-brand" href="#">Main Page</a>
                    </div>
                    <div id="navbar-collapse" class="collapse navbar-collapse">
                        <form class="navbar-form navbar-left" role="search">
                            <div class="input-group">
                                <input type="text" class="form-control" placeholder="Search">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                                </span>
                            </div>
                        </form>
                        <ul class="nav navbar-nav navbar-right">
                            <li class="dropdown">
                                <a id="flag" href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <img src="http://www.country-dialing-codes.net/img/png-country-4x2-fancy-res-1280x960/gb.png" alt="English" width="28px" height="18px">
                                </a>
                                <ul class="dropdown-menu dropdown-menu-flag" role="menu">
                                    <li>
                                        <a href="#">
                                            <img src="http://www.country-dialing-codes.net/img/png-country-4x2-flat-res-640x480/gf.png" alt="Français" width="28px" height="18px">
                                            <span>Français</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="dropdown">
                                <a id="user-profile" href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="http://lorempixel.com/100/100/people/9/" class="img-responsive img-thumbnail img-circle"> Username</a>
                                <ul class="dropdown-menu dropdown-block" role="menu">
                                    <li><a href="#">Profil edition</a></li>
                                    <li><a href="#">Admin</a></li>
                                    <li><a href="#">Logout</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
    </div>
    


<%--@ include file="../modal/modal_login.jsp" --%>


<script>

	// jQuery Start
	$(function() {
		
		// 로그인 버튼 클릭 시 모달 창을 연다.
		$('#btn-login').click(function() {
			$('#modal-login').modal('show');
		});
		
		
		// 회원가입 버튼 클릭 시 회원가입 페이지로 이동
		$('#btn-regist').click(function() {
			location.href='<c:url value="/user/userRegist" />';
		});
		
		
		// 로그아웃 버튼 클릭 시 비동기 방식으로 로그아웃 처리
		$('#btn-logout').click(function() {
			
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
							location.replace('/baseball');
						} else {
							alert('로그아웃이 정상적으로 이루어지지 않았습니다. 관리자에게 문의하세요.');
							return;
						}
					},
					
					error: function() {
						alert('서버와 통신 중 오류가 발생했습니다.');
						return;
					}
					
				});		// ajax 끝
			} else {
				return;
			}
		});
		
	});		// jQuery End
	
</script>