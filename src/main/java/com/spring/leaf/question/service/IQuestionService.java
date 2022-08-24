package com.spring.leaf.question.service;

import java.util.List;
import java.util.Map;

import com.spring.leaf.question.command.AnswerVO;
import com.spring.leaf.question.command.QuestionVO;
import com.spring.leaf.util.PageVO;

//Question(질문글) 서비스 인터페이스 : 2022-08-05 생성

public interface IQuestionService {
	
	//질문글 등록
	void questionWrite(QuestionVO vo);
	
	//질문글 목록
	List<QuestionVO> questionList(PageVO vo);
	
	//질문글 총 게시물 수
	int questionTotal(PageVO vo);
	
	//질문글 상세보기
	QuestionVO questionContent(int questionNo);
	
	//질문글 글쓴이 프로필사진 불러오기 요청
	int questionwriterProfile(String questionWriter, int questionNo);
	
	//질문글 수정
	void questionModify(QuestionVO vo);
	
	//질문글 삭제
	void questionDelete(int questionNo);
	
	//질문글 조회수
	void questionViews(int questionNo);
	
	//답변글 총 게시물 수
	int answerTotal(int questionNo);
	
	//답변글 등록
	void answerWrite(AnswerVO vo);
	
	//답변글 상세보기
	List<AnswerVO> answerList(int questionNo);
	
	AnswerVO answerContent(int answerNo);

	//답변글 수정하기
	void answerModify(AnswerVO vo);
	
	//답변글 삭제하기
	void answerDelete(int answerNo);

	// 사용자 프로필사진 불러오기 요청
	int answerwriterProfile(String answerWriter, int answerNo);

}
