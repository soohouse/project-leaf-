<%--<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/project-view-fix.css">

   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainpage-style.css">
  
  
  <style type="text/css">
  
  
  </style>


</head>
<body>

<%@ include file="../include/header.jsp" %>
	   
	   
<div class="container">
  
  <div id="main-box">
   
   
    <div class="first-box">
      <p>(주) 성진하이텍</p>
    </div> <br>
    <div class="container-top-icons">
      <div class="project-name">
      	<input type="text" value="${projectview.projectName}" name="projectName">
      </div>
      <div class="project-user">
        <p>신청자 : 3명 </p>
      </div>
      <div class="project-heart">
      <input type="hidden" value=""${projectLike.projectLikeNO} name="projectLikeNO">
       <a href="##"><i class="glyphicon glyphicon-thumbs-up"></i>좋아요</a>
      </div>
      <div class="project-seen">
        <p>조회수 : 12</p>
      </div>
      <div class="project-jiwon">
        <label>
          <input type="checkbox"> <i style="color: red;">마감 임박</i>
        </label>
        <label>
          <input type="checkbox"> <i style="color: green;">현재 모집중</i>
        </label>
      </div>
    </div>
  </div>
  
  <form action="<c:url value='/project/projectviewfix'/>"  method="post" name="projectUpdateForm">
  
  <div class="project-img-box">
    <div class="image-intro"> 
      <img src="../resources/img/main4.jpg" alt="사진">
      </div> <br>
      <div class="project-myeng">
        	프로젝트 명
        <input type="hidden" value="${projectview.projectNO}" id="hidden-project-no" name="projectNO">
      </div>
      <div class="project-myeng1">
        <p><input type="text" id="project-myeng1" value="${projectview.projectName}" name="projectName" style="width: 335px;"></p>
      </div>
      <div class="project-dt">
     		프로젝트 기간
      </div>
      <div class="project-dt1">
       <label for="exampleInputdate"></label>
                <input type="date" class="form-control" id="project-date1" placeholder="0000/00/00" style="height: 21px; padding-bottom: 5px;">
              <div class="date12">
                ~
              </div>
                <input type="date" class="form-control" id="project-date2" placeholder="0000/00/00" style="height: 21px; padding-bottom: 5px;">
      	<!--<c:set var="date1" value="${projectview.projectRequireDate1}" />
      	<c:set var="date2" value="${projectview.projectRequireDate2}" />
        <p>${fn:substring(date1, 0, 10)} ~ ${fn:substring(date2, 0, 10)}</p>-->
      </div>
      <div class="project-friend">
       		협력사 
      </div>
      <div class="project-friend1">
        <p>${projectview.companyName}</p> 
      </div>
      <div class="project-phone">
       		협력사 전화번호 
      </div>
      <div class="project-phone1">
        <p>${projectview.companyPhone1} - ${projectview.companyPhone2} - ${projectview.companyPhone3}</p> 
      </div>
      <div class="project-fr-lo">
        	협력사 위치 
      </div>
      <div class="project-fr-lo1">
        <p>${projectview.companyAddress1} ${projectview.companyAddress2} ${projectview.companyAddress3}</p> 
      </div>
      <div class="project-container-right">
      <a href="project-map.html" onclick="window.open(this.href, '_blank', 'width=600px, height=400px,toolbars=no,scrollbars=no'); return false;">
        <button type="button" class="btn btn-primary">
          	지도
          </button>
          </a>
        
      </div> <br>
      
      
      
      <div class="project-int">
        	프로젝트 설명 
      </div>
      <div class="project-int1">
       <p><input type="text" id="project-int1" value="${projectview.projectDesc}" name="projectDesc" style="width: 750px; height: 240px;">
        </p>
      </div>
        <div class="damdang-master">
          <div class="damdang">
           	담당자 
          </div>
          <div class="damdang1">
            <p><input type="text" id="damdang1" value="${projectview.projectManager}" name="projectManager" style="width: 335px;"></p> 
          </div>
          <div class="damdang-phone">
           	담당자 번호 
          </div>
          <div class="damdang-phone1">
           <p><input type="text" id="damdang-phone1" value="${projectview.projectManagerPhone}" name="projectManagerPhone" style="width: 335px;"></p> 
          </div>
      </div>
      <div class="damdang-email">
        	담당자 이메일 
      </div>
      <div class="damdang-email1">
        <p><input type="text" id="damdang-email1" value="${projectview.projectManagerEmail}" name="projectManagerEmail" style="width: 750px;"></p> 
      </div>
      <div class="skills">
        	지원 자격
      </div>
      <div class="skills1">
        <p>
          <input type="text" id="skills1" value="${projectview.projectRequireLicense}" name="projectRequireLicense" style="width: 750px; height: 78px;">
        </p>
      </div>
      <div class="mojib-master">
        <div class="mojib">
          	모집 역할
        </div>
        <div class="mojib1">
         <p><input type="text" id="mojib1" value="${projectview.projectRequireRole}" name="projectRequireRole" style="width: 335px;"></p> 
        </div>
        <div class="mojib-user">
          	모집 인원
        </div>
        <div class="mojib-user1">
          <p>
            <input type="text" id="mojib-user1" value="${projectview.projectRequirePeople}" name="projectRequirePeople" style="width: 335px;">
          </p>
        </div>
      </div> <br>
      <div class="below-but">
      <div class="singo">
        <a href="#" id="singo-modal">신고하기</a>
      </div>
      <div class="project-container-bottom">
        <button type="button" id="btn-project-content-update" class="btn btn-success" value="수정완료">수정하기</button>
        <button type="button" id="mokrok-btn" class="btn btn-danger">돌아가기</button>
      </div>
      </div>
    </div>

    
    </form>
 
	<%@ include file="../include/footer.jsp" %>
</div>


</body>
</html>
<script>
$(function() {
	
	
	$('#mokrok-btn').click(function() {
		location.href='<c:url value="/project/projectadmin" />';
	});
	
	
	
	//수정완료 버튼 클릭 시 
	$('#btn-project-content-update').click(function() {
			
			// 이름 입력 여부 체크
			if($('#project-myeng1').val() == '') {
				alert('이름을 입력해주세요.');				
				$('#project-myeng1').focus();
				return;
			}
			
			//프로젝트 기간 입력 여부 체크
			if($('#project-date1').val() == '') {
				alert('날짜를 입력해주세요.');				
				$('#project-date1').focus();
				return;
			}
			
			//프로젝트 기간 입력 여부 체크
			if($('#project-date2').val() == '') {
				alert('날짜를 입력해주세요.');				
				$('#project-date2').focus();
				return;
			}

			//프로젝트 설명 입력 여부 체크
			if($('#project-int1').val() == '') {
				alert('설명을 입력해주세요.');				
				$('#project-int1').focus();
				return;
			}

			//프로젝트 담당자이름 입력 여부 체크
			if($('#damdang1').val() == '') {
				alert('담당자 이름을 입력해주세요.');				
				$('#damdang1').focus();
				return;
			}

			//프로젝트 전화번호 입력 여부 체크
			if($('#damdang-phone1').val() == '') {
				alert('날짜를 입력해주세요.');				
				$('#damdang-phone1').focus();
				return;
			}

			//프로젝트 이메일 입력 여부 체크
			if($('#damdang-email1').val() == '') {
				alert('날짜를 입력해주세요.');				
				$('#damdang-email1').focus();
				return;
			}
			
			
			
			document.projectUpdateForm.submit();
			
	});
});





</script> 
                 

 --%>
 
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
			      			<button type="button" id="btn-apply-spt003" class="btn pull-right" disabled style="background: #585BCD; color: white; margin-top: -8px;">최종합격 검토 중</button>
			      		</c:when>
			      		
			      		<c:when test="${apply.commonCODE == 'SPT004'}">
			      			<button type="button" id="btn-apply-spt004" class="btn pull-right" disabled style="background: #0095AA; color: white; margin-top: -8px;">참여중</button>
			      		</c:when>
			      		
			      		<c:when test="${apply.commonCODE == 'SPT005'}">
			      			<button type="button" id="btn-apply-spt005" class="btn pull-right" disabled style="background: #c7c7c7; margin-top: -8px;">불합격</button>
			      		</c:when>
			      		
			      		<%--<c:when test="${companyNO != null}">
			      			<button type="button" id="jiwon-btn1" class="btn pull-right btn-success" style="margin-top: -8px;" disabled>지원하기</button>
			      		</c:when>
			      		
			      		<c:otherwise>
			      			<button type="button" id="jiwon-btn1" class="btn pull-right btn-success" style="margin-top: -8px;">지원하기</button>
			      		</c:otherwise> --%>
			      	
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
				
				<form action="<c:url value='/project/projectUpdate' />" method="post" name="projectUpdateForm">
					<input type="hidden" value="${projectview.projectNO}" id="hidden-project-no" name="projectNO">
					<input type="hidden" value="${user.userNO}" id="hidden-user-no" name="userNO">
				</form>
				
				<table class="table table-bordered" style="margin-top: 10px; font-size: 14px; font-family: sans-serif; border-collapse: unset; border-spacing: 0;">
					<tr>
						<td style="width: 12%; text-align: center; font-weight: 700; background: #EBF3ED;">프로젝트 명</td>
						<td style="width: 38%; background-color: #EEEEEE;">${projectview.projectName}</td>
						<td style="width: 12%; text-align: center; font-weight: 700; background: #EBF3ED;">프로젝트 기간</td>
						<td style="width: 38%; background-color: #EEEEEE;">
							<c:set var="date1" value="${projectview.projectRequireDate1}" />
				      		<c:set var="date2" value="${projectview.projectRequireDate2}" />
				        	${fn:substring(date1, 0, 10)} &nbsp; ~ &nbsp; ${fn:substring(date2, 0, 10)}
				        </td>
					</tr>
					<tr>
						<td style="width: 13%; text-align: center; font-weight: 700; background: #EBF3ED;">협력사</td>
						<td style="width: 37%; background-color: #EEEEEE;">${projectview.companyName}</td>
						<td style="width: 13%; text-align: center; font-weight: 700; background: #EBF3ED;">협력사 전화번호</td>
						<td style="width: 37%; background-color: #EEEEEE;">${projectview.companyPhone1} - ${projectview.companyPhone2} - ${projectview.companyPhone3}</td>
					</tr>
					<tr>
						<td style="width: 13%; text-align: center; font-weight: 700; background: #EBF3ED;">협력사 위치</td>
						<td colspan="3" style="width: 85%; background-color: #EEEEEE;">
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
							<!-- <input type="text" style="width: 100%; height: 100%;" name="projectDesc" value="${projectview.projectDesc}"/>  -->
							<textarea style="width: 100%; height: 100%; resize: none;" name="projectDesc">${projectview.projectDesc}</textarea>
						</td>
					</tr>
					<tr>
						<td style="width: 13%; text-align: center; font-weight: 700; background: #EBF3ED;">담당자</td>
						<td style="width: 37%;"><input type="text" value="${projectview.projectManager}" name="projectManager" style="width: 100%;"/></td>
						<td style="width: 13%; text-align: center; font-weight: 700; background: #EBF3ED;">담당자 전화번호</td>
						<td style="width: 37%;"><input type="text" value="${projectview.projectManagerPhone}" name="projectManagerPhone" style="width: 100%;"/></td>
					</tr>
					<tr>
						<td style="width: 13%; text-align: center; font-weight: 700; background: #EBF3ED;">담당자 이메일</td>
						<td colspan="3" style="width: 85%;"><input type="text" value="${projectview.projectManagerEmail}" name="projectManagerEmail" style="width: 50%;"/></td>
					</tr>
					<tr>
						<td style="width: 13%; text-align: center; font-weight: 700; background: #EBF3ED;">지원 자격</td>
						<td colspan="3" style="width: 85%; height: 120px; background-color: #EEEEEE;">
							<c:set var="License" value="${projectview.projectRequireLicense}" />
				       		${fn:replace(License, replaceChar, "<br/>")}
						</td>
					</tr>
					<tr>
						<td style="width: 13%; text-align: center; font-weight: 700; background: #EBF3ED;">모집 역할</td>
						<td style="width: 37%; background-color: #EEEEEE;">${projectview.projectRequireRole}</td>
						<td style="width: 13%; text-align: center; font-weight: 700; background: #EBF3ED;">모집 인원</td>
						<td style="width: 37%;"><input type="text" style="width:100%;" value="${projectview.projectRequirePeople}" name="projectRequirePeople"/></td>
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
			      			<button type="button" id="btn-apply-spt003-2" class="btn" disabled style="background: #585BCD; color: white;">최종합격 검토 중</button>
			      		</c:when>
			      		
			      		<c:when test="${apply.commonCODE == 'SPT004'}">
			      			<button type="button" id="btn-apply-spt004-2" class="btn" disabled style="background: #0095AA; color: white;">참여중</button>
			      		</c:when>
			      		
			      		<c:when test="${apply.commonCODE == 'SPT005'}">
			      			<button type="button" id="btn-apply-spt005-2" class="btn" disabled style="background: #c7c7c7;">불합격</button>
			      		</c:when>
			      		
			      		<c:when test="${companyNO != null}">
			      			<button type="button" id="jiwon-btn" class="btn btn-success" disabled>지원하기</button>
			      		</c:when>
			      		
			      		<c:otherwise>
			      			<button type="button" id="jiwon-btn" class="btn btn-success">수정하기</button>
			      		</c:otherwise>
			      	
			      	</c:choose>
				
					<button type="button" id="mokrok-btn" class="btn btn-danger">돌아가기</button>
				</div>
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
	
	$(function() {
		
		
		
	});

</script> 
                 






 




