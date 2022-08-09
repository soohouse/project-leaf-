package com.spring.leaf.company.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.company.command.CompanyVO;
import com.spring.leaf.company.mapper.ICompanyMypageMapper;
import com.spring.leaf.user.mapper.IUserMypageMapper;

@Service
public class CompanyMypageService implements ICompanyMypageService {
	
	@Autowired
	private ICompanyMypageMapper mapper;

	@Override
	public void companyUpdate(CompanyVO vo) {
		mapper.companyUpdate(vo);
	}

}
