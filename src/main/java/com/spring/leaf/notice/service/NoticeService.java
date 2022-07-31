package com.spring.leaf.notice.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.leaf.notice.command.NoticeVO;
import com.spring.leaf.notice.mapper.INoticeMapper;

// 공지사항 서비스 : 2022-07-30 생성

@Service
public class NoticeService implements INoticeMapper {

	//공지사항 글 등록
	@Override
	public void regist(NoticeVO vo) {


	}

	//공지사항 글 목록
	@Override
	public List<NoticeVO> getList() {

		return null;
	}

	//공지사항 상세보기
	@Override
	public NoticeVO getContent(int noticeNo) {

		return null;
	}

	//공지사항 수정
	@Override
	public void update(NoticeVO vo) {


	}

	//공지사항 삭제
	@Override
	public void delete(int noticeNo) {

	}

}
