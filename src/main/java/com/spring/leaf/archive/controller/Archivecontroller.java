package com.spring.leaf.archive.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.leaf.archive.command.ArchiveVO;
import com.spring.leaf.archive.service.IArchiveService;
import com.spring.leaf.user.controller.UserController;


//data 컨트롤러 : 2022-08-01 생성

@Controller
@RequestMapping("/archive")
public class Archivecontroller {

	// 로그 출력을 위한 Logger 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
		
	//자료실 서비스 연결
	@Autowired
	private IArchiveService service;
	
	//자료실 목록 페이지로 이동 요청
	@GetMapping("/archiveList")
	public String archiveList(Model model) {
		
		model.addAttribute("archiveList", service.archiveList());
		
		return "/board/archive_list";
	}
	
	//글쓰기 페이지로 이동 요청
	@GetMapping("/archiveWrite")
	public String archiveWrite() {
		return "/board/archive_write";
	}
	
	//글쓰기 요청
	@PostMapping("/archiveContent/{archiveNo}")
	public String archiveContent(@PathVariable int archiveNo, Model model) {
		
		model.addAttribute("archive", service.archiveContent(archiveNo));
		
		return "board/archive_content";
	}
	
	//글 수정 페이지 이동
	@GetMapping("/archiveModify")
	public String archiveModify(@RequestParam("archiveNo") int archiveNo, Model model) {
		
		model.addAttribute("archive", service.archiveContent(archiveNo));
		
		return "board/archive_modify";
	}
	
	//글 수정 처리
	@PostMapping("/archiveUpdate")
	public String archiveUpdate(ArchiveVO vo, RedirectAttributes ra) {
		
		service.archiveModify(vo);
		ra.addFlashAttribute("msg", "updateSuccess");
		return "redirect:/board/archiveContent/" + vo.getArchiveNo();
	}
	
	//글 삭제 처리
	@PostMapping("/archiveDelete")
	public String archiveDelete(ArchiveVO vo, RedirectAttributes ra) {
		
		service.archiveDelete(vo.getArchiveNo());
		ra.addFlashAttribute("msg", "deleteSuccess");
		return "redirect:/board/archiveList";
	}
}
