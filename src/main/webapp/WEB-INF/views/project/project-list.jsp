<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/project-list.css">

   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainpage-style.css">
   </head>
   
   <style>
   
   		.sections {
   			width: 1200px;
   			margin: 0 auto;
   		}
   		
   		.modal-body-sections {
   			width: 560px;
   			margin: 0 auto;
   		}
   		
   		.form-control {
   			width: 100%;
   		}
   
   </style>
   
<body>

<%@ include file="../include/header.jsp" %>
	   
	<div class="mainbox">
	
		<div class="sections">

			<a href="#" class="list-group-item active notice-list-top" style="margin-top: 20px;"> 
				<span class="main-board-title" style="color: #098391;">프로젝트 목록</span>
			</a>


			<form action="<c:url value='/project/project'/>">
			<div class="project-search-box" style="border: 1px solid #B1B1B1; padding: 20px; font-family: sans-serif; background: #FCFCFC;">
		            <div class="firstbox">
		             	 <p>분류</p>
		            </div>
		            
		            <div class="checkbox">
		            	
		            	<c:choose>
		            	
		            		<c:when test="${check eq 'check1'}">
		            			<label style="margin-right: 30px;"><input type="checkbox" id="check-project-1" name="check-project" onclick="checkOne(this)" checked> 현재 모집 중인 프로젝트</label>
				             	<label style="margin-right: 30px;"><input type="checkbox" id="check-project-2" name="check-project" onclick="checkOne(this)"> 마감 임박 프로젝트</label>
				              	<label style="margin-right: 30px;"><input type="checkbox" id="check-project-3" name="check-project" onclick="checkOne(this)"> 종료된 프로젝트</label>
				              	<label style="margin-right: 30px;"><input type="checkbox" id="check-project-4" name="check-project" onclick="checkOne(this)"> '좋아요'를 누른 프로젝트</label>
		            		</c:when>
		            		
		            		<c:when test="${check eq 'check2'}">
		            			<label style="margin-right: 30px;"><input type="checkbox" id="check-project-1" name="check-project" onclick="checkOne(this)"> 현재 모집 중인 프로젝트</label>
				             	<label style="margin-right: 30px;"><input type="checkbox" id="check-project-2" name="check-project" onclick="checkOne(this)" checked> 마감 임박 프로젝트</label>
				              	<label style="margin-right: 30px;"><input type="checkbox" id="check-project-3" name="check-project" onclick="checkOne(this)"> 종료된 프로젝트</label>
				              	<label style="margin-right: 30px;"><input type="checkbox" id="check-project-4" name="check-project" onclick="checkOne(this)"> '좋아요'를 누른 프로젝트</label>
		            		</c:when>
		            		
		            		<c:when test="${check eq 'check3'}">
		            			<label style="margin-right: 30px;"><input type="checkbox" id="check-project-1" name="check-project" onclick="checkOne(this)"> 현재 모집 중인 프로젝트</label>
				             	<label style="margin-right: 30px;"><input type="checkbox" id="check-project-2" name="check-project" onclick="checkOne(this)"> 마감 임박 프로젝트</label>
				              	<label style="margin-right: 30px;"><input type="checkbox" id="check-project-3" name="check-project" onclick="checkOne(this)" checked> 종료된 프로젝트</label>
				              	<label style="margin-right: 30px;"><input type="checkbox" id="check-project-4" name="check-project" onclick="checkOne(this)"> '좋아요'를 누른 프로젝트</label>
		            		</c:when>
		            		
		            		<c:when test="${check eq 'check4'}">
		            			<label style="margin-right: 30px;"><input type="checkbox" id="check-project-1" name="check-project" onclick="checkOne(this)"> 현재 모집 중인 프로젝트</label>
				             	<label style="margin-right: 30px;"><input type="checkbox" id="check-project-2" name="check-project" onclick="checkOne(this)"> 마감 임박 프로젝트</label>
				              	<label style="margin-right: 30px;"><input type="checkbox" id="check-project-3" name="check-project" onclick="checkOne(this)"> 종료된 프로젝트</label>
				              	<label style="margin-right: 30px;"><input type="checkbox" id="check-project-4" name="check-project" onclick="checkOne(this)" checked> '좋아요'를 누른 프로젝트</label>
		            		</c:when>
		            		
		            		<c:otherwise>
		            			<label style="margin-right: 30px;"><input type="checkbox" id="check-project-1" name="check-project" onclick="checkOne(this)"> 현재 모집 중인 프로젝트</label>
				             	<label style="margin-right: 30px;"><input type="checkbox" id="check-project-2" name="check-project" onclick="checkOne(this)"> 마감 임박 프로젝트</label>
				              	<label style="margin-right: 30px;"><input type="checkbox" id="check-project-3" name="check-project" onclick="checkOne(this)"> 종료된 프로젝트</label>
				              	<label style="margin-right: 30px;"><input type="checkbox" id="check-project-4" name="check-project" onclick="checkOne(this)"> '좋아요'를 누른 프로젝트</label>
		            		</c:otherwise>
		            	
		            	</c:choose>
		            
		            	
		            </div>
		            
		            <div class="container-right">
		             	<button type="submit" id="btn-project-search" class="btn btn-primary">키워드로 검색</button>
		            </div>
		            
		            <div class="intro-date">
		           		<p>모집 기간</p>
		            </div>
		            
		            <div class="date">
		            	
		            	<c:choose>
		            	
		            		<c:when test="${check eq 'check5'}">
		            			<input type="date" class="form-control" id="input-date" placeholder="0000/00/00" style="height: 30px; width: auto;" value="${date}">
		            		</c:when>
		            		
		            		<c:otherwise>
		            			<input type="date" class="form-control" id="input-date" placeholder="0000/00/00" style="height: 30px; width: auto;">
		            		</c:otherwise>
		            		
		            	</c:choose>

		                <button type="button" id="btn-date-search" class="btn" style="height:30px; font-size: 12px; background: white; border: 1px solid #808080;">선택</button>
		            </div>
		              	
		            <div class="input-group1 form-inline">
		            	<select id="select-project-search" class="form-control" name="condition" style="margin-right: -5px; font-size: 12px;">
		            		<option value="title" ${pc.paging.condition == 'title' ? 'selected' : ''}>프로젝트 이름</option>
		            		<option value="writer" ${pc.paging.condition == 'writer' ? 'selected' : ''}>기업명</option>
		            		<option value="date" ${pc.paging.condition == 'date' ? 'selected' : ''}>등록일자</option>
		            	</select>
		            	<input type="text" id="input-project-search" name="keyword" class="form-control" value="${pc.paging.keyword}" placeholder="검색어를 입력하세요">
		            </div>
		            <br>
		    </div> 
		    </form>
			
			<%--	우측 버튼인데 아직 사용 안해서 주석처리
			<form class="navbar-form navbar-left navbar-main-top pull-right" role="search" style="padding: 0; margin-left: 0;">
				<div class="input-group"> 
					<span class="input-group-btn">
						<button id="btn-apply-check" class="btn btn-success" type="button" style="height: 30px; font-size: 13px;">버튼</button>
					</span>
				</div>
			</form>
			--%>

			<div class="project-myproject-apply" style="clear: both;">
				
				<br>
				<p style="font-size: 14px; font-weight: bold; margin-top: 20px; margin-left: 16px; margin-bottom: -10px;">모집중인 프로젝트<span style="color: red;">&nbsp;&nbsp;</span></p>
				<hr>
				
				
				<div id="div-project-list">
				
					<c:forEach var="project" items="${projectlist}" varStatus="index">
					
					
					<div class="project-list" style="margin-left: 0; width: 100%; border: 1px solid #C7C7C7;">
				          <div class="project-list-col-md-8" >
				            <div class="project-listbox">
				              <div class="image-intro"> 
				                <a href="#"><img src="<c:url value='/project/projectImageGet?projectNO=${project.projectNO}' />" alt="사진" style="width: 200px; height: 100px; object-fit: cover; vertical-align: text-bottom; margin-left: 20px; margin-top: 16px;"></a>
				              </div>
				              <div class="project-form" style="margin-left: 30px;">

				                <div class="project-title" id="project-view-icon${index.index}" style="cursor: pointer;">
				                  <p style="width: 400px;" >${project.projectName}</p>

				                  <input type="hidden" value="${project.projectNO}" id="project-list-content${index.index}">
				              	</div>
				                <div class="project-content1">
				                  <p style="width: 400px;">${project.projectRequireRole}</p>
				                </div>
				                <div class="project-date">
				                  <p style="font-size: 12px;"><fmt:formatDate value="${project.projectRequireDate1}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${project.projectRequireDate2}" pattern="yyyy-MM-dd" /></p>
				                </div>
				              </div>
				              <div class="project-source">
				                <div class="project-content" style="position: relative; left: 180px;">
				                  <p style="font-size: 14px;">${project.companyName}</p>
				                </div>
				              </div>
				              
				              <div class="project-in" style="position: relative; right: 10px;">
				                <div class="project-container-right" style="height: 34px;">
				                	
				                	<c:choose>
				                	
				                		<c:when test="${project.commonCODE == 'PST001'}">
				                			<button type="button" class="btn btn-success" style="width: 99.9px;" disabled>${project.commonValue}</button>
				                		</c:when>
				                		
				                		<c:when test="${project.commonCODE == 'PST002'}">
				                			<button type="button" class="btn" style="color: white; background: #970000; width: 99.9px;" disabled>${project.commonValue}</button>
				                		</c:when>
				                		
				                		<c:when test="${project.commonCODE == 'PST003'}">
				                			<button type="button" class="btn" style="background: #808080; width: 99.9px;" disabled>${project.commonValue}</button>
				                		</c:when>
				                	
				                	</c:choose>
				                
				                </div><br>
				                <a href="#" id="project-view-icon2${index.index}" style="position: relative; top: 10px;">상세보기</a>
				              </div>
				              
				            </div>
				          </div>
				    </div>
					
					<script>
					
						$(function() {
	
							$('#project-view-icon${index.index}').click(function() {
								var projectNO = $('#project-list-content${index.index}').val();
								
								location.href='<c:url value="/project/projectview?projectNO=" />' + projectNO;
							})
							
							
							$('#project-view-icon2${index.index}').click(function() {
							var projectNO = $('#project-list-content${index.index}').val();
								
								location.href='<c:url value="/project/projectview?projectNO=" />' + projectNO;
							})
							
						});
				
					</script>
					
					
					</c:forEach>
					
				</div>
				
			</div>
			
			<!-- 프로젝트 목록 페이징 -->
            <div class="text-center">
				<form action="<c:url value='/project/project-list'/>" name="pageForm">
	                <ul class="pagination pagination-sm">
						<c:if test="${pc.prev }"><!-- 이전버튼 -->
							<c:if test="${check eq 'check1'}">
								<li><a href="/project/projectNow?pageNum=${pc.beginPage-1}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}" data-pagenum="${pc.beginPage-1 }"> << </a></li>
							</c:if>
						
							<c:if test="${check eq 'check2'}">
								<li><a href="/project/projectHurry?pageNum=${pc.beginPage-1}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}" data-pagenum="${pc.beginPage-1 }"> << </a></li>
							</c:if>
							
							<c:if test="${check eq 'check3'}">
								<li><a href="/project/projectEnd?pageNum=${pc.beginPage-1}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}" data-pagenum="${pc.beginPage-1 }"> << </a></li>
							</c:if>
							
							<c:if test="${check eq 'check4'}">
								<li><a href="/project/projectLike?pageNum=${pc.beginPage-1}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}" data-pagenum="${pc.beginPage-1 }"> << </a></li>
							</c:if>
							
							<c:if test="${check eq 'check5'}">
								<li><a href="/project/projectSearchDate?pageNum=${pc.beginPage-1}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}" data-pagenum="${pc.beginPage-1 }"> << </a></li>
							</c:if>
							
							<c:if test="${check == null}">
								<li><a href="/project/project?pageNum=${pc.beginPage-1}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}" data-pagenum="${pc.beginPage-1 }"> << </a></li>
							</c:if>
		                    
						</c:if>
						<c:forEach var="num" begin="${pc.beginPage }" end="${pc.endPage}">
							<c:if test="${check eq 'check1'}">
								<li class="${pc.paging.pageNum == num ? 'active' : '' }"><a href="/project/projectNow?pageNum=${num}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}" data-pagenum='${num }'>${num }</a></li>
							</c:if>
							
							<c:if test="${check eq 'check2'}">
								<li class="${pc.paging.pageNum == num ? 'active' : '' }"><a href="/project/projectHurry?pageNum=${num}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}" data-pagenum='${num }'>${num }</a></li>
							</c:if>
							
							<c:if test="${check eq 'check3'}">
								<li class="${pc.paging.pageNum == num ? 'active' : '' }"><a href="/project/projectEnd?pageNum=${num}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}" data-pagenum='${num }'>${num }</a></li>
							</c:if>
							
							<c:if test="${check eq 'check4'}">
								<li class="${pc.paging.pageNum == num ? 'active' : '' }"><a href="/project/projectLike?pageNum=${num}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}" data-pagenum='${num }'>${num }</a></li>
							</c:if>
							
							<c:if test="${check eq 'check5'}">
								<li class="${pc.paging.pageNum == num ? 'active' : '' }"><a href="/project/projectSearchDate?pageNum=${num}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}&date=${date}" data-pagenum='${num }'>${num }</a></li>
							</c:if>
							
							<c:if test="${check == null}">
								<li class="${pc.paging.pageNum == num ? 'active' : '' }"><a href="/project/project?pageNum=${num}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}&date=${date}" data-pagenum='${num }'>${num }</a></li>
							</c:if>
							
						</c:forEach>
						<c:if test="${pc.next }"><!-- 다음버튼 -->
							
							<c:if test="${check eq 'check1'}">
								<li><a href="/project/projectNow?pageNum=${pc.endPage+1}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}" data-pagenum="${pc.endPage-1 }"> >> </a></li>
							</c:if>
						
							<c:if test="${check eq 'check2'}">
								<li><a href="/project/projectHurry?pageNum=${pc.endPage+1}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}" data-pagenum="${pc.endPage-1 }"> >> </a></li>
							</c:if>
							
							<c:if test="${check eq 'check3'}">
								<li><a href="/project/projectEnd?pageNum=${pc.endPage+1}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}" data-pagenum="${pc.endPage-1 }"> >> </a></li>
							</c:if>
							
							<c:if test="${check eq 'check4'}">
								<li><a href="/project/projectLike?pageNum=${pc.endPage+1}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}" data-pagenum="${pc.endPage-1 }"> >> </a></li>
							</c:if>
							
							<c:if test="${check eq 'check5'}">
								<li><a href="/project/projectSearchDate?pageNum=${pc.endPage+1}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}" data-pagenum="${pc.endPage-1 }"> >> </a></li>
							</c:if>
							
							<c:if test="${check == null}">
								<li><a href="/project/project?pageNum=${pc.endPage+1}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}" data-pagenum="${pc.endPage-1 }"> >> </a></li>
							</c:if>

						</c:if>
					</ul>
                    <input type="hidden" name="pageNum" value="${pc.paging.pageNum}">
                    <input type="hidden" name="cpp" value="${pc.paging.cpp}">
                    <input type="hidden" name="condition" value="${pc.paging.condition}">
                    <input type="hidden" name="keyword" value="${pc.paging.keyword}">
				</form>
			</div>

		</div>
	
		<%@ include file="../include/footer.jsp" %>
	   
	</div>

</body>
</html>

<script>
	//특정 메시지 표현을 위한 스크립트
	let msg = '${msg}';
	
	if(msg != '') {
		alert(msg);
	}
	
	
	$(function() {
		
		// 모집 중인 프로젝트 검색
		$('#check-project-1').change(function() {
			$.ajax({
				type: 'GET',
				url: '<c:url value="/project/projectNow" />',
				
				success: function() {
					let url = '/project/projectNow';
					
					location.replace(url);
				},
				
				error: function() {
					alert('서버 오류가 발생했습니다');
					return;
				}
			})
		});
		
		
		// 모집 마감 임박 프로젝트 검색
		$('#check-project-2').change(function() {
			$.ajax({
				type: 'GET',
				url: '<c:url value="/project/projectHurry" />',
				
				success: function() {
					let url = '/project/projectHurry';
					
					location.replace(url);
				},
				
				error: function() {
					alert('서버 오류가 발생했습니다');
					return;
				}
			})
		});
		
		
		// 모집 종료된 프로젝트 검색
		$('#check-project-3').change(function() {
			$.ajax({
				type: 'GET',
				url: '<c:url value="/project/projectEnd" />',
				
				success: function() {
					let url = '/project/projectEnd';
					
					location.replace(url);
				},
				
				error: function() {
					alert('서버 오류가 발생했습니다');
					return;
				}
			})
		});
		
		
		// 좋아요 누른 프로젝트 검색
		$('#check-project-4').change(function() {
			$.ajax({
				type: 'GET',
				url: '<c:url value="/project/projectLike" />',
				
				success: function() {
					let url = '/project/projectLike';
					
					location.replace(url);
				},
				
				error: function() {
					alert('서버 오류가 발생했습니다');
					return;
				}
			})
		});
		
		
		$('#btn-date-search').click(function() {
			
			const projectDate = $('#input-date').val();
			

			$.ajax({
				type: 'GET',
				url: '<c:url value="/project/projectSearchDate" />',
				
				success: function() {
					let url = '/project/projectSearchDate?date=' + projectDate;
					
					location.replace(url);
				},
				
				error: function() {
					alert('서버 오류가 발생했습니다');
					return;
				}
			});

		});
		
		
		$('#btn-project-search').click(function() {
			
			const keyword = $('#input-project-search').val();
			const condition = $('#select-project-search').val();
			
			console.log(keyword);
			console.log(condition);
			
			let strAdd = '';

			
			$('#div-project-list').html(strAdd);	
		});
		
	});
	
	//페이징
	$(function() {
		$('#pagination').on('click', 'a', function(e) {
			e.preventDefault(); //a태그의 고유기능 중지.
			const value = $(this).data('pagenum'); //-> jQuery
			console.log(value);
			document.pageForm.pageNum.value = value;
			document.pageForm.submit();
		});
	}); 
	
	
	function checkOne(e) {
		const checkBoxes = document.getElementsByName("check-project");
		
		checkBoxes.forEach((cb) => {
		    cb.checked = false;
		  })
		  
		  e.checked = true;
	} 
	
	
</script>
