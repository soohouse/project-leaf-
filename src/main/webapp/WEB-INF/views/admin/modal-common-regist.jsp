<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="modal fade" id="modal-common-regist" role="dialog" data-backdrop="static">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			
			<div class="modal-body modal-body-sections">
				<a href="#" class="list-group-item active notice-list-top"> 
					<span class="main-board-title" style="color: #305423; font-size: 16px;">공통코드 등록</span>
				</a>

				<form class="form-horizontal" action="<c:url value='/admin/commonRegist' />" method="post" id="commonRegistForm">
					  <div class="form-group">
					    <label for="inputEmail3" class="col-sm-3 control-label">분류</label>
					    <select id="select-common" class="form-control" style="width: 36%; height: 28px; font-size: 12px;" name="upperCODE">
					    	<option value="ADM000" selected>회원 관리자 여부</option>
					    	<option value="CRG000">기업회원 가입 승인 여부</option>
					    	<option value="PST000">프로젝트 모집 상태</option>
					    	<option value="SPT000">프로젝트 지원 상태</option>
					    </select>
					  </div>
					  <div class="form-group">
					    <label for="inputEmail3" class="col-sm-3 control-label" style="text-align: left;">코드명</label>
					    <input id="common-code" type="text" class="form-control" style="width: 16%; height: 28px; font-size: 13px;" name="commonCODE" value="ADM000">
					  </div>
					  <div class="form-group">
					    <label for="inputEmail3" class="col-sm-3 control-label" style="text-align: left;">코드내용</label>
					    <textarea id="common-value" class="form-control" rows="3" cols="20" wrap="hard" style="width: 70%; height: 100px; font-size: 13px; resize: none;" name="commonValue"></textarea>
					  </div>
				</form>
		    </div>
		    
		    <div class="modal-footer" style="clear: both;">
		        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		        <button id="btn-common-regist-submit" type="button" class="btn btn-success">등록</button>
		    </div>
			
				
		</div>
	</div>
</div>

<script>
	
	$(function() {
		
		$('#select-common').change(function() {
			$('#common-code').val($('#select-common').val());
		});
		
		
		// 등록 버튼 클릭 시
		$('#btn-common-regist-submit').click(function() {
			
			const commonCODE = $('#common-code').val();
			
			console.log(commonCODE);
			
			// 코드 입력 유효성 체크
			if($('#common-code').val() == '') {
				alert('코드는 필수값입니다. 코드를 입력해주세요.');
				$('#common-code').focus();
				return;
			}
			
			
			if($('#common-code').val() == 'ADM000') {
				alert('이미 등록된 코드입니다. 다른 코드를 입력해주세요.');
				$('#common-code').focus();
				return;
			}
			
			
			if($('#common-code').val() == 'CRG000') {
				alert('이미 등록된 코드입니다. 다른 코드를 입력해주세요.');
				$('#common-code').focus();
				return;
			}
			
			
			if($('#common-code').val() == 'SPT000') {
				alert('이미 등록된 코드입니다. 다른 코드를 입력해주세요.');
				$('#common-code').focus();
				return;
			}
			
			
			if($('#common-code').val() == 'PST000') {
				alert('이미 등록된 코드입니다. 다른 코드를 입력해주세요.');
				$('#common-code').focus();
				return;
			}
			
			
			// 코드 중복 여부 체크
			$.ajax({
				type: 'POST',
				url: '<c:url value="/admin/commonCheck" />',
				
				dataType: "text",
				data: {
					'commonCODE': commonCODE
				},
				
				success: function(result) {
					if(result == 'commonCheckSuccess') {
						$('#commonRegistForm').submit();
					} else {
						alert('이미 등록된 코드입니다. 다른 코드를 입력해주세요.');
						return;
					}
				},
				
				error: function() {
					alert('코드 중복 체크 중 서버오류가 발생했습니다.');
					return;
				}
			});
			
		});
		
	});

</script>