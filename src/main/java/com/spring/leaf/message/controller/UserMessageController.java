package com.spring.leaf.message.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.leaf.message.service.ICompanyMessageService;
import com.spring.leaf.message.service.IUserMessageService;
import com.spring.leaf.notice.service.INoticeService;
import com.spring.leaf.user.controller.UserController;

//유저 메세지 수신 컨트롤러 : 2022-08-03 생성

@Controller
@RequestMapping("/usermessage")
public class UserMessageController {
	// 로그 출력을 위한 Logger 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private IUserMessageService service;

	// 유저쪽지함(목로으로) 이동 요청
	@GetMapping("/userMessageList")
	public String userMessageList(Model model) {

		model.addAttribute("userMessageList", service.userMessageList());

		return "/login/msg-list";
	}

	// 쪽지 상세보기
	@GetMapping("/userMessageContent/{userMessageNO}")
	public String userMessageContent(@PathVariable int userMessageNO, Model model) {

		model.addAttribute("userMessage", service.userMessageContent(userMessageNO));

		return "login/msg-content";
	}
	
	//글 삭제 처리
	@PostMapping("/userMessageDelete")
	public String userMessageDelete(int userMessageNO, RedirectAttributes ra) {
		
		service.userMessageDelete(userMessageNO);
		
		ra.addFlashAttribute("msg", "deleteSuccess");
		return "redirect:/login/msg-list";
	}
}
