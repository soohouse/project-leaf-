package com.spring.leaf.admin.controlller;

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

import com.spring.leaf.admin.command.CommonListVO;
import com.spring.leaf.admin.command.CommonVO;
import com.spring.leaf.admin.command.CompanyAcceptVO;
import com.spring.leaf.admin.service.IAdminService;
import com.spring.leaf.user.controller.UserController;


// 관리자 컨트롤러 : 2022-08-07 생성

@Controller
@RequestMapping("/admin")
public class AdminController {

	// 로그 출력을 위한 Logger 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	
	// 관리자 서비스 연결
	@Autowired
	private IAdminService service;
	
	
	// 공통코드 관리 페이지 이동 요청
	@GetMapping("/commonCODE")
	public String commonCODE(Model model) {
		logger.info("/admin/commonCODE : GET (공통코드 관리 페이지 이동)");
		
		model.addAttribute("commonList", service.commonList());
		
		return "/admin/common-code";
	}
	
	
	// 공통코드 상세 보기 요청
	@GetMapping("/commonDetail")
	@ResponseBody
	public CommonListVO commonDetail(String commonCODE) {
		logger.info("/admin/commonDetail : GET (공통코드 상세 보기 요청)");
		
		return service.commonDetail(commonCODE);
	}
	
	
	// 공통코드 사용 여부 Y로 수정 요청
	@PostMapping("/commonModifyYes")
	@ResponseBody
	public String commonModifyYes(String commonCODE) {
		logger.info("/admin/commonModifyYes : POST (공통코드 사용 여부 Y로 수정)");
		
		service.commonModifyYes(commonCODE);
		
		return "YesCommonModify";
	}
	
	
	// 공통코드 사용 여부 N으로 수정 요청
	@PostMapping("/commonModifyNo")
	@ResponseBody
	public String commonModifyNo(@RequestParam("commonCODE") String commonCODE) {
		logger.info("/admin/commonModifyNo : POST (공통코드 사용 여부 N으로 수정)");

		logger.info("commonCODE : " + commonCODE);
		
		service.commonModifyNo(commonCODE);
		
		return "NoCommonModify";
	}
	
	
	// 공통코드 등록 요청
	@PostMapping("/commonRegist")
	public String commonRegist(CommonVO vo, RedirectAttributes ra) {
		logger.info("/admin/commonRegist : POST (공통코드 등록 요청)");
		
		service.commonRegist(vo);
		
		ra.addFlashAttribute("msg", "성공적으로 등록되었습니다.");
		
		return "redirect:/admin/commonCODE";
	}
	
	
	// 공통코드 중복 체크 요청
	@PostMapping("/commonCheck")
	@ResponseBody
	public String commonCheck(@RequestParam("commonCODE") String commonCODE) {
		logger.info("/admin/commonCheck : POST (공통코드 중복 여부 체크)");
		
		int check = service.commonCheck(commonCODE);
		
		if(check == 0) {
			return "commonCheckSuccess";
		} else {
			return "commonCheckFail";
		}
	}
	
	
	// 공통코드 삭제 요청
	@PostMapping("/commonDelete")
	public String commonDelete(CommonVO vo, RedirectAttributes ra) {
		logger.info("/admin/commonDelete : POST (공통코드 삭제 요청)");
		
		service.commonDelete(vo.getCommonCODE());
		
		ra.addFlashAttribute("msg", "성공적으로 삭제되었습니다.");
		
		return "redirect:/admin/commonCODE";
	}
	
	
	// 기업회원 가입 관리 페이지 이동 요청
	@GetMapping("/companyAccept")
	public String companyAccept(Model model) {
		logger.info("/admin/companyAccept : GET (기업회원 가입 관리 페이지 이동 요청)");
		
		model.addAttribute("companyAcceptList", service.companyAcceptList());
		
		return "/admin/company-accept";
	}
	
	
	// 가입 승인 대기중인 기업 상세보기 요청
	@GetMapping("/companyDetail")
	@ResponseBody
	public CompanyAcceptVO companyDetail(int companyNO) {
		logger.info("/admin/companyDetail : GET (기업회원 상세 보기 요청)");
		
		return service.companyAcceptDetail(companyNO);
	}
	
	
	// 가입 승인 처리
	@PostMapping("/companyAccept")
	@ResponseBody
	public String companyAccept(@RequestParam("companyNO") int companyNO) {
		logger.info("/admin/companyAccept : POST (기업 가입 승인 요청)");
		
		service.companyAccept(companyNO);
		
		return "YesCompanyAccept";
	}
	
}
