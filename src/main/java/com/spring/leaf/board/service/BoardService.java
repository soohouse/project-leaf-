package com.spring.leaf.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.board.command.BoardVO;
import com.spring.leaf.board.mapper.IBoardMapper;
import com.spring.leaf.user.command.UserProfileVO;
import com.spring.leaf.util.PageVO;

import oracle.net.aso.b;

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
	public List<BoardVO> boardList(PageVO vo) {

		List<BoardVO> list = mapper.boardList(vo);
		
		return list;
	}
	
	//자유게시판 총 게시물 수
	@Override
	public int getTotal(PageVO vo) {
		return mapper.getTotal(vo);
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
	
	//자유게시판 조회수
	@Override
	public int boardViews(int boardNO) {
		return mapper.boardViews(boardNO);
	}

	//글쓴이 프로필사진 불러오기 요청
	@Override
	public int boardwriterProfile(String boardWriter, int boardNo) {
		
		Map<String, Object> boardInfo = new HashMap<>();
		
		boardInfo.put("boardWriter", boardWriter);
		boardInfo.put("boardNo", boardNo);
		
		return mapper.boardwriterProfile(boardInfo);
	}


}
