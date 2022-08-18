package com.spring.leaf.boardreply.mapper;

import java.util.List;
import java.util.Map;

import com.spring.leaf.boardreply.command.BoardReplyListVO;
import com.spring.leaf.boardreply.command.BoardReplyVO;
import com.spring.leaf.util.PageVO;

//게시판 댓글 매퍼 인터페이스 생성 : 2022-08-04

public interface IBoardReplyMapper {
	
	//댓글 등록
	void boardReplyWrite(BoardReplyVO vo);
	
	//댓글 목록
	List<BoardReplyListVO> boardReplyList(Map<String, Object> data);
	
	//댓글 개수
	int boardReplyTotal(int boardNo);
	
	//댓글 수정
	void boardReplyUpdate(int boardReplyNo);
	
	//댓글 삭제
	void boardReplyDelete(int boardReplyNo);
	

}
