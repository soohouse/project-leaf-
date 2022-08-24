<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="modal fade" id="modal-ID-PW-find-company" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header" style="background: #3071A9;">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h5 class="modal-title" id="myModalLabel" style="color: white; text-align: center;">ID / PW 찾기</h5>
			</div>
			<div class="modal-body" style="width: 598px;">
			
				<ul class="nav nav-tabs" style="text-align: center; margin-top: 10px; font-weight: 700;">
				  <li role="presentation" class="nav-item active">
				  	<a href="#company-id-find" id="btn-tab-company-id-find" data-toggle="tab" style="color: #3071A9;">ID 찾기</a>
				  </li>
				  <li role="presentation" class="nav-item">
				  	<a href="#company-pw-find" id="btn-tab-company-pw-find" data-toggle="tab" style="color: #3071A9;">PW 찾기</a>
				  </li>
				</ul>
				
				<div class="tab-content" style="margin: 0;">
			
					<!-- ID 찾기 탭 클릭 시 뜨는 화면 -->
					<div class="tab-pane modal-body fade in active" id="company-id-find">
		
						<form class="form-inline">
							<div class="form-group">
							    <input type="text" class="form-control" id="input-company-id-find" placeholder="기업 이름을 입력하세요." style="margin-top: 10px;">
							</div>
							<button type="button" id="btn-company-id-find" class="btn btn-default" style="margin-left: -4px; margin-top: 10px;">검색</button>
						</form>
						
						<hr>
						
						<table class="table table-bordered table-condensed" style="margin-top: 20px;">
							<thead style="width: 10px; font-size: 13px; background: #ADE4B5;">
								<tr style="font-family: sans-serif; font-size: 12px;">
									<th style="width: 30%;">기업 ID</th>
									<th style="width: 70%;">가입날짜</th>
								</tr>
							</thead>
							<tbody id="modalFindCompanyList" style="width: 10px; font-size: 10px; background: #FCFCFC;">
								
								<tr style="font-size: 12px;">
		    						<td colspan="2" style="text-align: center;">검색된 ID가 없습니다.</td>
								</tr>
							
							</tbody>
						</table>
		
					</div>
				
				
				
					<!-- PW 찾기 탭 클릭 시 뜨는 화면 -->
					<div class="tab-pane modal-body fade" id="company-pw-find" style="text-align: center;">
		
						<div class="desc-message">
							<p style="font-family: sans-serif; font-size: 12px; margin-top: 10px; color: #760101;">입력한 기업의 가입된 이메일 주소로 인증번호를 전송하여 인증합니다.</p>
						</div>
		
						<hr>
		
						<form class="form-inline">
							<div>
								<div class="form-group">
								    <input type="text" class="form-control" id="input-company-pw-find" placeholder="기업 ID를 입력하세요." style="width: 260px;"> 
								</div>
								<button type="button" id="btn-company-pw-find-email" class="btn btn-success" style="margin-left: -4px;">인증번호 전송</button>
							</div>
						</form>
						
						<div class="form-inline" style="margin-top: -14px; style="width: 260px;"">
							<input type="text" class="form-control" id="input-company-pw-find-email" placeholder="인증번호를 입력하세요." style="cursor: default; width: 260px;" readonly>
							<button type="button" id="btn-company-pw-find-check" class="btn btn-primary" style="margin-left: -4px;" disabled>인증번호 확인</button>
						</div>
		
					</div>
			
				</div>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-info" id="btn-company-pw-reset-check" style="display: none;">확인</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>


<script>

	let code2 = '';

	$(function() {
		
		
		$('#btn-tab-company-id-find').click(function() {
			$('#btn-company-pw-reset-check').css('display', 'none');
		});
		
		
		$('#btn-tab-company-pw-find').click(function() {
			$('#btn-company-pw-reset-check').css('display', 'inline-block');
		});
		
		
		// 일반회원 ID 검색 버튼 클릭 시
		$('#btn-company-id-find').click(function() {
			
			let strAdd = '';
			const companyName = $('#input-company-id-find').val();
			
			$.ajax({
				type: 'POST',
				url: '<c:url value="/company/companyIDFind" />',
				
				data: {
					'companyName': companyName
				},
				
				success: function(result) {
					
					let IDList = result.IDList;
					
					if(IDList == '') {
						strAdd +=
							`<tr style="font-size: 12px;">
	    						<td colspan="2" style="text-align: center;">검색된 기업 ID가 없습니다.</td>
							</tr>`;
					} else {
						for(let i = 0; i < IDList.length; i++) {
							var timestamp = IDList[i].companyDate;
							var date = new Date(timestamp).toISOString().replace("T", " ").replace(/\..*/, '');
							
							strAdd +=
								`<tr style="font-size: 12px;">
									<td>` + IDList[i].companyID + `</td>
									<td>` + date + `</td>
								</tr>`;
						}
					}
					
					$('#modalFindCompanyList').html(strAdd);
					
				},
				
				error: function() {
					alert('ID 검색 중 서버오류가 발생했습니다.');
					return;
				}
			});
			
		});
		
		
		// 일반회원 인증번호 전송 버튼 클릭 시
		$('#btn-company-pw-find-email').click(function() {
			
			const companyID = $('#input-company-pw-find').val();
			
			// ajax 시작 (이메일 전송 비동기 통신)
			$.ajax({
				type: 'POST',
				url: '<c:url value="/company/companyPWFindEmail" />',
				
				data: {
					'companyID': companyID
				},
				
				success: function(result) {
					if(result == 'NoFindEmail') {
						alert('해당 ID로 가입된 기업이 없습니다.');
						return;
					} else {
						$('#input-company-pw-find-email').attr('readonly', false);		// 비활성된 인증번호 입력창을 활성화시킨다.
						
						$('#input-company-pw-find').attr('readonly', true);			// ID 칸도 더이상 수정하지 못하도록 막는다.

						$('#btn-company-pw-find-email').attr('disabled', true);
						
						$('#btn-company-pw-find-check').attr('disabled', false);
						
						code2 = result;			// 미리 선언한 인증번호 코드 변수에 컨트롤러부터 받은 인증번호를 저장해둔다.
						
						alert('해당 기업의 이메일로 인증번호가 전송되었습니다.');
					}
				},
				
				error: function() {
					alert('인증번호 발급 중 서버오류가 발생했습니다.');
					return;
				}
			});		// 이메일 전송 끝
			
		});
		
		
		// 인증 확인 버튼 클릭 시
		$('#btn-company-pw-find-check').click(function() {
			
			const inputCODE = $('#input-company-pw-find-email').val();

			if(inputCODE == code2) {
				alert('인증되었습니다.');
				
				$('#input-company-pw-find-email').attr('readonly', true);
				
				$('#btn-company-pw-find-check').attr('disabled', true);
				
			} else {
				alert('인증번호가 일치하지 않습니다.');
				return;
			}
			
		});
		
		
		// 확인 버튼 클릭 시
		$('#btn-company-pw-reset-check').click(function() {
			
			const companyID = $('#input-company-pw-find').val();
			
			// 이메일 인증 여부 체크 1
			if(!$('#input-company-pw-find').attr('readonly')) {
				alert('이메일 인증이 필요합니다.');
				$('#input-company-pw-find').focus();
				return;
			}
			
			// 이메일 인증 여부 체크 2
			if(!$('#input-company-pw-find-email').attr('readonly')) {
				alert('인증번호를 확인해주세요.');
				$('#input-company-pw-find-email').focus();
				return;
			}
			
			$('#hidden-company-ID').val(companyID);
			
			$('#modal-password-new-company').modal('show');
			
		});
		
	});

</script>