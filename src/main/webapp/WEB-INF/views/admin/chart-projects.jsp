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
   		
   		.tab-content>.tab-pane {
		  height: 1px;
		  overflow: hidden;
		  display: block;
		  visibility: hidden;
		}
		.tab-content>.active {
		  height: auto;
		  overflow: auto;
		  visibility: visible;
		}
   		
   		
   </style>
   
</head>
<body>

<%@ include file="../include/header.jsp" %>
	   
	<div class="mainbox">
	
		<div class="sections">

			<a href="#" class="list-group-item active notice-list-top" style="margin-top: 20px;"> 
				<span class="main-board-title" style="color: #790674;">프로젝트 통계</span>
			</a>

			
			
			<ul class="nav nav-tabs" role="tablist" id="developersTab" style="text-align: center;">
			  <li role="presentation" class="nav-item active">
			  	<a href="#tab-company-new" role="tab" data-toggle="tab" style="color: #6A3738;">프로젝트 등록/삭제 현황</a>
			  </li>
			  <li role="presentation" class="nav-item">
			  	<a href="#tab-company-delete" role="tab" data-toggle="tab" style="color: #6A3738;">프로젝트 별 통계</a>
			  </li>
			  <li role="presentation" class="nav-item">
			  	<a href="#tab-company-another" role="tab" data-toggle="tab" style="color: #6A3738;">프로젝트 상태 현황</a>
			  </li>
			</ul>
			
			
			<div class="tab-content" style="margin: 0;">

				<!-- 프로젝트 등록/삭제 현황 탭 클릭 시 뜨는 화면 -->
				<div class="tab-pane fade in active" id="tab-company-new">
				
					<br>
					<p style="font-size: 14px; font-weight: bold; margin-top: 20px; margin-left: 16px; margin-bottom: -10px;">프로젝트 등록/삭제 현황</p>
					<hr>
					
					<div class="clearfix" style="border: 1px solid #C7C7C7; border-radius: 4px; overflow: hidden;">
						<div id="chart-project-regist" style="float: left; width: 50%;">
					
						</div>
						
						<div id="chart-project-delete" style="float: left; width: 50%;">
						
						</div>
						
						<div id="chart-project-total" style="float: left; width: 100%;">
					
						</div>
					</div>
					
					
					<br>
					<p style="font-size: 14px; font-weight: bold; margin-top: 30px; margin-left: 16px; margin-bottom: -10px; font-family: snas-serif;">최근 한 달간 신규 프로젝트 목록</p>
					<hr>
				
					<div class="clearfix" style="border: 1px solid #C7C7C7; border-radius: 4px; overflow: hidden;">
						
						<div id="chart-project-new-list" style="width: 100%;">
					
						</div>
					
					</div>
					
					
					<br>
					<p style="font-size: 14px; font-weight: bold; margin-top: 30px; margin-left: 16px; margin-bottom: -10px; font-family: snas-serif;">최근 한 달간 삭제 프로젝트 목록</p>
					<hr>
				
					<div class="clearfix" style="border: 1px solid #C7C7C7; border-radius: 4px; overflow: hidden;">
						
						<div id="chart-project-delete-list" style="width: 100%;">
					
						</div>
					
					</div>
					
				</div>
				
				
				<!-- 프로젝트 별 통계 탭 클릭 시 뜨는 화면 -->
				<div class="tab-pane fade" id="tab-company-delete">
					
					<br>
					<p style="font-size: 14px; font-weight: bold; margin-top: 20px; margin-left: 16px; margin-bottom: -10px;">프로젝트 별 지원자 현황</p>
					<hr>
					
					<div class="clearfix" style="border: 1px solid #C7C7C7; border-radius: 4px; overflow: hidden;">
					
						<div id="chart-project-apply" style="float: left; width: 33%;">
						
						</div>
					
						<div id="chart-project-apply-now" style="float: left; width: 33%;">
					
						</div>
						
						<div id="chart-project-apply-end" style="float: left; width: 33%;">
						
						</div>
						
						<div id="chart-project-apply-list" style="float: left; height: 400px; padding: 20px; width: 100%;">
					
						</div>
						
					</div>
					
					
					<br>
					<p style="font-size: 14px; font-weight: bold; margin-top: 20px; margin-left: 16px; margin-bottom: -10px;">프로젝트 별 기타 현황</p>
					<hr>
					
					<div class="clearfix" style="border: 1px solid #C7C7C7; border-radius: 4px; overflow: hidden;">
					
						<div id="chart-project-views" style="float: left; width: 50%;">
					
						</div>
						
						<div id="chart-project-likes" style="float: left; width: 50%;">
						
						</div>
						
					</div>
					
				</div>
				
				
				<!-- 프로젝트 상태 현황 탭 클릭 시 뜨는 화면 -->
				<div class="tab-pane fade" id="tab-company-another">
					
					<br>
					<p style="font-size: 14px; font-weight: bold; margin-top: 30px; margin-left: 16px; margin-bottom: -10px; font-family: snas-serif;">전체 프로젝트 상태 현황</p>
					<hr>
				
					<div class="clearfix" style="border: 1px solid #C7C7C7; border-radius: 4px; overflow: hidden;">
						
						<div id="chart-project-status-bar" style="float: left; width: 33%;">
					
						</div>
						
						<div id="chart-project-status-pie" style="float: left; width: 33%;">
					
						</div>
						
						<div id="chart-project-status-table" style="float: left; height: 400px; width: 33%; padding: 20px;">
					
						</div>
						
						<div id="chart-project-status-list" style="float: left; height: 400px; padding: 20px; width: 100%;">
					
						</div>
					
					</div>
					
				</div>
	
			</div>
	   
		</div>
		
		<%@ include file="../include/footer.jsp" %>
		
	</div>
   
</body>
</html>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

	//특정 메시지 표현을 위한 스크립트
	const msg = '${msg}';
	
	if(msg != '') {
		alert(msg);
	}
	

	
	// 통계 1
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);
	
	
	function drawChart() {
		
		$.ajax({
			type: 'POST',
			url: '<c:url value="/admin/chartProjects1" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let projectRegistCount = result.projectRegistCount;
				let projectDate = result.userDate;
				
				var data = new google.visualization.DataTable();
				data.addColumn('string', '날짜');
				data.addColumn('number', '프로젝트 수');

				data.addRow([projectDate.userDateBefore5, projectRegistCount.projectRegistCountBefore5]);
				data.addRow([projectDate.userDateBefore4, projectRegistCount.projectRegistCountBefore4]);
				data.addRow([projectDate.userDateBefore3, projectRegistCount.projectRegistCountBefore3]);
				data.addRow([projectDate.userDateBefore2, projectRegistCount.projectRegistCountBefore2]);
				data.addRow([projectDate.userDateBefore1, projectRegistCount.projectRegistCountBefore1]);
				data.addRow([projectDate.userDateNow, projectRegistCount.projectRegistCountNow]);

			      var options = {
			        title: "전체 프로젝트 등록 빈도 [최근 6개월]",
			        fontSize: 14,
			        width: 600,
			        height: 400,
			        bar: {groupWidth: "30%"},
			        legend: { position: "none" },
			        series: {0: {type: 'bar', color: '#1B857A'}},
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
	
	
	
	// 통계 2
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart2);
	
	
	function drawChart2() {
		
		$.ajax({
			type: 'POST',
			url: '<c:url value="/admin/chartProjects2" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let projectDeleteCount = result.projectDeleteCount;
				let projectDate = result.userDate;
				
				var data2 = new google.visualization.DataTable();
				data2.addColumn('string', '날짜');
				data2.addColumn('number', '프로젝트 수');

				data2.addRow([projectDate.userDateBefore5, projectDeleteCount.projectDeleteCountBefore5]);
				data2.addRow([projectDate.userDateBefore4, projectDeleteCount.projectDeleteCountBefore4]);
				data2.addRow([projectDate.userDateBefore3, projectDeleteCount.projectDeleteCountBefore3]);
				data2.addRow([projectDate.userDateBefore2, projectDeleteCount.projectDeleteCountBefore2]);
				data2.addRow([projectDate.userDateBefore1, projectDeleteCount.projectDeleteCountBefore1]);
				data2.addRow([projectDate.userDateNow, projectDeleteCount.projectDeleteCountNow]);

			      var options2 = {
			        title: "전체 프로젝트 삭제 빈도 [최근 6개월]",
			        fontSize: 14,
			        width: 600,
			        height: 400,
			        bar: {groupWidth: "30%"},
			        legend: { position: "none" },
			        series: {0: {type: 'bar', color: '#9A9ACF'}},
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
			      var chart2 = new google.visualization.ColumnChart(document.getElementById("chart-project-delete"));
			      chart2.draw(data2, options2);
			      
			},
			
			error: function() {
				alert('통계 자료를 얻어오는 중 서버오류가 발생했습니다.');
				return;
			}
		});
	 }
	
	
	
	// 통계 3
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart3);
	
	
	function drawChart3() {
		
		$.ajax({
			type: 'POST',
			url: '<c:url value="/admin/chartProjects3" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let projectRegistCount = result.projectRegistCount;
				let projectDeleteCount = result.projectDeleteCount;
				let projectDate = result.userDate;
				
				var data3 = new google.visualization.DataTable();
				data3.addColumn('string', '날짜');
				data3.addColumn('number', '프로젝트 등록 수');
				data3.addColumn('number', '프로젝트 삭제 수');

				data3.addRow([projectDate.userDateBefore5, projectRegistCount.projectRegistCountBefore5, projectDeleteCount.projectDeleteCountBefore5]);
				data3.addRow([projectDate.userDateBefore4, projectRegistCount.projectRegistCountBefore4, projectDeleteCount.projectDeleteCountBefore4]);
				data3.addRow([projectDate.userDateBefore3, projectRegistCount.projectRegistCountBefore3, projectDeleteCount.projectDeleteCountBefore3]);
				data3.addRow([projectDate.userDateBefore2, projectRegistCount.projectRegistCountBefore2, projectDeleteCount.projectDeleteCountBefore2]);
				data3.addRow([projectDate.userDateBefore1, projectRegistCount.projectRegistCountBefore1, projectDeleteCount.projectDeleteCountBefore1]);
				data3.addRow([projectDate.userDateNow, projectRegistCount.projectRegistCountNow,projectDeleteCount.projectDeleteCountNow]);
			

			      var options3 = {
			        title: "전체 프로젝트 종합 빈도  [최근 6개월]",
			        fontSize: 14,
			        width: 1200,
			        height: 400,
			        bar: {groupWidth: "30%"},
			        legend: { position: "none" },
			        series: {
			        	0: {type: 'line', color: '#1B857A'},
			        	1: {type: 'line', color: '#9A9ACF'}
			        },
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
			      var chart3 = new google.visualization.ComboChart(document.getElementById("chart-project-total"));
			      chart3.draw(data3, options3);
			      
			},
			
			error: function() {
				alert('통계 자료를 얻어오는 중 서버오류가 발생했습니다.');
				return;
			}
		});
	 }
	
	
	
	// 통계 4
	google.charts.load('current', {'packages':['table']});
	google.charts.setOnLoadCallback(drawChart4);
	
	
	function drawChart4() {
		
		$.ajax({
			type: 'POST',
			url: '<c:url value="/admin/chartProjects4" />',
			
			dataType: 'json',
			
			success: function(result) {
				let projectNewList = result.projectNewList;
				
				var data4 = new google.visualization.DataTable();
				data4.addColumn('number', '프로젝트 번호');
				data4.addColumn('string', '프로젝트 이름');
				data4.addColumn('string', '프로젝트 담당자');
				data4.addColumn('string', '모집 역할');
				data4.addColumn('string', '모집 시작 날짜');
				data4.addColumn('string', '모집 종료 날짜');
				data4.addColumn('string', '프로젝트 등록 날짜')
				data4.addColumn('string', '프로젝트 상태');
				
				for(let i = 0; i < projectNewList.length; i++) {
					data4.addRow([projectNewList[i].projectNO, projectNewList[i].projectName, projectNewList[i].projectManager, projectNewList[i].projectRequireRole, projectNewList[i].projectRequireDate1, projectNewList[i].projectRequireDate2, projectNewList[i].projectDate, projectNewList[i].commonValue]);
				}
				
			      var options4 = {
			        title: "기업회원 신규 가입자 목록",
			        fontSize: 14,
			        fontFaimly: 'sans-serif',
			        pieHole: 0.4,
			        //is3D: true,
			        width: 1200,
			        bar: {groupWidth: "10%"},
			        legend: {
			        	position: "bottom"
			        }
			      };
			      var chart4 = new google.visualization.Table(document.getElementById("chart-project-new-list"));
			      chart4.draw(data4, options4);
			},
			
			error: function() {
				alert('통계 자료를 얻어오는 중 서버오류가 발생했습니다.');
				return;
			}
		});
	 }
	
	
	
	// 통계 5
	google.charts.load('current', {'packages':['table']});
	google.charts.setOnLoadCallback(drawChart5);
	
	
	function drawChart5() {
		
		$.ajax({
			type: 'POST',
			url: '<c:url value="/admin/chartProjects5" />',
			
			dataType: 'json',
			
			success: function(result) {
				let projectDeleteList = result.projectDeleteList;
				
				var data5 = new google.visualization.DataTable();
				data5.addColumn('number', '프로젝트 번호');
				data5.addColumn('string', '프로젝트 이름');
				data5.addColumn('string', '프로젝트 담당자');
				data5.addColumn('string', '모집 역할');
				data5.addColumn('string', '모집 시작 날짜');
				data5.addColumn('string', '모집 종료 날짜');
				data5.addColumn('string', '프로젝트 등록 날짜')
				data5.addColumn('string', '프로젝트 상태');
				
				for(let i = 0; i < projectDeleteList.length; i++) {
					data5.addRow([projectDeleteList[i].projectNO, projectDeleteList[i].projectName, projectDeleteList[i].projectManager, projectDeleteList[i].projectRequireRole, projectDeleteList[i].projectRequireDate1, projectDeleteList[i].projectRequireDate2, projectDeleteList[i].projectDate, projectDeleteList[i].commonValue]);
				}
				
			      var options5 = {
			        title: "기업회원 신규 가입자 목록",
			        fontSize: 14,
			        fontFaimly: 'sans-serif',
			        pieHole: 0.4,
			        //is3D: true,
			        width: 1200,
			        bar: {groupWidth: "10%"},
			        legend: {
			        	position: "bottom"
			        }
			      };
			      var chart5 = new google.visualization.Table(document.getElementById("chart-project-delete-list"));
			      chart5.draw(data5, options5);
			},
			
			error: function() {
				alert('통계 자료를 얻어오는 중 서버오류가 발생했습니다.');
				return;
			}
		});
	 }
	
	
	
	// 통계 6
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart6);
	
	
	function drawChart6() {
		
		$.ajax({
			type: 'POST',
			url: '<c:url value="/admin/chartProjects6" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let projectApplyNow = result.projectApplyNow;

				var data6 = new google.visualization.DataTable();
				data6.addColumn('string', '프로젝트 명');
				data6.addColumn('number', '지원자 수');
				
				for(let i = 0; i < projectApplyNow.length; i++) {
					data6.addRow([projectApplyNow[i].projectName, projectApplyNow[i].applyCount]);
				}
				
			      var options6 = {
			        title: "현재 모집중인 프로젝트 별 지원자 수",
			        fontSize: 14,
			        fontFaimly: 'sans-serif',
			        pieHole: 0.4,
			        //is3D: true,
			        width: 400,
			        height: 400,
			        bar: {groupWidth: "10%"},
			        legend: {
			        	position: "bottom"
			        }
			      };
			      var chart6 = new google.visualization.PieChart(document.getElementById("chart-project-apply-now"));
			      chart6.draw(data6, options6);  
			},
			
			error: function() {
				alert('통계 자료를 얻어오는 중 서버오류가 발생했습니다.');
				return;
			}
		});
	 }
	
	
	
	// 통계 7
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart7);
	
	
	function drawChart7() {
		
		$.ajax({
			type: 'POST',
			url: '<c:url value="/admin/chartProjects7" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let projectApplyEnd = result.projectApplyEnd;

				var data7 = new google.visualization.DataTable();
				data7.addColumn('string', '프로젝트 명');
				data7.addColumn('number', '지원자 수');
				
				for(let i = 0; i < projectApplyEnd.length; i++) {
					data7.addRow([projectApplyEnd[i].projectName, projectApplyEnd[i].applyCount]);
				}
				
			      var options7 = {
			        title: "모집이 종료된 프로젝트 별 지원자 수",
			        fontSize: 14,
			        fontFaimly: 'sans-serif',
			        pieHole: 0.4,
			        //is3D: true,
			        width: 400,
			        height: 400,
			        bar: {groupWidth: "10%"},
			        legend: {
			        	position: "bottom"
			        }
			      };
			      var chart7 = new google.visualization.PieChart(document.getElementById("chart-project-apply-end"));
			      chart7.draw(data7, options7);  
			},
			
			error: function() {
				alert('통계 자료를 얻어오는 중 서버오류가 발생했습니다.');
				return;
			}
		});
	 }
	
	
	
	// 통계 8
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart8);
	
	
	function drawChart8() {
		
		$.ajax({
			type: 'POST',
			url: '<c:url value="/admin/chartProjects8" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let projectApply = result.projectApply;

				var data8 = new google.visualization.DataTable();
				data8.addColumn('string', '프로젝트 명');
				data8.addColumn('number', '지원자 수');
				
				for(let i = 0; i < projectApply.length; i++) {
					data8.addRow([projectApply[i].projectName, projectApply[i].applyCount]);
				}
				
			      var options8 = {
			        title: "전체 프로젝트 지원자 수",
			        fontSize: 14,
			        fontFaimly: 'sans-serif',
			        pieHole: 0.4,
			        //is3D: true,
			        width: 400,
			        height: 400,
			        bar: {groupWidth: "10%"},
			        legend: {
			        	position: "bottom"
			        }
			      };
			      var chart8 = new google.visualization.PieChart(document.getElementById("chart-project-apply"));
			      chart8.draw(data8, options8);  
			},
			
			error: function() {
				alert('통계 자료를 얻어오는 중 서버오류가 발생했습니다.');
				return;
			}
		});
	 }
	
	
	
	// 통계 9
	google.charts.load('current', {'packages':['table']});
	google.charts.setOnLoadCallback(drawChart9);
	
	
	function drawChart9() {
		
		$.ajax({
			type: 'POST',
			url: '<c:url value="/admin/chartProjects9" />',
			
			dataType: 'json',
			
			success: function(result) {
				let projectApplyList = result.projectApplyList;
				
				var data9 = new google.visualization.DataTable();
				data9.addColumn('string', '프로젝트 이름');
				data9.addColumn('string', '모집 역할');
				data9.addColumn('string', '모집 시작 날짜');
				data9.addColumn('string', '모집 종료 날짜');
				data9.addColumn('number', '지원자 수');
				
				for(let i = 0; i < projectApplyList.length; i++) {
					data9.addRow([projectApplyList[i].projectName, projectApplyList[i].projectRequireRole, projectApplyList[i].projectRequireDate1, projectApplyList[i].projectRequireDate2, projectApplyList[i].applyCount]);
				}
				
			      var options9 = {
			        title: "기업회원 신규 가입자 목록",
			        fontSize: 14,
			        fontFaimly: 'sans-serif',
			        pieHole: 0.4,
			        //is3D: true,
			        width: 1160,
			        bar: {groupWidth: "10%"},
			        legend: {
			        	position: "bottom"
			        }
			      };
			      var chart9 = new google.visualization.Table(document.getElementById("chart-project-apply-list"));
			      chart9.draw(data9, options9);
			},
			
			error: function() {
				alert('통계 자료를 얻어오는 중 서버오류가 발생했습니다.');
				return;
			}
		});
	 }
	
	
	
	// 통계 10
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart10);
	
	
	function drawChart10() {
		
		$.ajax({
			type: 'POST',
			url: '<c:url value="/admin/chartProjects10" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let projectViews = result.projectViews;

				var data10 = new google.visualization.DataTable();
				data10.addColumn('string', '프로젝트 명');
				data10.addColumn('number', '조회수');
				
				for(let i = 0; i < projectViews.length; i++) {
					data10.addRow([projectViews[i].projectName, projectViews[i].projectViews]);
				}
				
			      var options10 = {
			        title: "프로젝트 별 조회수",
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
			      };
			      var chart10 = new google.visualization.PieChart(document.getElementById("chart-project-views"));
			      chart10.draw(data10, options10);  
			},
			
			error: function() {
				alert('통계 자료를 얻어오는 중 서버오류가 발생했습니다.');
				return;
			}
		});
	 }
	
	
	
	// 통계 11
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart11);
	
	
	function drawChart11() {
		
		$.ajax({
			type: 'POST',
			url: '<c:url value="/admin/chartProjects11" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let projectLikes = result.projectLikes;

				var data11 = new google.visualization.DataTable();
				data11.addColumn('string', '프로젝트 명');
				data11.addColumn('number', '좋아요 수');
				
				for(let i = 0; i < projectLikes.length; i++) {
					data11.addRow([projectLikes[i].projectName, projectLikes[i].likeCount]);
				}
				
			      var options11 = {
			        title: "프로젝트 별 좋아요 수",
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
			      };
			      var chart11 = new google.visualization.PieChart(document.getElementById("chart-project-likes"));
			      chart11.draw(data11, options11);  
			},
			
			error: function() {
				alert('통계 자료를 얻어오는 중 서버오류가 발생했습니다.');
				return;
			}
		});
	 }
	
	
	
	// 통계 12
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart12);
	
	
	function drawChart12() {
		
		$.ajax({
			type: 'POST',
			url: '<c:url value="/admin/chartProjects12" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let projectStatusList = result.projectStatusList;
				
				var data12 = new google.visualization.DataTable();
				data12.addColumn('string', '프로젝트 상태');
				data12.addColumn('number', '프로젝트 개수');
				
				for(let i = 0; i < projectStatusList.length; i++) {
					data12.addRow([projectStatusList[i].commonValue, projectStatusList[i].statusCount]);
				}

			      var options12 = {
			        title: "전체 프로젝트 상태 현황 (막대)",
			        fontSize: 14,
			        width: 400,
			        height: 400,
			        bar: {groupWidth: "10%"},
			        legend: { position: "none" },
			        series: {
			        	0: {type: 'bar', color: '#9C070C'}
			        },
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
			                title: '프로젝트 개수',
			                format: '#개'
			            }
			        }
			      };
			      var chart12 = new google.visualization.ColumnChart(document.getElementById("chart-project-status-bar"));
			      chart12.draw(data12, options12);
			      
			},
			
			error: function() {
				alert('통계 자료를 얻어오는 중 서버오류가 발생했습니다.');
				return;
			}
		});
	 }
	
	
	
	// 통계 12-1
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart12_1);
	
	
	function drawChart12_1() {
		
		$.ajax({
			type: 'POST',
			url: '<c:url value="/admin/chartProjects12" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let projectStatusList = result.projectStatusList;
				
				var data12_1 = new google.visualization.DataTable();
				data12_1.addColumn('string', '프로젝트 상태');
				data12_1.addColumn('number', '프로젝트 개수');
				
				for(let i = 0; i < projectStatusList.length; i++) {
					data12_1.addRow([projectStatusList[i].commonValue, projectStatusList[i].statusCount]);
				}

			      var options12_1 = {
			        title: "전체 프로젝트 상태 현황 (파이)",
			        fontSize: 14,
			        width: 400,
			        height: 400,
			        pieHole: 0.4,
			        bar: {groupWidth: "10%"},
			        legend: { position: "bottom" },
			        series: {
			        	0: {type: 'bar', color: '#9C070C'}
			        },
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
			                title: '프로젝트 개수',
			                format: '#개'
			            }
			        }
			      };
			      var chart12_1 = new google.visualization.PieChart(document.getElementById("chart-project-status-pie"));
			      chart12_1.draw(data12_1, options12_1);
			      
			},
			
			error: function() {
				alert('통계 자료를 얻어오는 중 서버오류가 발생했습니다.');
				return;
			}
		});
	 }
	
	
	
	// 통계 12-2
	google.charts.load('current', {'packages':['table']});
	google.charts.setOnLoadCallback(drawChart12_2);
	
	
	function drawChart12_2() {
		
		$.ajax({
			type: 'POST',
			url: '<c:url value="/admin/chartProjects12" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let projectStatusList = result.projectStatusList;
				
				var data12_2 = new google.visualization.DataTable();
				data12_2.addColumn('string', '프로젝트 상태');
				data12_2.addColumn('number', '프로젝트 개수');
				
				for(let i = 0; i < projectStatusList.length; i++) {
					data12_2.addRow([projectStatusList[i].commonValue, projectStatusList[i].statusCount]);
				}

			      var options12_2 = {
			        title: "전체 프로젝트 상태 현황 (표)",
			        fontSize: 14,
			        width: 400,
			        pieHole: 0.4,
			        bar: {groupWidth: "10%"},
			        legend: { position: "bottom" },
			        series: {
			        	0: {type: 'bar', color: '#9C070C'}
			        },
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
			                title: '프로젝트 개수',
			                format: '#개'
			            }
			        }
			      };
			      var chart12_2 = new google.visualization.Table(document.getElementById("chart-project-status-table"));
			      chart12_2.draw(data12_2, options12_2);
			},
			
			error: function() {
				alert('통계 자료를 얻어오는 중 서버오류가 발생했습니다.');
				return;
			}
		});
	 }
	
	
	
	// 통계 13
	google.charts.load('current', {'packages':['table']});
	google.charts.setOnLoadCallback(drawChart13);
	
	
	function drawChart13() {
		
		$.ajax({
			type: 'POST',
			url: '<c:url value="/admin/chartProjects9" />',
			
			dataType: 'json',
			
			success: function(result) {
				let projectApplyList = result.projectApplyList;
				
				var data13 = new google.visualization.DataTable();
				data13.addColumn('string', '프로젝트 이름');
				data13.addColumn('string', '모집 역할');
				data13.addColumn('string', '모집 시작 날짜');
				data13.addColumn('string', '모집 종료 날짜');
				data13.addColumn('string', '프로젝트 상태');
				
				for(let i = 0; i < projectApplyList.length; i++) {
					data13.addRow([projectApplyList[i].projectName, projectApplyList[i].projectRequireRole, projectApplyList[i].projectRequireDate1, projectApplyList[i].projectRequireDate2, projectApplyList[i].commonValue]);
				}
				
			      var options13 = {
			        title: "기업회원 신규 가입자 목록",
			        fontSize: 14,
			        fontFaimly: 'sans-serif',
			        pieHole: 0.4,
			        //is3D: true,
			        width: 1160,
			        bar: {groupWidth: "10%"},
			        legend: {
			        	position: "bottom"
			        }
			      };
			      var chart13 = new google.visualization.Table(document.getElementById("chart-project-status-list"));
			      chart13.draw(data13, options13);
			},
			
			error: function() {
				alert('통계 자료를 얻어오는 중 서버오류가 발생했습니다.');
				return;
			}
		});
	 }
	

</script>
