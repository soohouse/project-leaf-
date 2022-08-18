package com.spring.leaf.question.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.question.command.AnswerVO;
import com.spring.leaf.question.command.QuestionVO;
import com.spring.leaf.question.mapper.IQuestionMapper;

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
	public List<QuestionVO> questionList() {

		List<QuestionVO> list = mapper.questionList();
		
		return list;
	}

	//질문글 상세보기
	@Override
	public QuestionVO questionContent(int questionNo) {

		return mapper.questionContent(questionNo);
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
	
	@Override
	public AnswerVO answerContent(int answerNo) {
		return mapper.answerContent(answerNo);
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
