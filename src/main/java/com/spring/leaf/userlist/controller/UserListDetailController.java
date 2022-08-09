package com.spring.leaf.userlist.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.leaf.userlist.command.UserListDetailVO;
import com.spring.leaf.userlist.command.UserListVO;
import com.spring.leaf.userlist.service.IUserListDetailService;
import com.spring.leaf.userlist.service.IUserListService;

@Controller
@RequestMapping("/userList")
public class UserListDetailController {
	
	@Autowired
	private IUserListDetailService service;

	// 로그 출력을 위한 Logger 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(UserListController.class);
	
	
	
	// 일반회원 목록 상세보기
		@GetMapping("/userListDetail")
		@ResponseBody
		public UserListDetailVO userListDetail(int userNO) {
			logger.info("/modal_mypage/developerInfo : GET (개발자목록 상세 보기 요청)");
			return service.userListDetail(userNO);
		}
}
