package com.spring.leaf.userapply.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.leaf.user.command.UserVO;
import com.spring.leaf.userapply.service.IUserApplyService;
import com.spring.leaf.userlist.controller.UserListController;
import com.spring.leaf.userlist.service.IUserListService;
import com.spring.leaf.util.PageApplyCreator;
import com.spring.leaf.util.PageApplyVO;
import com.spring.leaf.util.PageCreator;

@Controller
@RequestMapping("/userapply")
public class UserApplyController {

		@Autowired
		private IUserApplyService service;
		
		// 로그 출력을 위한 Logger 객체 생성
		private static final Logger logger = LoggerFactory.getLogger(UserListController.class);
		

		// 지원현황조회 페이지 이동 요청
		@GetMapping("/applystatus")
		public String applyStatusList(PageApplyVO pvo, HttpSession session, Model model) {
			
			UserVO vo = (UserVO) session.getAttribute("user");
			
			//페이징
			System.out.println(pvo);
			PageApplyCreator pc = new PageApplyCreator();
			pc.setPaging(pvo);
			pc.setArticleTotalCount(service.projectApplyCount(vo.getUserNO()));
			System.out.println(pc);
			
			logger.info("/userapply/applystatus: GET (지원현황 페이지로 이동)");
			
			
			model.addAttribute("applyStatusList", service.applyStatusList(vo.getUserNO(),pvo));
			model.addAttribute("projectApplyCount", service.projectApplyCount(vo.getUserNO()));
		model.addAttribute("pc", pc);
			
			
			return "user_mypage/user_apply_status";
		}
		
		
		//지원한 프로젝트 상세보기
		@GetMapping("/applystatuscontent")
		public String applyStatusContent(@RequestParam int projectNO, Model model) {
			
			model.addAttribute("applyStatusContent", service.applyStatusContent(projectNO));
			
			return "user_mypage/user_apply_status_content";
		}

		// 지원결과 페이지 이동 요청
		@GetMapping("/applyresult")
		public String applyResultList(HttpSession session, Model model) {
			logger.info("/userapply/applyresult: GET (지원결과조회 페이지로 이동)");
			
			UserVO vo = (UserVO) session.getAttribute("user");
					
			model.addAttribute("applyResultList", service.applyResultList(vo.getUserNO()));
			model.addAttribute("userNO", vo.getUserNO());
					
			return "user_mypage/user_apply_result";
		}
				
		

}
