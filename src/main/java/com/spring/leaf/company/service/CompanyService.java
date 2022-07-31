package com.spring.leaf.company.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

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
}
