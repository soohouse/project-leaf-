package com.spring.leaf.company.controller;

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

import com.spring.leaf.company.command.CompanyVO;
import com.spring.leaf.company.service.ICompanyService;
import com.spring.leaf.util.MailService;


// 기업회원 유저 컨트롤러 : 2022-07-28 생성

@Controller
@RequestMapping("/company")
public class CompanyController {

	// 로그 출력을 위한 Logger 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(CompanyController.class);
	
	
	// 기업회원 서비스 연결
	@Autowired
	private ICompanyService service;
	
	
	// 이메일 인증을 위한 서비스 연결
	@Autowired
	private MailService mailService;
	
	
	// 기업 회원가입 처리 요청
	@PostMapping("/companyRegist")
	public String companyRegist(CompanyVO vo, RedirectAttributes ra) {
		logger.info("/company/companyRegist : POST (기업 회원가입 처리 요청)");
		
		service.companyRegist(vo);
		
		ra.addFlashAttribute("msg", "기업 회원가입 신청이 완료되었습니다. 관리자의 승인을 기다려주세요.");
		
		return "redirect:/";
	}
	
	
	// 기업 아이디 중복체크 요청
	@PostMapping("/companyIDCheck")
	@ResponseBody
	public String companyIDCheck(@RequestBody String companyID) {
		logger.info("/company/companyIDCheck : POST (기업 아이디 중복체크 처리 요청)");
		
		int check = service.companyIDCheck(companyID);
		
		if(check == 0) {
			return "checkSuccess";
		} else {
			return "checkFail";
		}
	}
	
	
	// 기업 이메일 중복체크 요청
	@PostMapping("/companyEmailCheck")
	@ResponseBody
	public String companyEmailCheck(@RequestParam Map<String, Object> emails) {
		logger.info("/company/companyEmailCheck : POST (이메일 중복체크 처리 요청)");
			
		int check = service.companyEmailCheck(emails);
			
		if(check == 0) {
			return "emailCheckSuccess";
		} else {
			return "emailCheckFail";
		}
	}
	
	
	// 기업 이메일 인증 요청
	@GetMapping("/companyEmailAuth")
	@ResponseBody
	public String companyEmailAuth(@RequestParam("email") String email) {
		logger.info("/company/companyEmailAuth : GET (이메일 인증 요청)");

		logger.info("인증 이메일 : " + email);

		return mailService.joinEmail(email);
	}
	
	
	// 기업 로그인 요청
	@PostMapping("/companyLogin")
	public String companyLogin(String companyID, String companyPW, Model model) {
		logger.info("/company/companyLogin : POST (로그인 요청)");

		// 로그인 한 사용자의 정보를 가져온다.
		CompanyVO vo = service.companyGetInfo(companyID);

		// 가져온 사용자 정보를 인터셉터에게 전달한다.
		model.addAttribute("companyLogin", vo);
		// 가져온 사용자의 비밀번호를 인터셉터에게 전달한다. (비밀번호 비교를 위해)
		model.addAttribute("companyPW", companyPW);

		/* 기업 로그인 인터셉터 발동 */

		return "home";
	}
	
	
	// 기업회원 로그아웃 요청
	@PostMapping("/companyLogout")
	@ResponseBody
	public String companyLogout(HttpSession session) {

		logger.info("/company/companyLogout : POST (기업 로그아웃 요청)");

		// 로그아웃 시 저장된 사용자 정보와 프로필 사진 정보가 담긴 세션을 지운다.
		session.removeAttribute("company");

		return "logoutSuccess";
	}
}
