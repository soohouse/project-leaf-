<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>


<html>
<head>

   <meta charset="UTF-8">

   <title>오신것을 환영합니다</title>
   
   <!-- jQuery -->
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   
   <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
   <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
   
   <!-- 합쳐지고 최소화된 최신 CSS -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
   
   <!-- 개인 디자인 추가, ?after를 붙이면 기존에 동일한 이름의 파일을 인식하는것이 아닌 새로운 파일을 인식하게 된다. -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainstyle.css">
   
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/project-list.css">
   
   <!-- 여기다가 나만의 새로운 css 만들기 -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainpage-style.css">

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
   
</head>
<body>

<%@ include file="../include/header.jsp" %>
	   
	<div class="mainbox">
	
		<div class="sections">

			<a href="#" class="list-group-item active notice-list-top" style="margin-top: 20px;"> 
				<span class="main-board-title" style="color: #215C69;">내 프로젝트 지원자 현황</span>
			</a>

			<form class="navbar-form navbar-left navbar-main-top pull-left" role="search" style="padding: 0; margin-left: 0;">
				<select class="form-control" name="condition" style="height: 30px; font-size: 13px;">
                            <option value="project-name">프로젝트 이름</option>
                </select>
			
				<div class="input-group"> 
					<input type="text" class="form-control" placeholder="검색어를 입력하세요" style="height: 30px; font-size: 13px;">
					<span class="input-group-btn">
						<button class="btn btn-default" type="submit" style="height: 30px; background: #d3d3d3; font-size: 13px;">검색</button>
					</span>
				</div>
			</form>
			
			<form class="navbar-form navbar-left navbar-main-top pull-right" role="search" style="padding: 0; margin-left: 0;">
				<div class="input-group"> 
					<span class="input-group-btn">
						<button id="btn-apply-check" class="btn btn-success" type="button" style="height: 30px; font-size: 13px;">버튼</button>
					</span>
				</div>
			</form>

			<div class="project-myproject-apply" style="clear: both;">
				
				<br>
				<p style="font-size: 14px; font-weight: bold; margin-top: 20px; margin-left: 16px; margin-bottom: -10px;">등록한 내 프로젝트<span style="color: red;">&nbsp;&nbsp;${myProjectCount}</span></p>
				<hr>
				
				
				
				<c:forEach var="myProject" items="${myProjectStatus}" varStatus="index">
				
					<div class="project-list" style="margin-left: 0; width: 100%; border: 1px solid #C7C7C7;">
			          <div class="project-list-col-md-8" >
			            <div class="project-listbox">
			              <div class="image-intro"> 
			                <a href="#"><img src="<c:url value='/project/projectImageGet?projectNO=${myProject.projectNO}' />" alt="사진" style="width: 200px; height: 100px; object-fit: cover; vertical-align: text-bottom; margin-left: 20px; margin-top: 16px;"></a>
			                </div>
			              <div class="project-form" style="margin-left: 30px;">
			                <div class="project-title" id="" style="cursor: pointer;">
			                  <p style="width: 400px;" >${myProject.projectName}</p>
			                  <input type="hidden" value="${myProject.projectNO}" id="hidden-project-no${index.index}">
			                </div >
			                <div class="project-content1">
			                  <p style="width: 400px;">${myProject.projectRequireRole}</p>
			                </div>
			                <div class="project-date">
			                  <p style="font-size: 12px;"><fmt:formatDate value="${myProject.projectRequireDate1}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${myProject.projectRequireDate2}" pattern="yyyy-MM-dd" /></p>
			                </div>
			              </div>
			              <div class="project-source">
			                <div class="project-content" style="position: relative; left: 180px;">
			                  <p style="font-size: 14px;">${myProject.companyName}</p>
			                </div>
			              </div>
			              <div class="project-in" style="position: relative; right: 10px;">
			                <div class="project-container-right">
			                  <button type="button" class="btn btn-success" id="btn-project-apply-list${index.index}">지원자 목록</button>
			                </div><br>
			                <a href="#" style="position: relative; top: 10px;"><span>${myProject.applyCount}</span>명</a>
			              </div>
			            </div>
			          </div>
			        </div>
				
					<%@ include file="modal-apply-list.jsp" %>
					<%@ include file="modal-apply-detail.jsp" %>
					
					<script>
					
						$('#btn-project-apply-list${index.index}').click(function() {
							
							let projectNO = $('#hidden-project-no${index.index}').val();
							let strAdd = '';
							
							$.ajax({
								type: 'POST',
								url: '<c:url value="/project/projectMyApply/" />' + projectNO,
								
								dataType: 'json',
								
								success: function(result) {
									
									let applyList = result.myProjectApplyList;
			    					let applyCount = result.myProjectApplyCount;
			    					
			    					if(applyList == '') {    							
		    							strAdd +=
					    					`<tr id="" style="cursor: pointer; font-size: 12px;">
					    						<td colspan="6" style="text-align: center;">해당 프로젝트에는 지원자가 없습니다.</td>
											</tr>`;
			    					} else {
			    						for(let i = 0; i < applyList.length; i++) {

				    						var timestamp = applyList[i].applyDate;
											var date = new Date(timestamp).toISOString().split("T", 1);
											
											if(applyList[i].commonCODE == 'SPT001') {
												strAdd +=
							    					`<tr id="tr-project-apply-detail` + i + `" style="cursor: pointer; font-size: 12px;">
														<td value="` + applyList[i].userNO + `" data-value="` + projectNO + `">` + applyList[i].applyNum + `</td>
														<td value="` + applyList[i].userNO + `" data-value="` + projectNO + `">` + applyList[i].userID + `</td>
														<td value="` + applyList[i].userNO + `" data-value="` + projectNO + `">` + applyList[i].userName + `</td>
														<td value="` + applyList[i].userNO + `" data-value="` + projectNO + `">` + applyList[i].userPhone + `</td>
														<td value="` + applyList[i].userNO + `" data-value="` + projectNO + `">` + date + `</td>
														<td value="` + applyList[i].userNO + `" data-value="` + projectNO + `" style="font-weight: bold; color: #700073;">` + applyList[i].commonValue + `</td>
													</tr>`;
											} else if(applyList[i].commonCODE == 'SPT002') {
												strAdd +=
							    					`<tr id="tr-project-apply-detail` + i + `" style="cursor: pointer; font-size: 12px;">
														<td value="` + applyList[i].userNO + `" data-value="` + projectNO + `">` + applyList[i].applyNum + `</td>
														<td value="` + applyList[i].userNO + `" data-value="` + projectNO + `">` + applyList[i].userID + `</td>
														<td value="` + applyList[i].userNO + `" data-value="` + projectNO + `">` + applyList[i].userName + `</td>
														<td value="` + applyList[i].userNO + `" data-value="` + projectNO + `">` + applyList[i].userPhone + `</td>
														<td value="` + applyList[i].userNO + `" data-value="` + projectNO + `">` + date + `</td>
														<td value="` + applyList[i].userNO + `" data-value="` + projectNO + `" style="font-weight: bold; color: #097500;">` + applyList[i].commonValue + `</td>
													</tr>`;
											} else if(applyList[i].commonCODE == 'SPT003') {
												strAdd +=
							    					`<tr id="tr-project-apply-detail` + i + `" style="cursor: pointer; font-size: 12px;">
														<td value="` + applyList[i].userNO + `" data-value="` + projectNO + `">` + applyList[i].applyNum + `</td>
														<td value="` + applyList[i].userNO + `" data-value="` + projectNO + `">` + applyList[i].userID + `</td>
														<td value="` + applyList[i].userNO + `" data-value="` + projectNO + `">` + applyList[i].userName + `</td>
														<td value="` + applyList[i].userNO + `" data-value="` + projectNO + `">` + applyList[i].userPhone + `</td>
														<td value="` + applyList[i].userNO + `" data-value="` + projectNO + `">` + date + `</td>
														<td value="` + applyList[i].userNO + `" data-value="` + projectNO + `" style="font-weight: bold; color: #712D04;">` + applyList[i].commonValue + `</td>
													</tr>`;
											} else if(applyList[i].commonCODE == 'SPT004') {
												strAdd +=
							    					`<tr id="tr-project-apply-detail` + i + `" style="cursor: pointer; font-size: 12px;">
														<td value="` + applyList[i].userNO + `" data-value="` + projectNO + `">` + applyList[i].applyNum + `</td>
														<td value="` + applyList[i].userNO + `" data-value="` + projectNO + `">` + applyList[i].userID + `</td>
														<td value="` + applyList[i].userNO + `" data-value="` + projectNO + `">` + applyList[i].userName + `</td>
														<td value="` + applyList[i].userNO + `" data-value="` + projectNO + `">` + applyList[i].userPhone + `</td>
														<td value="` + applyList[i].userNO + `" data-value="` + projectNO + `">` + date + `</td>
														<td value="` + applyList[i].userNO + `" data-value="` + projectNO + `" style="font-weight: bold; color: blue;">` + applyList[i].commonValue + `</td>
													</tr>`;
											} else {
												strAdd +=
							    					`<tr id="tr-project-apply-detail` + i + `" style="cursor: pointer; font-size: 12px;">
														<td value="` + applyList[i].userNO + `" data-value="` + projectNO + `">` + applyList[i].applyNum + `</td>
														<td value="` + applyList[i].userNO + `" data-value="` + projectNO + `">` + applyList[i].userID + `</td>
														<td value="` + applyList[i].userNO + `" data-value="` + projectNO + `">` + applyList[i].userName + `</td>
														<td value="` + applyList[i].userNO + `" data-value="` + projectNO + `">` + applyList[i].userPhone + `</td>
														<td value="` + applyList[i].userNO + `" data-value="` + projectNO + `">` + date + `</td>
														<td value="` + applyList[i].userNO + `" data-value="` + projectNO + `" style="font-weight: bold; color: red;">` + applyList[i].commonValue + `</td>
													</tr>`;
											}
				    					}
			    					}
			 						
			    					$('#span-apply-count').text(applyCount);
			    					$('#modalApplyList').html(strAdd);
								},
								
								error: function() {
									alert('프로젝트 지원자 목록을 불러오는 중 서버오류가 발생했습니다.');
									return;
								}
							});
							
							$('#modal-apply-list').modal('show');
						});
						
					</script>
				
				</c:forEach>
				
			</div>

		</div>
	
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
	
	
	// 지원자 목록 하나를 클릭하면 해당되는 지원자의 상세보기 모달창을 띄운다.
	$('#modal-apply-list').on('click', 'td', function(e) {
		
		const userNO = e.target.getAttribute('value');
		const projectNO = e.target.getAttribute('data-value');
		
		if(userNO == null) {
			alert('해당 프로젝트에는 지원자가 없습니다.');
			return;
		} else {
			$.ajax({
				type: 'POST',
				url: '<c:url value="/project/projectMyApplyDetail" />',
				
				data: {
					'userNO': userNO,
					'projectNO': projectNO
				},
				dataType: 'json',
				
				success: function(apply) {

					$('#modal-user-profile').attr('src', '<c:url value="/user/userProfileGet?userNO=" />' + apply.userNO);
					
					$('#hidden-apply-no').val(apply.applyNO);
					$('#hidden-user-no').val(apply.userNO);
					
					$('#modal-main-user-id').text(apply.userID);
					$('#modal-main-user-name').text(apply.userName);
					
					$('#modal-user-id').text(apply.userID);
					$('#modal-user-name').text(apply.userName);
					$('#modal-user-phone').text(apply.userPhone);
					$('#modal-user-email').text(apply.userEmail);
					
					if(apply.userIntro == null || apply.userIntro == '') {
						$('#modal-user-intro').text('');
					} else {
						$('#modal-user-intro').text(apply.userIntro);
					}
					
					if(apply.resumeRealname == null || apply.resumeRealname == '') {
						$('#modal-user-resume-realname').text('');
					} else {
						$('#modal-user-resume-realname').text(apply.resumeRealname);
					}
					
					if(apply.commonCODE == 'SPT001') {
						$('#modal-user-common-value').css({'font-weight': 'bold', 'color': '#700073'});
						$('#modal-user-common-value').text(apply.commonValue);
						$('#btn-modal-apply-accept-1').css('display', 'inline-block');
						$('#btn-modal-apply-accept-2').css('display', 'none');
						$('#btn-modal-apply-accept-yes').css('display', 'none');
					} else if(apply.commonCODE == 'SPT002') {
						$('#modal-user-common-value').css({'font-weight': 'bold', 'color': '#097500'});
						$('#modal-user-common-value').text(apply.commonValue);
						$('#btn-modal-apply-accept-1').css('display', 'none');
						$('#btn-modal-apply-accept-2').css('display', 'inline-block');
						$('#btn-modal-apply-accept-yes').css('display', 'none');
					} else if(apply.commonCODE == 'SPT003') {
						$('#modal-user-common-value').css({'font-weight': 'bold', 'color': '#712D04'});
						$('#modal-user-common-value').text(apply.commonValue);
						$('#btn-modal-apply-accept-1').css('display', 'none');
						$('#btn-modal-apply-accept-2').css('display', 'none');
						$('#btn-modal-apply-accept-yes').css('display', 'inline-block');
					} else if(apply.commonCODE == 'SPT004') {
						$('#modal-user-common-value').css({'font-weight': 'bold', 'color': 'blue'});
						$('#modal-user-common-value').text(apply.commonValue);
						$('#btn-modal-apply-accept-1').css('display', 'none');
						$('#btn-modal-apply-accept-2').css('display', 'none');
						$('#btn-modal-apply-accept-yes').css('display', 'none');
					} else {
						$('#hidden-apply-no').val(apply.applyNO);
						$('#modal-user-common-value').css({'font-weight': 'bold', 'color': 'red'});
						$('#modal-user-common-value').text(apply.commonValue);
						$('#btn-modal-apply-accept-1').css('display', 'none');
						$('#btn-modal-apply-accept-2').css('display', 'none');
						$('#btn-modal-apply-accept-yes').css('display', 'none');
					}	
					
					$('#modal-user-apply-msg').empty().append(apply.applyMsg);
					
					$('#modal-apply-detail').modal('show');
				},
				
				error: function() {
					alert('지원자 상세보기를 불러오는 중 서버오류가 발생했습니다.');
					return;
				}
			});
		}
	});

</script>
