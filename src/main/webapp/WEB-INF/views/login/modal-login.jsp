<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 로그인 모달 -->
<div class="modal fade" id="modal-login" role="dialog" data-backdrop="static" style="text-align: center;">
	<div class="modal-dialog modal-sm" style="display: inline-block; vertical-align: middle; width: 400px; margin-top: 120px;">
		<div class="modal-content">
			<div class="modal-header" style="background: #3071A9;">
				<h3 class="modal-title" style="color: white; font-weight: bold;">
					LOGIN
				</h3>
				<button type="button" class="close" data-dismiss="modal" style="position: relative; top: -25px;">&times;</button>
			</div>
			
			<ul class="nav nav-tabs nav-justified" style="padding: 10px; text-align: center; margin-top: 10px;">
			  <li role="presentation" class="nav-item active">
			  	<a href="#user_modal" data-toggle="tab" style="color: #3071A9;">일반회원</a>
			  </li>
			  <li role="presentation" class="nav-item">
			  	<a href="#company_modal" data-toggle="tab" style="color: #3071A9;">기업회원</a>
			  </li>
			</ul>
			
			<div class="tab-content" style="margin: 0;">
			
				<!-- 일반회원 탭 클릭 시 뜨는 화면 -->
				<div class="tab-pane modal-body fade in active" id="user_modal">
	
					<form class="form-horizontal" action="<c:url value='/user/userLogin' />" method="post" name="userLoginForm">
						<div class="form-group" style="margin-bottom: 0;">
							<div class="col-sm-8" style="margin-left: 16px; width: 290px;">
								<input type="text" class="form-control" name="userID" placeholder="아이디를 입력하세요.">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-8" style="margin-left: 16px; width: 290px;">
								<input type="password" class="form-control" name="userPW" placeholder="비밀번호를 입력하세요.">
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-sm-3">
								<button type="submit" class="btn btn-primary btn-sm btn-block" 
								style="font-size: 14px; border-radius: 0; padding: 8px 16px;
								position: absolute; left: 290; bottom: 16;
								width: 80px; height: 68px; border-radius: 4px;">로그인</button>
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-sm-12">
								<div class="checkbox">
									<label> <input type="checkbox"> 로그인 유지
									</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							
							<div class="col-sm-12">
								<button type="button" class="btn btn-primary btn-lg btn-block" id="btn-modal-regist" 
								style="font-size: 14px; background: green; border: none; color: white; border-radius: 0; padding: 8px 16px; 
								width: 340px; height: 40px; margin: 0 auto; border-radius: 4px;">회원가입</button>
							</div>
							
							<div class="col-sm-12">
								<br>
								<a href="#">ID / PW 찾기</a>
							</div>
							
							<div class="col-sm-12" style="font-size: 12px;">
								<br>
								<a href="#" style="color: gray;">도움말</a>
							</div>
						</div>
					</form>
	
				</div>
				
				
				
				<!-- 기업회원 탭 클릭 시 뜨는 화면 -->
				<div class="tab-pane modal-body fade" id="company_modal">
	
					<form class="form-horizontal" action="<c:url value='/company/companyLogin' />" method="post" name="companyLoginForm">
						<div class="form-group" style="margin-bottom: 0;">
							<div class="col-sm-8" style="margin-left: 16px; width: 290px;">
								<input type="text" class="form-control" name="companyID" placeholder="기업 아이디를 입력하세요.">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-8" style="margin-left: 16px; width: 290px;">
								<input type="password" class="form-control" name="companyPW" placeholder="비밀번호를 입력하세요.">
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-sm-3">
								<button type="submit" class="btn btn-primary btn-sm btn-block" 
								style="font-size: 14px; border-radius: 0; padding: 8px 16px;
								position: absolute; left: 290; bottom: 16;
								width: 80px; height: 68px; border-radius: 4px;">로그인</button>
							</div>
						</div>
						
						<div class="form-group">
							<div class="col-sm-12">
								<div class="checkbox">
									<label> <input type="checkbox"> 로그인 유지
									</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							
							
							<div class="col-sm-12">
								<button type="button" class="btn btn-primary btn-lg btn-block" id="btn-modal-regist2" 
								style="font-size: 14px; background: green; border: none; color: white; border-radius: 0; padding: 8px 16px; 
								width: 340px; height: 40px; margin: 0 auto; border-radius: 4px;">회원가입</button>
							</div>
							
							<div class="col-sm-12">
								<br>
								<a href="#">ID / PW 찾기</a>
							</div>
							
							<div class="col-sm-12" style="font-size: 12px;">
								<br>
								<a href="#" style="color: gray;">도움말</a>
							</div>
						</div>
					</form>
	
				</div>
			
			</div>
			
				
		</div>
	</div>
</div>

<script>
	
	// jQuery 시작
	$(function() {
		
		// 로그인 모달에서 회원가입 버튼을 눌렀을 경우 발생하는 이벤트
		$('#btn-modal-regist').click(function() {
			location.href='<c:url value="/user/userRegist" />';
		});
		
		
		$('#btn-modal-regist2').click(function() {
			location.href='<c:url value="/user/userRegist" />';
		});
		
	});		// jQuery 끝

</script>