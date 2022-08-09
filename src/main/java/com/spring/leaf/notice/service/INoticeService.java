package com.spring.leaf.notice.service;

import java.util.List;

import com.spring.leaf.notice.command.NoticeVO;
import com.spring.leaf.util.PageVO;

//공지사항 서비스 인터페이스 : 2022-07-30 생성

public interface INoticeService {
	
	//공지사항 글 등록
	void noticeWrite(NoticeVO vo);
	
	//공지사항 글 목록
	List<NoticeVO> noticeList(PageVO vo);
	
	//공지사항 총 게시물 수
	int getTotal(PageVO vo);
	
	//공지사항 상세보기
	NoticeVO noticeContent(int noticeNo);
	
	//공지사항 수정
	void noticeModify(NoticeVO vo);
	
	//공지사항 삭제
	void noticeDelete(int noticeNo);
	
	//공지사항 조회수
	int noticeViews (int noticeNO);
	
}
