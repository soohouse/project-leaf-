package com.spring.leaf.boardreply.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.boardreply.command.BoardReplyListVO;
import com.spring.leaf.boardreply.command.BoardReplyVO;
import com.spring.leaf.boardreply.mapper.IBoardReplyMapper;
import com.spring.leaf.util.PageVO;

//게시판 댓글 서비스 생성 : 2022-08-04

@Service
public class BoardReplyService implements IBoardReplyService {

	@Autowired
	private IBoardReplyMapper mapper;

	//댓글 작성
	@Override
	public void boardReplyWrite(BoardReplyVO vo) {
		//댓글줄바꿈
		vo.setBoardReplyContent(vo.getBoardReplyContent().replace("\n", "<br>"));
		
		mapper.boardReplyWrite(vo);
	}

	//댓글 목록
	@Override
	public List<BoardReplyListVO> boardReplyList(PageVO vo, int boardNo) {
		Map<String, Object> data = new HashMap<>();
		data.put("paging", vo);
		data.put("boardNo", boardNo);
		
		return mapper.boardReplyList(data);
	}
	
	//자유게시판 댓글 프로필 사진 불러오기
	@Override
	public int rboardwriterProfile(String boardReplyWriter, int boardReplyNo) {
		
		Map<String, Object> rboardInfo = new HashMap<>();
		
		rboardInfo.put("boardReplyWriter", boardReplyWriter);
		rboardInfo.put("boardReplyNo", boardReplyNo);
		
		return mapper.rboardwriterProfile(rboardInfo);
	}
	
	//댓글 개수
	@Override
	public int boardReplyTotal(int boardNo) {
		return mapper.boardReplyTotal(boardNo);
	}
	
	//댓글 수정
	@Override
	public void boardReplyUpdate(int boardReplyNo, String boardReplyContent) {
		BoardReplyVO vo = new BoardReplyVO();
		vo.setBoardReplyNo(boardReplyNo);
		vo.setBoardReplyContent(boardReplyContent);
		
		//댓글줄바꿈
		vo.setBoardReplyContent(vo.getBoardReplyContent().replace("\n", "<br>"));
		
		mapper.boardReplyUpdate(vo);
	}
	
	//댓글 삭제
	@Override
	public void boardReplyDelete(int boardReplyNo) {
		mapper.boardReplyDelete(boardReplyNo);
	}
	
	
}
