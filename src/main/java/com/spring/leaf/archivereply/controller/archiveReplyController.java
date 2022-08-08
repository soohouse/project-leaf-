package com.spring.leaf.archivereply.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
}