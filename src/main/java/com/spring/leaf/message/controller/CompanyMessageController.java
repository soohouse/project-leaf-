package com.spring.leaf.message.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.leaf.message.command.CompanySendMessageVO;
import com.spring.leaf.message.command.UserMessageVO;
import com.spring.leaf.message.service.ICompanyMessageService;
import com.spring.leaf.notice.command.NoticeVO;
import com.spring.leaf.user.controller.UserController;

@Controller
@RequestMapping("/companyMessage")
public class CompanyMessageController {

	// 로그 출력을 위한 Logger 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(CompanyMessageController.class);

	@Autowired
	private ICompanyMessageService service;
	
	//쪽지보내기 요청
	@PostMapping("/userSendMessage")
	@ResponseBody
	public String userSendMessage(@RequestBody UserMessageVO vo) {
		
		System.out.println(vo);
		
		service.userSendMessage(vo);
		
		return "yes";
	}
	
	// 기업 보낸 쪽지함(목록으로) 이동 요청
	@PostMapping("/companySendList")
	@ResponseBody
	public Map<String, Object> companySendList(@RequestParam("companyName") String userMessageWriter, Model model) {

		List<CompanySendMessageVO> list = service.companySendList(userMessageWriter);
			
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
			
		return map;
	}
	
	
	// 유저에게 보낸 쪽지 상세보기
	@PostMapping("/sendMessageContent")
	@ResponseBody
	public UserMessageVO sendMessageContent(int userMessageNO) {
		return service.sendMessageContent(userMessageNO);
	}
		
	
	// 기업 받은 쪽지함(목록으로) 이동 요청
	@GetMapping("/companyReceiveList")
	public String companyMessageList(Model model) {

		model.addAttribute("companyMessageList", service.companyMessageList());

		return "/login/msg-list";
	}
	


	// 쪽지 삭제 처리
	@PostMapping("/companyMessageDelete")
	public String companyMessageDelete(int companyMessageNO, RedirectAttributes ra) {

		service.companyMessageDelete(companyMessageNO);

		ra.addFlashAttribute("msg", "deleteSuccess");
		return "redirect:/login/msg-list";
	}
	
}
