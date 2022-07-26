package com.spring.leaf.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.leaf.user.command.AutoLoginVO;
import com.spring.leaf.user.command.PasswordVO;
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
	
	
	// 사용자 비밀번호 변경 요청
	@Override
	public void userPasswordChange(PasswordVO vo) {
		logger.info("암호화 전 비밀번호 : " + vo.getNewPassword());
		
		// 비밀번호 암호화를 위한 BCrypt 객체 생성
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		// encode로 암호화한 비밀번호를 새로 변수로 만든 후 vo에 새로 지정해준다.
		String bcryptPW = encoder.encode(vo.getNewPassword());
				
		logger.info("암호화 후 비밀번호 : " + bcryptPW);
		
		vo.setNewPassword(bcryptPW);
		
		mapper.userPasswordChange(vo);
	}
	
	
	// 사용자 회원탈퇴 요청
	@Override
	public void userDelete(int userNO) {
		mapper.userDelete(userNO);
	}
	
	
	// 사용자 자동로그인 요청
	@Override
	public void userAutoLogin(AutoLoginVO vo) {
		mapper.userAutoLogin(vo);	
	}
	
	
	// 사용자 자동로그인시 사용자 정보 얻어오기 요청
	@Override
	public UserVO userAutoGet(String sessionID) {
		return mapper.userAutoGet(sessionID);
	}
	
	
	// 사용자 ID 찾기 요청
	@Override
	public List<UserVO> userIDFind(String userName) {
		return mapper.userIDFind(userName);
	}
	
	
	// 사용자 PW 초기화 요청
	@Override
	public void userPWReset(String newPassword, String userID) {
		
		logger.info("암호화 전 비밀번호 : " + newPassword);
		
		// 비밀번호 암호화를 위한 BCrypt 객체 생성
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		// encode로 암호화한 비밀번호를 새로 변수로 만든 후 vo에 새로 지정해준다.
		String bcryptPW = encoder.encode(newPassword);
				
		logger.info("암호화 후 비밀번호 : " + bcryptPW);
		
		Map<String, Object> newPW = new HashMap<>();
		newPW.put("newPassword", bcryptPW);
		newPW.put("userID", userID);
		
		mapper.userPWReset(newPW);	
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
	
	
	// 사용자 프로필사진 삭제 요청
	@Override
	public void userProfileDelete(int userNO) {
		mapper.userProfileDelete(userNO);
	}
	
	
	// 사용자 프로필사진 수정 요청
	@Override
	public void userProfileUpdate(UserProfileVO vo) {
		mapper.userProfileUpdate(vo);
	}
	
	
	// 사용자 프로필사진 존재 여부 체크 요청
	@Override
	public int userProfileCheck(int userNO) {
		return mapper.userProfileCheck(userNO);
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
