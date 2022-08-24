package com.spring.leaf.question.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.leaf.question.command.AnswerVO;
import com.spring.leaf.question.command.QuestionVO;
import com.spring.leaf.question.service.IQuestionService;
import com.spring.leaf.util.PageCreator;
import com.spring.leaf.util.PageVO;

//Question 컨트롤러 : 2022-07-30 생성

@Controller
@RequestMapping("/question")
public class QuestionController {
	
	// 로그 출력을 위한 Logger 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(QuestionController.class);
		
	//질문글 서비스 연결
	@Autowired
	private IQuestionService service;
	
	//질문글 목록 페이지로 이동 요청
	@GetMapping("/questionList")
	public String questionList(Model model, PageVO vo) {
		//페이징
		System.out.println(vo);
		PageCreator pc = new PageCreator();
		pc.setPaging(vo);
		pc.setArticleTotalCount(service.questionTotal(vo));
		System.out.println(pc);
		
		//현재시간 구하기 (뉴마크) https://mingbocho.tistory.com/11참고
	    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	    Calendar cal = Calendar.getInstance();
	    cal.add(Calendar.DAY_OF_MONTH, -1); //게시글 등록 후 1일간 뉴마크 표시.
	    String nowday = format.format(cal.getTime());
		
	    model.addAttribute("pc", pc);
	    model.addAttribute("nowday", nowday);
		model.addAttribute("questionList", service.questionList(vo));
		
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
		
    //조회수 증가
		service.questionViews(questionNo);

		QuestionVO vo = service.questionContent(questionNo);
		
		int questionWriterNo = service.questionwriterProfile(vo.getQuestionWriter(), questionNo);
		
		model.addAttribute("question", vo);
		model.addAttribute("questionWriterNo", questionWriterNo);
		
		return "board/qna_content";
		
	}

	//질문글 수정 페이지 이동
	@GetMapping("/questionModify")
	public String questionModify(@RequestParam("questionNo") int questionNo, Model model) {
			
		model.addAttribute("question", service.questionContent(questionNo));
			
		return "board/qna_modify";
	}
		
	//질문글 수정 처리
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
	public String answerWrite(@PathVariable int questionNo,Model model) {
		
		model.addAttribute("questionNo", questionNo);
		
		return "/board/answer_write";
	}
		

	//답변글 작성
	@PostMapping("/answerWrite")
	public String answerWrite(AnswerVO vo) {
				
		service.answerWrite(vo);
				
	return "redirect:/question/questionList";
	}
	
	//답변글 상세보기(목록)프로필사진용
	@PostMapping("/answerList/{answerNo}")
	public String answerList(@PathVariable int answerNo, int questionNo, Model model) {		

		
		AnswerVO vo = service.answerContent(answerNo);
		
		int answerWriterNo = service.answerwriterProfile(vo.getAnswerWriter(), answerNo);
		
		//답변글 수
		int answerTotal = service.answerTotal(questionNo);
		model.addAttribute("answerCount", answerTotal);
		
		model.addAttribute("answer", vo);
		model.addAttribute("answerWriterNo", answerWriterNo);
		
		
		
		return "redirect:/question/answerList" ;
	}

	
	//답변글 상세보기(목록)
	@PostMapping("/answerList")
	@ResponseBody
	public Map<String, Object> answerList(int questionNo) {		
		List<AnswerVO> list = service.answerList(questionNo);		
		
		Map<String, Object> map = new HashMap<>();
		map.put("answerList", list);
		
		return map;
	}
	
	//답변글 수정 페이지 이동
	@PostMapping("/answerModify")
	public String answerModify(@RequestParam("answerNo") int answerNo, Model model) {
		
		model.addAttribute("answerContent", service.answerContent(answerNo));
		
		return "board/answer_modify";
	}
	
	//답변글 수정 처리
		@PostMapping("/answerUpdate")
		public String answerUpdate(AnswerVO vo, RedirectAttributes ra) {
				
			service.answerModify(vo);
			ra.addFlashAttribute("msg", "수정이 완료되었습니다.");
			return "redirect:/question/questionList";
		}
	
	//답변글 삭제
	@PostMapping("/answerDelete")
	@ResponseBody
	public String answerDelete(@RequestParam int answerNo) {
		service.answerDelete(answerNo);
		
		return "deleteSuccess";
	}
	
	
}
		

	
	
