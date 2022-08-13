package com.spring.leaf.user.service;

import java.util.Map;

import com.spring.leaf.user.command.ResumeVO;
import com.spring.leaf.user.command.UserProfileVO;
import com.spring.leaf.user.command.UserVO;


// 일반회원 유저 서비스 인터페이스 : 2022-07-28 생성

public interface IUserService {

	// 사용자 회원가입 요청
	void userRegist(UserVO vo);
	
	
	// 사용자 아이디 중복체크 요청
	int userIDCheck(String userID);
	
	
	// 사용자 이메일 중복체크 요청
	int userEmailCheck(Map<String, Object> emails);
	
	
	// 사용자 정보 불러오기 요청
	UserVO userGetInfo(String userID);
	
	
	// 사용자 회원번호 얻는 요청
	int userNOGet();
		
		
	// 사용자 프로필사진 등록 요청
	void userProfile(UserProfileVO vo);
	
	
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
