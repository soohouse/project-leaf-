package com.spring.leaf.question.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.leaf.question.command.QuestionVO;
import com.spring.leaf.question.service.IQuestionService;
import com.spring.leaf.user.controller.UserController;

//Question 컨트롤러 : 2022-07-30 생성

@Controller
@RequestMapping("/question")
public class QuestionController {
	
	// 로그 출력을 위한 Logger 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
		
	//질문글 서비스 연결
	@Autowired
	private IQuestionService service;
	
	//질문글 목록 페이지로 이동 요청
	@GetMapping("/questionList")
	public String questionList(Model model) {
		
		model.addAttribute("questionList", service.questionList());
		
		return "/board/qna_list";
	}
	
	//질문글 글쓰기 페이지로 이동 요청
	@GetMapping("/questionWrite")
	public String questionWrite() {
		return "/board/qna_write";
	}
	
	//질문글 글쓰기 요청
	@PostMapping("/questionWrite")
	public String questionWrite(QuestionVO vo) {
		
		service.questionWrite(vo);
		
		return "redirect:/question/questionList";
	}

}
