package com.spring.leaf.admin.controlller;

import java.util.HashMap;
import java.util.Map;

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
import com.spring.leaf.util.PageCreator;
import com.spring.leaf.util.PageVO;


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
	public String commonCODE(Model model,  PageVO vo) {
		logger.info("/admin/commonCODE : GET (공통코드 관리 페이지 이동)");
		
		//페이징
		System.out.println(vo);
		PageCreator pc = new PageCreator();
		pc.setPaging(vo);
		pc.setArticleTotalCount(service.getTotal(vo));
		System.out.println(pc);
		
		model.addAttribute("commonList", service.commonList(vo));
		model.addAttribute("pc", pc);
		
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
	public String companyAccept(Model model, PageVO vo) {
		logger.info("/admin/companyAccept : GET (기업회원 가입 관리 페이지 이동 요청)");
		
		//페이징
		System.out.println(vo);
		PageCreator pc = new PageCreator();
		pc.setPaging(vo);
		pc.setArticleTotalCount(service.getTotal(vo));
		System.out.println(pc);
		
		model.addAttribute("companyAcceptList", service.companyAcceptList(vo));
		model.addAttribute("pc", pc);
		
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
	
	
	// 가입 거부 처리
	@PostMapping("/companyDenied")
	@ResponseBody
	public String companyDenied(@RequestParam("companyNO") int companyNO) {
		logger.info("/admin/companyDenied : POST (기업 가입 거부 요청)");
		
		service.companyDenied(companyNO);
		
		return "YesCompanyDenied";
	}
	
	
	// 개발자 통계 페이지 이동 요청
	@GetMapping("/chartDevelopers")
	public String chartDevelopers() {
		logger.info("/admin/chartDevelopers : GET (개발자 통계 페이지 이동)");
		
		return "/admin/chart-developers";
	}
	
	
	// 개발자 신규 가입 현황 데이터 얻어오는 요청
	@PostMapping("/chartDevelopers1")
	@ResponseBody
	public Map<String, Object> chartDevelopers1() {
		
		Map<String, Object> map = new HashMap<>();
		map.put("userRegistCount", service.userRegistCount());
		map.put("userDate", service.userDate());
		
		return map;
	}
	
	
	// 개발자 프로필사진 등록 현황 데이터 얻어오는 요청
	@PostMapping("/chartDevelopers2")
	@ResponseBody
	public Map<String, Object> chartDevelopers2() {

		Map<String, Object> map = new HashMap<>();
		map.put("userProfileCount", service.userProfileCount());

		return map;
	}
	
	
	// 개발자 이력서 등록 현황 데이터 얻어오는 요청
	@PostMapping("/chartDevelopers3")
	@ResponseBody
	public Map<String, Object> chartDevelopers3() {
		
		Map<String, Object> map = new HashMap<>();
		map.put("userResumeCount", service.userResumeCount());
		
		return map;
	}
	
	
	// 한 달간 개발자 신규가입 목록을 얻어오는 요청
	@PostMapping("/chartDevelopers4")
	@ResponseBody
	public Map<String, Object> chartDevelopers4() {
		
		Map<String, Object> map = new HashMap<>();
		map.put("userNewList", service.userNewList());
		
		return map;
	}
	
	
	// 개발자 탈퇴 현황을 얻어오는 요청
	@PostMapping("/chartDevelopers5")
	@ResponseBody
	public Map<String, Object> chartDevelopers5() {
		
		Map<String, Object> map = new HashMap<>();
		map.put("userDeleteCount", service.userDeleteCount());
		map.put("userDate", service.userDate());
		
		return map;
	}
	
	
	// 한 달 간 개발자 탈퇴 목록을 얻어오는 요청
	@PostMapping("/chartDevelopers6")
	@ResponseBody
	public Map<String, Object> chartDevelopers6() {
		
		Map<String, Object> map = new HashMap<>();
		map.put("userDeleteList", service.userDeleteList());
		
		return map;
	}
	
	
	// 개발자 별 프로젝트 지원 수를 얻어오는 요청
	@PostMapping("/chartDevelopers7")
	@ResponseBody
	public Map<String, Object> chartDevelopers7() {

		Map<String, Object> map = new HashMap<>();
		map.put("userApplyCount", service.userApplyCount());

		return map;
	}
	
	
	// 개발자 별 받은 쪽지 수를 얻어오는 요청
	@PostMapping("/chartDevelopers8")
	@ResponseBody
	public Map<String, Object> chartDevelopers8() {
		
		Map<String, Object> map = new HashMap<>();
		map.put("userMessageCount", service.userMessageCount());

		return map;
	}
	
	
	// 개발자 별 자유게시판 게시물 수를 얻어오는 요청
	@PostMapping("/chartDevelopers9")
	@ResponseBody
	public Map<String, Object> chartDevelopers9() {

		Map<String, Object> map = new HashMap<>();
		map.put("userBoardCount", service.userBoardCount());

		return map;
	}
	
	
	// 개발자 별 질문 글 수를 얻어오는 요청
	@PostMapping("/chartDevelopers10")
	@ResponseBody
	public Map<String, Object> chartDevelopers10() {

		Map<String, Object> map = new HashMap<>();
		map.put("userQuestionCount", service.userQuestionCount());

		return map;
	}

	
	// 개발자 별 답변 글 수를 얻어오는 요청
	@PostMapping("/chartDevelopers11")
	@ResponseBody
	public Map<String, Object> chartDevelopers11() {

		Map<String, Object> map = new HashMap<>();
		map.put("userAnswerCount", service.userAnswerCount());

		return map;
	}

	
	// 개발자 별 자료실 게시물 수를 얻어오는 요청
	@PostMapping("/chartDevelopers12")
	@ResponseBody
	public Map<String, Object> chartDevelopers12() {

		Map<String, Object> map = new HashMap<>();
		map.put("userArchiveCount", service.userArchiveCount());

		return map;
	}
	
	
	// 기업 통계 페이지 이동 요청
	@GetMapping("/chartCompanies")
	public String chartCompanies() {
		logger.info("/admin/chartCompanies : GET (기업 통계 페이지 이동)");

		return "/admin/chart-companies";
	}
	
	
	// 기업 신규 가입 현황 데이터 얻어오는 요청
	@PostMapping("/chartCompanies1")
	@ResponseBody
	public Map<String, Object> chartCompanies1() {

		Map<String, Object> map = new HashMap<>();
		map.put("companyRegistCount", service.companyRegistCount());
		map.put("companyDate", service.userDate());

		return map;
	}
	
	
	// 전체 기업들의 가입 현황을 얻어오는 요청
	@PostMapping("/chartCompanies2")
	@ResponseBody
	public Map<String, Object> chartCompanies2() {

		Map<String, Object> map = new HashMap<>();
		map.put("companyStatus", service.companyStatus());

		return map;
	}
	
	
	// 각 기업들의 가입 현황을 얻어오는 요청
	@PostMapping("/chartCompanies3")
	@ResponseBody
	public Map<String, Object> chartCompanies3() {

		Map<String, Object> map = new HashMap<>();
		map.put("companyCRG", service.companyCRG());

		return map;
	}
	
	
	// 한 달 간 기업회원 신규 가입 목록을 얻어오는 요청
	@PostMapping("/chartCompanies4")
	@ResponseBody
	public Map<String, Object> chartCompanies4() {

		Map<String, Object> map = new HashMap<>();
		map.put("companyNewList", service.companyNewList());

		return map;
	}
	
	
	// 가입한 기업들의 위치 정보를 얻어오는 요청
	@PostMapping("/chartCompanies5")
	@ResponseBody
	public Map<String, Object> chartCompanies5() {

		Map<String, Object> map = new HashMap<>();
		map.put("companyRegion", service.companyRegion());

		return map;
	}
	
	
	// 기업 로고를 등록한 기업의 수를 얻어오는 요청
	@PostMapping("/chartCompanies6")
	@ResponseBody
	public Map<String, Object> chartCompanies6() {

		Map<String, Object> map = new HashMap<>();
		map.put("companyLogoCount", service.companyLogoCount());

		return map;
	}
	
	
	// 6개월 동안 탈퇴한 기업 수를 얻어오는 요청
	@PostMapping("/chartCompanies7")
	@ResponseBody
	public Map<String, Object> chartCompanies7() {
		
		Map<String, Object> map = new HashMap<>();
		map.put("companyDeleteCount", service.companyDeleteCount());
		map.put("userDate", service.userDate());
		
		return map;
	}
	
	
	// 한 달 간 기업 탈퇴 목록을 얻어오는 요청
	@PostMapping("/chartCompanies8")
	@ResponseBody
	public Map<String, Object> chartCompanies8() {

		Map<String, Object> map = new HashMap<>();
		map.put("companyDeleteList", service.companyDeleteList());

		return map;
	}
	
	
	// 기업 별 프로젝트 등록 수 얻어오는 요청
	@PostMapping("/chartCompanies9")
	@ResponseBody
	public Map<String, Object> chartCompanies9() {

		Map<String, Object> map = new HashMap<>();
		map.put("companyProjectCount", service.companyProjectCount());

		return map;
	}
	
	
	// 기업 별 보낸 쪽지 수 얻어오는 요청
	@PostMapping("/chartCompanies10")
	@ResponseBody
	public Map<String, Object> chartCompanies10() {

		Map<String, Object> map = new HashMap<>();
		map.put("companyMessageCount", service.companyMessageCount());

		return map;
	}
	
	
	// 기업 별 자유게시판 게시글 수 얻어오는 요청
	@PostMapping("/chartCompanies11")
	@ResponseBody
	public Map<String, Object> chartCompanies11() {

		Map<String, Object> map = new HashMap<>();
		map.put("companyBoardCount", service.companyBoardCount());

		return map;
	}

	
	// 기업 별 자료실 게시글 수 얻어오는 요청
	@PostMapping("/chartCompanies12")
	@ResponseBody
	public Map<String, Object> chartCompanies12() {

		Map<String, Object> map = new HashMap<>();
		map.put("companyArchiveCount", service.companyArchiveCount());

		return map;
	}
	
	
	// 프로젝트 통계 페이지 이동 요청
	@GetMapping("/chartProjects")
	public String chartProjects() {
		logger.info("/admin/chartProjects : GET (프로젝트 통계 페이지 이동)");

		return "/admin/chart-projects";
	}
	
	
	// 6개월 동안 등록된 프로젝트 수를 얻어오는 요청
	@PostMapping("/chartProjects1")
	@ResponseBody
	public Map<String, Object> chartProjects1() {

		Map<String, Object> map = new HashMap<>();
		map.put("projectRegistCount", service.projectRegistCount());
		map.put("userDate", service.userDate());

		return map;
	}
	
	
	// 6개월 동안 삭제된 프로젝트 수를 얻어오는 요청
	@PostMapping("/chartProjects2")
	@ResponseBody
	public Map<String, Object> chartProjects2() {

		Map<String, Object> map = new HashMap<>();
		map.put("projectDeleteCount", service.projectDeleteCount());
		map.put("userDate", service.userDate());

		return map;
	}
	
	
	// 6개월 동안 등록된 프로젝트 수와 삭제된 프로젝트 수를 얻어오는 요청
	@PostMapping("/chartProjects3")
	@ResponseBody
	public Map<String, Object> chartProjects3() {

		Map<String, Object> map = new HashMap<>();
		map.put("projectRegistCount", service.projectRegistCount());
		map.put("projectDeleteCount", service.projectDeleteCount());
		map.put("userDate", service.userDate());

		return map;
	}
	
	
	// 한 달 간 프로젝트 신규 등록을 얻어오는 요청
	@PostMapping("/chartProjects4")
	@ResponseBody
	public Map<String, Object> chartProjects4() {

		Map<String, Object> map = new HashMap<>();
		map.put("projectNewList", service.projectNewList());

		return map;
	}
	
	
	// 한 달 간 프로젝트 삭제을 얻어오는 요청
	@PostMapping("/chartProjects5")
	@ResponseBody
	public Map<String, Object> chartProjects5() {

		Map<String, Object> map = new HashMap<>();
		map.put("projectDeleteList", service.projectDeleteList());

		return map;
	}
	
	
	// 모집 중인 프로젝트의 지원자 수를 얻어오는 요청
	@PostMapping("/chartProjects6")
	@ResponseBody
	public Map<String, Object> chartProjects6() {

		Map<String, Object> map = new HashMap<>();
		map.put("projectApplyNow", service.projectApplyNow());

		return map;
	}
	
	
	// 모집이 종료된 프로젝트의 지원자 수를 얻어오는 요청
	@PostMapping("/chartProjects7")
	@ResponseBody
	public Map<String, Object> chartProjects7() {

		Map<String, Object> map = new HashMap<>();
		map.put("projectApplyEnd", service.projectApplyEnd());

		return map;
	}
	
	
	// 전체 프로젝트의 지원자 수를 얻어오는 요청
	@PostMapping("/chartProjects8")
	@ResponseBody
	public Map<String, Object> chartProjects8() {

		Map<String, Object> map = new HashMap<>();
		map.put("projectApply", service.projectApply());

		return map;
	}
	
	
	// 전체 프로젝트의 지원자 수 목록을 얻어오는 요청
	@PostMapping("/chartProjects9")
	@ResponseBody
	public Map<String, Object> chartProjects9() {

		Map<String, Object> map = new HashMap<>();
		map.put("projectApplyList", service.projectApplyList());

		return map;
	}
	
	
	// 프로젝트 별 조회수를 얻어오는 요청
	@PostMapping("/chartProjects10")
	@ResponseBody
	public Map<String, Object> chartProjects10() {

		Map<String, Object> map = new HashMap<>();
		map.put("projectViews", service.projectViews());

		return map;
	}
	
	
	// 프로젝트 별 좋아요 수를 얻어오는 요청
	@PostMapping("/chartProjects11")
	@ResponseBody
	public Map<String, Object> chartProjects11() {

		Map<String, Object> map = new HashMap<>();
		map.put("projectLikes", service.projectLikes());

		return map;
	}
	
	
	// 프로젝트들의 상태를 얻어오는 요청
	@PostMapping("/chartProjects12")
	@ResponseBody
	public Map<String, Object> chartProjects12() {

		Map<String, Object> map = new HashMap<>();
		map.put("projectStatusList", service.projectStatusList());

		return map;
	}
	
	
	// 지원 통계 페이지 이동 요청
	@GetMapping("/chartApplies")
	public String chartApplies() {
		logger.info("/admin/chartApplies : GET (지원 통계 페이지 이동)");

		return "/admin/chart-applies";
	}
	
	
	// 전체 지원 상태를 얻어오는 요청
	@PostMapping("/chartApplies1")
	@ResponseBody
	public Map<String, Object> chartApplies1() {

		Map<String, Object> map = new HashMap<>();
		map.put("applyStatusList", service.applyStatusList());

		return map;
	}
	
}
