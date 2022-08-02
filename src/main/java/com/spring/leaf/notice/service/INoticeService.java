package com.spring.leaf.notice.service;

import java.util.List;

import com.spring.leaf.notice.command.NoticeVO;

//공지사항 서비스 인터페이스 : 2022-07-30 생성

public interface INoticeService {
	
		//공지사항 글 등록
		void noticeWrite(NoticeVO vo);
		
		//공지사항 글 목록
		List<NoticeVO> noticeList();
		
		//공지사항 총 게시물 수
		
		
		//공지사항 상세보기
		NoticeVO noticeContent(int noticeNo);
		
		//공지사항 수정
		void update(NoticeVO vo);
		
		//공지사항 삭제
		void delete(int noticeNo);

}
