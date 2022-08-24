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
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainpage-style.css">
   
   <!-- 여기다가 나만의 새로운 css 만들기 -->
   
   <!-- 개인 회원가입 css -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/register-gein.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/register-giup.css">
   
</head>
<body>

<%@ include file="../include/header.jsp" %>
	   
	<div class="mainbox">
	
		<!-- 이곳에다가 div 생성해서 만드시면 될겁니다~~ -->
	    <div class="register-box">
	
	        <div class="top-msg">
	            *은 필수 항목입니다.
	        </div>
	
	        <ul class="nav nav-tabs nav-justified" style="padding: 10px; text-align: center;">
			  <li role="presentation" class="nav-item active">
			  	<a href="#tab-user-regist" data-toggle="tab" style="color: #3071A9;">일반회원</a>
			  </li>
			  <li role="presentation" class="nav-item">
			  	<a href="#tab-company-regist" data-toggle="tab" style="color: #3071A9;">기업회원</a>
			  </li>
			</ul>
	
			<div class="tab-content" style="margin: 0;">
	
				<!-- 일반회원 탭 클릭 시 뜨는 화면 -->
				<div class="tab-pane fade in active" id="tab-user-regist">
					<form action="<c:url value='/user/userRegist' />" method="post" name="userRegistForm">
						<div class="register-input-box">
				            <div class="id all">
				                <p>ID *</p>
				                <input type="search" id="user-id" class="input-all input1-1" placeholder="영문/숫자 4~12자 조합" maxlength="12" name="userID">
				                <input type="button" id="user-id-check" class="input1-2" value="중복체크" style="cursor: pointer; background: #2D5BD2" > 
				                <span id="span-id"></span>
				            </div>
				            <div class="pw all">
				                <p>PW *</p>
				                <input type="password" id="user-pw" class="input-all input1" placeholder="영문/숫자/특수문자 8~16자 조합" maxlength="16" name="userPW">
				                <span id="span-pw"></span>
				            </div>
				            <div class="pw-check all">
				            	<p>비밀번호 확인 *</p>
				                <input type="password" id="user-pw-check" class="input-all input1" placeholder="비밀번호를 입력해 주세요." maxlength="16">
				                <span id="span-pw-check"></span>
				            </div>
				            <div class="name all">
								<p>이름 *</p>
				                <input type="search" id="user-name" class="input-all input1" placeholder="이름을 입력해 주세요." maxlength="40" name="userName">
				                <span id="span-name"></span>
				            </div>
				            <div class="e-mail all">
				                <p>이메일 *</p>
				                <input type="search" id="user-email1" class="input-all input2" placeholder="이메일을 입력해 주세요." maxlength="40" style="width: 45%;" name="userEmail1">&nbsp;@
				                <select name="userEmail2" id="user-email2" class="regi-droup-down input3" style="width: 25%; float: none;">
				                    <option value="naver.com" selected>naver.com</option>
				                    <option value="gmail.com">gmail.com</option>
				                    <option value="daum.net">daum.net</option>
				                </select>
				                <input type="button" id="btn-user-email-check" class="email-submit-button" value="인증요청" style="cursor: pointer; width: 26%; float: right;" >
				                <input type="search" id="user-email-check-num" class="input-all input2" placeholder="인증번호 6자리를 입력해주세요." maxlength="6" readonly style="background: #e6e6e6; width: 74%;">
				                <input type="button" id="btn-user-email-check-ok" class="email-submit-button" value="인증확인" style="cursor: pointer; width: 26%; background: green;" >
				                <span id="span-email"></span>
				            </div>
				            <div class="phone all">
				                <p>전화번호 *</p>
				                <select name="userPhone1" id="user-phone1" class="regi-droup-down input4-1">
				                    <option value="010" selected>010</option>
				                    <option value="010" >011</option>
				                    <option value="010" >016</option>
				                </select>&nbsp;-
				                <input type="search" id="user-phone2" class="input-all input4-2" placeholder="전화번호 앞 4자리" maxlength="4" name="userPhone2">&nbsp;-
				               	<input type="search" id="user-phone3" class="input-all input4-3" placeholder="전화번호 뒷 4자리" maxlength="4" name="userPhone3">
				                <br><span id="span-phone"></span>
				            </div>
				        </div>
				    </form>
				    
				    <p>자유양식 이력서</p>
				        <div class="form-group">
				            <input type="file" id="user-resume" class="file-upload">
				        </div>
				    <span id="span-intro2"></span>		<br>
				    <div id="div-profile" class="profile all">
				        <p>프로필사진</p>
				        	<img id="img_profile" width="120px" height="120px" src="${pageContext.request.contextPath}/resources/img/white.png" style="display: block; margin-top:10px; margin-bottom:10px; border-radius: 100px;">
				        	<input type="file" name="userProfile" id="user-profile" accept="image/png, image/jpeg, image/jpg, image/gif">
				        <br>
				    </div>
				    
				    <div class="regi-button">
				        <input type="button" class="regi-button1" value="회원가입" style=" cursor: pointer; background: #2D5BD2" id="btn-user-regist-go">
				        <input type="button" class="regi-button2" value="취소" style=" cursor: pointer;" >
				    </div>
				</div>
				
				
				
				<!-- 기업회원 탭 클릭 시 뜨는 화면 -->
				<div class="tab-pane fade" id="tab-company-regist">
					<form action="<c:url value='/company/companyRegist' />" method="post" name="companyRegistForm">
						<div class="register-input-box">
				            <div class="id all">
				                <p>기업 ID *</p>
				                <input type="search" id="company-id" class="input-all input1-1" placeholder="영문/숫자 4~12자 조합" maxlength="12" name="companyID">
				                <input type="button" id="company-id-check" class="input1-2" value="중복체크" style="cursor: pointer;" >
				                <span id="span-id2"></span>
				            </div>
				            <div class="pw all">
				                <p>PW *</p>
				                <input type="password" id="company-pw" class="input-all input1" placeholder="영문/숫자/특수문자 8~16자 조합" maxlength="16" name="companyPW">
				                <span id="span-pw2"></span>
				            </div>
				            <div class="pw-check all">
				            	<p>비밀번호 확인 *</p>
				                <input type="password" id="company-pw-check" class="input-all input1" placeholder="비밀번호를 입력해 주세요." maxlength="16">
				                <span id="span-pw-check2"></span>
				            </div>
				            <div class="name all">
								<p>기업 이름 *</p>
				                <input type="search" id="company-name" class="input-all input1" placeholder="이름을 입력해 주세요." maxlength="40" name="companyName">
				                <span id="span-name2"></span>
				            </div>
				            <div class="e-mail all">
				                <p>기업 이메일 *</p>
				                <input type="search" id="company-email1" class="input-all input2" placeholder="이메일을 입력해 주세요." maxlength="40" style="width: 45%;" name="companyEmail1">&nbsp;@
				                <select name="companyEmail2" id="company-email2" class="regi-droup-down input3" style="width: 25%; float: none;">
				                    <option value="naver.com" selected>naver.com</option>
				                    <option value="gmail.com">gmail.com</option>
				                    <option value="daum.net">daum.net</option>
				                </select>
				                <input type="button" id="btn-company-email-check" class="email-submit-button" value="인증요청" style="cursor: pointer; background:#319196; width: 26%; float: right;" >
				                <input type="search" id="company-email-check-num" class="input-all input2" placeholder="인증번호 6자리를 입력해주세요." maxlength="6" readonly style="background: #e6e6e6; width: 74%;">
				                <input type="button" id="btn-company-email-check-ok" class="email-submit-button" value="인증확인" style="cursor: pointer; width: 26%; background: green;" >
				                <span id="span-email2"></span>
				            </div>
				            <div class="phone all">
				                <p>기업 전화번호 *</p>
				                <select name="companyPhone1" id="company-phone1" class="regi-droup-down input4-1">
				                    <option value="02" selected>02</option>
				                    <option value="031" >031</option>
				                    <option value="032" >032</option>
				                    <option value="033" >033</option>
				                    <option value="041" >041</option>
				                    <option value="042" >042</option>
				                    <option value="043" >043</option>
				                    <option value="044" >044</option>
				                    <option value="051" >051</option>
				                    <option value="052" >052</option>
				                    <option value="053" >053</option>
				                    <option value="054" >054</option>
				                    <option value="055" >055</option>
				                    <option value="061" >061</option>
				                    <option value="062" >062</option>
				                    <option value="063" >063</option>
				                    <option value="064" >064</option>
				                </select>&nbsp;-
				                <input type="search" id="company-phone2" class="input-all input4-2" placeholder="전화번호 앞 자리" maxlength="4" name="companyPhone2">&nbsp;-
				               	<input type="search" id="company-phone3" class="input-all input4-3" placeholder="전화번호 뒷 자리" maxlength="4" name="companyPhone3">
				                <br><span id="span-phone2"></span>
				            </div>
				            <div class="address">
				                <p>기업 주소 *</p>
				                <input type="search" id="company-address1" class="input-all input2" placeholder="우편번호를 입력해 주세요." readonly style="background: #e6e6e6;" name="companyAddress1">
				                <input type="button" id="btn-company-address-search" class="regi-submit-button" value="주소찾기">
				                <input type="search" id="company-address2" class="input-all input1" placeholder="기본주소를 입력해 주세요." readonly style="background: #e6e6e6;" name="companyAddress2">
				                <input type="search" id="company-address3" class="input-all input1" placeholder="상세주소를 입력해 주세요." maxlength="100" name="companyAddress3">
				                <span id="span-address2"></span>
				            </div>
				            <div class="company_sub all">
				                <p>회사 소개서 *</p>
				                <div class="form-group">
				                    <input type="file" id="company-intro" class="file-upload">
				                </div>
				                <span id="span-intro2"></span>		<br>
				                <p>기업 로고</p>
				                <div class="form-group">
				                	<img id="img_company_logo" width="120px" height="120px" src="${pageContext.request.contextPath}/resources/img/white.png" style="display: block; margin-top:10px; margin-bottom:10px; border-radius: 100px;">
				                    <input type="file" accept="image/png, image/jpeg, image/jpg, image/gif" id="company-logo" class="file-upload">
				                </div>
				                <span id="span-logo2"></span>
				            </div>
				        </div>
				    </form>
			        
			        <div class="regi-button">
			            <input type="button" class="regi-button1" value="가입신청" style=" cursor: pointer;" id="btn-company-regist-go">
			            <input type="button" class="regi-button2" value="취소" style=" cursor: pointer;" >
			        </div>
				</div>
				
	        </div>
	
	    </div>

		  
<%@ include file="../include/footer.jsp" %>
	   
	</div>
   
</body>
</html>


<!-- 다음(카카오) 주소 API 사용을 위한 js파일 로드 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script>

	// 뒤로가기로 접속할 시 데이터가 남아있는 현상 방지
	window.onpageshow = function(event) {
		if(event.persisted) {
			window.location.reload();
		}
	}
	

    // 일반회원 파일 미리보기 자바스크립트 함수
	function readURL(input) {
    	if (input.files && input.files[0]) {
    		
        	var reader = new FileReader(); //비동기처리를 위한 파일을 읽는 자바스크립트 객체
        	
        	//readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
        	reader.readAsDataURL(input.files[0]); 
        	
        	reader.onload = function(e) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
            	$('#img_profile').attr("src", e.target.result); 
            	console.log(event.target)//event.target은 이벤트로 선택된 요소를 의미
        	}
    	} else {
    		$('#img_profile').attr("src", '${pageContext.request.contextPath}/resources/img/white.png');
    	}
    }
    
    
	// 기업회원 파일 미리보기 자바스크립트 함수
	function readURL2(input) {
    	if (input.files && input.files[0]) {
    		
        	var reader = new FileReader(); //비동기처리를 위한 파일을 읽는 자바스크립트 객체
        	
        	//readAsDataURL 메서드는 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할 (MDN참조)
        	reader.readAsDataURL(input.files[0]); 
        	
        	reader.onload = function(e) { //읽기 동작이 성공적으로 완료 되었을 때 실행되는 익명함수
            	$('#img_company_logo').attr("src", e.target.result); 
            	console.log(event.target);//event.target은 이벤트로 선택된 요소를 의미
        	}
    	} else {
    		$('#img_company_logo').attr("src", '${pageContext.request.contextPath}/resources/img/white.png');
    	}
    }

	
	//다음(카카오) 주소 API
	function searchAddress() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('company-address1').value = data.zonecode;
	            document.getElementById("company-address2").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("company-address3").focus();
	        }
	    }).open();
	}
	
	
	/* ############### 일반회원 유효성 검사 ############## */
	// 일반회원 아이디 검사
    var ID = document.getElementById("user-id");
	
    ID.onkeyup = function() {
        /*자바스크립트의 정규표현식 입니다*/
        /*test메서드를 통해 비교하며, 매칭되면 true, 아니면 false반*/
        var regex = /^[A-Za-z0-9+]{4,12}$/; 
        if(regex.test(document.getElementById("user-id").value )) {
            document.getElementById("user-id").style.borderColor = "gray";
        } else {
            document.getElementById("user-id").style.borderColor = "red";
            document.getElementById("span-id").innerHTML = "";
        }
    }
    

	// 비밀번호 형식 검사
    var PW = document.getElementById("user-pw");
	
    PW.onkeyup = function() {
    	// 영문과 숫자 조합, 8 ~ 16길이
        var regex = /^[A-Za-z0-9+]{8,16}$/;
        
        // 형식에 만족한다면
        if(regex.test(document.getElementById("user-pw").value)) {
        	document.getElementById("user-pw").style.borderColor = "green";
        	
            document.getElementById("span-pw").innerHTML = "사용 가능한 비밀번호입니다.";
            document.getElementById("span-pw").style.color = "green";
        } else {		// 형식에 만족하지 않는다면
            document.getElementById("user-pw").style.borderColor = "red";
            
            document.getElementById("span-pw").innerHTML = "";
        }
    }
    
    
    // 이름 입력 시 기존 경고 메세지 삭제
    var Name = document.getElementById("user-name");
    
    Name.onkeyup = function() {
    	document.getElementById("span-name").innerHTML = "";
    }
    
    
    // 비밀번호 확인란에 다시 입력 시 기존 경고 메세지 삭제
    var PWCheck = document.getElementById("user-pw-check");
    
    PWCheck.onkeyup = function() {
    	document.getElementById("span-pw-check").innerHTML = "";
    }

    
 	// 이메일 입력 시 기존 경고 메세지 삭제
    var Email = document.getElementById("user-email1");
    
    Email.onkeyup = function() {
    	document.getElementById("span-email").innerHTML = "";
    }
    
    
    // 이메일 두번째 선택 시 기존 경고 메세지 삭제
    var Email2 = document.getElementById("user-email2");
    
    Email2.onchange = function() {
    	document.getElementById("span-email").innerHTML = "";
    }
    
    
 	// 인증번호 입력 시 기존 경고 메세지 삭제
    var EmailCheckNum = document.getElementById("user-email-check-num");
    
    EmailCheckNum.onkeyup = function() {
    	document.getElementById("span-email").innerHTML = "";
    }
    
    
 	// 전화번호 입력 시 기존 경고 메세지 삭제
    var Phone2 = document.getElementById("user-phone2");
    
    Phone2.onkeyup = function() {
    	document.getElementById("span-phone").innerHTML = "";
    }
    
    
 	// 전화번호 입력 시 기존 경고 메세지 삭제
    var Phone3 = document.getElementById("user-phone3");
    
    Phone3.onkeyup = function() {
    	document.getElementById("span-phone").innerHTML = "";
    }
    /* ############### 일반회원 유효성 검사 끝 ############## */
    
    
    
    /* ############### 기업회원 유효성 검사 ############## */
 	// 기업회원 아이디 검사
	var ID2 = document.getElementById("company-id");
	
    ID2.onkeyup = function() {
        /*자바스크립트의 정규표현식 입니다*/
        /*test메서드를 통해 비교하며, 매칭되면 true, 아니면 false반*/
        var regex = /^[A-Za-z0-9+]{4,12}$/; 
        if(regex.test(document.getElementById("company-id").value )) {
            document.getElementById("company-id").style.borderColor = "gray";
        } else {
            document.getElementById("company-id").style.borderColor = "red";
            document.getElementById("span-id2").innerHTML = "";
        }
    }
    
    
 	// 비밀번호 형식 검사
    var PW2 = document.getElementById("company-pw");
	
    PW2.onkeyup = function() {
    	// 영문과 숫자 조합, 8 ~ 16길이
        var regex = /^[A-Za-z0-9+]{8,16}$/;
        
        // 형식에 만족한다면
        if(regex.test(document.getElementById("company-pw").value)) {
        	document.getElementById("company-pw").style.borderColor = "green";
        	
            document.getElementById("span-pw2").innerHTML = "사용 가능한 비밀번호입니다.";
            document.getElementById("span-pw2").style.color = "green";
        } else {		// 형식에 만족하지 않는다면
            document.getElementById("company-pw").style.borderColor = "red";
            
            document.getElementById("span-pw2").innerHTML = "";
        }
    }
    
    
    // 이름 입력 시 기존 경고 메세지 삭제
    var Name2 = document.getElementById("company-name");
    
    Name2.onkeyup = function() {
    	document.getElementById("span-name2").innerHTML = "";
    }
    
    
    // 비밀번호 확인란에 다시 입력 시 기존 경고 메세지 삭제
    var PWCheck2 = document.getElementById("company-pw-check");
    
    PWCheck2.onkeyup = function() {
    	document.getElementById("span-pw-check2").innerHTML = "";
    }

    
 	// 이메일 입력 시 기존 경고 메세지 삭제
    var Email3 = document.getElementById("company-email1");
    
    Email3.onkeyup = function() {
    	document.getElementById("span-email2").innerHTML = "";
    }
    
    
    // 이메일 두번째 선택 시 기존 경고 메세지 삭제
    var Email4 = document.getElementById("company-email2");
    
    Email4.onchange = function() {
    	document.getElementById("span-email2").innerHTML = "";
    }
    
    
 	// 인증번호 입력 시 기존 경고 메세지 삭제
    var EmailCheckNum2 = document.getElementById("company-email-check-num");
    
    EmailCheckNum2.onkeyup = function() {
    	document.getElementById("span-email2").innerHTML = "";
    }
    
    
 	// 전화번호 입력 시 기존 경고 메세지 삭제
    var Phone4 = document.getElementById("company-phone2");
    
    Phone4.onkeyup = function() {
    	document.getElementById("span-phone2").innerHTML = "";
    }
    
    
 	// 전화번호 입력 시 기존 경고 메세지 삭제
    var Phone5 = document.getElementById("company-phone3");
    
    Phone5.onkeyup = function() {
    	document.getElementById("span-phone2").innerHTML = "";
    }
    
    
 	// 기업 상세주소 입력 시 기존 경고 메세지 삭제
    var Address1 = document.getElementById("company-address3");
    
    Address1.onkeyup = function() {
    	document.getElementById("span-address2").innerHTML = "";
    }
    
    
 	// 기업 주소검색 버튼 클릭 시 기존 경고 메세지 삭제
    var Address2 = document.getElementById("btn-company-address-search");
    
    Address2.onclick = function() {
    	document.getElementById("span-address2").innerHTML = "";
    }
    /* ############### 기업회원 유효성 검사 끝 ############## */
    

	// jQuery 시작
	$(function() {
		
		// 일반회원 프로필 사진 파일 선택 시 미리보기 기능
		$('#user-profile').change(function () {
			readURL(this);
		});
		
		
		// 기업회원 로고 사진 파일 선택 시 미리보기 기능
		$('#company-logo').change(function () {
			readURL2(this);
		});

		
		// 기업회원 주소찾기 버튼 클릭 시 다음 카카오 주소찾기 API 작동
		$('#btn-company-address-search').click(function() {
			searchAddress();	
		});
		
		
		// 일반회원 아이디 중복체크 버튼 클릭 시 중복체크 비동기 방식 처리
		$('#user-id-check').click(function() {
			
			const userID = $('#user-id').val();
			
			if(userID == '') {
				alert('아이디를 먼저 입력해주세요.');
				$('#span-id').text('아이디를 입력해주세요.');
				$('#span-id').css('color', 'red');
				
				$('#user-id').css('border-color', 'red');
				$('#user-id').focus();
				return;
			}
			
			// 영문 대/소문자, 숫자만 허용, 4 ~ 12길이
			var regex = /^[A-Za-z0-9+]{4,12}$/; 
			
			
			// 위 형식을 만족한다면
			if(regex.test($('#user-id').val())) {
				
				// ajax 시작 (아이디 중복 체크 비동기 통신)
				// UserController의 userIDCheck 메소드로 요청을 보냄
				$.ajax({
					type: 'POST',
					url: '<c:url value="/user/userIDCheck" />',
					contentType: 'application/json',
					
					data: userID,
					dataType: 'text',
					
					success: function(result) {
						if(result == 'checkSuccess') {
							$('#span-id').text('사용 가능한 아이디입니다.');
							$('#span-id').css('color', 'green');
							
							$('#user-id').css('border-color', 'green');
							$('#user-id').css('background', '#e6e6e6');
							$('#user-id').attr('readonly', true);
						} else {
							$('#span-id').text('이미 사용중인 아이디입니다.');
							$('#span-id').css('color', 'red');
							
							$('#user-id').css('border-color', 'red');
							$('#user-id').focus();
						}
					},
					
					error: function() {
						alert('중복체크 중 서버 오류가 발생했습니다.');
						return;
					}
				});		// ajax 끝
			} else {		// 위 형식에 만족하지 않는다면
				alert('아이디를 형식에 맞게 작성해주세요.');
				$('#span-id').text('영문 포함 4 ~ 12자 형식으로 작성해주세요.');
				$('#span-id').css('color', 'red');
				
				$('#user-id').focus();
				return;
			}
		});		// 아이디 중복체크 끝
		
		
		// 일반회원 이메일 인증번호 전송 비동기 방식 처리
		$('#btn-user-email-check').click(function() {
			
			const email = $('#user-email1').val() + '@' + $('#user-email2').val();
			console.log('완성된 이메일 : ' + email);
			
			const userEmail1 = $('#user-email1').val();
			const userEmail2 = $('#user-email2').val();
			
			
			// 이메일 빈 칸 여부 확인
			if(userEmail1 == '') {
				alert('이메일을 먼저 입력해주세요.');
				$('#span-email').text('이메일을 입력해주세요.');
				$('#span-email').css('color', 'red');
				
				$('#user-email1').css('border-color', 'red');
				$('#user-email1').focus();
				return;
			}
			
				
			// ajax 시작 (이메일 중복 체크 비동기 통신)
			$.ajax({
				type: 'POST',
				url: '<c:url value="/user/userEmailCheck" />',
					
				data: {
					'user_email1': userEmail1,
					'user_email2': userEmail2
				},
				dataType: 'text',
					
				success: function(result) {
					// 비동기 통신의 결과로 컨트롤러에서 emailCheckSuccess 결과, 즉 중복되는 이메일이 없을 경우
					if(result == 'emailCheckSuccess') {	
						
						// ajax 시작 (이메일 전송 비동기 통신)
						$.ajax({
							type: 'GET',
							url: '<c:url value="/user/userEmailAuth?email=" />' + email,
							
							success: function(result) {
								$('#user-email-check-num').attr('readonly', false);		// 비활성된 인증번호 입력창을 활성화시킨다.
								$('#user-email-check-num').css('background', 'white');
								
								$('#user-email1').attr('readonly', true);			// 이메일 칸도 더이상 수정하지 못하도록 막는다.
								$('#user-email1').css('background', '#e6e6e6');
								$('#user-email2').attr('readonly', true);			
								$('#user-email2').css('background', '#e6e6e6');
								
								// disabled는 함부로 주면 안된다. 버튼 같은 경우는 해도 되지만 disabled는 값을 넘길수가 없으므로 input이나 select에는 적합하지 않다.
								
								// select 태그는 readonly가 안먹는다..
								// focus가 발생하게 되면 초기값을 사용자가 선택한 값으로 무조건 설정하게 한다. (select에서 readonly 대용)
								$('#user-email2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
								$('#user-email2').attr('onChange', 'this.selectedIndex = this.initailSelect'); 
								
								code = result;			// 미리 선언한 인증번호 코드 변수에 컨트롤러부터 받은 인증번호를 저장해둔다.
								
								alert('인증번호가 전송되었습니다. 확인 후 입력란에 입력해주세요.');
							},
							
							error: function() {
								alert('인증번호 발급 중 서버오류가 발생했습니다.');
								return;
							}
						});		// 이메일 전송 끝
						
					} else {		// 중복되는 이메일이 이미 있을 경우
						$('#span-email').text('이미 사용중인 이메일입니다.');
						$('#span-email').css('color', 'red');
							
						$('#user-email1').focus();
						
						return;
					}
				},
					
				error: function() {
					alert('중복체크 중 서버 오류가 발생했습니다.');
					return;
				}
			});		// 이메일 중복체크 끝
			
		});		// 인증번호 이메일 전송 끝
		
		
		// 일반회원 인증번호 비교
		$('#btn-user-email-check-ok').click(function() {
			
			const inputCode = $('#user-email-check-num').val();
			const $resultMsg = $('#span-email');
			
			// 인증코드란에 작성한 인증코드와 이메일로 받은 인증번호가 동일하다면
			if(inputCode === code) {
				$resultMsg.html('인증번호가 일치합니다.');
				$resultMsg.css('color', 'green');
				
				$('#btn-user-email-check').attr('disabled', true);		// 인증이 완료되었으므로 더이상 인증을 하지 못하게 막는다.
				$('#btn-user-email-check-ok').attr('disabled', true);	// 인증이 완료되었으므로 더이상 인증을 하지 못하게 막는다.
			
				$('#user-email-check-num').attr('readonly', true);
				$('#user-email-check-num').css('background', '#e6e6e6');			
			} else {
				$resultMsg.html('인증번호가 일치하지 않습니다.');
				$resultMsg.css('color', 'red');
			}
		});		// 인증번호 이벤트 끝	
		
		
		// 일반회원 회원가입 버튼 클릭 시 (형식에 맞는지 모두 검사 후 가입 진행)
		$('#btn-user-regist-go').click(function() {
			
			if(confirm('회원가입 하시겠습니까?')) {
				
				// ID 입력 여부 체크
				if($('#user-id').val() == '') {
					alert('아이디를 입력해주세요.');
					$('#span-id').text('아이디를 입력해주세요.');
					$('#span-id').css('color', 'red');

					$('#user-id').focus();
					return;
				}
				
				// ID 중복체크 여부 체크
				if(!$('#user-id').attr('readonly')) {
					alert('아이디 중복확인이 필요합니다.');
					$('#span-id').text('아이디 중복확인이 필요합니다.');
					$('#span-id').css('color', 'red');

					$('#user-id').focus();
					return;
				}

				// 비밀번호 유효성 체크				
				if($('#span-pw').html() != '사용 가능한 비밀번호입니다.') {
					alert('비밀번호를 형식에 맞게 작성해주세요.');
					$('#span-pw').text('비밀번호 형식에 맞게 작성해주세요.');
					$('#span-pw').css('color', 'red');
					
					$('#user-pw').focus();
					return;
				}
				
				// 비밀번호 확인 체크
				if($('#user-pw').val() != $('#user-pw-check').val()) {
					alert('비밀번호가 서로 일치하지 않습니다.');
					$('#span-pw-check').text('비밀번호를 확인해주세요.');
					$('#span-pw-check').css('color', 'red');
					
					$('#user-pw-check').focus();
					return;
				}
				
				// 이름 입력 여부 체크
				if($('#user-name').val() == '') {
					alert('이름을 입력해주세요.');
					$('#span-name').text('이름을 입력해주세요.');
					$('#span-name').css('color', 'red');
					
					$('#user-name').focus();
					return;
				}
				
				// 이메일 입력 여부 체크
				if($('#user-email1').val() == '') {
					alert('이메일을 입력해주세요.');
					$('#span-email').text('이메일을 입력해주세요.');
					$('#span-email').css('color', 'red');
					
					$('#user-email1').focus();
					return;
				}
				
				// 이메일 인증 여부 체크 1
				if(!$('#user-email1').attr('readonly')) {
					alert('이메일 인증이 필요합니다.');
					$('#span-email').text('이메일 인증이 필요합니다.');
					$('#span-email').css('color', 'red');

					$('#user-email1').focus();
					return;
				}
				
				// 이메일 인증 여부 체크 2
				if(!$('#user-email-check-num').attr('readonly')) {
					alert('인증번호가 일치하지 않습니다.');
					$('#span-email').text('인증번호가 일치하지 않습니다.');
					$('#span-email').css('color', 'red');

					$('#user-email-check-num').focus();
					return;
				}
				
				// 전화번호 가운데 칸 입력 여부 체크
				if($('#user-phone2').val() == '') {
					alert('전화번호를 입력해주세요.');
					$('#span-phone').text('전화번호를 입력해주세요.');
					$('#span-phone').css('color', 'red');
					
					$('#user-phone2').focus();
					return;
				}
				
				// 전화번호 마지막 칸 입력 여부 체크
				if($('#user-phone3').val() == '') {
					alert('전화번호를 입력해주세요.');
					$('#span-phone').text('전화번호를 입력해주세요.');
					$('#span-phone').css('color', 'red');
					
					$('#user-phone3').focus();
					return;
				}
				
				
				// 자바스크립트의 파일 확장자 체크 검색 (문서 파일만 받을 수 있도록)
				let resume = $('#user-resume').val();
				
				// . 을 제거한 확장자만 얻어낸 후 그것을 소문자로 일괄 변경 후 비교한다.
				// +1을 한 것은 점 바로 이후 문자부터 잘라서 추출하기 위해
				resume = resume.slice(resume.indexOf('.') + 1).toLowerCase();
				
				if(resume !== 'hwp' && resume !== 'doc' && resume !== 'pdf' && resume !== 'ppt' && resume !== 'pptx' && resume !== 'docx' && resume !== 'xlsx' && resume !== 'xls' && resume !== '') {
					alert('문서 파일 형식만 등록이 가능합니다.');
					$('#resume').val('');
					return;
				}
				
				
				// 자바스크립트의 파일 크기 체크 (5MB 이내의 크기만 첨부할 수 있도록)
				if($('#user-resume').val() != '') {
					let maxResumeSize = 5 * 1024 * 1024;		// 5MB
					let resumeSize = $('#user-resume')[0].files[0].size;
					
					if(resumeSize > maxResumeSize) {
						alert("이력서 첨부파일은 5MB 이내로 첨부가 가능합니다.");
						$('#resume').val('');
						return;
					}
				}
				
				
				// 자바스크립트의 파일 확장자 체크 검색 (이미지 파일만 받을 수 있도록)
				let profile = $('#user-profile').val();
				
				// . 을 제거한 확장자만 얻어낸 후 그것을 소문자로 일괄 변경 후 비교한다.
				// +1을 한 것은 점 바로 이후 문자부터 잘라서 추출하기 위해
				profile = profile.slice(profile.indexOf('.') + 1).toLowerCase();
				
				if(profile !== 'jpg' && profile !== 'png' && profile !== 'jpeg' && profile !== 'bmp' && profile !== '') {
					alert('이미지 파일 형식만 등록이 가능합니다.');
					$('#profile').val('');
					return;
				}
				
				
				// 자바스크립트의 파일 크기 체크 (5MB 이내의 크기만 첨부할 수 있도록)
				if($('#user-profile').val() != '') {
					let maxProfileSize = 5 * 1024 * 1024;		// 5MB
					let profileSize = $('#user-profile')[0].files[0].size;
					
					if(profileSize > maxProfileSize) {
						alert("프로필사진 첨부파일은 5MB 이내로 첨부가 가능합니다.");
						$('#profile').val('');
						return;
					}
				}

				
				// 모든 항목들이 적합하다면 회원가입 폼 내용들을 컨트롤러로 보낸다.
				document.userRegistForm.submit();
				
				
				// 이력서를 등록하지 않고 회원가입 할 경우
				if($('#user-resume').val() == '') {
					// 회원가입하는 회원의 회원번호를 불러오는 userNOGet을 비동기로 처리
					$.ajax({
						type: 'POST',
						url: '<c:url value="/user/userNOGet" />',
						contentType: false,
						processData: false,
						
						success: function(userNO) {
							// 이력서 파일없이 회원을 등록하는 userResumeNo를 비동기로 처리 (보내는 데이터 없음)
							$.ajax({
								type: 'POST',
								url: '<c:url value="/user/userResumeNo/" />' + userNO,
								contentType: false,
								processData: false,
								
								success: function(result) {
									if(result == 'NoResume') {
										console.log('이력서 파일 없이 가입 성공');
									} else {
										alert('이력서 파일 없이 가입 중 오류가 발생했습니다.');
										return;
									}
								},
								
								error: function() {
									alert('이력서 파일 없이 가입 중 서버오류가 발생했습니다.');
									return;
								}
							});
						},
						
						error: function() {
							alert("사용자 회원번호를 얻어오는 중 서버오류가 발생했습니다.");
							return;
						}
					});
				} else {		// 이력서파일 등록하고 회원가입을 할 경우
					// 회원가입하는 회원의 회원번호를 불러오는 userNOGet을 비동기로 처리
					$.ajax({
						type: 'POST',
						url: '<c:url value="/user/userNOGet" />',
						contentType: false,
						processData: false,
						
						success: function(userNO) {
							// 가상 Form을 생성한다.
							const formData = new FormData();
						
							const data = $('#user-resume');
							
							// 가상 Form에 받은 파일을 userResume이라는 이름으로 넣는다.
							formData.append('userResume', data[0].files[0]);
							
							// 이력서 파일을 등록하는 userResume를 비동기로 처리
							$.ajax({
								type: 'POST',
								url: '<c:url value="/user/userResume/" />' + userNO,
								contentType: false,
								processData: false,
								
								data: formData,
								
								success: function(result) {
									if(result == 'YesResume') {
										console.log('이력서 등록 성공');
									} else {
										alert('이력서 등록 중 오류가 발생했습니다.');
										return;
									}
								},
								
								error: function() {
									alert('이력서 등록 중 서버오류가 발생했습니다.');
									return;
								}
							});		// ajax(userProfile) 끝
						},
						
						error: function() {
							alert("사용자 회원번호를 얻어오는 중 서버오류가 발생했습니다.");
							return;
						}
					});		// ajax(userNOGet) 끝
				}
				
				
				// 프로필사진을 등록하지 않고 회원가입 할 경우
				if($('#user-profile').val() == '') {
					// 회원가입하는 회원의 회원번호를 불러오는 userNOGet을 비동기로 처리
					$.ajax({
						type: 'POST',
						url: '<c:url value="/user/userNOGet" />',
						contentType: false,
						processData: false,
						
						success: function(userNO) {
							// 프로필사진 없이 회원을 등록하는 userProfileNo를 비동기로 처리 (보내는 데이터 없음)
							$.ajax({
								type: 'POST',
								url: '<c:url value="/user/userProfileNo/" />' + userNO,
								contentType: false,
								processData: false,
								
								success: function(result) {
									if(result == 'NoProfile') {
										console.log('프로필사진 없이 가입 성공');
									} else {
										alert('프로필 사진 없이 가입 중 오류가 발생했습니다.');
										return;
									}
								},
								
								error: function() {
									alert('프로필 사진 없이 가입 중 서버오류가 발생했습니다.');
									return;
								}
							});
						},
						
						error: function() {
							alert("사용자 회원번호를 얻어오는 중 서버오류가 발생했습니다.");
							return;
						}
					});
				} else {		// 프로필사진 등록하고 회원가입 할 경우
					// 회원가입하는 회원의 회원번호를 불러오는 userNOGet을 비동기로 처리
					$.ajax({
						type: 'POST',
						url: '<c:url value="/user/userNOGet" />',
						contentType: false,
						processData: false,
						
						success: function(userNO) {
							// 가상 Form을 생성한다.
							const formData = new FormData();
						
							const data = $('#user-profile');
							
							// 가상 Form에 받은 파일을 userProfile이라는 이름으로 넣는다.
							formData.append('userProfile', data[0].files[0]);
							
							// 프로필사진을 등록하는 userProfile를 비동기로 처리
							$.ajax({
								type: 'POST',
								url: '<c:url value="/user/userProfile/" />' + userNO,
								contentType: false,
								processData: false,
								
								data: formData,
								
								success: function(result) {
									if(result == 'YesProfile') {
										console.log('프로필사진 등록 성공');
									} else {
										alert('프로필사진 등록 중 오류가 발생했습니다.');
										return;
									}
								},
								
								error: function() {
									alert('프로필사진 등록 중 서버오류가 발생했습니다.');
									return;
								}
							});		// ajax(userProfile) 끝
						},
						
						error: function() {
							alert("사용자 회원번호를 얻어오는 중 서버오류가 발생했습니다.");
							return;
						}
					});		// ajax(userNOGet) 끝
				}
			} else {
				return;
			}
		});
		
		
		
		
		
		// 기업회원 아이디 중복체크 버튼 클릭 시 중복체크 비동기 방식 처리
		$('#company-id-check').click(function() {
			
			const companyID = $('#company-id').val();
			
			if(companyID == '') {
				alert('아이디를 먼저 입력해주세요.');
				$('#span-id2').text('기업 아이디를 입력해주세요.');
				$('#span-id2').css('color', 'red');
				
				$('#company-id').css('border-color', 'red');
				$('#company-id').focus();
				return;
			}
			
			// 영문 대/소문자, 숫자만 허용, 4 ~ 12길이
			var regex = /^[A-Za-z0-9+]{4,12}$/; 
			
			
			// 위 형식을 만족한다면
			if(regex.test($('#company-id').val())) {
				
				// ajax 시작 (아이디 중복 체크 비동기 통신)
				// CompanyController의 companyIDCheck 메소드로 요청을 보냄
				$.ajax({
					type: 'POST',
					url: '<c:url value="/company/companyIDCheck" />',
					contentType: 'application/json',
					
					data: companyID,
					dataType: 'text',
					
					success: function(result) {
						if(result == 'checkSuccess') {
							$('#span-id2').text('사용 가능한 아이디입니다.');
							$('#span-id2').css('color', 'green');
							
							$('#company-id').css('border-color', 'green');
							$('#company-id').css('background', '#e6e6e6');
							$('#company-id').attr('readonly', true);
						} else {
							$('#span-id2').text('이미 사용중인 아이디입니다.');
							$('#span-id2').css('color', 'red');
							
							$('#company-id').css('border-color', 'red');
							$('#company-id').focus();
						}
					},
					
					error: function() {
						alert('중복체크 중 서버 오류가 발생했습니다.');
						return;
					}
				});		// ajax 끝
			} else {		// 위 형식에 만족하지 않는다면
				alert('아이디를 형식에 맞게 작성해주세요.');
				$('#span-id2').text('영문 포함 4 ~ 12자 형식으로 작성해주세요.');
				$('#span-id2').css('color', 'red');
				
				$('#company-id').focus();
				return;
			}
		});		// 아이디 중복체크 끝
		
		
		// 기업회원 이메일 인증번호 전송 비동기 방식 처리
		$('#btn-company-email-check').click(function() {
			
			const email2 = $('#company-email1').val() + '@' + $('#company-email2').val();
			console.log('완성된 이메일 : ' + email2);
			
			const companyEmail1 = $('#company-email1').val();
			const companyEmail2 = $('#company-email2').val();
			
			
			// 이메일 빈 칸 여부 확인
			if(companyEmail1 == '') {
				alert('이메일을 먼저 입력해주세요.');
				$('#span-email2').text('기업 이메일을 입력해주세요.');
				$('#span-email2').css('color', 'red');
				
				$('#company-email1').css('border-color', 'red');
				$('#company-email1').focus();
				return;
			}
			
				
			// ajax 시작 (이메일 중복 체크 비동기 통신)
			$.ajax({
				type: 'POST',
				url: '<c:url value="/company/companyEmailCheck" />',
					
				data: {
					'company_email1': companyEmail1,
					'company_email2': companyEmail2
				},
				dataType: 'text',
					
				success: function(result) {
					// 비동기 통신의 결과로 컨트롤러에서 emailCheckSuccess 결과, 즉 중복되는 이메일이 없을 경우
					if(result == 'emailCheckSuccess') {	
						
						// ajax 시작 (이메일 전송 비동기 통신)
						$.ajax({
							type: 'GET',
							url: '<c:url value="/company/companyEmailAuth?email=" />' + email2,
							
							success: function(result) {
								$('#company-email-check-num').attr('readonly', false);		// 비활성된 인증번호 입력창을 활성화시킨다.
								$('#company-email-check-num').css('background', 'white');
								
								$('#company-email1').attr('readonly', true);			// 이메일 칸도 더이상 수정하지 못하도록 막는다.
								$('#company-email1').css('background', '#e6e6e6');
								$('#company-email2').attr('readonly', true);			
								$('#company-email2').css('background', '#e6e6e6');
								
								// disabled는 함부로 주면 안된다. 버튼 같은 경우는 해도 되지만 disabled는 값을 넘길수가 없으므로 input이나 select에는 적합하지 않다.
								
								// select 태그는 readonly가 안먹는다..
								// focus가 발생하게 되면 초기값을 사용자가 선택한 값으로 무조건 설정하게 한다. (select에서 readonly 대용)
								$('#company-email2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
								$('#company-email2').attr('onChange', 'this.selectedIndex = this.initailSelect'); 
								
								code = result;			// 미리 선언한 인증번호 코드 변수에 컨트롤러부터 받은 인증번호를 저장해둔다.
								
								alert('인증번호가 전송되었습니다. 확인 후 입력란에 입력해주세요.');
							},
							
							error: function() {
								alert('인증번호 발급 중 서버오류가 발생했습니다.');
								return;
							}
						});		// 이메일 전송 끝
						
					} else {		// 중복되는 이메일이 이미 있을 경우
						$('#span-email2').text('이미 사용중인 이메일입니다.');
						$('#span-email2').css('color', 'red');
							
						$('#company-email1').focus();
						
						return;
					}
				},
					
				error: function() {
					alert('중복체크 중 서버 오류가 발생했습니다.');
					return;
				}
			});		// 이메일 중복체크 끝
			
		});		// 인증번호 이메일 전송 끝
		
		
		// 기업회원 인증번호 비교
		$('#btn-company-email-check-ok').click(function() {
			
			const inputCode = $('#company-email-check-num').val();
			const $resultMsg = $('#span-email2');
			
			// 인증코드란에 작성한 인증코드와 이메일로 받은 인증번호가 동일하다면
			if(inputCode === code) {
				$resultMsg.html('인증번호가 일치합니다.');
				$resultMsg.css('color', 'green');
				
				$('#btn-company-email-check').attr('disabled', true);		// 인증이 완료되었으므로 더이상 인증을 하지 못하게 막는다.
				$('#btn-company-email-check-ok').attr('disabled', true);	// 인증이 완료되었으므로 더이상 인증을 하지 못하게 막는다.
			
				$('#company-email-check-num').attr('readonly', true);
				$('#company-email-check-num').css('background', '#e6e6e6');			
			} else {
				$resultMsg.html('인증번호가 일치하지 않습니다.');
				$resultMsg.css('color', 'red');
			}
		});		// 인증번호 이벤트 끝	
		
		
		// 기업회원 회원가입 버튼 클릭 시 (형식에 맞는지 모두 검사 후 가입 진행)
		$('#btn-company-regist-go').click(function() {
			
			if(confirm('회원가입 하시겠습니까?')) {
				
				// ID 입력 여부 체크
				if($('#company-id').val() == '') {
					alert('아이디를 입력해주세요.');
					$('#span-id2').text('기업 아이디를 입력해주세요.');
					$('#span-id2').css('color', 'red');

					$('#company-id').focus();
					return;
				}
				
				// ID 중복체크 여부 체크
				if(!$('#company-id').attr('readonly')) {
					alert('아이디 중복확인이 필요합니다.');
					$('#span-id2').text('아이디 중복확인이 필요합니다.');
					$('#span-id2').css('color', 'red');

					$('#company-id').focus();
					return;
				}

				// 비밀번호 유효성 체크				
				if($('#span-pw2').html() != '사용 가능한 비밀번호입니다.') {
					alert('비밀번호를 형식에 맞게 작성해주세요.');
					$('#span-pw2').text('비밀번호 형식에 맞게 작성해주세요.');
					$('#span-pw2').css('color', 'red');
					
					$('#company-pw').focus();
					return;
				}
				
				// 비밀번호 확인 체크
				if($('#company-pw').val() != $('#company-pw-check').val()) {
					alert('비밀번호가 서로 일치하지 않습니다.');
					$('#span-pw-check2').text('비밀번호를 확인해주세요.');
					$('#span-pw-check2').css('color', 'red');
					
					$('#company-pw-check').focus();
					return;
				}
				
				// 이름 입력 여부 체크
				if($('#company-name').val() == '') {
					alert('기업 이름을 입력해주세요.');
					$('#span-name2').text('기업 이름을 입력해주세요.');
					$('#span-name2').css('color', 'red');
					
					$('#company-name').focus();
					return;
				}
				
				// 이메일 입력 여부 체크
				if($('#company-email1').val() == '') {
					alert('기업 이메일을 입력해주세요.');
					$('#span-email2').text('기업 이메일을 입력해주세요.');
					$('#span-email2').css('color', 'red');
					
					$('#company-email1').focus();
					return;
				}
				
				// 이메일 인증 여부 체크 1
				if(!$('#company-email1').attr('readonly')) {
					alert('이메일 인증이 필요합니다.');
					$('#span-email2').text('이메일 인증이 필요합니다.');
					$('#span-email2').css('color', 'red');

					$('#company-email1').focus();
					return;
				}
				
				// 이메일 인증 여부 체크 2
				if(!$('#company-email-check-num').attr('readonly')) {
					alert('인증번호가 일치하지 않습니다.');
					$('#span-email2').text('인증번호가 일치하지 않습니다.');
					$('#span-email2').css('color', 'red');

					$('#company-email-check-num').focus();
					return;
				}
				
				// 전화번호 가운데 칸 입력 여부 체크
				if($('#company-phone2').val() == '') {
					alert('기업 전화번호를 입력해주세요.');
					$('#span-phone2').text('기업 전화번호를 입력해주세요.');
					$('#span-phone2').css('color', 'red');
					
					$('#company-phone2').focus();
					return;
				}
				
				// 전화번호 마지막 칸 입력 여부 체크
				if($('#company-phone3').val() == '') {
					alert('기업 전화번호를 입력해주세요.');
					$('#span-phone2').text('기업 전화번호를 입력해주세요.');
					$('#span-phone2').css('color', 'red');
					
					$('#company-phone3').focus();
					return;
				}
				
				// 기업 주소 첫 번째 칸 입력 여부 체크
				if($('#company-address1').val() == '') {
					alert('기업 우편번호를 입력해주세요.');
					$('#span-address2').text('기업 우편번호를 검색하여 입력해주세요.');
					$('#span-address2').css('color', 'red');
					
					$('#company-address3').focus();
					return;
				}
				
				// 기업 주소 두 번째 칸 입력 여부 체크
				if($('#company-address2').val() == '') {
					alert('기업 기본주소를 입력해주세요.');
					$('#span-address2').text('기업 기본주소를 검색하여 입력해주세요.');
					$('#span-address2').css('color', 'red');
					
					$('#company-address3').focus();
					return;
				}
				
				// 기업 주소 세 번째 칸 입력 여부 체크
				if($('#company-address3').val() == '') {
					alert('기업 상세주소를 입력해주세요.');
					$('#span-address2').text('기업 상세주소를 입력해주세요.');
					$('#span-address2').css('color', 'red');
					
					$('#company-address3').focus();
					return;
				}
				
				
				// 기업 회사 소개서 첨부 여부 체크
				if($('#company-intro').val() == '') {
					alert('회사 소개서를 첨부해주세요.');
					$('#span-intro2').text('회사 소개서를 첨부해주세요.');
					$('#span-intro2').css('color', 'red');

					return;
				}
				
				
				// 자바스크립트의 파일 확장자 체크 검색 (문서 파일만 받을 수 있도록)
				let intro = $('#company-intro').val();
				
				// . 을 제거한 확장자만 얻어낸 후 그것을 소문자로 일괄 변경 후 비교한다.
				// +1을 한 것은 점 바로 이후 문자부터 잘라서 추출하기 위해
				let introEx = intro.slice(intro.indexOf('.') + 1).toLowerCase();
				
				if(introEx !== 'hwp' && introEx !== 'doc' && introEx !== 'pdf' && introEx !== 'ppt' && introEx !== 'pptx' && introEx !== 'docx' && introEx !== 'xlsx' && introEx !== 'xls') {
					alert('문서 파일 형식만 등록이 가능합니다.');
					$('#intro').val('');
					return;
				}
				
				
				// 자바스크립트의 파일 크기 체크 (5MB 이내의 크기만 첨부할 수 있도록)
				let maxIntroSize = 5 * 1024 * 1024;		// 5MB
				let introSize = $('#company-intro')[0].files[0].size;
				
				if(introSize > maxIntroSize) {
					alert("회사 소개서 첨부파일은 5MB 이내로 첨부가 가능합니다.");
					$('#intro').val('');
					return;
				}
				
				
				// 자바스크립트의 파일 확장자 체크 검색 (이미지 파일만 받을 수 있도록)
				let logo = $('#company-logo').val();
				
				// . 을 제거한 확장자만 얻어낸 후 그것을 소문자로 일괄 변경 후 비교한다.
				// +1을 한 것은 점 바로 이후 문자부터 잘라서 추출하기 위해
				logo = logo.slice(logo.indexOf('.') + 1).toLowerCase();
				
				if(logo !== 'jpg' && logo !== 'png' && logo !== 'jpeg' && logo !== 'bmp' && logo !== '') {
					alert('이미지 파일 형식만 등록이 가능합니다.');
					$('#logo').val('');
					return;
				}
				
				
				// 자바스크립트의 파일 크기 체크 (5MB 이내의 크기만 첨부할 수 있도록)
				if($('#company-logo').val() != '') {
					let maxLogoSize = 5 * 1024 * 1024;		// 5MB
					let logoSize = $('#company-logo')[0].files[0].size;
					
					if(logoSize > maxLogoSize) {
						alert("로고 첨부파일은 5MB 이내로 첨부가 가능합니다.");
						$('#logo').val('');
						return;
					}
				}
				
				
				// 모든 항목들이 적합하다면 회원가입 폼 내용들을 컨트롤러로 보낸다.
				document.companyRegistForm.submit();
				
				
				// 회원가입하는 회원의 회원번호를 불러오는 companyNOGet을 비동기로 처리
				$.ajax({
					type: 'POST',
					url: '<c:url value="/company/companyNOGet" />',
					contentType: false,
					processData: false,
					
					success: function(companyNO) {
						// 가상 Form을 생성한다.
						const formData = new FormData();
					
						const data = $('#company-intro');
						
						// 가상 Form에 받은 파일을 companyIntro이라는 이름으로 넣는다.
						formData.append('companyIntro', data[0].files[0]);
						
						// 회사 소개서 파일을 등록하는 companyIntro를 비동기로 처리
						$.ajax({
							type: 'POST',
							url: '<c:url value="/company/companyIntro/" />' + companyNO,
							contentType: false,
							processData: false,
							
							data: formData,
							
							success: function(result) {
								if(result == 'YesCompanyIntro') {
									console.log('회사 소개서 등록 성공');
								} else {
									alert('회사 소개서 등록 중 오류가 발생했습니다.');
									return;
								}
							},
							
							error: function() {
								alert('회사 소개서 등록 중 서버오류가 발생했습니다.');
								return;
							}
						});		// ajax(userProfile) 끝
					},
					
					error: function() {
						alert("기업회원 회원번호를 얻어오는 중 서버오류가 발생했습니다.");
						return;
					}
				});		// ajax(userNOGet) 끝
				
				
				// 로고 사진을 등록하지 않고 회원가입 할 경우
				if($('#company-logo').val() == '') {
					// 회원가입하는 회원의 회원번호를 불러오는 companyNOGet을 비동기로 처리
					$.ajax({
						type: 'POST',
						url: '<c:url value="/company/companyNOGet" />',
						contentType: false,
						processData: false,
						
						success: function(companyNO) {
							// 로고사진없이 회원으로 등록하는 companyLogoNo를 비동기로 처리 (보내는 데이터 없음)
							$.ajax({
								type: 'POST',
								url: '<c:url value="/company/companyLogoNo/" />' + companyNO,
								contentType: false,
								processData: false,
								
								success: function(result) {
									if(result == 'NoLogo') {
										console.log('로고사진 없이 가입 성공');
									} else {
										alert('로고 사진 없이 가입 중 오류가 발생했습니다.');
										return;
									}
								},
								
								error: function() {
									alert('로고 사진 없이 가입 중 서버오류가 발생했습니다.');
									return;
								}
							});
						},
						
						error: function() {
							alert("기업회원 회원번호를 얻어오는 중 서버오류가 발생했습니다.");
							return;
						}
					});
				} else {		// 로고사진 등록하고 회원가입 할 경우		
					// 회원가입하는 회원의 회원번호를 불러오는 companyNOGet을 비동기로 처리
					$.ajax({
						type: 'POST',
						url: '<c:url value="/company/companyNOGet" />',
						contentType: false,
						processData: false,
						
						success: function(companyNO) {
							// 가상 Form을 생성한다.
							const formData = new FormData();
						
							const data = $('#company-logo');
							
							// 가상 Form에 받은 파일을 companyLogo이라는 이름으로 넣는다.
							formData.append('companyLogo', data[0].files[0]);
							
							// 프로필사진을 등록하는 companyLogo를 비동기로 처리
							$.ajax({
								type: 'POST',
								url: '<c:url value="/company/companyLogo/" />' + companyNO,
								contentType: false,
								processData: false,
								
								data: formData,
								
								success: function(result) {
									if(result == 'YesLogo') {
										console.log('로고사진 등록 성공');
									} else {
										alert('기업 로고 등록 중 오류가 발생했습니다.');
										return;
									}
								},
								
								error: function() {
									alert('기업 로고 등록 중 서버오류가 발생했습니다.');
									return;
								}
							});		// ajax(companyLogo) 끝
						},
						
						error: function() {
							alert("기업회원 회원번호를 얻어오는 중 서버오류가 발생했습니다. ");
							return;
						}
					});		// ajax(companyNOGet) 끝
				}
			} else {
				return;
			}
		});
		

	});		// jQuery 끝

</script>
