package com.spring.leaf.boardreply.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.leaf.boardreply.command.BoardReplyVO;
import com.spring.leaf.boardreply.service.IBoardReplyService;
import com.spring.leaf.user.controller.UserController;

//reply 컨트롤러 : 2022-08-01 생성

@Controller
@RequestMapping("/boardreply")
public class BoardReplyController {
	
	// 로그 출력을 위한 Logger 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private IBoardReplyService service;
	
	//댓글 등록
	@PostMapping("/boardReplyWrite")
	@ResponseBody
	public String boardReplyWrite(@RequestBody BoardReplyVO vo) {
		service.boardReplyWrite(vo);
		
		return "writeSuccess";
	}
	
	//댓글 목록
	/*@GetMapping("/boardList")
	public String boardReply*/

}
