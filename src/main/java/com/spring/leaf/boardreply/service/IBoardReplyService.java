package com.spring.leaf.boardreply.service;

import java.util.List;

import com.spring.leaf.boardreply.command.BoardReplyListVO;
import com.spring.leaf.boardreply.command.BoardReplyVO;
import com.spring.leaf.util.PageVO;

//게시판 댓글 서비스 인터페이스 생성 : 2022-08-04 (IBoardReplyService)

public interface IBoardReplyService {
	
	//댓글 등록
	void boardReplyWrite(BoardReplyVO vo);
	
	//댓글 목록
	List<BoardReplyListVO> boardReplyList(PageVO vo, int boardNo);
	
	//댓글 개수
	int boardReplyTotal(int boardNo);
	
	//댓글 수정
	void boardReplyUpdate(int boardReplyNo, String boardReplyContent);
	
	//댓글 삭제
	void boardReplyDelete(int boardReplyNo);

	// 사용자 프로필사진 불러오기 요청
	int rboardwriterProfile(String boardReplyWriter, int boardReplyNo);




}
