<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


	<c:choose>
	
		<c:when test="${user == null && company != null}">
			<!-- 기업회원 푸터 -->
			<footer style="background: #6BB656;">
				  <div class="notice_box">
				    <a href="/"><span class="sidebar-icon"><i class="fa fa-building"></i></span> RunWith</a>
				  </div>
				    <div class="area_user">
				      <div class="area_user_row">
				        <ul>
				          <li>
				          	<a>
				          		Leaf Company | 대표자: 홍길동 | E-mail: info@info.com <br>
		                                                      사업자번호: 123-45-67890 | 개인정보보호책임자: 홍길동 | 통신판매업: 2022-서울강남-0001 <br>
		                                                      주소: 서울특별시 강남구 역삼동 649-5 7층 
		                    </a>
				          </li>
				        </ul>
				      </div>
				      <div class="area_user_row area_user_row2">
				        <ul>
				          <li><a href="/">고객센터</a></li>
				          <li><a href="/">이용약관</a></li>
				          <li><a href="/">개인정보취급방침</a></li>
				          <li><a href="/">찾아오시는 길</a></li>
				        </ul>
				      </div>
				    </div>
			</footer>
		</c:when>
	
	
	
		<c:when test="${company == null && user.commonCODE == 'ADM002'}">
			<!-- 관리자 푸터 -->
			<footer style="background: #ccac00;">
				  <div class="notice_box">
				    <a href="/"><span class="sidebar-icon"><i class="fa fa-building"></i></span> RunWith</a>
				  </div>
				    <div class="area_user">
				      <div class="area_user_row">
				        <ul>
				          <li>
				          	<a>
				          		Leaf Company | 대표자: 홍길동 | E-mail: info@info.com <br>
		                                                      사업자번호: 123-45-67890 | 개인정보보호책임자: 홍길동 | 통신판매업: 2022-서울강남-0001 <br>
		                                                      주소: 서울특별시 강남구 역삼동 649-5 7층 
		                    </a>
				          </li>
				        </ul>
				      </div>
				      <div class="area_user_row area_user_row2">
				        <ul>
				          <li><a href="/">고객센터</a></li>
				          <li><a href="/">이용약관</a></li>
				          <li><a href="/">개인정보취급방침</a></li>
				          <li><a href="/">찾아오시는 길</a></li>
				        </ul>
				      </div>
				    </div>
			</footer>
		</c:when>
	
	
	
		<c:otherwise>
			<!-- 일반 푸터 -->
			<footer>
				<div>
				  <div class="notice_box">
				    <a href="/"><span class="sidebar-icon"><i class="fa fa-building"></i></span> RunWith</a>
				  </div>
				    <div class="area_user">
				      <div class="area_user_row">
				        <ul>
				          <li>
				          	<a>
				          		Leaf Company | 대표자: 홍길동 | E-mail: info@info.com <br>
		                                                      사업자번호: 123-45-67890 | 개인정보보호책임자: 홍길동 | 통신판매업: 2022-서울강남-0001 <br>
		                                                      주소: 서울특별시 강남구 역삼동 649-5 7층 
		                    </a>
				          </li>
				        </ul>
				      </div>
				      <div class="area_user_row area_user_row2">
				        <ul>
				          <li><a href="/">고객센터</a></li>
				          <li><a href="/">이용약관</a></li>
				          <li><a href="/">개인정보취급방침</a></li>
				          <li><a href="/">찾아오시는 길</a></li>
				        </ul>
				      </div>
				    </div>
				</div>
			</footer>
		</c:otherwise>
	
	</c:choose>
	
