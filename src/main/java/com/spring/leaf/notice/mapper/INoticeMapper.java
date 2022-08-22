package com.spring.leaf.notice.mapper;

import java.util.List;
import java.util.Map;

import com.spring.leaf.notice.command.NoticeVO;
import com.spring.leaf.util.PageVO;

//공지사항 매퍼 인터페이스 : 2022-07-29 생성

public interface INoticeMapper {
	
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
	
	// 사용자 프로필사진 불러오기 요청
	int noticewriterProfile(Map<String, Object> noticeInfo);
	
}
