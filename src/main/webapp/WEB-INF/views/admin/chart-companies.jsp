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
				<span class="main-board-title" style="color: #003E03;">기업 통계</span>
			</a>

			
			
			<ul class="nav nav-tabs" role="tablist" id="developersTab" style="text-align: center;">
			  <li role="presentation" class="nav-item active">
			  	<a href="#tab-company-new" role="tab" data-toggle="tab" style="color: #6A3738;">기업 가입 현황</a>
			  </li>
			  <li role="presentation" class="nav-item">
			  	<a href="#tab-company-delete" role="tab" data-toggle="tab" style="color: #6A3738;">기업 탈퇴 현황</a>
			  </li>
			  <li role="presentation" class="nav-item">
			  	<a href="#tab-company-another" role="tab" data-toggle="tab" style="color: #6A3738;">기업 기타 통계</a>
			  </li>
			</ul>
			
			
			<div class="tab-content" style="margin: 0;">

				<!-- 기업 가입 현황 탭 클릭 시 뜨는 화면 -->
				<div class="tab-pane fade in active" id="tab-company-new">
				
					<br>
					<p style="font-size: 14px; font-weight: bold; margin-top: 30px; margin-left: 16px; margin-bottom: -10px; font-family: snas-serif;">신규 가입 현황</p>
					<hr>
				
					<div class="clearfix" style="border: 1px solid #C7C7C7; border-radius: 4px; overflow: hidden;">
						
						<div id="chart-company-regist" style="width: 100%;">
					
						</div>
					
					</div>
					
					
					<br>
					<p style="font-size: 14px; font-weight: bold; margin-top: 30px; margin-left: 16px; margin-bottom: -10px; font-family: snas-serif;">최근 한 달간 신규 기업 목록</p>
					<hr>
				
					<div class="clearfix" style="border: 1px solid #C7C7C7; border-radius: 4px; overflow: hidden;">
						
						<div id="chart-company-new-list" style="width: 100%;">
					
						</div>
					
					</div>
					
					
					<br>
					<p style="font-size: 14px; font-weight: bold; margin-top: 30px; margin-left: 16px; margin-bottom: -10px; font-family: snas-serif;">기업 가입 상태 현황</p>
					<hr>
					
					<div class="clearfix" style="border: 1px solid #C7C7C7; border-radius: 4px; overflow: hidden;">
						
						<div id="chart-company-logo" style="float: left; width: 33%;">
					
						</div>
						
						<div id="chart-company-status" style="float: left; width: 33%;">
					
						</div>
						
						<div id="chart-company-crg" style="float: left; width: 33%; height:400px; padding-top: 10px; padding-bottom: 10px; padding-left: 40px; padding-right: 40px;">
					
						</div>

					</div>
					
				</div>
				
				
				<!-- 기업 탈퇴 현황 탭 클릭 시 뜨는 화면 -->
				<div class="tab-pane fade" id="tab-company-delete">
					
					<br>
					<p style="font-size: 14px; font-weight: bold; margin-top: 30px; margin-left: 16px; margin-bottom: -10px; font-family: snas-serif;">탈퇴 현황</p>
					<hr>
				
					<div class="clearfix" style="border: 1px solid #C7C7C7; border-radius: 4px; overflow: hidden;">
						
						<div id="chart-company-delete" style="width: 100%;">
					
						</div>
					
					</div>
					
					
					<br>
					<p style="font-size: 14px; font-weight: bold; margin-top: 30px; margin-left: 16px; margin-bottom: -10px; font-family: snas-serif;">최근 한 달간 탈퇴 기업 목록</p>
					<hr>
				
					<div class="clearfix" style="border: 1px solid #C7C7C7; border-radius: 4px; overflow: hidden;">
						
						<div id="chart-company-delete-list" style="width: 100%;">
					
						</div>
					
					</div>
					
				</div>
				
				
				<!-- 기업 기타 통계 탭 클릭 시 뜨는 화면 -->
				<div class="tab-pane fade" id="tab-company-another">
					
					<br>
					<p style="font-size: 14px; font-weight: bold; margin-top: 30px; margin-left: 16px; margin-bottom: -10px; font-family: snas-serif;">전체 기업 위치 현황</p>
					<hr>
				
					<div class="clearfix" style="border: 1px solid #C7C7C7; border-radius: 4px; overflow: hidden;">
						
						<div id="chart-company-region" style="width: 100%;">
					
						</div>
					
					</div>
					
					
					<br>
					<p style="font-size: 14px; font-weight: bold; margin-top: 30px; margin-left: 16px; margin-bottom: -10px; font-family: snas-serif;">기업 별 프로젝트 등록 수</p>
					<hr>
					
					<div class="clearfix" style="border: 1px solid #C7C7C7; border-radius: 4px; overflow: hidden;">
						
						<div id="chart-company-project" style="float: left; width: 50%;">
					
						</div>
						
						<div id="chart-company-project-table" style="float: left; width: 50%; height:400px; padding-top: 10px; padding-bottom: 10px; padding-left: 40px; padding-right: 40px;">
					
						</div>

					</div>
					
					
					<br>
					<p style="font-size: 14px; font-weight: bold; margin-top: 30px; margin-left: 16px; margin-bottom: -10px; font-family: snas-serif;">기업 별 전송한 쪽지 수</p>
					<hr>
					
					<div class="clearfix" style="border: 1px solid #C7C7C7; border-radius: 4px; overflow: hidden;">
						
						<div id="chart-company-message" style="float: left; width: 50%;">
					
						</div>
						
						<div id="chart-company-message-table" style="float: left; width: 50%; height:400px; padding-top: 10px; padding-bottom: 10px; padding-left: 40px; padding-right: 40px;">
					
						</div>

					</div>
					
					
					<br>
					<p style="font-size: 14px; font-weight: bold; margin-top: 30px; margin-left: 16px; margin-bottom: -10px; font-family: snas-serif;">기업 별 게시판 현황</p>
					<hr>
					
					<div class="clearfix" style="border: 1px solid #C7C7C7; border-radius: 4px; overflow: hidden;">
						
						<div id="chart-company-board" style="float: left; width: 50%;">
					
						</div>
						
						<div id="chart-company-archive" style="float: left; width: 50%;">
					
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
			url: '<c:url value="/admin/chartCompanies1" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let companyRegistCount = result.companyRegistCount;
				let companyDate = result.companyDate;
				
				var data = new google.visualization.DataTable();
				data.addColumn('string', '날짜');
				data.addColumn('number', '신규 가입자 수');

				data.addRow([companyDate.userDateBefore5, companyRegistCount.companyRegistCountBefore5]);
				data.addRow([companyDate.userDateBefore4, companyRegistCount.companyRegistCountBefore4]);
				data.addRow([companyDate.userDateBefore3, companyRegistCount.companyRegistCountBefore3]);
				data.addRow([companyDate.userDateBefore2, companyRegistCount.companyRegistCountBefore2]);
				data.addRow([companyDate.userDateBefore1, companyRegistCount.companyRegistCountBefore1]);
				data.addRow([companyDate.userDateNow, companyRegistCount.companyRegistCountNow]);

			      var options = {
			        title: "신규 가입자 수 [최근 6개월]",
			        fontSize: 14,
			        width: 1200,
			        height: 400,
			        bar: {groupWidth: "30%"},
			        legend: { position: "none" },
			        series: {0: {type: 'line', color: '#1B3EA7'}},
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
			      var chart = new google.visualization.ColumnChart(document.getElementById("chart-company-regist"));
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
			url: '<c:url value="/admin/chartCompanies2" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let companyStatus = result.companyStatus;

				var data2 = new google.visualization.DataTable();
				data2.addColumn('string', '가입 상태');
				data2.addColumn('number', '상태별 인원 수');
				
				for(let i = 0; i < companyStatus.length; i++) {
					data2.addRow([companyStatus[i].commonValue, companyStatus[i].companyStatus]);
				}
				
			      var options2 = {
			        title: "전체 기업 가입 상태 현황",
			        fontSize: 14,
			        fontFaimly: 'sans-serif',
			        pieHole: 0.4,
			        //is3D: true,
			        width: 400,
			        height: 400,
			        legend: {
			        	position: "bottom"
			        }
			      };
			      var chart2 = new google.visualization.PieChart(document.getElementById("chart-company-status"));
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
			url: '<c:url value="/admin/chartCompanies3" />',
			
			dataType: 'json',
			
			success: function(result) {
				let companyCRG = result.companyCRG;
				
				var data3 = new google.visualization.DataTable();
				data3.addColumn('string', '기업 ID');
				data3.addColumn('string', '기업 이름');
				data3.addColumn('string', '기업 가입 상태');
				
				for(let i = 0; i < companyCRG.length; i++) {
					data3.addRow([companyCRG[i].companyID, companyCRG[i].companyName, companyCRG[i].commonValue]);
				}
				
			      var options3 = {
			        title: "각 기업 별 가입 상태 현황",
			        fontSize: 14,
			        fontFaimly: 'sans-serif',
			        pieHole: 0.4,
			        //is3D: true,
			        width: 400,
			        bar: {groupWidth: "10%"},
			        legend: {
			        	position: "bottom"
			        }
			      };
			      var chart3 = new google.visualization.Table(document.getElementById("chart-company-crg"));
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
			url: '<c:url value="/admin/chartCompanies4" />',
			
			dataType: 'json',
			
			success: function(result) {
				let companyNewList = result.companyNewList;
				
				var data4 = new google.visualization.DataTable();
				data4.addColumn('number', '기업번호');
				data4.addColumn('string', '기업 ID');
				data4.addColumn('string', '기업명');
				data4.addColumn('string', '기업 이메일');
				data4.addColumn('string', '기업 전화번호');
				data4.addColumn('string', '기업 주소');
				data4.addColumn('string', '기업 가입날짜');
				
				for(let i = 0; i < companyNewList.length; i++) {
					data4.addRow([companyNewList[i].companyNO, companyNewList[i].companyID, companyNewList[i].companyName, companyNewList[i].companyEmail, companyNewList[i].companyPhone, companyNewList[i].companyAddress, companyNewList[i].companyDate]);
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
			      var chart4 = new google.visualization.Table(document.getElementById("chart-company-new-list"));
			      chart4.draw(data4, options4);
			},
			
			error: function() {
				alert('통계 자료를 얻어오는 중 서버오류가 발생했습니다.');
				return;
			}
		});
	 }
	
	
	// 통계 5
	google.charts.load('current', {
        'packages':['geochart']
      });
      google.charts.setOnLoadCallback(drawRegionsMap);

      function drawRegionsMap() {
    	  
    	  $.ajax({
  			type: 'POST',
  			url: '<c:url value="/admin/chartCompanies5" />',
  			
  			dataType: 'json',
  			
  			success: function(result) {
  				let companyRegion = result.companyRegion;
  				
  				var data5 = new google.visualization.DataTable();
  				data5.addColumn('string', 'Country');
  	    		data5.addColumn('number', '기업 수');

  	    		let city = '';
  				
  	    		console.log(companyRegion);
  	    		
  				for(let i = 0; i < companyRegion.length; i++) {
  					
  					if(companyRegion[i].companyRegion == 'KR-11') {
  						city = '서울';
  					} else if(companyRegion[i].companyRegion == 'KR-26') {
  						city = '부산';
  					} else if(companyRegion[i].companyRegion == 'KR-27') {
  						city = '대구';
  					} else if(companyRegion[i].companyRegion == 'KR-30') {
  						city = '대전';
  					} else if(companyRegion[i].companyRegion == 'KR-29') {
  						city = '광주';
  					} else if(companyRegion[i].companyRegion == 'KR-28') {
  						city = '인천';
  					} else if(companyRegion[i].companyRegion == 'KR-31') {
  						city = '울산';
  					} else if(companyRegion[i].companyRegion == 'KR-43') {
  						city = '충북';
  					} else if(companyRegion[i].companyRegion == 'KR-44') {
  						city = '충남';
  					} else if(companyRegion[i].companyRegion == 'KR-42') {
  						city = '강원';
  					} else if(companyRegion[i].companyRegion == 'KR-41') {
  						city = '경기';
  					} else if(companyRegion[i].companyRegion == 'KR-47') {
  						city = '경북';
  					} else if(companyRegion[i].companyRegion == 'KR-48') {
  						city = '경남';
  					} else if(companyRegion[i].companyRegion == 'KR-49') {
  						city = '제주';
  					} else if(companyRegion[i].companyRegion == 'KR-45') {
  						city = '전북';
  					} else if(companyRegion[i].companyRegion == 'KR-46') {
  						city = '전남';
  					} else {
  						city = '서울';
  					}
  					
  					data5.addRow([{v: companyRegion[i].companyRegion, f: city} , companyRegion[i].companyScore]);
  				}
  				
  			      var options5 = {
  			    	title: '전체 기업 위치 현황',
  			  		colorAxis:  {minValue: 0, colors: ['#EDE5DA', '#C2D6B5' ,'#13971A']},
  			  		backgroundColor: {fill:'#ffffff'},	
  			  		datalessRegionColor: '#f5f5f5',
  			  		displayMode: 'regions', 
  			  		enableRegionInteractivity: 'true', 
  			  		resolution: 'provinces',
  			  		//sizeAxis: {minValue: 1, maxValue:1,minSize:10,  maxSize: 10},
  			  		region:'KR', //country code
  			  		//keepAspectRatio: true,
  			  		width:1200,
  			  		height:400,
  			  		tooltip: {textStyle: {color: '#444444'}, trigger:'focus'}
  			      };
  			      
  			    var chart5 = new google.visualization.GeoChart(document.getElementById('chart-company-region'));
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
  			url: '<c:url value="/admin/chartCompanies6" />',
  			
  			dataType: 'json',
  			
  			success: function(result) {
  				let logoYes = result.companyLogoCount.logoYes;
  				let logoNo = result.companyLogoCount.logoNo;

  				var data6 = new google.visualization.DataTable();
  				data6.addColumn('string', '로고 사진 등록 여부');
  				data6.addColumn('number', '기업 수');
  				
  				data6.addRow(['로고사진 O ', logoYes]);
  				data6.addRow(['로고사진 X', logoNo]);
  				
  			      var options6 = {
  			        title: "전체 기업 로고사진 등록 현황",
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
  			      var chart6 = new google.visualization.PieChart(document.getElementById("chart-company-logo"));
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
			url: '<c:url value="/admin/chartCompanies7" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let companyDeleteCount = result.companyDeleteCount;
				let companyDate = result.userDate;
				
				var data7 = new google.visualization.DataTable();
				data7.addColumn('string', '날짜');
				data7.addColumn('number', '탈퇴 수');

				data7.addRow([companyDate.userDateBefore5, companyDeleteCount.companyDeleteCountBefore5]);
				data7.addRow([companyDate.userDateBefore4, companyDeleteCount.companyDeleteCountBefore4]);
				data7.addRow([companyDate.userDateBefore3, companyDeleteCount.companyDeleteCountBefore3]);
				data7.addRow([companyDate.userDateBefore2, companyDeleteCount.companyDeleteCountBefore2]);
				data7.addRow([companyDate.userDateBefore1, companyDeleteCount.companyDeleteCountBefore1]);
				data7.addRow([companyDate.userDateNow, companyDeleteCount.companyDeleteCountNow]);

			      var options7 = {
			        title: "탈퇴 회원 수 [최근 6개월]",
			        fontSize: 14,
			        width: 1200,
			        height: 400,
			        bar: {groupWidth: "30%"},
			        legend: { position: "none" },
			        series: {0: {type: 'line', color: '#B8B8B8'}},
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
			                format: '#개'
			            }
			        }
			      };
			      var chart7 = new google.visualization.ColumnChart(document.getElementById("chart-company-delete"));
			      chart7.draw(data7, options7);
			      
			},
			
			error: function() {
				alert('통계 자료를 얻어오는 중 서버오류가 발생했습니다.');
				return;
			}
		});
	 }
	
	
	
	// 통계 8
	google.charts.load('current', {'packages':['table']});
	google.charts.setOnLoadCallback(drawChart8);
	
	
	function drawChart8() {
		
		$.ajax({
			type: 'POST',
			url: '<c:url value="/admin/chartCompanies8" />',
			
			dataType: 'json',
			
			success: function(result) {
				let companyDeleteList = result.companyDeleteList;
				
				var data8 = new google.visualization.DataTable();
				data8.addColumn('number', '기업번호');
				data8.addColumn('string', '기업 ID');
				data8.addColumn('string', '기업명');
				data8.addColumn('string', '기업 이메일');
				data8.addColumn('string', '기업 전화번호');
				data8.addColumn('string', '기업 주소');
				data8.addColumn('string', '기업 탈퇴날짜');
				
				for(let i = 0; i < companyDeleteList.length; i++) {
					data8.addRow([companyDeleteList[i].companyNO, companyDeleteList[i].companyID, companyDeleteList[i].companyName, companyDeleteList[i].companyEmail, companyDeleteList[i].companyPhone, companyDeleteList[i].companyAddress, companyDeleteList[i].companyDelete]);
				}
				
			      var options8 = {
			        title: "기업 탈퇴 목록",
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
			      var chart8 = new google.visualization.Table(document.getElementById("chart-company-delete-list"));
			      chart8.draw(data8, options8);
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
			url: '<c:url value="/admin/chartCompanies9" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let companyProjectCount = result.companyProjectCount;

				var data9 = new google.visualization.DataTable();
				data9.addColumn('string', '기업명');
				data9.addColumn('number', '프로젝트 등록 수');
				
				for(let i = 0; i < companyProjectCount.length; i++) {
					data9.addRow([companyProjectCount[i].companyName, companyProjectCount[i].companyProjectCount]);
				}
				
			      var options9 = {
			        title: "기업 별 프로젝트 등록 수",
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
			      var chart9 = new google.visualization.PieChart(document.getElementById("chart-company-project"));
			      chart9.draw(data9, options9);  
			},
			
			error: function() {
				alert('통계 자료를 얻어오는 중 서버오류가 발생했습니다.');
				return;
			}
		});
	 }
	
	
	
	// 통계 9-1
	google.charts.load('current', {'packages':['table']});
	google.charts.setOnLoadCallback(drawChart9_1);
	
	
	function drawChart9_1() {
		
		$.ajax({
			type: 'POST',
			url: '<c:url value="/admin/chartCompanies9" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let companyProjectCount = result.companyProjectCount;
				
				var data9_1 = new google.visualization.DataTable();
				data9_1.addColumn('string', '기업명');
				data9_1.addColumn('number', '프로젝트 등록 수');
				
				for(let i = 0; i < companyProjectCount.length; i++) {
					data9_1.addRow([companyProjectCount[i].companyName, companyProjectCount[i].companyProjectCount]);
				}
				
			      var options9_1 = {
			        title: "기업 별 프로젝트 등록 수",
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
			      var chart9_1 = new google.visualization.Table(document.getElementById("chart-company-project-table"));
			      chart9_1.draw(data9_1, options9_1);
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
			url: '<c:url value="/admin/chartCompanies10" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let companyMessageCount = result.companyMessageCount;

				var data10 = new google.visualization.DataTable();
				data10.addColumn('string', '기업명');
				data10.addColumn('number', '전송한 쪽지 수');
				
				for(let i = 0; i < companyMessageCount.length; i++) {
					data10.addRow([companyMessageCount[i].companyName, companyMessageCount[i].userMessageCount]);
				}
				
			      var options10 = {
			        title: "기업 별 전송 쪽지 수",
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
			      var chart10 = new google.visualization.PieChart(document.getElementById("chart-company-message"));
			      chart10.draw(data10, options10);  
			},
			
			error: function() {
				alert('통계 자료를 얻어오는 중 서버오류가 발생했습니다.');
				return;
			}
		});
	 }
	
	
	
	// 통계 10-1
	google.charts.load('current', {'packages':['table']});
	google.charts.setOnLoadCallback(drawChart10_1);
	
	
	function drawChart10_1() {
		
		$.ajax({
			type: 'POST',
			url: '<c:url value="/admin/chartCompanies10" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let companyMessageCount = result.companyMessageCount;
				
				var data10_1 = new google.visualization.DataTable();
				data10_1.addColumn('string', '기업명');
				data10_1.addColumn('number', '기업 별 전송 쪽지 수');
				
				for(let i = 0; i < companyMessageCount.length; i++) {
					data10_1.addRow([companyMessageCount[i].companyName, companyMessageCount[i].userMessageCount]);
				}
				
			      var options10_1 = {
			        title: "기업 별 전송 쪽지 수",
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
			      var chart10_1 = new google.visualization.Table(document.getElementById("chart-company-message-table"));
			      chart10_1.draw(data10_1, options10_1);
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
			url: '<c:url value="/admin/chartCompanies11" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let companyBoardCount = result.companyBoardCount;

				var data11 = new google.visualization.DataTable();
				data11.addColumn('string', '기업명');
				data11.addColumn('number', '작성한 게시글 수');
				
				for(let i = 0; i < companyBoardCount.length; i++) {
					data11.addRow([companyBoardCount[i].companyName, companyBoardCount[i].companyBoardCount]);
				}
				
			      var options11 = {
			        title: "기업 별 자유게시판 게시글 작성 수",
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
			      var chart11 = new google.visualization.PieChart(document.getElementById("chart-company-board"));
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
			url: '<c:url value="/admin/chartCompanies12" />',
			
			dataType: 'json',
			
			success: function(result) {
				
				let companyArchiveCount = result.companyArchiveCount;

				var data12 = new google.visualization.DataTable();
				data12.addColumn('string', '기업명');
				data12.addColumn('number', '작성한 게시글 수');
				
				for(let i = 0; i < companyArchiveCount.length; i++) {
					data12.addRow([companyArchiveCount[i].companyName, companyArchiveCount[i].companyArchiveCount]);
				}
				
			      var options12 = {
			        title: "기업 별 자료실 게시글 작성 수",
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
			      var chart12 = new google.visualization.PieChart(document.getElementById("chart-company-archive"));
			      chart12.draw(data12, options12);  
			},
			
			error: function() {
				alert('통계 자료를 얻어오는 중 서버오류가 발생했습니다.');
				return;
			}
		});
	 }
	

</script>
