package com.spring.leaf.board.service;

import java.util.List;

import com.spring.leaf.board.command.BoardVO;

//자유게시판 서비스 인터페이스 : 2022-08-03 생성

public interface IBoardService  {
	
		//자유게시판 글 등록
		void boardWrite(BoardVO vo);
	
		//자유게시판 글 목록
		List<BoardVO> boardList();
		
		//자유게시판 상세보기
		BoardVO boardContent(int boardNo);
		
		//자유게시판 수정
		void boardModify(BoardVO vo);
		
		//자유게시판 삭제
		void boardDelete(int boardNo);

}
