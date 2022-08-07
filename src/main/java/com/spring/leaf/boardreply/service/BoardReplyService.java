package com.spring.leaf.boardreply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.boardreply.command.BoardReplyVO;
import com.spring.leaf.boardreply.mapper.IBoardReplyMapper;

@Service
public class BoardReplyService implements IBoardReplyService {

	@Autowired
	private IBoardReplyMapper mapper;

	//댓글 작성
	@Override
	public void boardReplyWrite(BoardReplyVO vo) {
		mapper.boardReplyWrite(vo);
		
	}

	//댓글 목록
	@Override
	public List<BoardReplyVO> boardReplyList(int boardReplyNo) {
		return mapper.boardReplyList(boardReplyNo);
	}
	
	//댓글 개수
	@Override
	public int boardReplyTotal(int boardReplyNo) {
		return mapper.boardReplyTotal(boardReplyNo);
	}
	
	
}