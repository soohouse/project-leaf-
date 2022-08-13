<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="modal fade" id="modal-company-detail" role="dialog" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			
			<div class="modal-body modal-body-sections">
				<a href="#" class="list-group-item active notice-list-top"> 
					<span class="main-board-title" style="color: #000686; font-size: 16px;">기업회원 상세 정보</span>
				</a>

				<div style="display: inline-block; margin-top: 20px;">
				  	<img id="modal-company-logo" alt="사진" width="160px" height="160px" style="border-radius: 120px;">
				  	
				  	<div style="width: 160px;">
				  		<h3 id="modal-main-company-id" style="text-align: center;">&nbsp;</h3>
				  		<p id="modal-main-company-name" style="text-align: center; font-size: 12px; color: #808080;">&nbsp;</p>
				  	</div>
				</div>
				
				<input type="hidden" id="hidden-company-no">
				
				<div style="display: inline-block; position: relative; left: 40px; margin-top: 10px; width: 360px;">
					  <div class="form-group">
					    <label for="inputEmail3" class="control-label form-inline" style="width: 100px;">ID</label>
					    <p id="modal-company-id" style="font-size: 13px; display: inline-block; vertical-align: top;">&nbsp;</p>
					  </div>
					  <div class="form-group">
					    <label for="inputEmail3" class="control-label" style="width: 100px;">기업명</label>
					    <p id="modal-company-name" style="font-size: 13px; display: inline-block; vertical-align: top;">&nbsp;</p>
					    
					  </div>
					  <div class="form-group">
					    <label for="inputEmail3" class="control-label" style="width: 100px;">기업 전화번호</label>
					    <p id="modal-company-phone" style="font-size: 13px; display: inline-block; vertical-align: top;">&nbsp;</p>
					    
					  </div>
					  <div class="form-group">
					    <label for="inputEmail3" class="control-label" style="width: 100px;">기업 이메일</label>
					    <p id="modal-company-email" style="font-size: 13px; display: inline-block; vertical-align: top;">&nbsp;</p>
					    
					  </div>
					  <div class="form-group">
					    <label for="inputEmail3" class="control-label" style="width: 100px;">회사 소개서</label>
					    <p id="modal-company-intro-realname" style="font-size: 13px; display: inline-block; vertical-align: top; text-decoration: underline; color: blue; cursor: pointer;">&nbsp;</p>
					    
					  </div>
					  <div class="form-group">
					    <label for="inputEmail3" class="control-label" style="width: 100px;">승인 상태</label>
					    <p id="modal-company-common-value" style="font-size: 13px; display: inline-block; vertical-align: top;">&nbsp;</p>
					    
					  </div>
				</div>
			
		    </div>
		    
		    <div class="modal-footer" style="clear: both;">
		        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-warning" id="btn-modal-company-accept">가입 승인</button>
		    </div>
			
				
		</div>
	</div>
</div>

<script>
	
	// jQuery 시작
	$(function() {
		
		// 회사 소개서 클릭 시 다운로드 되도록
		$('#modal-company-intro-realname').off().click(function() {

			const companyNO = $('#hidden-company-no').val();
			
			location.href="<c:url value='/company/companyIntro/download?companyNO=' />" + companyNO;
		});
		
		
		// 가입 승인 버튼 클릭 시
		$('#btn-modal-company-accept').off().click(function() {
			
			if(confirm('해당 기업의 가입을 승인하시겠습니까?')) {
				
				const companyNO = $('#hidden-company-no').val();
			
				$.ajax({
					type: 'POST',
					url: '<c:url value="/admin/companyAccept" />',
					
					dataType: 'text',
					data: {
						'companyNO': companyNO
					},
					
					success: function(result) {
						if(result == 'YesCompanyAccept') {
							alert('해당 기업 가입을 승인하였습니다.');
							location.replace('/admin/companyAccept');
						} else {
							alert('가입 승인 중 오류가 발생했습니다.');
							return;
						}
					},
					
					error: function() {
						alert('가입 승인 중 서버오류가 발생했습니다.');
						return;
					}
				});
				
			} else {
				return false;
			}
			
		})
		
		
		
	});		// jQuery 끝

</script>