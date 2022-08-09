package com.spring.leaf.company.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.leaf.company.command.CompanyVO;
import com.spring.leaf.company.service.ICompanyMypageService;


//기업회원 마이페이지 컨트롤러 : 2022-08-02 생성
@Controller
@RequestMapping("/companymypage")
public class CompanyMypageController {

	// 로그 출력을 위한 Logger 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(CompanyMypageController.class);

	@Autowired
	private ICompanyMypageService service;

	// 마이페이지(기업정보) 이동 요청
	@GetMapping("/companyprofile")
	public String companyprofile() {
		logger.info("/companymypage/companyprofile : GET (내 정보 페이지 이동)");

		return "/company_mypage/com_profile";
	}

	// 마이페이지(기업 정보) 수정페이지 이동
	@GetMapping("/companyupdatemod")
	public String companyupdatemod() {
		logger.info("/companymypage/companyupdatemod : GET (기업 정보 수정페이지 이동)");

		return "/company_mypage/company_profileMod";
	}

	// 수정 로직
	@PostMapping("/companyUpdate")
	public String companyUpdate(CompanyVO vo, RedirectAttributes ra) {
		System.out.println("param: " + vo);
		service.companyUpdate(vo);

		ra.addFlashAttribute("msg", "수정이 완료되었습니다.");
		return "redirect:/company_mypage/company_profile";
	}
}
