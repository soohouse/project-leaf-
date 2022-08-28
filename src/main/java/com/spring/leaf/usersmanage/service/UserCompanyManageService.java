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
import com.spring.leaf.util.PageVO;

@Service
public class UserCompanyManageService implements IUserCompanyManageService {

	@Autowired
	private IUserCompanyManageMapper mapper;
	
	
	@Override
	public List<UserMembersVO> userMembers(PageVO vo) {
		List<UserMembersVO> list = mapper.userMembers(vo);
		return list;
	}
	
	@Override
	public int getUserTotal(PageVO vo) {
		return mapper.getUserTotal(vo);
	}
	
	@Override
	public List<CompanyMembersVO> companyMembers(PageVO cvo) {
		List<CompanyMembersVO> list = mapper.companyMembers(cvo);
		return list;
	}
	
	@Override
	public int getCompanyTotal(PageVO cvo) {
		return mapper.getCompanyTotal(cvo);
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
