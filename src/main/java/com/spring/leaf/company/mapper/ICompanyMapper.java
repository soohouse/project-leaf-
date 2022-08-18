package com.spring.leaf.company.mapper;

import java.util.Map;

import com.spring.leaf.company.command.CompanyAutoLoginVO;
import com.spring.leaf.company.command.CompanyIntroVO;
import com.spring.leaf.company.command.CompanyLogoVO;
import com.spring.leaf.company.command.CompanyPasswordVO;
import com.spring.leaf.company.command.CompanyVO;


// 기업회원 매퍼 인터페이스 : 2022-07-28 생성

public interface ICompanyMapper {

	// 기업 회원가입 요청
	void companyRegist(CompanyVO vo);
			
			
	// 기업 아이디 중복체크 요청
	int companyIDCheck(String companyID);
			
			
	// 기업 이메일 중복체크 요청
	int companyEmailCheck(Map<String, Object> emails);
	
	
	// 기업 정보 불러오기 요청
	CompanyVO companyGetInfo(String companyID);
	
	
	// 기업회원 비밀번호 변경 요청
	void companyPasswordChange(CompanyPasswordVO vo);
	
	
	// 기업회원 자동로그인 요청
	void companyAutoLogin(CompanyAutoLoginVO vo);
		
		
	// 기업회원 자동로그인시 기업회원 정보 얻어오기 요청
	CompanyVO companyAutoGet(String sessionID);
	
	
	// 기업회원 회원번호 얻는 요청
	int companyNOGet();
		
		
	// 기업 로고 등록 요청
	void companyLogo(CompanyLogoVO vo);
	
	
	// 기업 로고 삭제 요청
	void companyLogoDelete(int companyNO);
	

	// 기업 로고 수정 요청
	void companyLogoUpdate(CompanyLogoVO vo);
	

	// 기업 로고 존재 여부 체크 요청
	int companyLogoCheck(int companyNO);
	
	
	// 기업 로고 불러오기 요청
	CompanyLogoVO companyLogoGet(int companyNO);
	
	
	// 기업 회사 소개서 등록 요청
	void companyIntro(CompanyIntroVO vo);
	
	
	// 기업 회사 소개서 삭제 요청
	void companyIntroDelete(int companyNO);
	
	
	// 기업 회사 소개서 수정 요청
	void companyIntroUpdate(CompanyIntroVO vo);
	
	
	// 기업 소개서 얻어오기 요청
	CompanyIntroVO companyIntroGet(int companyNO);
	
}
