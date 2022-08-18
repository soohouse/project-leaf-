package com.spring.leaf.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.user.command.UserVO;
import com.spring.leaf.user.mapper.IUserMapper;
import com.spring.leaf.user.mapper.IUserMypageMapper;
import com.spring.leaf.company.command.CompanyDetailVO;
import com.spring.leaf.company.command.CompanyVO;
import com.spring.leaf.user.command.UserDetailVO;

@Service
public class UserMypageService implements IUserMypageService {

	@Autowired
	private IUserMypageMapper mapper;
	
	
	@Override
	public UserDetailVO getInfo(int userNO) {
		return mapper.getInfo(userNO);
	}
	
	@Override
	public CompanyDetailVO getCompanyInfo(int companyNO) {
		return mapper.getCompanyInfo(companyNO);
	}

	@Override
	public void updateUser(UserVO vo) {
		mapper.updateUser(vo);
	}
	
	@Override
	public void updateCompany(CompanyVO vo) {
		mapper.updateCompany(vo);
	}

}
