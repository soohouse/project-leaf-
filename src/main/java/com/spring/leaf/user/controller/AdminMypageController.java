package com.spring.leaf.user.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.leaf.company.command.CompanyVO;
import com.spring.leaf.company.service.ICompanyService;
import com.spring.leaf.user.command.UserVO;
import com.spring.leaf.user.service.IUserMypageService;
import com.spring.leaf.user.service.IUserService;

@Controller
@RequestMapping("/adminmypage")
public class AdminMypageController {
	
		// 로그 출력을 위한 Logger 객체 생성
		private static final Logger logger = LoggerFactory.getLogger(UserMypageController.class);

		// 일반회원 유저 서비스 연결
		@Autowired
		private IUserMypageService service;
		
		
		@Autowired
		private IUserService uservice;
		
		
		@Autowired
		private ICompanyService cservice;
		
		
		// 일반회원 마이페이지 이동 요청
		@GetMapping("/adminusermypage")
		public String adminUserMyPage(int userNO, Model model) {
			
			model.addAttribute("userDetail", service.getInfo(userNO));
			return "/user_mypage/admin-user-mypage";
		}
		
		//일반회원 수정페이지 이동 요청
		@GetMapping("/adminusermypagemod")
		public String userMyPageMod(int userNO, Model model) {
						
			model.addAttribute("userDetail", service.getInfo(userNO));	
			return "/user_mypage/admin-user-mypage-mod";
		}
		
		// 기업회원 마이페이지 이동 요청
		@GetMapping("/admincompanymypage")
		public String adminCompanyMyPage(int companyNO, Model model) {
					
			model.addAttribute("companyDetail", service.getCompanyInfo(companyNO));
			return "/user_mypage/admin-company-mypage";
		}
				
		// 기업회원 수정페이지 이동 요청
		@GetMapping("/admincompanymypagemod")
		public String companyMyPageMod(int companyNO, Model model) {
								
			model.addAttribute("companyDetail", service.getCompanyInfo(companyNO));	
			return "/user_mypage/admin-company-mypage-mod";
		}
		
		// 일반회원 수정 로직
		@PostMapping("/adminuserupdate")
		public String userUpdate(UserVO vo, RedirectAttributes ra) {
			
			service.updateUser(vo);

			ra.addFlashAttribute("msg", "수정이 완료되었습니다.");
			return "redirect:/membersList/membersList";
		}
		
		
		// 기업회원 수정 로직
		@PostMapping("/admincompanyupdate")
		public String companyUpdate(CompanyVO vo, RedirectAttributes ra) {

			service.updateCompany(vo);

			ra.addFlashAttribute("msg", "수정이 완료되었습니다.");
			return "redirect:/membersList/membersList";
		}
		
		
		// 일반회원 강제탈퇴 로직
		@PostMapping("/adminuserdelete")
		@ResponseBody
		public String userDelete(int userNO) {
			
			uservice.userDelete(userNO);
			
			return "YesUserDelete";
		}
		
		
		// 기업회원 강제탈퇴 로직
		@PostMapping("/admincompanydelete")
		@ResponseBody
		public String companyDelete(int companyNO) {

			cservice.companyDelete(companyNO);

			return "YesCompanyDelete";
		}
		
}
