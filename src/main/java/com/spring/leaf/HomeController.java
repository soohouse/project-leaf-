package com.spring.leaf;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.leaf.home.service.IHomeService;
import com.spring.leaf.project.service.IProjectService;

/*
	메인 화면으로 이동하도록 제어하는 컨트롤러
	수정 X
*/
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	// 프로젝트 목록을 불러오기 위한 서비스
	@Autowired
	private IHomeService service;
	
	
	// 프로젝트 목록을 불러오기 위한 서비스
	@Autowired
	private IProjectService pservice;
	
	
	// 메인페이지 이동 요청
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("/ : GET (메인페이지 이동)");
		
		model.addAttribute("miniNoticeList", service.homeNoticeList());
		model.addAttribute("miniBoardList", service.homeBoardList());
		model.addAttribute("miniProjectList", service.homeProjectList());
		
		model.addAttribute("projectList", pservice.projectlist());
		
		return "home";
	}
	
}
