<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>

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
   			width: 1000px;
   			margin: 0 auto;
   	}
   	
  </style>


</head>
<body>

<%@ include file="../include/header.jsp" %>
  
	<div class="mainbox">
  
		<div class="sections">
   
			<div class="list-group-item active notice-list-top" style="margin-top: 20px; border-radius: 0;"> 
			
				<div style="clear: both;">
					<span class="main-board-title" style="color: #909090; font-size: 14px;">${projectview.companyName}</span>
					
					<c:choose>
			      	
			      		<c:when test="${apply.commonCODE == 'SPT001'}">
			      			<button type="button" id="btn-apply-spt001" class="btn pull-right" style="background: #4F5199; color: white; margin-top: -8px;">지원 취소</button>
			      		</c:when>
			      	
			      		<c:when test="${apply.commonCODE == 'SPT002'}">
			      			<button type="button" id="btn-apply-spt002" class="btn pull-right" disabled style="background: #74733D; color: white; margin-top: -8px;">심사 진행 중</button>
			      		</c:when>
			      		
			      		<c:when test="${apply.commonCODE == 'SPT003'}">
			      			<button type="button" id="btn-apply-spt003" class="btn pull-right" disabled style="background: #585BCD; color: white; margin-top: -8px;">최종 합격 검토 중</button>
			      		</c:when>
			      		
			      		<c:when test="${apply.commonCODE == 'SPT004'}">
			      			<button type="button" id="btn-apply-spt004" class="btn pull-right" disabled style="background: #0095AA; color: white; margin-top: -8px;">최종 합격</button>
			      		</c:when>
			      		
			      		<c:when test="${apply.commonCODE == 'SPT005'}">
			      			<button type="button" id="btn-apply-spt005" class="btn pull-right" disabled style="background: #c7c7c7; margin-top: -8px;">불합격</button>
			      		</c:when>
			      		
			      		<c:when test="${companyNO != null}">
			      			<button type="button" id="jiwon-btn1" class="btn pull-right btn-success" style="margin-top: -8px;" disabled>지원하기</button>
			      		</c:when>
			      		
			      		<c:when test="${projectview.commonCODE == 'PST003'}">
			      			<button type="button" id="btn-end1" class="btn pull-right" style="margin-top: -8px; background: #808080; color: white;" disabled>지원종료</button>
			      		</c:when>
			      		
			      		<c:otherwise>
			      			<button type="button" id="jiwon-btn1" class="btn pull-right btn-success" style="margin-top: -8px;">지원하기</button>
			      		</c:otherwise>
			      	
			      	</c:choose>
			      	
			      	<c:choose>
			      	
			      		<c:when test="${projectview.commonCODE == 'PST001'}">
			      			<span class="main-board-title pull-right" style="font-size: 14px; font-weight: 500; margin-right: 60px; color: green;">${projectview.commonValue}</span>
			      		</c:when>
			      		
			      		<c:when test="${projectview.commonCODE == 'PST002'}">
			      			<span class="main-board-title pull-right" style="font-size: 14px; font-weight: 500; margin-right: 60px; color: #970000;">${projectview.commonValue}</span>
			      		</c:when>
			      		
			      		<c:when test="${projectview.commonCODE == 'PST003'}">
			      			<span class="main-board-title pull-right" style="font-size: 14px; font-weight: 500; margin-right: 60px; color: #808080;">${projectview.commonValue}</span>
			      		</c:when>
			      	
			      	</c:choose>

				</div>
				
				<div style="clear: both;">
					<span class="main-board-title" style="color: #2B2B2B; font-size: 20px; margin-top: 10px; font-family: sans-serif;">${projectview.projectName}</span>
					<span id="btn-apply-pass" style="margin-top: 14px; font-size: 11px; font-weight: bold; color: rgba(121,7,131,0.5); margin-left: 8px; font-family: sans-serif; cursor: pointer;"><i class="fa fa-search" aria-hidden="true"></i> 지원자 : <span style="color: #EA00AA; font-weight: 500;">${projectPassCount}</span> 명</span>
					<span class="pull-right" style="margin-top: 14px; font-size: 11px; color: #A0A0A0;">조회수 : ${projectview.projectViews}</span>
					<span class="pull-right" style="margin-top: 14px; font-size: 11px; color: red; margin-right: 40px;"><img alt="하트" width="16px" src="${pageContext.request.contextPath}/resources/img/like1.png"> 좋아요 3</span>
				</div>
				
			</div>
			
			
			<div class="project-view-main">
				
				<input type="hidden" value="${projectview.projectNO}" id="hidden-projectNO" name="projectNO">
				<input type="hidden" value="${user.userNO}" id="hidden-userNO" name="userNO">

				<div class="project-image-box">
					<img src="<c:url value='/project/projectImageGet?projectNO=${projectview.projectNO}' />" alt="사진" width="1000px" height="500px" style="margin-top: 10px; object-fit: fill;">
				</div>
				
				<form action="<c:url value='/project/projectApply' />" method="post" name="projectApplyForm">
					<input type="hidden" value="${projectview.projectNO}" id="hidden-project-no" name="projectNO">
					<input type="hidden" value="${user.userNO}" id="hidden-user-no" name="userNO">
				</form>
				
				<table class="table table-bordered" style="margin-top: 10px; font-size: 14px; font-family: sans-serif; border-collapse: unset; border-spacing: 0;">
					<tr>
						<td style="width: 12%; text-align: center; font-weight: 700; background: #EBF3ED;">프로젝트 명</td>
						<td style="width: 38%;">${projectview.projectName}</td>
						<td style="width: 12%; text-align: center; font-weight: 700; background: #EBF3ED;">프로젝트 기간</td>
						<td style="width: 38%;">
							<c:set var="date1" value="${projectview.projectRequireDate1}" />
				      		<c:set var="date2" value="${projectview.projectRequireDate2}" />
				        	${fn:substring(date1, 0, 10)} &nbsp; ~ &nbsp; ${fn:substring(date2, 0, 10)}
				        </td>
					</tr>
					<tr>
						<td style="width: 13%; text-align: center; font-weight: 700; background: #EBF3ED;">협력사</td>
						<td style="width: 37%;">${projectview.companyName}</td>
						<td style="width: 13%; text-align: center; font-weight: 700; background: #EBF3ED;">협력사 전화번호</td>
						<td style="width: 37%;">${projectview.companyPhone1} - ${projectview.companyPhone2} - ${projectview.companyPhone3}</td>
					</tr>
					<tr>
						<td style="width: 13%; text-align: center; font-weight: 700; background: #EBF3ED;">협력사 위치</td>
						<td colspan="3" style="width: 85%;">
							<input type="hidden" value="${projectview.companyAddress1}" id="address-no">
							${projectview.companyAddress2} ${projectview.companyAddress3}
							
				      		<a href="project-map.html" onclick="window.open(this.href, '_blank', 'width=600px, height=400px,toolbars=no,scrollbars=no'); return false;">
				        		<button type="button" class="btn btn-primary pull-right" style="display: inline; margin-top: -8px; margin-bottom: -8px; margin-right: -8px; height: 37px; width: 120px; border-radius: 0;">지도</button>
				         	</a>
						</td>
					</tr>
					<tr>
						<td style="width: 13%; text-align: center; font-weight: 700; background: #EBF3ED;">프로젝트 설명</td>
						<td colspan="3" style="width: 85%; height: 340px;">
							<c:set var="desc" value="${projectview.projectDesc}" />
							${fn:replace(desc, replaceChar, "<br/>")}
						</td>
					</tr>
					<tr>
						<td style="width: 13%; text-align: center; font-weight: 700; background: #EBF3ED;">모집 역할</td>
						<td style="width: 37%;">${projectview.projectRequireRole}</td>
						<td style="width: 13%; text-align: center; font-weight: 700; background: #EBF3ED;">모집 인원</td>
						<td style="width: 37%;">${projectview.projectRequirePeople}</td>
					</tr>
					<tr>
						<td style="width: 13%; text-align: center; font-weight: 700; background: #EBF3ED;">지원 자격</td>
						<td colspan="3" style="width: 85%; height: 120px;">
							<c:set var="License" value="${projectview.projectRequireLicense}" />
				       		${fn:replace(License, replaceChar, "<br/>")}
						</td>
					</tr>
					<tr>
						<td style="width: 13%; text-align: center; font-weight: 700; background: #EBF3ED;">담당자</td>
						<td style="width: 37%;">${projectview.projectManager}</td>
						<td style="width: 13%; text-align: center; font-weight: 700; background: #EBF3ED;">담당자 전화번호</td>
						<td style="width: 37%;">${projectview.projectManagerPhone}</td>
					</tr>
					<tr>
						<td style="width: 13%; text-align: center; font-weight: 700; background: #EBF3ED;">담당자 이메일</td>
						<td colspan="3" style="width: 85%;">${projectview.projectManagerEmail}</td>
					</tr>
				</table>
			
			</div>
			
			
			<div class="project-view-footer">
				<div class="singo" style="display: inline; font-size: 12px; line-height: 2.6em;">
				    <a href="#" id="singo-modal" style="color: #808080;">신고하기</a>
				</div>
			
				<div class="pull-right">
				
					<c:choose>
			      	
			      		<c:when test="${apply.commonCODE == 'SPT001'}">
			      			<button type="button" id="btn-apply-spt001-2" class="btn" style="background: #4F5199; color: white;">지원 취소</button>
			      		</c:when>
			      	
			      		<c:when test="${apply.commonCODE == 'SPT002'}">
			      			<button type="button" id="btn-apply-spt002-2" class="btn" disabled style="background: #74733D; color: white;">심사 진행 중</button>
			      		</c:when>
			      		
			      		<c:when test="${apply.commonCODE == 'SPT003'}">
			      			<button type="button" id="btn-apply-spt003-2" class="btn" disabled style="background: #585BCD; color: white;">최종 합격 검토 중</button>
			      		</c:when>
			      		
			      		<c:when test="${apply.commonCODE == 'SPT004'}">
			      			<button type="button" id="btn-apply-spt004-2" class="btn" disabled style="background: #0095AA; color: white;">최종 합격</button>
			      		</c:when>
			      		
			      		<c:when test="${apply.commonCODE == 'SPT005'}">
			      			<button type="button" id="btn-apply-spt005-2" class="btn" disabled style="background: #c7c7c7;">불합격</button>
			      		</c:when>
			      		
			      		<c:when test="${companyNO != null}">
			      			<button type="button" id="jiwon-btn" class="btn btn-success" disabled>지원하기</button>
			      		</c:when>
			      		
			      		<c:when test="${projectview.commonCODE == 'PST003'}">
			      			<button type="button" id="btn-end" class="btn" style="background: #808080; color: white;" disabled>지원종료</button>
			      		</c:when>
			      		
			      		<c:otherwise>
			      			<button type="button" id="jiwon-btn" class="btn btn-success">지원하기</button>
			      		</c:otherwise>
			      	
			      	</c:choose>
				
					<button type="button" id="mokrok-btn" class="btn btn-primary">목록</button>
				</div>
			</div>
    
		</div>
 
 	<%@ include file="modal-pass-list.jsp" %>
	<%@ include file="../include/footer.jsp" %>
	
	</div>

</body>
</html>
<script>

	//특정 메시지 표현을 위한 스크립트
	const msg = '${msg}';
	
	if(msg != '') {
		alert(msg);
	}
	
	$(function() {
		
		// 목록 버튼 클릭 시
		$('#mokrok-btn').click(function() {
			location.href='<c:url value="/project/project" />';
		});
		
	
		// 지원하기 윗 버튼 클릭 시
		$('#jiwon-btn').click(function() {
			document.projectApplyForm.submit();
		});
	
		
		// 지원하기 밑 버튼 클릭 시
		$('#jiwon-btn1').click(function() {
			document.projectApplyForm.submit();
		});
		
		
		// 지원 취소 버튼 클릭 시
		$('#btn-apply-spt001').click(function() {
			
			if(confirm('지원을 취소하시겠습니까?')) {
				
				const userNO = $('#hidden-userNO').val();
				const projectNO = $('#hidden-projectNO').val();
	
				$.ajax({
					type: 'POST',
					url: '<c:url value="/project/applyCancel" />',
					
					dataType: 'text',
					data: {
						'userNO': userNO,
						'projectNO': projectNO
					},
					
					success: function(result) {
						if(result == 'YesApplyCancel') {
							alert('지원이 취소되었습니다.');
							location.replace('<c:url value="/project/projectview?projectNO=" />' + projectNO);
						} else {
							alert('지원 취소 중 오류가 발생했습니다.');
							return;
						}
					},
					
					error: function() {
						alert('지원 취소 중 서버오류가 발생했습니다.');
						return;
					}
				});
				
			} else {
				return false;
			}
			
		});
		
		
		// 지원 취소 버튼 클릭 시
		$('#btn-apply-spt001-2').click(function() {
			
			if(confirm('지원을 취소하시겠습니까?')) {
				
				const userNO = $('#hidden-userNO').val();
				const projectNO = $('#hidden-projectNO').val();
	
				$.ajax({
					type: 'POST',
					url: '<c:url value="/project/applyCancel" />',
					
					dataType: 'text',
					data: {
						'userNO': userNO,
						'projectNO': projectNO
					},
					
					success: function(result) {
						if(result == 'YesApplyCancel') {
							alert('지원이 취소되었습니다.');
							location.replace('<c:url value="/project/projectview?projectNO=" />' + projectNO);
						} else {
							alert('지원 취소 중 오류가 발생했습니다.');
							return;
						}
					},
					
					error: function() {
						alert('지원 취소 중 서버오류가 발생했습니다.');
						return;
					}
				});
				
			} else {
				return false;
			}
			
		});
		
		
		// 합격자 돋보기 클릭 시
		$('#btn-apply-pass').click(function() {
			
			let strAdd = '';
			
			const companyName = '${projectview.companyName}';
			const projectName = '${projectview.projectName}';
			const passCount = '${projectPassCount}';
			
			const projectNO = $('#hidden-projectNO').val();
			
			console.log(projectNO);
			
			$('#span-company-name').text(companyName);
			$('#h5-project-name').text(projectName);
			$('#span-pass-count').text(passCount);
			
			
			$.ajax({
				type: 'POST',
				url: '<c:url value="/project/projectPassList/" />' + projectNO,
		
				dataType: 'json',
				
				success: function(result) {
					
					let passList = result.projectPassList;
					
					if(passList == '') {
						strAdd +=
	    					`<tr style="font-size: 12px;">
	    						<td colspan="5" style="text-align: center;">아직 지원자가 없습니다.</td>
							</tr>`;
					} else {
						for(let i = 0; i < passList.length; i++) {
							
							var timestamp = passList[i].applyDate;
							var date = new Date(timestamp).toISOString().replace("T", " ").replace(/\..*/, '');
							
							if(passList[i].commonCODE == 'SPT001') {
								strAdd +=
									`<tr style="font-size: 12px;">
			    						<td>` + passList[i].applyNum + `</td>
			    						<td>` + passList[i].userID + `</td>
			    						<td>` + passList[i].userName + `</td>
			    						<td>` + date + `</td>
			    						<td style="font-weight: bold; color: #700073;">` + passList[i].commonValue + `</td>
									</tr>`;
							} else if(passList[i].commonCODE == 'SPT002') {
								strAdd +=
									`<tr style="font-size: 12px;">
			    						<td>` + passList[i].applyNum + `</td>
			    						<td>` + passList[i].userID + `</td>
			    						<td>` + passList[i].userName + `</td>
			    						<td>` + date + `</td>
			    						<td style="font-weight: bold; color: #097500;">` + passList[i].commonValue + `</td>
									</tr>`;
							} else if(passList[i].commonCODE == 'SPT003') {
								strAdd +=
									`<tr style="font-size: 12px;">
			    						<td>` + passList[i].applyNum + `</td>
			    						<td>` + passList[i].userID + `</td>
			    						<td>` + passList[i].userName + `</td>
			    						<td>` + date + `</td>
			    						<td style="font-weight: bold; color: #712D04;">` + passList[i].commonValue + `</td>
									</tr>`;
							} else if(passList[i].commonCODE == 'SPT004') {
								strAdd +=
									`<tr style="font-size: 12px;">
			    						<td>` + passList[i].applyNum + `</td>
			    						<td>` + passList[i].userID + `</td>
			    						<td>` + passList[i].userName + `</td>
			    						<td>` + date + `</td>
			    						<td style="font-weight: bold; color: blue;">` + passList[i].commonValue + `</td>
									</tr>`;
							} else {
								strAdd +=
									`<tr style="font-size: 12px;">
			    						<td>` + passList[i].applyNum + `</td>
			    						<td>` + passList[i].userID + `</td>
			    						<td>` + passList[i].userName + `</td>
			    						<td>` + date + `</td>
			    						<td style="font-weight: bold; color: red;">` + passList[i].commonValue + `</td>
									</tr>`;
							}

						}
					}
					
					$('#modalPassList').html(strAdd);
				},
				
				error: function() {
					alert('합격자 목록을 불러오는 중 서버오류가 발생했습니다.');
					return;
				}
			});
			
			
			$('#modal-pass-list').modal('show');
			
		});
		
	});

</script> 
                 






