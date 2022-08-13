package com.spring.leaf.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.leaf.project.command.ProjectLikeVO;
import com.spring.leaf.project.command.ProjectVO;
import com.spring.leaf.project.service.IProjectService;


@Controller
@RequestMapping("/project")
public class ProjectController {
	@Autowired
	private IProjectService service;
	
	
	//프로젝트 목록 
	@GetMapping("/project")
	public String project(Model model) {
		
		model.addAttribute("projectlist", service.projectlist());
		
		return "project/project-list";
	}
	
	//프로젝트 상세보기
	@GetMapping("/projectview")
	public String project1(@RequestParam int projectNO, Model model) {
		
		model.addAttribute("projectview", service.getContent(projectNO));
		
		return "project/project-view";
	}
	
	
	// 좋아요 버튼 클릭 처리
	@PostMapping("/projectview")
	@ResponseBody
	public String likeConfirm(@RequestBody ProjectLikeVO vo) {
		System.out.println(vo.getProjectNO());
		System.out.println(vo.getUserNo());
		
		int result = service.searchLike(vo);
		if(result == 0) {
			service.createLike(vo);
			return "like";
		} else {
			service.deleteLike(vo);
			return "delete";
		}
	}
	
	//기업 - 프로젝트 등록하기
	@GetMapping("/projectputin")
	public String project2() {
		return "company_mypage/projectreg";
	}
	// 지원 후 목록 창 이동 
	@PostMapping("/projectputin")
	public String projectputin(ProjectVO vo) {
		service.projectputin(vo);
		return "redirect:/project/project";
	}
	
	//프로젝트 관리 창 
	@GetMapping("/projectadmin")
	public String project5(Model model) {
		
		model.addAttribute("projectlist", service.projectlist());
		
		return "project/project-admin";
	}
	
	// 프로젝트 상세보기 수정하기
		@GetMapping("/projectviewfix")
		public String project4(@RequestParam int projectNO, Model model) {
			
			model.addAttribute("projectview", service.getContent(projectNO));
			
			return "project/project-view-fix";
		}
	
}
