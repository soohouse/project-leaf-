package com.spring.leaf.userlist.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.leaf.admin.command.CompanyAcceptVO;
import com.spring.leaf.devinfo.command.DevInfoVO;
import com.spring.leaf.user.controller.UserController;
import com.spring.leaf.userlist.command.UserListDetailVO;
import com.spring.leaf.userlist.command.UserListVO;
import com.spring.leaf.userlist.service.IUserListService;
import com.spring.leaf.util.PageCreator;
import com.spring.leaf.util.PageVO;

//개발자 리스트 컨트롤러 : 2022-08-04 생성

@Controller
@RequestMapping("/userList")
public class UserListController {

	@Autowired
	private IUserListService service;

	// 로그 출력을 위한 Logger 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(UserListController.class);

	// 일반회원 목록 이동 요청
		@GetMapping("/userList")
		public String userList(PageVO vo, Model model) {
			
		//페이징
		System.out.println(vo);
		PageCreator pc = new PageCreator();
		pc.setPaging(vo);
		pc.setArticleTotalCount(service.getTotal(vo));
		System.out.println(pc);
		//
		
		logger.info("/userList/userList: GET (일반회원 목록 페이지 이동)");
		
		model.addAttribute("pc", pc);
		model.addAttribute("userList", service.userList(vo));
		return "/board/dev_list";
	}
	
	
	//일반회원 목록 상세보기
		@GetMapping("/userListDetail")
		@ResponseBody
		public UserListDetailVO userListDetail(int userNO) {
		logger.info("/modal_mypage/developerInfo : GET (개발자목록 상세 보기 요청)");
		return service.userListDetail(userNO);
		}
		
		

}
