package com.spring.leaf.notice.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.leaf.notice.command.NoticeVO;
import com.spring.leaf.notice.service.INoticeService;
import com.spring.leaf.notice.service.NoticeService;
import com.spring.leaf.user.controller.UserController;
import com.spring.leaf.util.PageCreator;
import com.spring.leaf.util.PageVO;

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
	public String noticeList(PageVO vo, Model model) {
		
		//페이징
		System.out.println(vo);
		PageCreator pc = new PageCreator();
		pc.setPaging(vo);
		pc.setArticleTotalCount(service.getTotal(vo));
		System.out.println(pc);
		
		//현재시간 구하기 (뉴마크) https://mingbocho.tistory.com/11참고
	    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	    Calendar cal = Calendar.getInstance();
	    cal.add(Calendar.DAY_OF_MONTH, -1); //게시글 등록 후 1일간 뉴마크 표시.
	    String nowday = format.format(cal.getTime());
	    model.addAttribute("nowday",nowday);
		
		model.addAttribute("noticeList", service.noticeList(vo));
		model.addAttribute("pc", pc);
		
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
		
		return "redirect:/notice/noticeList";
	}

	
	//글 상세보기
	@GetMapping("/noticeContent/{noticeNo}")
	public String noticeContent(@PathVariable int noticeNo, Model model) {
		
		model.addAttribute("notice", service.noticeContent(noticeNo));
		
		// 조회수 증가
		service.noticeViews(noticeNo);
		
		return "board/notice_content";
	}
	
	//글 수정 페이지 이동
	@GetMapping("/noticeModify")
	public String noticeModify(@RequestParam("noticeNo") int noticeNo, Model model) {
		
		model.addAttribute("notice", service.noticeContent(noticeNo));
		
		return "board/notice_modify";

	}
	
	//글 수정 처리
	@PostMapping("/noticeUpdate")
	public String noticeUpdate(NoticeVO vo, RedirectAttributes ra) {
		
		service.noticeModify(vo);
		
		ra.addFlashAttribute("msg", "updateSuccess");
		return "redirect:/notice/noticeContent/" + vo.getNoticeNo();
	}
	
	//글 삭제 처리
	@PostMapping("/noticeDelete")
	public String noticeDelete(NoticeVO vo, RedirectAttributes ra) {
		
		service.noticeDelete(vo.getNoticeNo());
		
		ra.addFlashAttribute("msg", "deleteSuccess");
		return "redirect:/notice/noticeList";
	}
	
	
	
	
	
}
