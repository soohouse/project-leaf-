package com.spring.leaf.projectapply.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.leaf.company.command.CompanyVO;
import com.spring.leaf.projectapply.command.ApplyVO;
import com.spring.leaf.projectapply.command.MyProjectApplyDetailVO;
import com.spring.leaf.projectapply.command.MyProjectApplyListVO;
import com.spring.leaf.projectapply.service.IProjectApplyService;

@Controller
@RequestMapping("/project")
public class ProjectApplyController {
	@Autowired
	private IProjectApplyService service;
	
	@GetMapping("/projectapply")
	public String project3(@RequestParam int projectNO, Model model) {
		
		model.addAttribute("projectNO", projectNO);
		
		return "project/project-putin";
	}
	
	//지원 후 상세보기 창
	@PostMapping("/projectapply")
	public String projectapply(ApplyVO vo) {
		service.projectapply(vo);
		return "redirect:/project/project";
	}
	
	
	// 기업회원 자신 프로젝트 지원현황 페이지 이동 요청
	@GetMapping("/projectMyApply")
	public String projectMyApply(HttpSession session, Model model) {
		
		CompanyVO vo = (CompanyVO) session.getAttribute("company");
		
		model.addAttribute("myProjectStatus", service.myProjectStatus(vo.getCompanyNO()));
		model.addAttribute("myProjectCount", service.myProjectCount(vo.getCompanyNO()));
		model.addAttribute("companyNO", vo.getCompanyNO());
		
		return "project/project-myproject-apply";
	}
	
	
	// 기업회원 자신 프로젝트 지원자 목록 얻어오기 요청
	@PostMapping("/projectMyApply/{projectNO}")
	@ResponseBody
	public Map<String, Object> projectMyApply(@PathVariable("projectNO") int projectNO) {
		
		List<MyProjectApplyListVO> list = service.myProjectApplyList(projectNO);
		int count = service.myProjectApplyCount(projectNO);
		
		Map<String, Object> map = new HashMap<>();
		map.put("myProjectApplyList", list);
		map.put("myProjectApplyCount", count);
		
		return map;
	}
	
	
	// 기업회원 지원자 상세보기 요청
	@PostMapping("/projectMyApplyDetail")
	@ResponseBody
	public MyProjectApplyDetailVO projectMyApplyDetail(@RequestParam("userNO") int userNO, @RequestParam("projectNO") int projectNO) {
		return service.myProjectApplyDetail(userNO, projectNO);
	}
	
	
	// 지원자 1차 서류 합격 처리
	@PostMapping("/applySetPrimary")
	@ResponseBody
	public String applySetPrimary(int applyNO) {
		
		service.applySetPrimary(applyNO);
			
		return "YesApplySetPrimary";
	}
	
	
	// 지원자 2차 면접 인터뷰 합격 처리
	@PostMapping("/applySetSecondary")
	@ResponseBody
	public String applySetSecondary(int applyNO) {

		service.applySetSecondary(applyNO);

		return "YesApplySetSecondary";
	}
		
		
	// 지원자 최종 합격 처리
	@PostMapping("/applySetFinally")
	@ResponseBody
	public String applySetFinally(int applyNO) {

		service.applySetFinally(applyNO);

		return "YesApplySetFinally";
	}
	

	// 지원자 불합격 처리
	@PostMapping("/applySetNo")
	@ResponseBody
	public String applySetNo(int applyNO) {

		service.applySetNo(applyNO);

		return "YesApplySetNo";
	}
	
	
	
}
