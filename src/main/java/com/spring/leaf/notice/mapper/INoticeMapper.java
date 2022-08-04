package com.spring.leaf.notice.mapper;

import java.util.List;

import com.spring.leaf.notice.command.NoticeVO;

//공지사항 매퍼 인터페이스 : 2022-07-29 생성

public interface INoticeMapper {
	
	//공지사항 글 등록
	void noticeWrite(NoticeVO vo);
	
	//공지사항 글 목록
	List<NoticeVO> noticeList();
	
	//공지사항 상세보기
	NoticeVO noticeContent(int noticeNo);
	
	//공지사항 수정
	void noticeModify(NoticeVO vo);
	
	//공지사항 삭제
	void noticeDelete(int noticeNo);

}
