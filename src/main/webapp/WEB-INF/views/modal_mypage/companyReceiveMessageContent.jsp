<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal fade" id="modal-company-message-content" role="dialog" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-body modal-body-sections" style="height: 500px; overflow-y: auto;">
				<a href="#" class="list-group-item active notice-list-top"> <span class="main-board-title" style="color: #000686; font-size: 16px;">쪽지내용</span></a> 
				<input type="hidden" id="hidden-company-no">
				<div id="companyReceiveMessageContent">
				
					<div style="height:415px; padding:20px;">
						<div style="height:55px;">
							<div class="col-md-2" style="border:1px solid; background:lightcyan; height:55px;"><p>보낸이</p></div>
							<div class="col-md-4" style="border:1px solid; height:55px; margin:auto;"><p id="modal-message-detail-from2"></p></div>
							<div class="col-md-2" style="border:1px solid; background:lightcyan; height:55px;"><p>날짜</p></div>
							<div id="modal-message-detail-date2"class="col-md-4" style="border:1px solid; height:55px;"><p></p></div>
						</div>
						<div style="height:325px;">
							<div class="col-md-2" style="border:1px solid; background:lightcyan; height:325px;"><p>내용</p></div>
							<div id="modal-message-detail-content2" class="col-md-10" style="border:1px solid; height:325px;"><p></p></div>
						</div>
						
					</div>



				</div>
			</div>
			<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">목록으로</button>
			</div>
			
			
		</div>
	</div>
</div>

<script>

	
</script>



