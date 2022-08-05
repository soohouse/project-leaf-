package com.spring.leaf.boardreply.service;

import java.util.List;

import com.spring.leaf.boardreply.command.BoardReplyVO;

public interface IBoardReplyService {
	
		//댓글 등록
		void boardReplyWrite(BoardReplyVO vo);
		
		//댓글 목록
		List<BoardReplyVO> boardReplyList();
		
		//댓글 수정
		
		//댓글 삭제

}
