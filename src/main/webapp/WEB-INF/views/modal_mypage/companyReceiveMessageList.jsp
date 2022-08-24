<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="modal fade" id="modal-company-receive-message" role="dialog" data-backdrop="static">
	<div class="modal-dialog">
	
		<!-- 유저쪽지리스트 모달창 -->
		<div class="modal-content">

			<div class="modal-body modal-body-sections" style="height: 500px; overflow-y: auto;">
				<a href="#" class="list-group-item active notice-list-top"> <span class="main-board-title" style="color: #000686; font-size: 16px;">받은쪽지함</span></a> 
				<input type="hidden" id="hidden-company-no">
				<div id="companyMessageList">
					

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



