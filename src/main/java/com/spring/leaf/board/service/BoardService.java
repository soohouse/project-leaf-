package com.spring.leaf.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.board.command.BoardVO;
import com.spring.leaf.board.mapper.IBoardMapper;

//자유게시판 서비스 : 2022-08-03 생성

@Service
public class BoardService implements IBoardService {

	@Autowired
	private IBoardMapper mapper;
	
	//자유게시판 글 등록
	@Override
	public void boardWrite(BoardVO vo) {
		mapper.boardWrite(vo);
		
	}
	
	//자유게시판 글 목록
	@Override
	public List<BoardVO> boardList() {

		List<BoardVO> list = mapper.boardList();
		
		return list;
	}
	
	//자유게시판 글 상세보기
	@Override
	public BoardVO boardContent(int boardNo) {
		
		return mapper.boardContent(boardNo);
	}
	
	//자유게시판 글 수정
	@Override
	public void boardModify(BoardVO vo) {
		
		mapper.boardModify(vo);
	}
	
	//자유게시판 글 삭제
	@Override
	public void boardDelete(int boardNo) {
		
		mapper.boardDelete(boardNo);
	}

}
