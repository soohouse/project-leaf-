<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="modal fade" id="modal-password-change" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header" style="background: #92bce0;">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h5 class="modal-title" id="myModalLabel" style="font-weight: bold;">비밀번호 변경</h5>
			</div>
			<div class="modal-body" style="width: 598px;">
				<div class="form-group" style="text-align: left;">
					
						<label style="text-align: left;">기존 비밀번호</label><br> 
						<input type="password" id="input-modal-old-password" class="form-control" placeholder="기존 비밀번호를 입력해주세요." style="margin-bottom: 30px;"><br> 
						
						<label>신규 비밀번호</label><br> 
						<input type="password" id="input-modal-new-password" class="form-control" placeholder="신규 비밀번호를 입력해주세요.">
						<span id="span-pw" style="display: block; margin-bottom: 16px;"></span><br>
						
						<label>신규 비밀번호 확인</label><br> 
						<input type="password" id="input-modal-new-password-check" class="form-control" placeholder="신규 비밀번호를 다시 입력해주세요.">

				</div>

			</div>
			<div class="modal-footer">
				<button type="button" id="btn-modal-password-change" class="btn btn-primary" style="display: none;">변경하기</button>
				<button type="button" id="btn-modal-password-change-company" class="btn btn-primary" style="display: none;">변경하기</button>

				<button type="button" class="btn btn-default" data-dismiss="modal">취소하기</button>
			</div>
		</div>
	</div>
</div>


<script>

	//비밀번호 형식 검사
	var PW = document.getElementById("input-modal-new-password");
	
	PW.onkeyup = function() {
		// 영문과 숫자 조합, 8 ~ 16길이
	    var regex = /^[A-Za-z0-9+]{8,16}$/;
	    
	    // 형식에 만족한다면
	    if(regex.test(document.getElementById("input-modal-new-password").value)) {
	    	document.getElementById("input-modal-new-password").style.borderColor = "green";
	    	
	        document.getElementById("span-pw").innerHTML = "사용 가능한 비밀번호입니다.";
	        document.getElementById("span-pw").style.color = "green";
	    } else {		// 형식에 만족하지 않는다면
	        document.getElementById("input-modal-new-password").style.borderColor = "red";
	        
	        document.getElementById("span-pw").innerHTML = "";
	    }
	}


	$(function() {
		
		// 일반회원 변경하기 버튼 클릭 시
		$('#btn-modal-password-change').click(function() {
			
			if(confirm('비밀번호를 변경하시겠습니까?')) {
				
				const oldPassword = $('#input-modal-old-password').val();
				const newPassword = $('#input-modal-new-password').val();
				const newPasswordCheck = $('#input-modal-new-password-check').val();
				const userNO = '${user.userNO}';
				
				
				// 신규 비밀번호 유효성 체크				
				if($('#span-pw').html() != '사용 가능한 비밀번호입니다.') {
					alert('비밀번호를 형식에 맞게 작성해주세요.');
					$('#span-pw').text('비밀번호 형식에 맞게 작성해주세요.');
					$('#span-pw').css('color', 'red');
					
					$('#input-modal-new-password').focus();
					return;
				}
				
				
				// 신규 비밀번호 확인과 일치하지 않을 시
				if(newPassword != newPasswordCheck) {
					alert('신규 비밀번호가 서로 일치하지 않습니다.');
					$('#input-modal-new-password-check').val('');
					$('#input-modal-new-password-check').focus();
					return;
				}
				
				
				$.ajax({
					type: 'POST',
					url: '<c:url value="/user/userPasswordChange" />',
					
					dataType: 'text',
					
					data: {
						'oldPassword': oldPassword,
						'newPassword': newPassword,
						'userNO': userNO
					},
					
					success: function(result) {
						
						if(result == 'YesChange') {
							
							// 로그아웃 처리 비동기 ajax
		    				$.ajax({
		    					type: 'POST',
		    					url: '<c:url value="/user/userLogout" />',
		    					contentType: 'application/json',
		    					
		    					success: function(result) {
		    						if(result == 'logoutSuccess') {
		    							alert('비밀번호가 변경되었습니다. 다시 로그인 해주세요.');
		    							
		    							// location.href는 단순 페이지 이동이라면, location.replace()는 해당 주소를 redirect하는 것과 비슷하다.
		    							location.replace('/');
		    						} else {
		    							alert('로그아웃이 정상적으로 이루어지지 않았습니다. 관리자에게 문의하세요.');
		    							return;
		    						}
		    					},
		    					
		    					error: function() {
		    						alert('로그아웃 처리 중 서버 오류가 발생했습니다.');
		    						return;
		    					}
		    				});		// ajax 끝
							
						} else {
							alert('기존 비밀번호가 일치하지 않습니다.');
							return;
						}
					},
					
					error: function() {
						alert('비밀번호 변경 중 서버오류가 발생했습니다.');
						return;
					}
				});
				
			} else {
				return false;
			}
			
		});
		
		
		// 기업회원 변경하기 버튼 클릭 시
		$('#btn-modal-password-change-company').click(function() {
			
			if(confirm('비밀번호를 변경하시겠습니까?')) {
				
				const oldPassword = $('#input-modal-old-password').val();
				const newPassword = $('#input-modal-new-password').val();
				const newPasswordCheck = $('#input-modal-new-password-check').val();
				const companyNO = '${company.companyNO}';
				
				
				// 신규 비밀번호 유효성 체크				
				if($('#span-pw').html() != '사용 가능한 비밀번호입니다.') {
					alert('비밀번호를 형식에 맞게 작성해주세요.');
					$('#span-pw').text('비밀번호 형식에 맞게 작성해주세요.');
					$('#span-pw').css('color', 'red');
					
					$('#input-modal-new-password').focus();
					return;
				}
				
				
				// 신규 비밀번호 확인과 일치하지 않을 시
				if(newPassword != newPasswordCheck) {
					alert('신규 비밀번호가 서로 일치하지 않습니다.');
					$('#input-modal-new-password-check').val('');
					$('#input-modal-new-password-check').focus();
					return;
				}
				
				
				$.ajax({
					type: 'POST',
					url: '<c:url value="/company/companyPasswordChange" />',
					
					dataType: 'text',
					
					data: {
						'oldPassword': oldPassword,
						'newPassword': newPassword,
						'companyNO': companyNO
					},
					
					success: function(result) {
						
						if(result == 'YesChange') {
							
							// 로그아웃 처리 비동기 ajax
		    				$.ajax({
		    					type: 'POST',
		    					url: '<c:url value="/company/companyLogout" />',
		    					contentType: 'application/json',
		    					
		    					success: function(result) {
		    						if(result == 'logoutSuccess') {
		    							alert('비밀번호가 변경되었습니다. 다시 로그인 해주세요.');
		    							
		    							// location.href는 단순 페이지 이동이라면, location.replace()는 해당 주소를 redirect하는 것과 비슷하다.
		    							location.replace('/');
		    						} else {
		    							alert('로그아웃이 정상적으로 이루어지지 않았습니다. 관리자에게 문의하세요.');
		    							return;
		    						}
		    					},
		    					
		    					error: function() {
		    						alert('로그아웃 처리 중 서버 오류가 발생했습니다.');
		    						return;
		    					}
		    				});		// ajax 끝
							
						} else {
							alert('기존 비밀번호가 일치하지 않습니다.');
							return;
						}
					},
					
					error: function() {
						alert('비밀번호 변경 중 서버오류가 발생했습니다.');
						return;
					}
				});
				
			} else {
				return false;
			}
			
		});
		
	});

</script>