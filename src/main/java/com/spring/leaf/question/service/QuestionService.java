package com.spring.leaf.question.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.question.command.AnswerVO;
import com.spring.leaf.question.command.QuestionVO;
import com.spring.leaf.question.mapper.IQuestionMapper;
import com.spring.leaf.util.PageVO;

// Question(질문글) 서비스 : 2022-08-05 생성

@Service
public class QuestionService implements IQuestionService {

	//질문글 mapper 연결
	@Autowired
	private IQuestionMapper mapper;
	
	//질문글 글 등록
	@Override
	public void questionWrite(QuestionVO vo) {
		mapper.questionWrite(vo);
	}

	//질문글 목록
	@Override
	public List<QuestionVO> questionList(PageVO vo) {
		List<QuestionVO> list = mapper.questionList(vo);
		return list;
	}

	//질문글 상세보기
	@Override
	public QuestionVO questionContent(int questionNo) {
		return mapper.questionContent(questionNo);
	}
	
	//질문글 글쓴이 프로필사진 불러오기 요청
	@Override
	public int questionwriterProfile(String questionWriter, int questionNo) {
		
		Map<String, Object> questionInfo = new HashMap<>();
		
		questionInfo.put("questionWriter", questionWriter);
		questionInfo.put("questionNo", questionNo);
		
		return mapper.questionwriterProfile(questionInfo);
	}
	
	//질문글 수정하기
	@Override
	public void questionModify(QuestionVO vo) {
		mapper.questionModify(vo);
	}

	//질문글 삭제하기
	@Override
	public void questionDelete(int questionNo) {
		mapper.questionDelete(questionNo);
	}
	
	//질문글 조회수
	@Override
	public void questionViews(int questionNo) {
		mapper.questionViews(questionNo);
	}
	
	//질문글 총 개수
	@Override
	public int questionTotal(PageVO vo) {
		return mapper.questionTotal(vo);
	}
	
	//답변글 총 개수
	@Override
	public int answerTotal(int questionNo) {
		return mapper.answerTotal(questionNo);
	}
	
	
	//답변글 글 등록
	@Override
	public void answerWrite(AnswerVO vo) {
		mapper.answerWrite(vo);
	}
	
	//답변글 상세보기
	@Override
	public List<AnswerVO> answerList(int questionNo) {
		return mapper.answerList(questionNo);
	}
	
	//답변글 목록
	@Override
	public AnswerVO answerContent(int answerNo) {
		return mapper.answerContent(answerNo);
	}
	
	//답변글 프로필 사진 불러오기
	@Override
	public int answerwriterProfile(String answerWriter, int answerNo) {
		
		Map<String, Object> answerInfo = new HashMap<>();
		
		answerInfo.put("answerWriter", answerWriter);
		answerInfo.put("answerNo", answerNo);
		
		return mapper.answerwriterProfile(answerInfo);
	}
	
	//답변글 수정하기
	@Override
	public void answerModify(AnswerVO vo) {
		mapper.answerModify(vo);
	}
	
	//답변글 삭제하기
	@Override
	public void answerDelete(int answerNo) {
		mapper.answerDelete(answerNo);
	}

}
