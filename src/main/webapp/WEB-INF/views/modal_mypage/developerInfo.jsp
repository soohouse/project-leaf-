<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

			<!-- Modal -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel">
				<div class="modal-dialog" role="document">
					<div class="modal-content" style="height: 600px; width: 700px;">
						<div class="modal-header" style="background: #92bce0;">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h5 class="modal-title" id="myModalLabel" style="font-weight:bold;">개발자 정보</h5>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-md-5">
									<div style="background: #fff; height: 250px;">
										<img src="<c:url value='/user/userProfileGet?userNO=${user.userNO}' />" alt="profile"
											width="140px" style="transform: translate(60px, 35px);">
										<div style="margin-top: 60px;">
											<h3 id="modal-user-id" style="text-align: center;"></h3>
											<ul id="modal-user-name" style="text-align: center; padding-left: 0px;"></ul>
										</div>
									</div>
								</div>

								<div class="col-md-7">
									<div style="margin-bottom:7px;">
										<div style="font-weight:bold; display:inline-block; width:30%;">ID</div>
										<div id="modal-user-id" style="display:inline-block; width:100px;"></div>
									</div>
									<div style="margin-bottom:7px;">
										<div style="font-weight:bold; display:inline-block; width:30%;">이름</div>
										<div id="modal-user-name" style="display:inline-block; width:100px;"></div>
									</div>
									<div style="margin-bottom:7px;">
										<div style="font-weight:bold; display:inline-block; width:30%;">이메일</div>
										<div id="modal-user-email" style="display:inline-block; width:100px;"></div>
									</div>
									<div style="margin-bottom:9px;">
										<div style="font-weight:bold; display:inline-block; width:30%;">Phone</div>
										<div id="modal-user-phone" style="display:inline-block; width:200px;"></div>
									</div>
									<div style="margin-bottom:15px;">
										<div style="font-weight:bold; display:inline-block; width:30%; float:left;">소개</div>
										<div id="modal-user-intro" style="display:inline-block; width:260px;"></div>
									</div>
									<div style="margin-bottom:7px;">
										<div style="font-weight:bold; display:inline-block; width:30%;">이력서</div>
										<div id="modal-user-resume" style="display:inline-block; width:150px;"></div>
									</div>
									<div style="margin-bottom:7px;">
										<div style="font-weight:bold; display:inline-block; width:30%;">회원구분</div>
										<div style="display:inline-block; width:100px;">일반회원</div>
									</div>
								</div>
							
								<div class="col-md-12">
									<textarea placeholder="쪽지 내용을 입력하세요." rows="8"
										style="width: 670px; margin-top: 20px;"></textarea>
								</div>
							</div>
							
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-warning" style="float:left;">강제수정</button>
							<button type="button" class="btn btn-danger" style="float:left;">강제탈퇴</button>
							<button type="button" class="btn btn-success">개별쪽지발송</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
			
<script>
	
</script>
