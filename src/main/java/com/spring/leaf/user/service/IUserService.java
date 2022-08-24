package com.spring.leaf.user.service;

import java.util.List;
import java.util.Map;

import com.spring.leaf.user.command.AutoLoginVO;
import com.spring.leaf.user.command.PasswordVO;
import com.spring.leaf.user.command.ResumeVO;
import com.spring.leaf.user.command.UserProfileVO;
import com.spring.leaf.user.command.UserVO;


// 일반회원 유저 서비스 인터페이스 : 2022-07-28 생성

public interface IUserService {

	// 사용자 회원가입 요청 매퍼
	void userRegist(UserVO vo);
	

	// 사용자 아이디 중복체크 요청
	int userIDCheck(String userID);
	

	// 사용자 이메일 중복체크 요청
	int userEmailCheck(Map<String, Object> emails);
	

	// 사용자 정보 불러오기 요청
	UserVO userGetInfo(String userID);
	
	
	// 사용자 비밀번호 변경 요청
	void userPasswordChange(PasswordVO vo);
	
	
	// 사용자 회원탈퇴 요청
	void userDelete(int userNO);
	
	
	// 사용자 자동로그인 요청
	void userAutoLogin(AutoLoginVO vo);
	
	
	// 사용자 자동로그인시 사용자 정보 얻어오기 요청
	UserVO userAutoGet(String sessionID);
	
	
	// 사용자 PW 초기화 요청
	void userPWReset(String newPassword, String userID);
	
	
	// 사용자 ID 찾기 요청
	List<UserVO> userIDFind(String userName);
	

	// 사용자 회원번호 얻는 요청
	int userNOGet();
	

	// 사용자 프로필사진 등록 요청
	void userProfile(UserProfileVO vo);
	

	// 사용자 프로필사진 삭제 요청
	void userProfileDelete(int userNO);
	

	// 사용자 프로필사진 수정 요청
	void userProfileUpdate(UserProfileVO vo);
	

	// 사용자 프로필사진 존재 여부 체크 요청
	int userProfileCheck(int userNO);
	

	// 사용자 프로필사진 불러오기 요청
	UserProfileVO userProfileGet(int userNO);
	

	// 사용자 이력서파일 등록 요청
	void userResume(ResumeVO vo);
	

	// 사용자 이력서파일 삭제 요청
	void userResumeDelete(int userNO);
	

	// 사용자 이력서파일 수정 요청
	void userResumeUpdate(ResumeVO vo);
	

	// 사용자 이력서파일 존재 여부 체크 요청
	int userResumeCheck(int userNO);
	

	// 사용자 이력서파일 얻어오기 요청
	ResumeVO userResumeGet(int userNO);
	
}
