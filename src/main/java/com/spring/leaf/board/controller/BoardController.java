package com.spring.leaf.board.controller;

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

import com.spring.leaf.board.command.BoardVO;
import com.spring.leaf.board.service.IBoardService;
import com.spring.leaf.user.controller.UserController;


// free 컨트롤러 : 2022-07-30 생성

@Controller
@RequestMapping("/board")
public class BoardController {
	
	// 로그 출력을 위한 Logger 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	//자유게시판 서비스 연결
	@Autowired
	private IBoardService service;
	
	//자유게시판 목록 페이지로 이동 요청
	@GetMapping("/boardList")
	public String boardList(Model model) {
		
		model.addAttribute("boardList", service.boardList());
		
		return "/board/free_list";
	}
	
	//자유게시판 글쓰기 페이지로 이동 요청
	@GetMapping("/boardWrite")
	public String boardWrite() {
		return "/board/free_write";
	}
	
	//글쓰기 요청
	@PostMapping("/boardWrite")
	public String boardWrite(BoardVO vo) {
		
		service.boardWrite(vo);
		
		return "redirect:/board/boardList";
	}
	
	//글 상세보기
	@GetMapping("/boardContent/{boardNo}")
	public String boardContent(@PathVariable int boardNo, Model model) {
		
		model.addAttribute("board", service.boardContent(boardNo));
		
		return "board/free_content";
	}
	
	//글 수정 페이지 이동
	@GetMapping("/boardModify")
	public String boardModify(@RequestParam("boardNo") int boardNo, Model model) {
		
		model.addAttribute("board", service.boardContent(boardNo));
		
		return "board/free_modify";
	}
	
	//글 수정 처리
	@PostMapping("/boardUpdate")
	public String boardUpdate(BoardVO vo, RedirectAttributes ra) {
		
		service.boardModify(vo);
		ra.addFlashAttribute("msg", "updateSuccess");
		return "redirect:/board/boardContent/" + vo.getBoardNo();
	}
	
	//글 삭제 처리
	@PostMapping("/boardDelete")
	public String boardDelete(BoardVO vo, RedirectAttributes ra) {
		
		service.boardDelete(vo.getBoardNo());
		ra.addFlashAttribute("msg", "deleteSuccess");
		return "redirect:/board/boardList";
	}
	
}
