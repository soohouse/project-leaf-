<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal fade" id="modal-members-company" role="dialog"
	data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-body modal-body-sections">
				<a href="#" class="list-group-item active notice-list-top"> <span
					class="main-board-title" style="color: #000686; font-size: 16px;">기업정보</span>
				</a>

				<div style="display: inline-block; margin-top: 20px;">
					<img id="members-company-logo" alt="사진" width="160px" height="160px"
						style="border-radius: 120px;">

					<div style="width: 160px;">
						<h3 id="members-main-company-id" style="text-align: center;">&nbsp;</h3>
						<p id="members-main-company-name"
							style="text-align: center; font-size: 12px; color: #808080;">&nbsp;</p>
					</div>
				</div>

				<input type="hidden" id="hidden-members-company-no">



				<div
					style="display: inline-block; position: relative; left: 40px; margin-top: 10px; width: 360px;">
					<div class="form-group">
						<label for="inputEmail3" class="control-label form-inline"
							style="width: 100px;">ID</label>
						<p id="members-company-id"
							style="font-size: 13px; display: inline-block; vertical-align: top;">&nbsp;</p>
					</div>
					<div class="form-group">
						<label for="inputEmail3" class="control-label"
							style="width: 100px;">이름</label>
						<p id="members-company-name"
							style="font-size: 13px; display: inline-block; vertical-align: top;">&nbsp;</p>

					</div>
					<div class="form-group">
						<label for="inputEmail3" class="control-label"
							style="width: 100px;">전화번호</label>
						<p id="members-company-phone"
							style="font-size: 13px; display: inline-block; vertical-align: top;">&nbsp;</p>

					</div>
					<div class="form-group">
						<label for="inputEmail3" class="control-label"
							style="width: 100px;">이메일</label>
						<p id="members-company-email"
							style="font-size: 13px; display: inline-block; vertical-align: top;">&nbsp;</p>

					</div>
					<div class="form-group">
						<label for="inputEmail3" class="control-label"
							style="width: 100px;">소개</label>
						<p id="members-company-intro"
							style="font-size: 13px; display: inline-block; vertical-align: top;">&nbsp;</p>

					</div>
					<div class="form-group">
						<label for="inputEmail3" class="control-label"
							style="width: 100px;">회사소개서</label>
						<p id="members-company-intro-realname"
							style="font-size: 13px; display: inline-block; vertical-align: top; text-decoration: underline; color: blue; cursor: pointer;">&nbsp;</p>

					</div>



				</div>

				<div class="form-group">
					<textarea id="members-company-message" rows="6" placeholder="쪽지 내용을 입력하세요."
						style="width: 530px; resize: none;"></textarea>
				</div>

			</div>

			<div class="modal-footer" style="clear: both;">
				<button type="button" class="btn btn-danger" style="float:left;">강제탈퇴</button>
				<button type="button" class="btn btn-success" style="float:left;">강제수정</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-info" id="btn-members-company-message">쪽지발송</button>
			</div>


		</div>
	</div>
</div>

<script>
	
	// jQuery 시작
	$(function() {
		
		// 회사소개서 클릭 시 다운로드 되도록
		$('#members-company-intro-realname').off().click(function() {

			const companyNO = $('#hidden-members-company-no').val();
			
			location.href="/company/companyIntro/download?companyNO=" + companyNO;
		});
		
		
		// 기업정보 모달에서 쪽지 버튼을 눌렀을 경우 발생하는 이벤트
		$('#btn-members-company-message').off().click(function() {
			
				if(confirm('쪽지를 발송하시겠습니까?')) {
					const companyNO = $('#hidden-members-company-no').val();
					const companyMessageContent = $('#members-company-message').val();
					const userName = '${user.userName}';
					
					
				$.ajax({
					type: 'POST',
					url: '<c:url value="/adminMessage/adminSendCompanyMessage" />',
					contentType: 'application/json',
					
					dataType: 'text',
					data: JSON.stringify ({
						'companyMessageWriter': userName,
						'companyMessageContent': companyMessageContent,
						'companyNO': companyNO
					}),
					
					success: function(result) {
						if(result == 'yes') {
							alert('쪽지를 성공적으로 발송하였습니다.');
							location.replace('/membersList/membersList');
						}
					},
					
					error: function() {
						alert('쪽지 발송이 실패하였습니다.');
						return;
					}
				});
				
			} else {
				return false;
			}
		});
		
		
		
	});		// jQuery 끝

</script>