<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="modal fade" id="modal-apply-check" role="dialog" data-backdrop="static">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			
			<div class="modal-body modal-body-sections" style="padding-bottom: 0;">
				
				<input type="hidden" id="hidden-apply-no">
				<input type="hidden" id="hidden-user-no">
				
				<div style="width: 264px;">
					  <div class="form-group">
					    <label for="inputEmail3" class="control-label" style="display: block; font-family: none; font-weight: 500; font-size: 14px;">입력란에 &nbsp;<span style="color: red;">"확인"</span> 을 입력해주세요.</label>
					    <input id="input-check" class="form-control" type="text" style="width: 100%; margin-top: 10px;">
					  </div>
				</div>
			
		    </div>
		    
		    <div class="modal-footer" style="clear: both;">
		   		<button type="button" id="btn-check" class="btn btn-primary">확인</button>
		        <button type="button" id="btn-check-close" class="btn btn-default">취소</button>
		    </div>
			
				
		</div>
	</div>
</div>
