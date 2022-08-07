package com.spring.leaf.boardreply.mapper;

import java.util.List;

import com.spring.leaf.boardreply.command.BoardReplyVO;

public interface IBoardReplyMapper {
	
	//댓글 등록
	void boardReplyWrite(BoardReplyVO vo);
	
	//댓글 목록
	List<BoardReplyVO> boardReplyList(int boardReplyNo);
	
	//댓글 개수
	int boardReplyTotal(int boardReplyNo);
	
	//댓글 수정
	
	//댓글 삭제

}
