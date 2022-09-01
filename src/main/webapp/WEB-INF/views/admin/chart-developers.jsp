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
				<span class="main-board-title" style="color: #343772;">개발자 통계</span>
			</a>

			
			
			<ul class="nav nav-tabs" role="tablist" id="developersTab" style="text-align: center;">
			  <li role="presentation" class="nav-item active">
			  	<a href="#tab-user-new" role="tab" data-toggle="tab" style="color: #6A3738;">개발자 신규 가입 현황</a>
			  </li>
			  <li role="presentation" class="nav-item">
			  	<a href="#tab-user-delete" role="tab" data-toggle="tab" style="color: #6A3738;">개발자 탈퇴 현황</a>
			  </li>
			  <li role="presentation" class="nav-item">
			  	<a href="#tab-user-another" role="tab" data-toggle="tab" style="color: #6A3738;">개발자 기타 통계</a>
			  </li>
			</ul>
			
			
			<div class="tab-content" style="margin: 0;">

				<!-- 개발자 신규 가입 현황 탭 클릭 시 뜨는 화면 -->
				<div class="tab-pane fade in active" id="tab-user-new">
				
					<br>
					<p style="font-size: 14px; font-weight: bold; margin-top: 30px; margin-left: 16px; margin-bottom: -10px; font-family: snas-serif;">신규 가입 현황</p>
					<hr>
				
					<div class="clearfix" style="border: 1px solid #C7C7C7; border-radius: 4px; overflow: hidden;">
						
						<div id="chart-user-regist" style="width: 100%;">
					
						</div>
					
					</div>
					
					
					<br>
					<p style="font-size: 14px; font-weight: bold; margin-top: 30px; margin-left: 16px; margin-bottom: -10px; font-family: snas-serif;">최근 한 달간 신규 가입자 목록</p>
					<hr>
				
					<div class="clearfix" style="border: 1px solid #C7C7C7; border-radius: 4px; overflow: hidden;">
						
						<div id="chart-user-new-list" style="width: 100%;">
					
						</div>
					
					</div>
					
					
					<br>
					<p style="font-size: 14px; font-weight: bold; margin-top: 30px; margin-left: 16px; margin-bottom: -10px; font-family: snas-serif;">프로필사진 및 이력서 현황</p>
					<hr>
					
					<div class="clearfix" style="border: 1px solid #C7C7C7; border-radius: 4px; overflow: hidden;">
						
						<div id="chart-user-profile" style="float: left; width: 50%;">
					
						</div>
						
						<div id="chart-user-resume" style="float: left; width: 50%;">
					
						</div>
					
					</div>
					
				</div>
				
				
				<!-- 개발자 탈퇴 현황 탭 클릭 시 뜨는 화면 -->
				<div class="tab-pane fade" id="tab-user-delete">
					
					<br>
					<p style="font-size: 14px; font-weight: bold; margin-top: 30px; margin-left: 16px; margin-bottom: -10px; font-family: snas-serif;">탈퇴 현황</p>
					<hr>
				
					<div class="clearfix" style="border: 1px solid #C7C7C7; border-radius: 4px; overflow: hidden;">
						
						<div id="chart-user-delete" style="width: 100%;">
					
						</div>
					
					</div>
					
					<br>
					<p style="font-size: 14px; font-weight: bold; margin-top: 30px; margin-left: 16px; margin-bottom: -10px; font-family: snas-serif;">최근 한 달간 탈퇴자 목록</p>
					<hr>
				
					<div class="clearfix" style="border: 1px solid #C7C7C7; border-radius: 4px; overflow: hidden;">
						
						<div id="chart-user-delete-list" style="width: 100%;">
					
						</div>
					
					</div>
					
				</div>
				
				
				<!-- 개발자 별 기타 통계 탭 클릭 시 뜨는 화면 -->
				<div class="tab-pane fade" id="tab-user-another">
					
					<br>
					<p style="font-size: 14px; font-weight: bold; margin-top: 30px; margin-left: 16px; margin-bottom: -10px; font-family: snas-serif;">개발자 별 프로젝트 지원 수</p>
					<hr>
					
					<div class="clearfix" style="border: 1px solid #C7C7C7; border-radius: 4px; overflow: hidden;">
						
						<div id="chart-user-apply" style="float: left; width: 50%;">
					
						</div>
						
						<div id="chart-user-apply-table" style="float: left; width: 50%; height:400px; padding-top: 10px; padding-bottom: 10px; padding-left: 40px; padding-right: 40px;">
					
						</div>

					</div>
					
					
					<br>
					<p style="font-size: 14px; font-weight: bold; margin-top: 30px; margin-left: 16px; margin-bottom: -10px; font-family: snas-serif;">개발자 별 쪽지 수신 현황</p>
					<hr>
					
					<div class="clearfix" style="border: 1px solid #C7C7C7; border-radius: 4px; overflow: hidden;">
						
						<div id="chart-user-message" style="float: left; width: 50%;">
					
						</div>
						
						<div id="chart-user-message-table" style="float: left; width: 50%; height:400px; padding-top: 10px; padding-bottom: 10px; padding-left: 40px; padding-right: 40px;">
					
						</div>

					</div>
					
					
					<br>
					<p style="font-size: 14px; font-weight: bold; margin-top: 30px; margin-left: 16px; margin-bottom: -10px; font-family: snas-serif;">개발자 별 게시판 현황</p>
					<hr>
					
					<div class="clearfix" style="border: 1px solid #C7C7C7; border-radius: 4px; overflow: hidden;">
						
						<div id="chart-user-board" style="float: left; width: 25%;">
					
						</div>
						
						<div id="chart-user-question" style="float: left; width: 25%;">
					
						</div>
						
						<div id="chart-user-answer" style="float: left; width: 25%;">
					
						</div>
						
						<div id="chart-user-archive" style="float: left; width: 25%;">
					
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
			url: '<c:url value="/admin/chartDevelopers1" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let userRegistCount = result.userRegistCount;
				let userDate = result.userDate;
				
				var data = new google.visualization.DataTable();
				data.addColumn('string', '날짜');
				data.addColumn('number', '신규 가입자 수');

				data.addRow([userDate.userDateBefore5, userRegistCount.userRegistCountBefore5]);
				data.addRow([userDate.userDateBefore4, userRegistCount.userRegistCountBefore4]);
				data.addRow([userDate.userDateBefore3, userRegistCount.userRegistCountBefore3]);
				data.addRow([userDate.userDateBefore2, userRegistCount.userRegistCountBefore2]);
				data.addRow([userDate.userDateBefore1, userRegistCount.userRegistCountBefore1]);
				data.addRow([userDate.userDateNow, userRegistCount.userRegistCountNow]);

			      var options = {
			        title: "신규 가입자 수 [최근 6개월]",
			        fontSize: 14,
			        width: 1200,
			        height: 400,
			        bar: {groupWidth: "30%"},
			        legend: { position: "none" },
			        series: {0: {type: 'line', color: 'green'}},
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
			                title: '신규 가입자 수',
			                format: '#명'
			            }
			        }
			      };
			      var chart = new google.visualization.ColumnChart(document.getElementById("chart-user-regist"));
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
			url: '<c:url value="/admin/chartDevelopers2" />',
			
			dataType: 'json',
			
			success: function(result) {
				let userProfileYes = result.userProfileCount.userProfileYes;
				let userProfileNo = result.userProfileCount.userProfileNo;

				var data2 = new google.visualization.DataTable();
				data2.addColumn('string', '프로필사진 등록 여부');
				data2.addColumn('number', '개발자 인원');
				
				data2.addRow(['프로필사진 O ', userProfileYes]);
				data2.addRow(['프로필사진 X', userProfileNo]);
				
			      var options2 = {
			        title: "전체 개발자 프로필사진 등록 현황",
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
			      var chart2 = new google.visualization.PieChart(document.getElementById("chart-user-profile"));
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
			url: '<c:url value="/admin/chartDevelopers3" />',
			
			dataType: 'json',
			
			success: function(result) {
				let userResumeYes = result.userResumeCount.resumeYes;
				let userResumeNo = result.userResumeCount.resumeNo;

				var data3 = new google.visualization.DataTable();
				data3.addColumn('string', '이력서 등록 여부', {role: 'style'});
				data3.addColumn('number', '개발자 인원', {role: 'style'});
				
				data3.addRow(['이력서 O', userResumeYes]);
				data3.addRow(['이력서 X', userResumeNo]);
				
			      var options3 = {
			        title: "전체 개발자 이력서 등록 현황",
			        fontSize: 14,
			        fontFaimly: 'sans-serif',
			        pieHole: 0.4,
			        //is3D: true,
			        width: 600,
			        height: 400,
			        slices: {
			        	0: {color: '#109618'},
			        	1: {color: '#DC3912'}
			        },
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
			      var chart3 = new google.visualization.PieChart(document.getElementById("chart-user-resume"));
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
			url: '<c:url value="/admin/chartDevelopers4" />',
			
			dataType: 'json',
			
			success: function(result) {
				let userNewList = result.userNewList;
				
				var data4 = new google.visualization.DataTable();
				data4.addColumn('number', '회원번호');
				data4.addColumn('string', '회원 ID');
				data4.addColumn('string', '회원 이름');
				data4.addColumn('string', '회원 이메일');
				data4.addColumn('string', '회원 전화번호');
				data4.addColumn('string', '회원 가입날짜');
				
				for(let i = 0; i < userNewList.length; i++) {
					data4.addRow([userNewList[i].userNO, userNewList[i].userID, userNewList[i].userName, userNewList[i].userEmail, userNewList[i].userPhone, userNewList[i].userDate]);
				}
				
			      var options4 = {
			        title: "프로젝트 별 지원자 수",
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
			      var chart4 = new google.visualization.Table(document.getElementById("chart-user-new-list"));
			      chart4.draw(data4, options4);
			},
			
			error: function() {
				alert('통계 자료를 얻어오는 중 서버오류가 발생했습니다.');
				return;
			}
		});
	 }
	
	
	
	// 통계 5
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart5);
	
	
	function drawChart5() {
		
		$.ajax({
			type: 'POST',
			url: '<c:url value="/admin/chartDevelopers5" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let userDeleteCount = result.userDeleteCount;
				let userDate = result.userDate;
				
				var data5 = new google.visualization.DataTable();
				data5.addColumn('string', '날짜');
				data5.addColumn('number', '탈퇴 수');

				data5.addRow([userDate.userDateBefore5, userDeleteCount.userDeleteCountBefore5]);
				data5.addRow([userDate.userDateBefore4, userDeleteCount.userDeleteCountBefore4]);
				data5.addRow([userDate.userDateBefore3, userDeleteCount.userDeleteCountBefore3]);
				data5.addRow([userDate.userDateBefore2, userDeleteCount.userDeleteCountBefore2]);
				data5.addRow([userDate.userDateBefore1, userDeleteCount.userDeleteCountBefore1]);
				data5.addRow([userDate.userDateNow, userDeleteCount.userDeleteCountNow]);

			      var options5 = {
			        title: "탈퇴 회원 수 [최근 6개월]",
			        fontSize: 14,
			        width: 1200,
			        height: 400,
			        bar: {groupWidth: "30%"},
			        legend: { position: "none" },
			        series: {0: {type: 'line', color: 'red'}},
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
			                title: '탈퇴 수',
			                format: '#명'
			            }
			        }
			      };
			      var chart5 = new google.visualization.ColumnChart(document.getElementById("chart-user-delete"));
			      chart5.draw(data5, options5);
			      
			},
			
			error: function() {
				alert('통계 자료를 얻어오는 중 서버오류가 발생했습니다.');
				return;
			}
		});
	 }
	
	
	
	// 통계 6
	google.charts.load('current', {'packages':['table']});
	google.charts.setOnLoadCallback(drawChart6);
	
	
	function drawChart6() {
		
		$.ajax({
			type: 'POST',
			url: '<c:url value="/admin/chartDevelopers6" />',
			
			dataType: 'json',
			
			success: function(result) {
				let userDeleteList = result.userDeleteList;
				
				var data6 = new google.visualization.DataTable();
				data6.addColumn('number', '회원번호');
				data6.addColumn('string', '회원 ID');
				data6.addColumn('string', '회원 이름');
				data6.addColumn('string', '회원 이메일');
				data6.addColumn('string', '회원 전화번호');
				data6.addColumn('string', '회원 탈퇴날짜');
				
				for(let i = 0; i < userDeleteList.length; i++) {
					data6.addRow([userDeleteList[i].userNO, userDeleteList[i].userID, userDeleteList[i].userName, userDeleteList[i].userEmail, userDeleteList[i].userPhone, userDeleteList[i].userDelete]);
				}
				
			      var options6 = {
			        title: "프로젝트 별 지원자 수",
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
			      var chart6 = new google.visualization.Table(document.getElementById("chart-user-delete-list"));
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
			url: '<c:url value="/admin/chartDevelopers7" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let userApplyCount = result.userApplyCount;

				var data7 = new google.visualization.DataTable();
				data7.addColumn('string', '개발자 ID');
				data7.addColumn('number', '지원 수');
				
				for(let i = 0; i < userApplyCount.length; i++) {
					data7.addRow([userApplyCount[i].userID, userApplyCount[i].userApplyCount]);
				}
				
			      var options7 = {
			        title: "개발자 별 프로젝트 지원 수",
			        fontSize: 14,
			        fontFaimly: 'sans-serif',
			        //pieHole: 0.4,
			        is3D: true,
			        width: 600,
			        height: 400,
			        bar: {groupWidth: "10%"},
			        legend: {
			        	position: "bottom"
			        }
			      };
			      var chart7 = new google.visualization.PieChart(document.getElementById("chart-user-apply"));
			      chart7.draw(data7, options7);  
			},
			
			error: function() {
				alert('통계 자료를 얻어오는 중 서버오류가 발생했습니다.');
				return;
			}
		});
	 }
	
	
	
	// 통계 7-1
	google.charts.load('current', {'packages':['table']});
	google.charts.setOnLoadCallback(drawChart7_1);
	
	
	function drawChart7_1() {
		
		$.ajax({
			type: 'POST',
			url: '<c:url value="/admin/chartDevelopers7" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let userApplyCount = result.userApplyCount;
				
				var data7_1 = new google.visualization.DataTable();
				data7_1.addColumn('string', '회원 ID');
				data7_1.addColumn('number', '프로젝트 지원 수');
				
				for(let i = 0; i < userApplyCount.length; i++) {
					data7_1.addRow([userApplyCount[i].userID, userApplyCount[i].userApplyCount]);
				}
				
			      var options7_1 = {
			        title: "프로젝트 별 지원자 수",
			        fontSize: 14,
			        fontFaimly: 'sans-serif',
			        pieHole: 0.4,
			        //is3D: true,
			        width: 600,
			        bar: {groupWidth: "10%"},
			        legend: {
			        	position: "bottom"
			        }
			      };
			      var chart7_1 = new google.visualization.Table(document.getElementById("chart-user-apply-table"));
			      chart7_1.draw(data7_1, options7_1);
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
			url: '<c:url value="/admin/chartDevelopers8" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let userMessageCount = result.userMessageCount;

				var data8 = new google.visualization.DataTable();
				data8.addColumn('string', '개발자 ID');
				data8.addColumn('number', '쪽지 수');
				
				for(let i = 0; i < userMessageCount.length; i++) {
					data8.addRow([userMessageCount[i].userID, userMessageCount[i].userMessageCount]);
				}
				
				
				
			      var options8 = {
			        title: "개발자 별 받은 쪽지 수",
			        fontSize: 14,
			        fontFaimly: 'sans-serif',
			        //pieHole: 0.4,
			        is3D: true,
			        width: 600,
			        height: 400,
			        legend: {
			        	position: "bottom"
			        }
			      };
			      var chart8 = new google.visualization.PieChart(document.getElementById("chart-user-message"));
			      chart8.draw(data8, options8);  
			},
			
			error: function() {
				alert('통계 자료를 얻어오는 중 서버오류가 발생했습니다.');
				return;
			}
		});
	 }
	
	
	
	// 통계 8-1
	google.charts.load('current', {'packages':['table']});
	google.charts.setOnLoadCallback(drawChart8_1);
	
	
	function drawChart8_1() {
		
		$.ajax({
			type: 'POST',
			url: '<c:url value="/admin/chartDevelopers8" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let userMessageCount = result.userMessageCount;
				
				var data8_1 = new google.visualization.DataTable();
				data8_1.addColumn('string', '회원 ID');
				data8_1.addColumn('number', '받은 쪽지 수');
				
				for(let i = 0; i < userMessageCount.length; i++) {
					data8_1.addRow([userMessageCount[i].userID, userMessageCount[i].userMessageCount]);
				}
				
			      var options8_1 = {
			        title: "프로젝트 별 지원자 수",
			        fontSize: 14,
			        fontFaimly: 'sans-serif',
			        pieHole: 0.4,
			        //is3D: true,
			        width: 600,
			        bar: {groupWidth: "10%"},
			        legend: {
			        	position: "bottom"
			        }
			      };
			      var chart8_1 = new google.visualization.Table(document.getElementById("chart-user-message-table"));
			      chart8_1.draw(data8_1, options8_1);
			},
			
			error: function() {
				alert('통계 자료를 얻어오는 중 서버오류가 발생했습니다.');
				return;
			}
		});
	 }
	
	
	
	// 통계 9
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart9);
	
	
	function drawChart9() {
		
		$.ajax({
			type: 'POST',
			url: '<c:url value="/admin/chartDevelopers9" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let userBoardCount = result.userBoardCount;

				var data9 = new google.visualization.DataTable();
				data9.addColumn('string', '개발자 ID');
				data9.addColumn('number', '작성한 게시글 수');
				
				for(let i = 0; i < userBoardCount.length; i++) {
					data9.addRow([userBoardCount[i].userID, userBoardCount[i].userBoardCount]);
				}
				
			      var options9 = {
			        title: "자유게시판 게시글 수",
			        fontSize: 14,
			        fontFaimly: 'sans-serif',
			        pieHole: 0.4,
			        //is3D: true,
			        width: 300,
			        height: 300,
			        legend: {
			        	position: "bottom"
			        }
			      };
			      var chart9 = new google.visualization.PieChart(document.getElementById("chart-user-board"));
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
			url: '<c:url value="/admin/chartDevelopers10" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let userQuestionCount = result.userQuestionCount;

				var data10 = new google.visualization.DataTable();
				data10.addColumn('string', '개발자 ID');
				data10.addColumn('number', '작성한 질문글 수');
				
				for(let i = 0; i < userQuestionCount.length; i++) {
					data10.addRow([userQuestionCount[i].userID, userQuestionCount[i].userQuestionCount]);
				}
				
			      var options10 = {
			        title: "Q&A 질문 글 수",
			        fontSize: 14,
			        fontFaimly: 'sans-serif',
			        pieHole: 0.4,
			        //is3D: true,
			        width: 300,
			        height: 300,
			        legend: {
			        	position: "bottom"
			        }
			      };
			      var chart10 = new google.visualization.PieChart(document.getElementById("chart-user-question"));
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
			url: '<c:url value="/admin/chartDevelopers11" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let userAnswerCount = result.userAnswerCount;

				var data11 = new google.visualization.DataTable();
				data11.addColumn('string', '개발자 ID');
				data11.addColumn('number', '작성한 답변글 수');
				
				for(let i = 0; i < userAnswerCount.length; i++) {
					data11.addRow([userAnswerCount[i].userID, userAnswerCount[i].userAnswerCount]);
				}
				
			      var options11 = {
			        title: "Q&A 답변 글 수",
			        fontSize: 14,
			        fontFaimly: 'sans-serif',
			        pieHole: 0.4,
			        //is3D: true,
			        width: 300,
			        height: 300,
			        legend: {
			        	position: "bottom"
			        }
			      };
			      var chart11 = new google.visualization.PieChart(document.getElementById("chart-user-answer"));
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
			url: '<c:url value="/admin/chartDevelopers12" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let userArchiveCount = result.userArchiveCount;

				var data12 = new google.visualization.DataTable();
				data12.addColumn('string', '개발자 ID');
				data12.addColumn('number', '작성한 자료실 글 수');
				
				for(let i = 0; i < userArchiveCount.length; i++) {
					data12.addRow([userArchiveCount[i].userID, userArchiveCount[i].userArchiveCount]);
				}
				
			      var options12 = {
			        title: "자료실 게시글 수",
			        fontSize: 14,
			        fontFaimly: 'sans-serif',
			        pieHole: 0.4,
			        //is3D: true,
			        width: 300,
			        height: 300,
			        legend: {
			        	position: "bottom"
			        }
			      };
			      var chart12 = new google.visualization.PieChart(document.getElementById("chart-user-archive"));
			      chart12.draw(data12, options12);  
			},
			
			error: function() {
				alert('통계 자료를 얻어오는 중 서버오류가 발생했습니다.');
				return;
			}
		});
	 }

</script>
