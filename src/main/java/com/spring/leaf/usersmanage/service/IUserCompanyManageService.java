package com.spring.leaf.usersmanage.service;

import java.util.List;

import com.spring.leaf.usersmanage.command.CompanyMembersDetailVO;
import com.spring.leaf.usersmanage.command.CompanyMembersVO;
import com.spring.leaf.usersmanage.command.UserMembersDetailVO;
import com.spring.leaf.usersmanage.command.UserMembersVO;
import com.spring.leaf.util.PageVO;

//22-08-19
public interface IUserCompanyManageService {
	
	//유저 사용자 목록 조회
	List<UserMembersVO> userMembers(PageVO vo);
	
	int getUserTotal(PageVO vo);
	
	//기업 사용자 목록 조회
	List<CompanyMembersVO> companyMembers(PageVO vo);

	int getCompanyTotal(PageVO vo);
	
	// 개발자 목록 상세보기
	UserMembersDetailVO userMembersDetail(int userNO);
		
	// 기업 목록 상세보기
	CompanyMembersDetailVO companyMembersDetail(int companyNO);
}
