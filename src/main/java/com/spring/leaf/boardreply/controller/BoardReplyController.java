package com.spring.leaf.boardreply.controller;

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
import org.springframework.web.servlet.ModelAndView;

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
	@GetMapping("/boardReplyList/{boardReplyNo}")
	@ResponseBody
	public Map<String, Object> boardReplyList(@PathVariable int boardReplyNo, Model model) {
		logger.info("댓글 목록 컨트롤러 동작");
		List<BoardReplyVO> list = service.boardReplyList(boardReplyNo);
		int total = service.boardReplyTotal(boardReplyNo);
		
		ModelAndView view = new ModelAndView();
		logger.info("댓글 개수" + service.boardReplyTotal(boardReplyNo));
		view.setViewName("/board/boardList");
		Map<String, Object> map = new HashMap<>();
		map.put("boardReplyList", list);
		map.put("boardReplyTotal", total);
		
		return map;
	}

}
