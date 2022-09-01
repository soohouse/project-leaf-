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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.leaf.company.command.CompanyVO;
import com.spring.leaf.project.command.ProjectContentVO;
import com.spring.leaf.project.command.ProjectVO;
import com.spring.leaf.project.service.IProjectService;
import com.spring.leaf.projectapply.command.ApplyVO;
import com.spring.leaf.projectapply.command.MyProjectApplyDetailVO;
import com.spring.leaf.projectapply.command.MyProjectApplyListVO;
import com.spring.leaf.projectapply.command.ProjectPassListVO;
import com.spring.leaf.projectapply.service.IProjectApplyService;
import com.spring.leaf.util.PageApplyCreator;
import com.spring.leaf.util.PageApplyVO;

@Controller
@RequestMapping("/project")
public class ProjectApplyController {
	
	@Autowired
	private IProjectApplyService service;
	
	@Autowired
	private IProjectService pservice;
	
	// 지원하기 클릭 시 지원하기 페이지 요청 (POST로 하여 URL로 아무 프로젝트 지원에 접근할 수 없도록 제한)
	@PostMapping("/projectApply")
	public String project3(int projectNO, int userNO, Model model) {
		
		ProjectContentVO vo = pservice.getContent(projectNO);
		
		model.addAttribute("resumeRealname", service.userInfoGet(userNO));
		model.addAttribute("projectNO", projectNO);
		model.addAttribute("projectInfo", vo);
		
		System.out.println("yaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" + vo);
		
		return "project/project-putin";
	}
	
	//지원 후 상세보기 창
	@PostMapping("/projectapply")
	public String projectapply(ApplyVO vo, RedirectAttributes ra) {
		
		service.projectapply(vo);
		
		ra.addFlashAttribute("msg", "해당 프로젝트에 지원하셨습니다.");
		
		return "redirect:/project/projectview?projectNO=" + vo.getProjectNO();
	}
	
	
	// 기업회원 자신 프로젝트 지원현황 페이지 이동 요청
	@GetMapping("/projectMyApply")
	public String projectMyApply(PageApplyVO pvo, HttpSession session, Model model) {
		
		CompanyVO vo = (CompanyVO) session.getAttribute("company");
		
		//페이징
		System.out.println(pvo);
		PageApplyCreator pc = new PageApplyCreator();
		pc.setPaging(pvo);
		pc.setArticleTotalCount(service.myProjectCount(vo.getCompanyNO(), pvo));
		System.out.println(pc);
		
		model.addAttribute("myProjectStatus", service.myProjectStatus(vo.getCompanyNO(), pvo));
		model.addAttribute("myProjectCount", service.myProjectCount(vo.getCompanyNO(), pvo));
		model.addAttribute("companyNO", vo.getCompanyNO());
		model.addAttribute("pc", pc);
		
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
	
	
	// 지원 취소 처리
	@PostMapping("/applyCancel")
	@ResponseBody
	public String applyCancel(int userNO, int projectNO) {
		
		service.applyCancel(userNO, projectNO);
		
		return "YesApplyCancel";
	}
	
	
	// 프로젝트 최종 합격자 목록 불러오기
	@PostMapping("/projectPassList/{projectNO}")
	@ResponseBody
	public Map<String, Object> projectPassList(@PathVariable("projectNO") int projectNO) {
		
		List<ProjectPassListVO> list = service.applyPassList(projectNO);
		
		Map<String, Object> map = new HashMap<>();
		map.put("projectPassList", list);
		
		return map;
	}
}
