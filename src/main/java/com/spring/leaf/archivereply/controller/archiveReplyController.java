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
import com.spring.leaf.util.PageVO;

// 자료실 댓글 컨트롤러 : 2022-08-01 생성

@Controller
@RequestMapping("/archivereply")
public class ArchiveReplyController {

	// 로그 출력을 위한 Logger 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	//자료실 댓글 서비스 연결
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
	@GetMapping("/archiveReplyList/{archiveNo}/{pageNum}")
	public Map<String, Object> archiveReplyList(@PathVariable int archiveNo, @PathVariable int pageNum, Model model ) {
		PageVO vo = new PageVO();
		vo.setPageNum(pageNum); //화면에서 전달된 페이지 번호
		vo.setCpp(10); //댓글은 한 화면에 n개씩.
		
		List<ArchiveReplyVO> list = service.archiveReplyList(vo, archiveNo);
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
	public String archiveReplyUpdate(int archiveReplyNo, String archiveReplyContent) {
		service.archiveReplyUpdate(archiveReplyNo, archiveReplyContent);
		return "UpdateSuccess";
	}
	
	
	//댓글 삭제
	@PostMapping("/archiveReplyDelete")
	@ResponseBody
	public String archiveReplyDelete(@RequestParam("archiveReplyNO") int archiveReplyNo) {
		service.archiveReplyDelete(archiveReplyNo);
		return "DeleteSuccess";
	}
	
	
}