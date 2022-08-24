<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="modal fade" id="modal-apply-list" role="dialog" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">
			
			<div class="modal-header" style="background: #3071A9;">
				<h5 class="modal-title" style="color: white; text-align: center;">
					지원자 목록
				</h5>
				<button type="button" class="close" data-dismiss="modal" style="position: relative; top: -25px;">&times;</button>
			</div>
			
			<div class="modal-body modal-body-sections">
				<a href="#" class="list-group-item active notice-list-top" style="cursor: default;"> 
					<span id="span-company-name" style="color: #737373; font-size: 13px; margin-left: -10px; display: block;">&nbsp;</span>
					<h5 id="h5-project-name" style="color: black; font-weight: bold; margin-left: -10px; display: inline-block;">&nbsp;</h5>
					<span class="pull-right" style="font-size: 12px; color: #737373;">지원자 : <span id="span-apply-count" style="color: red;"></span> 명</span>
				</a>
				
				<input type="hidden" id="hidden-project-no" value="${projectNO}">
				
				<table class="table table-bordered table-condensed" style="margin-top: 20px;">
					<thead style="width: 10px; font-size: 13px; background: #CFD5F5;">
						<tr style="font-family: sans-serif; font-size: 12px;">
							<th style="width: 7%;">순번</th>
							<th style="width: 20%;">ID</th>
							<th style="width: 10%;">이름</th>
							<th style="width: 18%;">전화번호</th>
							<th style="width: 20%;">지원 날짜</th>
							<th style="width: 25%;">지원 현황</th>
						</tr>
					</thead>
					<tbody id="modalApplyList" style="width: 10px; font-size: 10px; background: #FCFCFC;">
						
						
							
							
						
	
					</tbody>
				</table>

			
		    </div>
		    
		    <div class="modal-footer" style="clear: both;">
		        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		    </div>
			
				
		</div>
	</div>
</div>
