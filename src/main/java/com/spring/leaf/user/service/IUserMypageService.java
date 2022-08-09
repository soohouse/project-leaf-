package com.spring.leaf.user.service;

import org.apache.ibatis.annotations.Param;

import com.spring.leaf.user.command.UserVO;

//유저 마이페이지 서비스 인터페이스 생성: 2022-08-03 생성
public interface IUserMypageService {
	
	//회원 정보 얻어오기
	UserVO getInfo(int UserNO);

	//회원 정보 수정
	void updateUser(UserVO vo);

	//회원 정보 삭제
	void deleteUser(@Param("id") String id, @Param("pw") String pw);

}
