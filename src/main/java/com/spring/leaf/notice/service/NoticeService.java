package com.spring.leaf.notice.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.notice.command.NoticeVO;
import com.spring.leaf.notice.mapper.INoticeMapper;
import com.spring.leaf.util.PageVO;

// 공지사항 서비스 : 2022-07-30 생성

@Service
public class NoticeService implements INoticeService {

	@Autowired
	private INoticeMapper mapper;
	
	//공지사항 글 등록
	@Override
	public void noticeWrite(NoticeVO vo) {
		mapper.noticeWrite(vo);

	}

	//공지사항 글 목록
	@Override
	public List<NoticeVO> noticeList(PageVO vo) {
		
		List<NoticeVO> list = mapper.noticeList(vo);
		/*
		for(NoticeVO notice : list) {
			long now = System.currentTimeMillis();
			long noticeViews = notice.getNoticeViews();
			
			if(now - noticeViews < 60 * 60 * 24 * 2 * 1000) {
				
			}
		}
		*/
		return list;
	}

	//총 페이지 개수
	@Override
	public int getTotal(PageVO vo) {
		return mapper.getTotal(vo);
	}
	
	//공지사항 상세보기
	@Override
	public NoticeVO noticeContent(int noticeNo) {

		return mapper.noticeContent(noticeNo);
	}
	
	//공지사항 프로필 사진 불러오기
	@Override
	public int noticewriterProfile(String noticeWriter, int noticeNo) {
		
		Map<String, Object> noticeInfo = new HashMap<>();
		
		noticeInfo.put("noticeWriter", noticeWriter);
		noticeInfo.put("noticeNo", noticeNo);
		
		return mapper.noticewriterProfile(noticeInfo);
	}

	//공지사항 수정
	@Override
	public void noticeModify(NoticeVO vo) {
		
		mapper.noticeModify(vo);

	}

	//공지사항 삭제
	@Override
	public void noticeDelete(int noticeNo) {
		
		mapper.noticeDelete(noticeNo);
	}
	
	//공지사항 조회수
	@Override
	public int noticeViews(int noticeNO) {
		return mapper.noticeViews(noticeNO);
	}
	
	
}
