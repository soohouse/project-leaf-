package com.spring.leaf.board.mapper;

import java.util.List;
import java.util.Map;

import com.spring.leaf.board.command.BoardVO;
import com.spring.leaf.user.command.UserProfileVO;
import com.spring.leaf.util.PageVO;

//자유게시판 매퍼 인터페이스 : 2022-08-03 생성

public interface IBoardMapper {
	
	//자유게시판 글 등록
	void boardWrite(BoardVO vo);
	
	//자유게시판 글 목록
	List<BoardVO> boardList(PageVO vo);
	
	//자유게시판 총 게시물 수
	int getTotal(PageVO vo);
	
	//자유게시판 상세보기
	BoardVO boardContent(int boardNo);
	
	//자유게시판 수정
	void boardModify(BoardVO vo);
	
	//자유게시판 삭제
	void boardDelete(int boardNo);
	
	//자유게시판 조회수
	int boardViews (int boardNo);
	
	//자유게시판 댓글개수
	int boardCommentCnt (int boardNo);
	
	// 사용자 프로필사진 불러오기 요청
	int boardwriterProfile(Map<String, Object> boardInfo);

}
