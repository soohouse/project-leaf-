<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal fade" id="modal-company-send-message" role="dialog" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-body modal-body-sections" style="height: 500px; overflow-y: auto;">
				<div class="list-group-item active notice-list-top"> <span class="main-board-title" style="color: #000686; font-size: 16px;">보낸쪽지함&nbsp;&nbsp;<span id="" style="color: red;">&nbsp;&nbsp;</span></span><span style="float:right; font-size:10px; color:#571212; padding-top:15px;">* 쪽지는 날짜기준 7일 뒤 자동으로 삭제됩니다.</span></div> 
				<input type="hidden" id="hidden-user-no">
				<div id="sendmailList">
				
				</div>

			</div>
			<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			</div>
			
			
		</div>
	</div>
</div>

<script>
	
</script>



