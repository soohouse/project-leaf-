package com.spring.leaf.usersmanage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.userlist.command.UserListDetailVO;
import com.spring.leaf.usersmanage.command.CompanyMembersDetailVO;
import com.spring.leaf.usersmanage.command.CompanyMembersVO;
import com.spring.leaf.usersmanage.command.UserMembersDetailVO;
import com.spring.leaf.usersmanage.command.UserMembersVO;
import com.spring.leaf.usersmanage.mapper.IUserCompanyManageMapper;

@Service
public class UserCompanyManageService implements IUserCompanyManageService {

	@Autowired
	private IUserCompanyManageMapper mapper;
	
	
	@Override
	public List<UserMembersVO> userMembers() {
		return mapper.userMembers();
	}
	
	@Override
	public List<CompanyMembersVO> companyMembers() {
		return mapper.companyMembers();
	}
	
	//일반회원 상세 보기
	@Override
	public UserMembersDetailVO userMembersDetail(int userNO) {
			// TODO Auto-generated method stub
		return mapper.userMembersDetail(userNO);
	}
	
	//기업회원 상세 보기
	@Override
	public CompanyMembersDetailVO companyMembersDetail(int companyNO) {
			// TODO Auto-generated method stub
		return mapper.companyMembersDetail(companyNO);
	}

}
