package com.spring.leaf.company.service;

import com.spring.leaf.company.command.CompanyVO;

public interface ICompanyMypageService {
	
	//기업 회원 정보 수정
	void companyUpdate(CompanyVO vo);
}
