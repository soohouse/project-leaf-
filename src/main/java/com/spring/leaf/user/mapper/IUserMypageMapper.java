package com.spring.leaf.user.mapper;

import org.apache.ibatis.annotations.Param;

import com.spring.leaf.user.command.UserVO;
import com.spring.leaf.company.command.CompanyDetailVO;
import com.spring.leaf.company.command.CompanyVO;
import com.spring.leaf.user.command.UserDetailVO;

//일반회원 유저 마이페이지 매퍼 인터페이스 : 2022-08-01 생성

public interface IUserMypageMapper {
	
	//회원 정보 얻어오기
	UserDetailVO getInfo(int userNO);
	
	//기업 정보 얻어오기
	CompanyDetailVO getCompanyInfo(int companyNO);
	
	//회원 정보 수정
	void updateUser(UserVO vo);
	
	//기업 정보 수정
	void updateCompany(CompanyVO vo);

}
