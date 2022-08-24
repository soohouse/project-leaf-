package com.spring.leaf.message.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.leaf.message.command.CompanyMessageVO;
import com.spring.leaf.message.command.UserMessageVO;
import com.spring.leaf.message.service.IAdminMessageService;

@Controller
@RequestMapping("/adminMessage")
public class AdminMessageController {
	
		@Autowired
		private IAdminMessageService service;
	
		//로그 출력을 위한 Logger 객체 생성
		private static final Logger logger = LoggerFactory.getLogger(AdminMessageController.class);
		
		//관리자 -> 유저 쪽지보내기 요청
		@PostMapping("/adminSendUserMessage")
		@ResponseBody
		public String adminSendUserMessage(@RequestBody UserMessageVO vo) {
			System.out.println(vo);
			service.adminSendUserMessage(vo);
			return "yes";
		}
		
		//관리자 -> 기업 쪽지보내기 요청
		@PostMapping("/adminSendCompanyMessage")
		@ResponseBody
		public String adminSendCompanyMessage(@RequestBody CompanyMessageVO vo) {
			System.out.println(vo);
			service.adminSendCompanyMessage(vo);
			return "yes";
		}
	
}
