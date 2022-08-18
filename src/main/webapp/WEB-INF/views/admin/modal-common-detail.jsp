<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="modal fade" id="modal-common-detail" role="dialog" data-backdrop="static">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			
			<div class="modal-body modal-body-sections">
				<a href="#" class="list-group-item active notice-list-top"> 
					<span class="main-board-title" style="color: #000686; font-size: 16px;">공통코드 상세 내용</span>
				</a>

				<form action="<c:url value='/admin/commonDelete' />" class="form-horizontal" method="post" id="commonDeleteForm">
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-3 control-label">분류</label>
				    <p id="modal-common-upperValue" class="col-sm-9" style="font-size: 13px;">&nbsp;</p>
				  </div>
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-3 control-label">코드명</label>
				    <p id="modal-common-commonCODE" class="col-sm-9" style="font-size: 13px;">&nbsp;</p>
				    <input type="hidden" id="hidden-common-code" name="commonCODE">
				  </div>
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-3 control-label">코드내용</label>
				    <p id="modal-common-commonValue" class="col-sm-9" style="height: 100px; font-size: 13px; word-wrap: break-word;">&nbsp;</p>
				    <input type="hidden" id="hidden-common-value" name="commonValue">
				  </div>
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-3 control-label">사용여부</label>
				    <p id="modal-common-commonUse" class="col-sm-9" style="font-size: 13px;">&nbsp;</p>
				    <input type="hidden" id="hidden-common-use" name="commonUse">
				  </div>
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-3 control-label">상위코드</label>
				    <p id="modal-common-upperCODE" class="col-sm-9" style="font-size: 13px;" name="upperCODE">&nbsp;</p>
				    <input type="hidden" id="hidden-common-upper" name="upperCODE">
				  </div>
				</form>
			
		    </div>
		    
		    <div class="modal-footer" style="clear: both;">
		    	<a id="btn-modal-common-delete" class="pull-left" style="color: #760101; text-decoation: underline; line-height: 2.5em; margin-left: 10px; cursor: pointer;">삭제</a>
		        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary" id="btn-modal-common-modify-yes" style="display: none;">사용</button>
		        <button type="button" class="btn btn-danger" id="btn-modal-common-modify-no" style="display: none;">사용중지</button>
		    </div>
			
				
		</div>
	</div>
</div>

<script>
	
	// jQuery 시작
	$(function() {
		
		// 공통코드 사용중지 버튼 클릭 시
		$('#btn-modal-common-modify-no').off().click(function() {
			
			if(confirm('해당 공통코드 사용을 중지하시겠습니까?')) {
				
				const code = $('#modal-common-commonCODE').text();
				
				$.ajax({
					type: 'POST',
					url: '<c:url value="/admin/commonModifyNo" />',

					dataType: 'text',
					data: {
						'commonCODE': code
					},
					
					success: function(result) {
						if(result == 'NoCommonModify') {
							alert('해당 코드 사용을 중지하였습니다.');
							location.replace('<c:url value="/admin/commonCODE" />');
						}
					},
					
					error: function() {
						alert('사용 여부를 수정하는 중 서버오류가 발생했습니다.');
						return;
					}
				});
				
			} else {
				return false;
			}

		});
		
		
		// 공통코드 사용 버튼 클릭 시
		$('#btn-modal-common-modify-yes').off().click(function() {
			
			if(confirm('해당 공통코드를 사용하시겠습니까?')) {
				
				const code = $('#modal-common-commonCODE').text();
				
				$.ajax({
					type: 'POST',
					url: '<c:url value="/admin/commonModifyYes" />',

					dataType: 'text',
					data: {
						'commonCODE': code
					},
					
					success: function(result) {
						if(result == 'YesCommonModify') {
							alert('해당 코드를 사용하도록 설정하였습니다.');
							location.replace('<c:url value="/admin/commonCODE" />');
						} else {
							alert('코드 사용 설정 중 오류가 발생했습니다.');
							return;
						}
					},
					
					error: function() {
						alert('사용 여부를 수정하는 중 서버오류가 발생했습니다.');
						return;
					}
				});
				
			} else {
				return false;
			}

		});
		
		
		// 공통코드 삭제 버튼 클릭 시
		$('#btn-modal-common-delete').off().click(function() {
			
			if(confirm('정말 해당코드를 삭제하시겠습니까?')) {
				$('#commonDeleteForm').submit();
			} else {
				return false;
			}
		});
		
	});		// jQuery 끝

</script>