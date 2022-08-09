package com.spring.leaf.projectapply.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.leaf.projectapply.command.ApplyVO;
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
}
