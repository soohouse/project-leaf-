package com.spring.leaf.boardreply.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.boardreply.command.BoardReplyVO;
import com.spring.leaf.boardreply.mapper.IBoardReplyMapper;

//게시판 댓글 서비스 생성 : 2022-08-04

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
	public List<BoardReplyVO> boardReplyList(int boardNo) {
	
		return mapper.boardReplyList(boardNo);
	}
	
	//댓글 개수
	@Override
	public int boardReplyTotal(int boardNo) {
		return mapper.boardReplyTotal(boardNo);
	}
	
	//댓글 수정
	@Override
	public void boardReplyUpdate(BoardReplyVO vo) {
		mapper.boardReplyUpdate(vo);
		
	}
	
	//댓글 삭제
	@Override
	public void boardReplyDelete(int boardReplyNo) {
		mapper.boardReplyDelete(boardReplyNo);
		
	}
	
	
}
