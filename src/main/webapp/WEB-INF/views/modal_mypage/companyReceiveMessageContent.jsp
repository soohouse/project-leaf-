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
				
					<table class="table table-bordered" style="border-collapse:unset; border-spacing:0;">
						<thead>
							<tr>
								<th style="width:20%; background:#edffde; text-align:center; font-size:13px;">보낸이</th>
								<th style="width:30%; font-weight:normal; font-size:13px;" id="modal-message-detail-from2"></th>
								<th style="width:20%; background:#edffde; text-align:center; font-size:13px;">날&nbsp;짜</th>
								<th style="width:30%; font-weight:normal; font-size:13px;" id="modal-message-detail-date2"></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="width:20%; background:#edffde; font-weight:bold; text-align:center; font-size:13px;">내&nbsp;용</td>
								<td colspan="3" id="modal-message-detail-content2" style="overflow:auto; height:354px; font-size:13px;"></td>
							</tr>	
						</tbody>
					
					
					</table>



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



