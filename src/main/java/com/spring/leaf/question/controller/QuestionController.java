package com.spring.leaf.question.controller;

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

import com.spring.leaf.answer.command.AnswerVO;
import com.spring.leaf.board.command.BoardVO;
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
	
	//질문글 상세보기
	@GetMapping("/questionContent/{questionNo}")
	public String questionContent(@PathVariable int questionNo, Model model) {
		
		model.addAttribute("question", service.questionContent(questionNo));
		
		return "board/qna_content";
		
	}

	//글 수정 페이지 이동
		@GetMapping("/questionModify")
		public String questionModify(@RequestParam("questionNo") int questionNo, Model model) {
			
			model.addAttribute("question", service.questionContent(questionNo));
			
			return "board/qna_modify";
		}
		
	//글 수정 처리
	@PostMapping("/questionUpdate")
	public String questionUpdate(QuestionVO vo, RedirectAttributes ra) {
			
		service.questionModify(vo);
		ra.addFlashAttribute("msg", "updateSuccess");
		return "redirect:/question/questionContent/" + vo.getQuestionNo();
	}
		
	//글 삭제 처리
	@PostMapping("/questionDelete")
	public String questionDelete(QuestionVO vo, RedirectAttributes ra) {
			
		service.questionDelete(vo.getQuestionNo());
		ra.addFlashAttribute("msg", "deleteSuccess");
		return "redirect:/question/questionList";
	}
	
	//답변글 작성창으로 이동
	@GetMapping("/answerWrite/{questionNo}")
	public String answerWrite() {
		return "/board/answer_write";
	}
	
	//답변글 작성
	@PostMapping("/answerWrite/{questionNo}")
	public String answerWrite(AnswerVO vo) {
		
		service.answerWrite(vo);
		return "redirect:/question/questionList";
	}
}
