package com.spring.leaf.user.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.leaf.user.command.ResumeVO;
import com.spring.leaf.user.command.UserProfileVO;
import com.spring.leaf.user.command.UserVO;
import com.spring.leaf.user.mapper.IUserMapper;


// 일반회원 유저 서비스 : 2022-07-28 생성

@Service
public class UserService implements IUserService {

	// 로그 출력을 위한 Logger 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(UserService.class);
	
	
	// 일반회원 유저 매퍼 연결
	@Autowired
	private IUserMapper mapper;
	
	
	// 사용자 회원가입 요청
	@Override
	public void userRegist(UserVO vo) {
		logger.info("암호화 전 비밀번호 : " + vo.getUserPW());
		
		// 비밀번호 암호화를 위한 BCrypt 객체 생성
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		// encode로 암호화한 비밀번호를 새로 변수로 만든 후 vo에 새로 지정해준다.
		String bcryptPW = encoder.encode(vo.getUserPW());
		
		logger.info("암호화 후 비밀번호 : " + bcryptPW);
		
		vo.setUserPW(bcryptPW);
		
		mapper.userRegist(vo);
	}
	
	
	// 사용자 아이디 중복체크 요청
	@Override
	public int userIDCheck(String userID) {
		return mapper.userIDCheck(userID);
	}
	
	
	// 사용자 이메일 중복체크 요청
	@Override
	public int userEmailCheck(Map<String, Object> emails) {
		return mapper.userEmailCheck(emails);
	}

	
	// 사용자 정보 불러오기 요청
	@Override
	public UserVO userGetInfo(String userID) {
		return mapper.userGetInfo(userID);
	}
	
	
	// 사용자 회원번호 얻는 요청
	@Override
	public int userNOGet() {
		return mapper.userNOGet();
	}
	
	
	// 사용자 프로필사진 등록 요청
	@Override
	public void userProfile(UserProfileVO vo) {
		mapper.userProfile(vo);
	}
	
	
	// 사용자 프로필사진 불러오기 요청
	@Override
	public UserProfileVO userProfileGet(int userNO) {
		return mapper.userProfileGet(userNO);
	}
	
	
	// 사용자 이력서파일 등록 요청
	@Override
	public void userResume(ResumeVO vo) {
		mapper.userResume(vo);
	}
	
	
	// 사용자 이력서파일 삭제 요청
	@Override
	public void userResumeDelete(int userNO) {
		mapper.userResumeDelete(userNO);
	}
	
	
	// 사용자 이력서파일 수정 요청
	@Override
	public void userResumeUpdate(ResumeVO vo) {
		mapper.userResumeUpdate(vo);
	}
	
	
	// 사용자 이력서파일 존재 여부 체크 요청
	@Override
	public int userResumeCheck(int userNO) {
		return mapper.userResumeCheck(userNO);
	}
	
	
	// 사용자 이력서파일 얻어오기 요청
	@Override
	public ResumeVO userResumeGet(int userNO) {
		return mapper.userResumeGet(userNO);
	}
}
