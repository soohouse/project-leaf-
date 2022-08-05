package com.spring.leaf.question.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	@Override
	public QuestionVO questionContent(int questionNo) {

		return null;
	}

	@Override
	public void questionModify(QuestionVO vo) {


	}

	@Override
	public void questionDelete(int questionNo) {


	}

}
