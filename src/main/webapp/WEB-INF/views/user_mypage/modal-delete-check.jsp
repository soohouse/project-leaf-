<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="modal fade" id="modal-delete-check" role="dialog" data-backdrop="static">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			
			<div class="modal-body modal-body-sections" style="padding-bottom: 0;">
				
				<input type="hidden" id="hidden-apply-no">
				<input type="hidden" id="hidden-user-no">
				
				<div style="width: 264px;">
					  <div class="form-group">
					    <label class="control-label" style="display: block; font-family: none; font-weight: 500; font-size: 14px;">계정 비밀번호를 입력해주세요.</label>
					    <input id="input-password-check" class="form-control" type="password" style="width: 100%; margin-top: 10px;">
					  </div>
				</div>
			
		    </div>
		    
		    <div class="modal-footer" style="clear: both;">
		   		<button type="button" id="btn-password-check" class="btn btn-primary">확인</button>
		        <button type="button" id="btn-password-check-close" class="btn btn-default">취소</button>
		    </div>
			
				
		</div>
	</div>
</div>
