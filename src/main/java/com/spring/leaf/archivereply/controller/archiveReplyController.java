package com.spring.leaf.archivereply.controller;

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

import com.spring.leaf.archivereply.command.ArchiveReplyVO;
import com.spring.leaf.archivereply.service.IArchiveReplyService;
import com.spring.leaf.user.controller.UserController;

// 자료실 댓글 컨트롤러 : 2022-08-01 생성

@Controller
@RequestMapping("/archivereply")
public class ArchiveReplyController {

	// 로그 출력을 위한 Logger 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	//자료실 서비스 연결
	@Autowired
	private IArchiveReplyService service;
	
	//자료실 댓글 등록
	@PostMapping("/archiveReplyWrite")
	@ResponseBody
	public String archiveReplyWrite(@RequestBody ArchiveReplyVO vo) {
		service.archiveReplyWrite(vo);
		
		return "writeSuccess";
	}
	
	//자료실 댓글 목록
	@ResponseBody
	@GetMapping("/archiveReplyList/{archiveNo}")
	public Map<String, Object> boardReplyList(@PathVariable int archiveNo, Model model ) {
		
		List<ArchiveReplyVO> list = service.archiveReplyList(archiveNo);
		int total = service.archiveReplyTotal(archiveNo);
		
		//댓글수
		int ReplyTotal = service.archiveReplyTotal(archiveNo);
		model.addAttribute("archiveReplyCount", ReplyTotal);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("archiveReplyList", list);
		map.put("archiveReplyTotal", total);
		
		return map;
	}
	
	//댓글 수정
	@PostMapping("/archiveReplyUpdate")
	@ResponseBody
	public String archiveUpdate(@RequestParam("archiveReplyNO") int archiveReplyNo) {
		service.archiveReplyUpdate(archiveReplyNo);
		return "UpdateSuccess";
	}
	
	
	//댓글 삭제
	@PostMapping("/archiveReplyDelete")
	@ResponseBody
	public String archiveDelete(@RequestParam("archiveReplyNO") int archiveReplyNo) {
		service.archiveReplyDelete(archiveReplyNo);
		return "DeleteSuccess";
	}
	
	
}