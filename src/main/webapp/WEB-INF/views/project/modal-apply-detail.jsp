<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("newLineChar", "\n"); %>

<style>

	::-webkit-scrollbar {
 		 display: none;
	}

</style>

<div class="modal fade" id="modal-apply-detail" role="dialog" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			
			<div class="modal-body modal-body-sections">
				<a href="#" class="list-group-item active notice-list-top"> 
					<span class="main-board-title" style="color: #000686; font-size: 16px;">지원자 상세 정보</span>
				</a>

				<div style="display: inline-block; margin-top: 20px;">
				  	<img id="modal-user-profile" alt="사진" width="160px" height="160px" style="border-radius: 120px;">
				  	
				  	<div style="width: 160px;">
				  		<h3 id="modal-main-user-id" style="text-align: center;">&nbsp;</h3>
				  		<p id="modal-main-user-name" style="text-align: center; font-size: 12px; color: #808080;">&nbsp;</p>
				  	</div>
				</div>
				
				<input type="hidden" id="hidden-apply-no">
				<input type="hidden" id="hidden-user-no">
				
				<div style="display: inline-block; position: relative; left: 40px; margin-top: 10px; width: 360px;">
					  <div class="form-group">
					    <label for="inputEmail3" class="control-label form-inline" style="width: 100px;">ID</label>
					    <p id="modal-user-id" style="font-size: 13px; display: inline-block; vertical-align: top;">&nbsp;</p>
					  </div>
					  <div class="form-group">
					    <label for="inputEmail3" class="control-label" style="width: 100px;">이름</label>
					    <p id="modal-user-name" style="font-size: 13px; display: inline-block; vertical-align: top;">&nbsp;</p>
					    
					  </div>
					  <div class="form-group">
					    <label for="inputEmail3" class="control-label" style="width: 100px;">전화번호</label>
					    <p id="modal-user-phone" style="font-size: 13px; display: inline-block; vertical-align: top;">&nbsp;</p>
					    
					  </div>
					  <div class="form-group">
					    <label for="inputEmail3" class="control-label" style="width: 100px;">이메일</label>
					    <p id="modal-user-email" style="font-size: 13px; display: inline-block; vertical-align: top;">&nbsp;</p>
					    
					  </div>
					  <div class="form-group">
					    <label for="inputEmail3" class="control-label" style="width: 100px;">소개</label>
					    <p id="modal-user-intro" style="font-size: 13px; display: inline-block; vertical-align: top;">&nbsp;</p>
					    
					  </div>
					  <div class="form-group">
					    <label for="inputEmail3" class="control-label" style="width: 100px;">이력서</label>
					    <p id="modal-user-resume-realname" style="font-size: 13px; display: inline-block; vertical-align: top; text-decoration: underline; color: blue; cursor: pointer;">&nbsp;</p>
					    
					  </div>
					  <div class="form-group">
					    <label for="inputEmail3" class="control-label" style="width: 100px;">지원 현황</label>
					    <p id="modal-user-common-value" style="font-size: 13px; display: inline-block; vertical-align: top;">&nbsp;</p>
					    
					  </div>
				</div>
				
				<div class="form-group">
					<label for="inputEmail3" class="control-label" style="display: block;">담당자에게 전할 메세지</label>
					    <div id="modal-user-apply-msg" style="height: 120px; border: 1px solid #C7C7C7; padding: 10px; overflow: auto;"></div>
				</div>
			
		    </div>
		    
		    <div class="modal-footer" style="clear: both;">
		        <button type="button" class="btn" id="btn-modal-apply-accept-1" style="background: #097500; color: white; display: none;">1차 서류 합격 처리</button>
		        <button type="button" class="btn" id="btn-modal-apply-accept-2" style="background: #712D04; color: white; display: none;">2차 면접 합격 처리</button>
		        <button type="button" class="btn" id="btn-modal-apply-accept-yes" style="background: blue; color: white; display: none;">최종 합격 처리</button>
		        <button type="button" class="btn" id="btn-modal-apply-accept-no" style="background: #AE0000; color: white;">불합격 처리</button>
		        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		    </div>
			
			<%@ include file="modal-apply-check.jsp" %>
				
		</div>
	</div>
</div>

<script>
	
	// jQuery 시작
	$(function() {
		
		// 이력서 클릭 시 다운로드 되도록
		$('#modal-user-resume-realname').off().click(function() {

			const userNO = $('#hidden-user-no').val();
			
			location.href="<c:url value='/user/userResume/download?userNO=' />" + userNO;
		});
		
		
		// 1차 서류 심사 합격 버튼 클릭 시
		$('#btn-modal-apply-accept-1').off().click(function() {
			
			if(confirm('해당 지원자의 1차 서류 심사를 합격처리 하시겠습니까?')) {
				
				// 확인 모달 창을 띄워서 재확인
				$('#modal-apply-check').modal('show');
				
				
				// 확인 버튼을 클릭 시
				$('#btn-check').off().click(function() {
					
					const checkMsg = $('#input-check').val();
					
					if(checkMsg == '확인') {
						
						const applyNO = $('#hidden-apply-no').val();
						
						$.ajax({
							type: 'POST',
							url: '<c:url value="/project/applySetPrimary" />',
							
							dataType: 'text',
							data: {
								'applyNO': applyNO
							},
							
							success: function(result) {
								if(result == 'YesApplySetPrimary') {
									alert('해당 지원자의 1차 서류 심사를 합격처리 하였습니다.');
									location.replace('<c:url value="/project/projectMyApply" />');
								} else {
									alert('합격 처리 중 오류가 발생했습니다.');
									return;
								}
							},
							
							error: function() {
								alert('합격 처리 중 서버오류가 발생했습니다.');
								return;
							}
						});
						
					} else {
						alert('메세지가 올바르지 않습니다.');
						$('#input-check').val('');
						$('#input-check').focus();
						return;
					}
				});
				
				
				// 취소 버튼 클릭 시
				$('#btn-check-close').off().click(function() {
					$('#modal-apply-check').modal('hide');
				});
				
			} else {
				return false;
			}
		});
		
		
		// 2차 면접 인터뷰 심사 합격 버튼 클릭 시
		$('#btn-modal-apply-accept-2').off().click(function() {
			
			if(confirm('해당 지원자의 2차 면접 인터뷰 심사를 합격처리 하시겠습니까?')) {
				
				// 확인 모달 창을 띄워서 재확인
				$('#modal-apply-check').modal('show');
				
				
				// 확인 버튼을 클릭 시
				$('#btn-check').off().click(function() {
					
					const checkMsg = $('#input-check').val();
					
					if(checkMsg == '확인') {
						
						const applyNO = $('#hidden-apply-no').val();
						
						$.ajax({
							type: 'POST',
							url: '<c:url value="/project/applySetSecondary" />',
							
							dataType: 'text',
							data: {
								'applyNO': applyNO
							},
							
							success: function(result) {
								if(result == 'YesApplySetSecondary') {
									alert('해당 지원자의 2차 면접 인터뷰 심사를 합격처리 하였습니다.');
									location.replace('<c:url value="/project/projectMyApply" />');
								} else {
									alert('합격 처리 중 오류가 발생했습니다.');
									return;
								}
							},
							
							error: function() {
								alert('합격 처리 중 서버오류가 발생했습니다.');
								return;
							}
						});
						
					} else {
						alert('메세지가 올바르지 않습니다.');
						$('#input-check').val('');
						$('#input-check').focus();
						return;
					}
				});
				
				
				// 취소 버튼 클릭 시
				$('#btn-check-close').off().click(function() {
					$('#modal-apply-check').modal('hide');
				});
				
				
			} else {
				return false;
			}
		});
		
		
		// 최종 합격 버튼 클릭 시
		$('#btn-modal-apply-accept-yes').off().click(function() {
			
			if(confirm('해당 지원자를 최종 합격처리 하시겠습니까?')) {
				
				// 확인 모달 창을 띄워서 재확인
				$('#modal-apply-check').modal('show');
				
				
				// 확인 버튼을 클릭 시
				$('#btn-check').off().click(function() {
					
					const checkMsg = $('#input-check').val();
					
					if(checkMsg == '확인') {
						
						const applyNO = $('#hidden-apply-no').val();
						
						$.ajax({
							type: 'POST',
							url: '<c:url value="/project/applySetFinally" />',
							
							dataType: 'text',
							data: {
								'applyNO': applyNO
							},
							
							success: function(result) {
								if(result == 'YesApplySetFinally') {
									alert('해당 지원자를 최종 합격처리 하였습니다.');
									location.replace('<c:url value="/project/projectMyApply" />');
								} else {
									alert('합격 처리 중 오류가 발생했습니다.');
									return;
								}
							},
							
							error: function() {
								alert('합격 처리 중 서버오류가 발생했습니다.');
								return;
							}
						});
						
					} else {
						alert('메세지가 올바르지 않습니다.');
						$('#input-check').val('');
						$('#input-check').focus();
						return;
					}
				});
				
				
				// 취소 버튼 클릭 시
				$('#btn-check-close').off().click(function() {
					$('#modal-apply-check').modal('hide');
				});

			} else {
				return false;
			}
		});
		
		
		// 불합격 버튼 클릭 시
		$('#btn-modal-apply-accept-no').off().click(function() {
			
			if(confirm('해당 지원자를 불합격 처리 하시겠습니까?')) {
				
				// 확인 모달 창을 띄워서 재확인
				$('#modal-apply-check').modal('show');
				
				
				// 확인 버튼을 클릭 시
				$('#btn-check').off().click(function() {
					
					const checkMsg = $('#input-check').val();
					
					if(checkMsg == '확인') {
						
						const applyNO = $('#hidden-apply-no').val();
						
						$.ajax({
							type: 'POST',
							url: '<c:url value="/project/applySetNo" />',
							
							dataType: 'text',
							data: {
								'applyNO': applyNO
							},
							
							success: function(result) {
								if(result == 'YesApplySetNo') {
									alert('해당 지원자를 불합격 처리 하였습니다.');
									location.replace('<c:url value="/project/projectMyApply" />');
								} else {
									alert('불합격 처리 중 오류가 발생했습니다.');
									return;
								}
							},
							
							error: function() {
								alert('불합격 처리 중 서버오류가 발생했습니다.');
								return;
							}
						});
						
					} else {
						alert('메세지가 올바르지 않습니다.');
						$('#input-check').val('');
						$('#input-check').focus();
						return;
					}
				});
				
				
				// 취소 버튼 클릭 시
				$('#btn-check-close').off().click(function() {
					$('#modal-apply-check').modal('hide');
				});

			} else {
				return false;
			}
		});
		
	});		// jQuery 끝

</script>