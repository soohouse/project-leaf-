package com.spring.leaf.notice.mapper;

import java.util.List;

import com.spring.leaf.notice.command.NoticeVO;

//공지사항 매퍼 인터페이스 : 2022-07-29 생성

public interface INoticeMapper {
	
	//공지사항 글 등록
	void regist(NoticeVO vo);
	
	//공지사항 글 목록
	List<NoticeVO> getList();
	
	//공지사항 총 게시물 수
	
	
	//공지사항 상세보기
	NoticeVO getContent(int noticeNo);
	
	//공지사항 수정
	void update(NoticeVO vo);
	
	//공지사항 삭제
	void delete(int noticeNo);

}
