package com.spring.leaf.boardreply.mapper;

import java.util.List;

import com.spring.leaf.boardreply.command.BoardReplyVO;

//게시판 댓글 매퍼 인터페이스 생성 : 2022-08-04

public interface IBoardReplyMapper {
	
	//댓글 등록
	void boardReplyWrite(BoardReplyVO vo);
	
	//댓글 목록
	List<BoardReplyVO> boardReplyList(int boardNo);
	
	//댓글 개수
	int boardReplyTotal(int boardNo);
	
	//댓글 수정
	void boardReplyUpdate(BoardReplyVO vo);
	
	//댓글 삭제
	void boardReplyDelete(int boardReplyNo);

}
