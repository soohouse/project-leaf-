package com.spring.leaf.user.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.leaf.user.command.UserVO;
import com.spring.leaf.user.service.IUserService;
import com.spring.leaf.util.MailService;


// 일반회원 유저 컨트롤러 : 2022-07-27 생성

@Controller
@RequestMapping("/user")
public class UserController {

	// 로그 출력을 위한 Logger 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	
	// 일반회원 유저 서비스 연결
	@Autowired
	private IUserService service;
	
	
	// 이메일 인증을 위한 서비스 연결
	@Autowired
	private MailService mailService;
	
	
	// 회원가입 페이지 이동 요청
	@GetMapping("/userRegist")
	public String userRegist() {
		logger.info("/user/userRegist : GET (회원가입 페이지 이동)");
		
		return "/register/register";
	}
	
	
	// 회원가입 처리 요청
	@PostMapping("/userRegist")
	public String userRegist(UserVO vo, RedirectAttributes ra) {
		logger.info("/user/userRegist : POST (회원가입 처리 요청)");
		
		service.userRegist(vo);
		
		ra.addFlashAttribute("msg", "성공적으로 회원가입 되었습니다.");
		
		return "redirect:/";
	}
	
	
	// 사용자 아이디 중복체크 요청
	@PostMapping("/userIDCheck")
	@ResponseBody
	public String userIDCheck(@RequestBody String userID) {
		logger.info("/user/userIDCheck : POST (회원가입 아이디 중복체크 처리 요청)");
		
		int check = service.userIDCheck(userID);
		
		if(check == 0) {
			return "checkSuccess";
		} else {
			return "checkFail";
		}
	}
	
	
	// 사용자 이메일 중복체크 요청
	@PostMapping("/userEmailCheck")
	@ResponseBody
	public String userEmailCheck(@RequestParam Map<String, Object> emails) {
		logger.info("/user/userEmailCheck : POST (이메일 중복체크 처리 요청)");
		
		int check = service.userEmailCheck(emails);
		
		if(check == 0) {
			return "emailCheckSuccess";
		} else {
			return "emailCheckFail";
		}
	}
	
	
	// 사용자 이메일 인증 요청
	@GetMapping("/userEmailAuth")
	@ResponseBody
	public String userEmailAuth(@RequestParam("email") String email) {
		logger.info("/user/userEmailAuth : GET (이메일 인증 요청)");
		
		logger.info("인증 이메일 : " + email);
		
		return mailService.joinEmail(email);
	}
	
	
	// 사용자 로그인 요청
	@PostMapping("/userLogin")
	public String userLogin(String userID, String userPW, Model model) {
		logger.info("/user/userLogin : POST (로그인 요청)");
		
		// 로그인 한 사용자의 정보를 가져온다.
		UserVO vo = service.userGetInfo(userID);
		
		// 가져온 사용자 정보를 인터셉터에게 전달한다.
		model.addAttribute("userLogin", vo);
		// 가져온 사용자의 비밀번호를 인터셉터에게 전달한다. (비밀번호 비교를 위해)
		model.addAttribute("userPW", userPW);
		
		/* 일반회원 로그인 인터셉터 발동 */
		
		return "home";
	}
	
	
	// 사용자 로그아웃 요청
	@PostMapping("/userLogout")
	@ResponseBody
	public String userLogout(HttpSession session) {

		logger.info("/user/userLogout : POST (사용자 로그아웃 요청)");

		// 로그아웃 시 저장된 사용자 정보와 프로필 사진 정보가 담긴 세션을 지운다.
		session.removeAttribute("user");

		return "logoutSuccess";
	}
}
