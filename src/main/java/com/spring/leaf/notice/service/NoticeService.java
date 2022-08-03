package com.spring.leaf.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.notice.command.NoticeVO;
import com.spring.leaf.notice.mapper.INoticeMapper;

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
	public List<NoticeVO> noticeList() {
		
		List<NoticeVO> list = mapper.noticeList();
		
		/*for(NoticeVO notice : list) {
			long now = System.currentTimeMillis();
			long noticeViews = notice.getNoticeViews();
			
			if(now - noticeViews < 60 * 60 * 24 * 2 * 1000) {
				
			}
		}*/

		return list;
	}

	//공지사항 상세보기
	@Override
	public NoticeVO noticeContent(int noticeNo) {

		return mapper.noticeContent(noticeNo);
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

}
