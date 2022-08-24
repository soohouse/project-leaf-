<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="modal fade" id="modal-password-new-company" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
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
	
					<input type="hidden" id="hidden-company-ID">

						<label style="margin-top: 10px;">신규 비밀번호</label><br> 
						<input type="password" id="input-modal-password-new-company" class="form-control" placeholder="신규 비밀번호를 입력해주세요.">
						<span id="span-pw-company" style="display: block; margin-bottom: 16px;"></span><br>
						
						<label>신규 비밀번호 확인</label><br> 
						<input type="password" id="input-modal-password-new-check-company" class="form-control" placeholder="신규 비밀번호를 다시 입력해주세요.">

				</div>

			</div>
			<div class="modal-footer">
				<button type="button" id="btn-modal-password-new-company" class="btn btn-primary">변경하기</button>

				<button type="button" class="btn btn-default" data-dismiss="modal">취소하기</button>
			</div>
		</div>
	</div>
</div>


<script>

	//비밀번호 형식 검사
	var PW = document.getElementById("input-modal-password-new-company");
	
	PW.onkeyup = function() {
		// 영문과 숫자 조합, 8 ~ 16길이
	    var regex = /^[A-Za-z0-9+]{8,16}$/;
	    
	    // 형식에 만족한다면
	    if(regex.test(document.getElementById("input-modal-password-new-company").value)) {
	    	document.getElementById("input-modal-password-new-company").style.borderColor = "green";
	    	
	        document.getElementById("span-pw-company").innerHTML = "사용 가능한 비밀번호입니다.";
	        document.getElementById("span-pw-company").style.color = "green";
	    } else {		// 형식에 만족하지 않는다면
	        document.getElementById("input-modal-password-new-company").style.borderColor = "red";
	        
	        document.getElementById("span-pw-company").innerHTML = "";
	    }
	}


	$(function() {
		
		// 일반회원 변경하기 버튼 클릭 시
		$('#btn-modal-password-new-company').off().click(function() {
			
			if(confirm('비밀번호를 변경하시겠습니까?')) {
				
				const newPassword = $('#input-modal-password-new-company').val();
				const newPasswordCheck = $('#input-modal-password-new-check-company').val();
				const companyID = $('#hidden-company-ID').val();
				
				
				// 신규 비밀번호 유효성 체크				
				if($('#span-pw-company').html() != '사용 가능한 비밀번호입니다.') {
					alert('비밀번호를 형식에 맞게 작성해주세요.');
					$('#span-pw-company').text('비밀번호 형식에 맞게 작성해주세요.');
					$('#span-pw-company').css('color', 'red');
					
					$('#input-modal-password-new-company').focus();
					return;
				}
				
				
				// 신규 비밀번호 확인과 일치하지 않을 시
				if(newPassword != newPasswordCheck) {
					alert('신규 비밀번호가 서로 일치하지 않습니다.');
					$('#input-modal-new-password-check-company').val('');
					$('#input-modal-new-password-check-company').focus();
					return;
				}
				
				
				$.ajax({
					type: 'POST',
					url: '<c:url value="/company/companyPWReset" />',
					
					dataType: 'text',
					
					data: {
						'newPassword': newPassword,
						'companyID': companyID
					},
					
					success: function(result) {
						
						if(result == 'YesCompanyPWReset') {
							alert('성공적으로 비밀번호를 재설정 하였습니다.');
							location.replace('/');
						} else {
							alert('비밀번호 재설정 중 오류가 발생했습니다.');
							return;
						}
					},
					
					error: function() {
						alert('비밀번호 재설정 중 서버오류가 발생했습니다.');
						return;
					}
				});
				
			} else {
				return false;
			}
			
		});
		
	});

</script>