package com.spring.leaf.company.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.leaf.company.command.CompanyAutoLoginVO;
import com.spring.leaf.company.command.CompanyIntroVO;
import com.spring.leaf.company.command.CompanyLogoVO;
import com.spring.leaf.company.command.CompanyPasswordVO;
import com.spring.leaf.company.command.CompanyVO;
import com.spring.leaf.company.mapper.ICompanyMapper;


// 기업회원 서비스 : 2022-07-28 생성

@Service
public class CompanyService implements ICompanyService {

	// 로그 출력을 위한 Logger 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(CompanyService.class);
	
	
	// 기업회원 매퍼 연결
	@Autowired
	private ICompanyMapper mapper;
	
	
	// 기업회원 가입 요청
	@Override
	public void companyRegist(CompanyVO vo) {
		logger.info("암호화 전 비밀번호 : " + vo.getCompanyPW());
		
		// 비밀번호 암호화를 위한 BCrypt 객체 생성
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		// encode로 암호화한 비밀번호를 새로 변수로 만든 후 vo에 새로 지정해준다.
		String bcryptPW = encoder.encode(vo.getCompanyPW());
		
		logger.info("암호화 후 비밀번호 : " + bcryptPW);
		
		vo.setCompanyPW(bcryptPW);
		
		mapper.companyRegist(vo);
	}

	
	// 기업회원 아이디 중복체크 요청
	@Override
	public int companyIDCheck(String companyID) {
		return mapper.companyIDCheck(companyID);
	}

	
	// 기업회원 이메일 중복체크 요청
	@Override
	public int companyEmailCheck(Map<String, Object> emails) {
		return mapper.companyEmailCheck(emails);
	}

	
	// 기업회원 정보 불러오기 요청
	@Override
	public CompanyVO companyGetInfo(String companyID) {
		return mapper.companyGetInfo(companyID);
	}
	
	
	// 기업회원 비밀번호 변경 요청
	@Override
	public void companyPasswordChange(CompanyPasswordVO vo) {
		logger.info("암호화 전 비밀번호 : " + vo.getNewPassword());
		
		// 비밀번호 암호화를 위한 BCrypt 객체 생성
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		// encode로 암호화한 비밀번호를 새로 변수로 만든 후 vo에 새로 지정해준다.
		String bcryptPW = encoder.encode(vo.getNewPassword());
				
		logger.info("암호화 후 비밀번호 : " + bcryptPW);
		
		vo.setNewPassword(bcryptPW);
		
		mapper.companyPasswordChange(vo);
	}
	

	// 기업회원 자동로그인 요청
	@Override
	public void companyAutoLogin(CompanyAutoLoginVO vo) {
		mapper.companyAutoLogin(vo);
	}
	
	
	// 기업회원 자동로그인시 기업회원 정보 얻어오기 요청
	@Override
	public CompanyVO companyAutoGet(String sessionID) {
		return mapper.companyAutoGet(sessionID);
	}
	
	
	// 기업회원 회원번호 얻는 요청
	@Override
	public int companyNOGet() {
		return mapper.companyNOGet();
	}
	
	
	// 기업회원 로고사진 등록 요청
	@Override
	public void companyLogo(CompanyLogoVO vo) {
		mapper.companyLogo(vo);
	}
	
	
	// 기업회원 로고사진 삭제 요청
	@Override
	public void companyLogoDelete(int companyNO) {
		mapper.companyLogoDelete(companyNO);
	}
	
	
	// 기업회원 로고사진 수정 요청
	@Override
	public void companyLogoUpdate(CompanyLogoVO vo) {
		mapper.companyLogoUpdate(vo);
	}
	
	
	// 기업회원 로고사진 존재 여부 체크 요청
	@Override
	public int companyLogoCheck(int companyNO) {
		return mapper.companyLogoCheck(companyNO);
	}
	
	
	// 기업회원 로고사진 불러오기 요청
	@Override
	public CompanyLogoVO companyLogoGet(int companyNO) {
		return mapper.companyLogoGet(companyNO);
	}
	
	
	// 기업회원 회사소개서 등록 요청
	@Override
	public void companyIntro(CompanyIntroVO vo) {
		mapper.companyIntro(vo);
	}
	

	// 기업회원 회사소개서 삭제 요청
	@Override
	public void companyIntroDelete(int companyNO) {
		mapper.companyIntroDelete(companyNO);	
	}
	
	
	// 기업회원 회사소개서 수정 요청
	@Override
	public void companyIntroUpdate(CompanyIntroVO vo) {
		mapper.companyIntroUpdate(vo);
	}
	
	
	// 기업 소개서 얻어오기 요청
	@Override
	public CompanyIntroVO companyIntroGet(int companyNO) {
		return mapper.companyIntroGet(companyNO);
	}
}
