package com.spring.leaf.userapply.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.leaf.userapply.service.IUserApplyService;
import com.spring.leaf.userlist.controller.UserListController;
import com.spring.leaf.userlist.service.IUserListService;

@Controller
@RequestMapping("/userapply")
public class UserApplyController {

		@Autowired
		private IUserApplyService service;
		
		// 로그 출력을 위한 Logger 객체 생성
		private static final Logger logger = LoggerFactory.getLogger(UserListController.class);
		
		
		// 지원결과 페이지 이동 요청
		@GetMapping("/applyresult")
		public String applyResultList(Model model) {
			logger.info("/userapply/applyresult: GET (지원결과조회 페이지 이동)");
			model.addAttribute("applyResultList", service.applyResultList());
			return "/user_mypage/user_apply_result";
		}

}
