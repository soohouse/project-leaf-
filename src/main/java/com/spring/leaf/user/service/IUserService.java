package com.spring.leaf.user.service;

import java.util.Map;

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
	
}
