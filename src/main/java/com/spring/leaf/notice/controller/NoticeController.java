package com.spring.leaf.notice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.leaf.notice.command.NoticeVO;
import com.spring.leaf.notice.service.INoticeService;
import com.spring.leaf.user.controller.UserController;

//notice 컨트롤러 : 2022-07-29 생성

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	// 로그 출력을 위한 Logger 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	// 공지사항 서비스 연결
	@Autowired
	private INoticeService service;
	
	//공지사항 목록 페이지로 이동 요청
	@GetMapping("/noticeList")
	public String noticeList(Model model) {
		
		model.addAttribute("noticeList", service.noticeList());
		
		return "/board/notice_list";
	}
	
	//글쓰기 페이지로 이동 요청
	@GetMapping("/noticeWrite")
	public String noticeWrite() {
		return "/board/notice_write";
	}
	
	//글쓰기 요청
	@PostMapping("/noticeWrite")
	public String noticeWrite(NoticeVO vo) {
		
		service.noticeWrite(vo);
		
		return "redirect:/noticeList";
	}

	
	//글 상세보기
	@GetMapping("/noticeContent/{noticeNo}")
	public String noticeContent(@PathVariable int noticeNo, Model model) {
		
		model.addAttribute("notice", service.noticeContent(noticeNo));
		
		return "board/notice_content";
	}
	
	//글 수정 페이지 이동
	@GetMapping("/noticeModify")
	public String noticeModify() {
		return "/board/notice_modify";
	}
	
}
