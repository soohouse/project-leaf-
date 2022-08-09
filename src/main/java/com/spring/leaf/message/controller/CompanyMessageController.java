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

import com.spring.leaf.message.command.UserMessageVO;
import com.spring.leaf.message.service.ICompanyMessageService;
import com.spring.leaf.notice.command.NoticeVO;
import com.spring.leaf.user.controller.UserController;

@Controller
@RequestMapping("/companymessage")
public class CompanyMessageController {

	// 로그 출력을 위한 Logger 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(CompanyMessageController.class);

	@Autowired
	private ICompanyMessageService service;
	
	//쪽지쓰기 요청
	@PostMapping("/userSendMessage")
	public String userSendMessage(UserMessageVO vo) {
		
		service.userSendMessage(vo);
		
		return "redirect://";
	}


	// 기업쪽지함(목록으로) 이동 요청
	@GetMapping("/companyMessageList")
	public String companyMessageList(Model model) {

		model.addAttribute("companyMessageList", service.companyMessageList());

		return "/login/msg-list";
	}

	// 쪽지 상세보기
	@GetMapping("/companyMessageContent/{companyMessageNO}")
	public String companyMessageContent(@PathVariable int companyMessageNO, Model model) {

		model.addAttribute("companyMessage", service.companyMessageContent(companyMessageNO));

		return "login/msg-content";
	}

	// 글 삭제 처리
	@PostMapping("/companyMessageDelete")
	public String companyMessageDelete(int companyMessageNO, RedirectAttributes ra) {

		service.companyMessageDelete(companyMessageNO);

		ra.addFlashAttribute("msg", "deleteSuccess");
		return "redirect:/login/msg-list";
	}

}
