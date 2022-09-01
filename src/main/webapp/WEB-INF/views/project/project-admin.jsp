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
   		
   </style>
   
<body>

<%@ include file="../include/header.jsp" %>
	   
	<div class="mainbox">
	
		<div class="sections">

			<a href="#" class="list-group-item active notice-list-top" style="margin-top: 20px;"> 
				<span class="main-board-title" style="color: #633523;">프로젝트 관리</span>
			</a>

			<div class="project-myproject-apply" style="clear: both;">
			
				<c:if test="${adminCheck == 0}">
			
				<br>
				<p style="font-size: 14px; font-weight: bold; margin-top: 20px; margin-left: 16px; margin-bottom: -10px;">프로젝트 통계</p>
				<hr>
				
				<div class="clearfix" style="border: 1px solid #C7C7C7; border-radius: 4px; overflow: hidden;">
					
						<div id="chart-project-regist" style="float: left; width: 50%;">
				
						</div>
						
						<div id="chart-project-apply" style="float: left; width: 50%;">
						
						</div>
					
				</div>
				
				</c:if>

				
				<br>
				<p style="font-size: 14px; font-weight: bold; margin-top: 20px; margin-left: 16px; margin-bottom: -10px; clear: both;">내 프로젝트 목록</p>
				<hr>
					
					<div class="clearfix" style="margin-top: -16px;">
					
						<form class="navbar-form navbar-left navbar-main-top pull-left" action="<c:url value='/project/projectadmin'/>" style="padding: 0; margin-left: 0; margin-bottom: 30px;">
								<select class="form-control" name="condition" style="height: 30px; font-size: 13px;">
				                            <option value="title">프로젝트 이름</option>
				                </select>
							
								<div class="input-group"> 
									<input type="text" name="keyword" class="form-control" value="${pc.paging.keyword}" placeholder="검색어를 입력하세요" style="height: 30px; font-size: 13px;">
									<span class="input-group-btn">
										<button class="btn btn-default" type="submit" style="height: 30px; background: #d3d3d3; font-size: 13px;">검색</button>
									</span>
								</div>
						</form>
						
					</div>
				
				<c:forEach var="project" items="${projectadmin}" varStatus="index">
				
				
				<div class="project-list" style="margin-left: 0; width: 100%; border: 1px solid #C7C7C7;">
			          <div class="project-list-col-md-8" >
			            <div class="project-listbox">
			              <div class="image-intro"> 
			                <a href="#"><img src="<c:url value='/project/projectImageGet?projectNO=${project.projectNO}' />" alt="사진" style="width: 200px; height: 100px; object-fit: cover; vertical-align: text-bottom; margin-left: 20px; margin-top: 16px;"></a>
			              </div>
			              <div class="project-form" style="margin-left: 30px;">
			                <div class="project-title"  style="cursor: pointer;">
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
			                 <a href="#" id="project-view-icon2${index.index}" style="font-size: 14px;">상세보기</a>
			                </div>
			              </div>
			              
			              <div class="project-in" style="position: relative; right: 10px;">
			                <div class="project-container-right">
			                  <button type="button" class="btn btn-success" id="project-view-icon${index.index}">수정</button>
			                </div><br>
			                  <button type="button" class="btn btn-danger" id="btn-project-delete${index.index}">삭제</button>
			              </div>
			              
			            </div>
			          </div>
			    </div>
				
				<script>
				
					$(function() {

						$('#project-view-icon${index.index}').click(function() {
							var projectNO = $('#project-list-content${index.index}').val();
							
							location.href='<c:url value="/project/projectviewfix?projectNO=" />' + projectNO;
						});
						
						
						$('#project-view-icon2${index.index}').click(function() {
							var projectNO = $('#project-list-content${index.index}').val();
							
							location.href='<c:url value="/project/projectview?projectNO=" />' + projectNO;
						});
						
						$('#btn-project-delete${index.index}').click(function() {
							
							if(confirm('정말 삭제하시겠습니까?')) {
						
								const check = '${adminCheck}';
								
								if(check == 1) {
									
	
										const projectNO = $('#project-list-content${index.index}').val();
										
										$.ajax({
											type: 'POST',
											url: '<c:url value="/project/projectUserCheck" />',
											
											data: {
												'projectNO': projectNO
											},
											
											success: function(result) {
												if(result == 'CheckZero') {
													
													// 이미 있던 프로젝트 사진을 삭제한 후에
													$.ajax({
														type: 'POST',
														url: '<c:url value="/project/projectImageDelete/" />' + projectNO,
														contentType: false,
														processData: false,
														
														success: function(result) {
															if(result == 'YesProjectImageDelete') {

																// 해당 프로젝트 삭제
																$.ajax({
																	type: 'POST',
																	url: '<c:url value="/project/projectDelete" />',
																	
																	dataType: 'text',
																	data : {
																		'projectNO': projectNO
																	},
																	
																	success: function(result) {
																		if(result == 'YesProjectDelete') {
																			
																
														    			alert('삭제를 성공했습니다.');	
														    			location.replace('<c:url value="/project/projectadmin" /> ');
																			
																		}
																	},
																	
																	error: function() {
																		alert('프로젝트 삭제 처리 중 서버오류가 발생했습니다.');
																		return;
																	}
																});
																
															} else {
																alert('프로젝트 사진 삭제 중 오류가 발생했습니다.');
																return;
															}
														},
														
														error: function() {
															alert('프로젝트 사진 삭제 중 서버오류가 발생했습니다.');
															return;
														}
													});
													
												} else {
													alert('지원중인 지원자가 있어서 삭제할 수 없습니다.');
													return;
												}
											},
											
											error: function() {
												alert('해당 기업의  프로젝트 지원자 여부를 확인 중 서버오류가 발생했습니다.');
												return;
											}
										});
								} else {
									$('#modal-delete-check-project').modal('show');
									
									//확인 버튼 클릭 시 
									$('#btn-password-check-project').off().click(function(){
										const inputPW = $('#input-password-check-project').val();
										const projectNO = $('#project-list-content${index.index}').val();
										
										$.ajax({
											type: 'POST',
											url: '<c:url value="/company/companyPasswordCheck" />',
											
											dataType: 'text',
											data: {
												'inputPW': inputPW
											},
											
											success: function(result) {
												if(result == 'YesCheck') {
													
													console.log('비밀번호 일치');
													
													$.ajax({
														type: 'POST',
														url: '<c:url value="/project/projectUserCheck" />',
														
														data: {
															'projectNO': projectNO
														},
														
														success: function(result) {
															if(result == 'CheckZero') {
																
																// 이미 있던 프로젝트 사진을 삭제한 후에
																$.ajax({
																	type: 'POST',
																	url: '<c:url value="/project/projectImageDelete/" />' + projectNO,
																	contentType: false,
																	processData: false,
																	
																	success: function(result) {
																		if(result == 'YesProjectImageDelete') {

																			// 해당 프로젝트 삭제
																			$.ajax({
																				type: 'POST',
																				url: '<c:url value="/project/projectDelete" />',
																				
																				dataType: 'text',
																				data : {
																					'projectNO': projectNO
																				},
																				
																				success: function(result) {
																					if(result == 'YesProjectDelete') {
																						
																			
																	    			alert('삭제를 성공했습니다.');	
																	    			location.replace('<c:url value="/project/projectadmin" /> ');
																						
																					}
																				},
																				
																				error: function() {
																					alert('프로젝트 삭제 처리 중 서버오류가 발생했습니다.');
																					return;
																				}
																			});
																			
																		} else {
																			alert('프로젝트 사진 삭제 중 오류가 발생했습니다.');
																			return;
																		}
																	},
																	
																	error: function() {
																		alert('프로젝트 사진 삭제 중 서버오류가 발생했습니다.');
																		return;
																	}
																});
																
															} else {
																alert('지원중인 지원자가 있어서 삭제할 수 없습니다.');
																return;
															}
														},
														
														error: function() {
															alert('해당 기업의  프로젝트 지원자 여부를 확인 중 서버오류가 발생했습니다.');
															return;
														}
													});
													
												} else {
													alert('비밀번호가 일치하지 않습니다.');
													return;
												}
											},
											
											error: function() {
												alert('비밀번호 체크 중 서버오류가 발생했습니다.');
												return;
											}
										});
									});
								}
							} else {
								return false;
							}
						});

		});	
					
				</script>
				
				
				</c:forEach>
				
			</div>
			<!-- 프로젝트 목록 페이징 -->
            <div class="text-center">
				<form action="<c:url value='/project/project-admin'/>" name="pageForm">
	                <ul class="pagination pagination-sm">
						<c:if test="${pc.prev }"><!-- 이전버튼 -->
		                    <li><a href="/project/projectadmin?pageNum=${pc.beginPage-1}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}" data-pagenum="${pc.beginPage-1 }"> << </a></li>
						</c:if>
						<c:forEach var="num" begin="${pc.beginPage }" end="${pc.endPage}">
							<li class="${pc.paging.pageNum == num ? 'active' : '' }"><a href="/project/projectadmin?pageNum=${num}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}" data-pagenum='${num }'>${num }</a></li>
						</c:forEach>
						<c:if test="${pc.next }"><!-- 다음버튼 -->
		                    <li><a href="/project/projectadmin?pageNum=${pc.endPage+1}&cpp=${pc.paging.cpp }&condition=${pc.paging.condition}&keyword=${pc.paging.keyword}" data-pagenum="${pc.endPage-1 }"> >> </a></li>
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
		<%@ include file="modal-delete-check-project.jsp" %>
	   
	</div>

</body>
</html>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

	var check = '${adminCheck}';
	
	if(check == 0) {
		
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChart);
		
		function drawChart() {
			
			$.ajax({
				type: 'POST',
				url: '<c:url value="/project/projectChart1" />',
				
				dataType: 'json',
				
				success: function(result) {
					
					let projectRegistCount = result.projectRegistCount;
					let projectDate = result.projectDate;
					
					var data = new google.visualization.DataTable();
					data.addColumn('string', '날짜');
					data.addColumn('number', '프로젝트 수');

					data.addRow([projectDate.projectDateBefore5, projectRegistCount.projectRegistCountBefore5]);
					data.addRow([projectDate.projectDateBefore4, projectRegistCount.projectRegistCountBefore4]);
					data.addRow([projectDate.projectDateBefore3, projectRegistCount.projectRegistCountBefore3]);
					data.addRow([projectDate.projectDateBefore2, projectRegistCount.projectRegistCountBefore2]);
					data.addRow([projectDate.projectDateBefore1, projectRegistCount.projectRegistCountBefore1]);
					data.addRow([projectDate.projectDateNow, projectRegistCount.projectRegistCountNow]);

				      var options = {
				        title: "프로젝트 등록 빈도 [최근 6개월]",
				        fontSize: 14,
				        width: 600,
				        height: 400,
				        bar: {groupWidth: "30%"},
				        legend: { position: "none" },
				        series: {0: {type: 'bar', color: '#977902'}},
				        /* 배경색이랑 표 배경 색.... 나중에 참고
				        chartArea: {
			                backgroundColor: {
			                    fill: '#FFFFFF',
			                },
			            },
				        backgroundColor: {
			        		fill: '#FCFCFC'
			        	},
			        	*/
				        vAxes: {
				            0: {
				                title: '등록 프로젝트 개수',
				                format: '#개'
				            }
				        }
				      };
				      var chart = new google.visualization.ColumnChart(document.getElementById("chart-project-regist"));
				      chart.draw(data, options);
				      
				},
				
				error: function() {
					alert('통계 자료를 얻어오는 중 서버오류가 발생했습니다.');
					return;
				}
			});
		 }
		
		
		
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChart2);
		
		
		function drawChart2() {
			
			$.ajax({
				type: 'POST',
				url: '<c:url value="/project/projectChart2" />',
				
				dataType: 'json',
				
				success: function(result) {
					let projectApplyCount = result.projectApplyCountList;
					
					var data2 = new google.visualization.DataTable();
					data2.addColumn('string', '프로젝트 이름');
					data2.addColumn('number', '지원자 수');
					
					for(let i = 0; i < projectApplyCount.length; i++) {
						let projectName = projectApplyCount[i].projectName.substr(0, 7) + '...';
						
						data2.addRow([projectName, projectApplyCount[i].applyCount]);
					}
					
				      var options2 = {
				        title: "프로젝트 별 지원자 수",
				        fontSize: 14,
				        fontFaimly: 'sans-serif',
				        pieHole: 0.4,
				        //is3D: true,
				        width: 600,
				        height: 400,
				        bar: {groupWidth: "10%"},
				        legend: {
				        	position: "bottom"
				        }
				        /* 배경색이랑 표 배경 색.... 나중에 참고
				        chartArea: {
			                backgroundColor: {
			                    fill: '#FFFFFF',
			                },
			            },
				        backgroundColor: {
			        		fill: '#FCFCFC'
			        	},
			        	*/
				      };
				      var chart2 = new google.visualization.PieChart(document.getElementById("chart-project-apply"));
				      chart2.draw(data2, options2);
				},
				
				error: function() {
					alert('통계 자료를 얻어오는 중 서버오류가 발생했습니다.');
					return;
				}
			});
		 }
	}
	
	


</script>


