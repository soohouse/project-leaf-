package com.spring.leaf.message.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.leaf.message.command.UserMessageVO;
import com.spring.leaf.message.service.ICompanyMessageService;
import com.spring.leaf.message.service.IUserMessageService;
import com.spring.leaf.notice.service.INoticeService;
import com.spring.leaf.user.command.UserVO;
import com.spring.leaf.user.controller.UserController;
import com.spring.leaf.userlist.command.UserListVO;

//유저 메세지 수신 컨트롤러 : 2022-08-03 생성

@Controller
@RequestMapping("/usermessage")
public class UserMessageController {
	// 로그 출력을 위한 Logger 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private IUserMessageService service;

	// 유저쪽지함(목록으로) 이동 요청
	@PostMapping("/userMessageList")
	@ResponseBody
	public Map<String, Object> userMessageList(int userNO) {
		List<UserMessageVO> list = service.userMessageList(userNO);
		Map<String, Object> map = new HashMap<>();
		map.put("list", list);
		
		map.put("count", service.userMessageCount(userNO));
	
		
		return map;
	}

	// 받은 쪽지 상세보기
	@PostMapping("/userMessageContent")
	@ResponseBody
	public UserMessageVO userMessageContent(int userMessageNO) {
		return service.userMessageContent(userMessageNO);
	}
	
}
