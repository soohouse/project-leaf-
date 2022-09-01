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
				<span class="main-board-title" style="color: #790674;">지원 통계</span>
			</a>
			
			
			<div class="tab-content" style="margin: 0;">

				<br>
				<p style="font-size: 14px; font-weight: bold; margin-top: 30px; margin-left: 16px; margin-bottom: -10px; font-family: snas-serif;">전체 지원 상태 현황</p>
				<hr>
				
					<div class="clearfix" style="border: 1px solid #C7C7C7; border-radius: 4px; overflow: hidden;">
						
						<div id="chart-apply-status-bar" style="float: left; width: 50%;">
					
						</div>
						
						<div id="chart-apply-status-pie" style="float: left; width: 50%;">
					
						</div>
						
						<div id="chart-apply-status-table" style="float: left; height: 200px; width: 100%; padding: 20px;">
					
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
			url: '<c:url value="/admin/chartApplies1" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let applyStatusList = result.applyStatusList;
				
				var data = new google.visualization.DataTable();
				data.addColumn('string', '지원 상태');
				data.addColumn('number', '지원자 수');
				
				for(let i = 0; i < applyStatusList.length; i++) {
					data.addRow([applyStatusList[i].commonValue, applyStatusList[i].statusCount]);
				}

			      var options = {
			        title: "전체 지원 상태 현황 (막대)",
			        fontSize: 14,
			        width: 600,
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
			      var chart = new google.visualization.ColumnChart(document.getElementById("chart-apply-status-bar"));
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
			url: '<c:url value="/admin/chartApplies1" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let applyStatusList = result.applyStatusList;
				
				var data2 = new google.visualization.DataTable();
				data2.addColumn('string', '지원 상태');
				data2.addColumn('number', '지원자 수');
				
				for(let i = 0; i < applyStatusList.length; i++) {
					data2.addRow([applyStatusList[i].commonValue, applyStatusList[i].statusCount]);
				}

			      var options2 = {
			        title: "전체 지원 상태 현황 (파이)",
			        fontSize: 14,
			        width: 600,
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
			      var chart2 = new google.visualization.PieChart(document.getElementById("chart-apply-status-pie"));
			      chart2.draw(data2, options2);
			      
			},
			
			error: function() {
				alert('통계 자료를 얻어오는 중 서버오류가 발생했습니다.');
				return;
			}
		});
	 }
	
	
	
	// 통계 3
	google.charts.load('current', {'packages':['table']});
	google.charts.setOnLoadCallback(drawChart3);
	
	
	function drawChart3() {
		
		$.ajax({
			type: 'POST',
			url: '<c:url value="/admin/chartApplies1" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let applyStatusList = result.applyStatusList;
				
				var data3 = new google.visualization.DataTable();
				data3.addColumn('string', '지원 상태');
				data3.addColumn('number', '지원자 수');
				
				for(let i = 0; i < applyStatusList.length; i++) {
					data3.addRow([applyStatusList[i].commonValue, applyStatusList[i].statusCount]);
				}

			      var options3 = {
			        title: "전체 지원 상태 현황 (표)",
			        fontSize: 14,
			        width: 1150,
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
			      var chart3 = new google.visualization.Table(document.getElementById("chart-apply-status-table"));
			      chart3.draw(data3, options3);
			},
			
			error: function() {
				alert('통계 자료를 얻어오는 중 서버오류가 발생했습니다.');
				return;
			}
		});
	 }
	

</script>
