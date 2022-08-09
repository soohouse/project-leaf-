package com.spring.leaf.company.mapper;

import com.spring.leaf.company.command.CompanyVO;

//기업회원 마이페이지 매퍼 인터페이스 : 2022-08-02 생성

public interface ICompanyMypageMapper {
	
	//내 정보 업데이트
	void companyUpdate(CompanyVO vo);
}
