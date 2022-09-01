package com.spring.leaf.home.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.home.command.MiniBoardVO;
import com.spring.leaf.home.command.MiniNoticeVO;
import com.spring.leaf.home.command.MiniProjectVO;
import com.spring.leaf.home.mapper.IHomeMapper;


@Service
public class HomeService implements IHomeService {

	// 메인화면 매퍼 연결
	@Autowired
	private IHomeMapper mapper;
	
	
	// 메인화면 미니 공지사항 목록 불러오기
	@Override
	public List<MiniNoticeVO> homeNoticeList() {
		
		List<MiniNoticeVO> list = mapper.homeNoticeList();
		
		for(int i = 0; i < list.size(); i++) {
			
			if(list.get(i).getMiniNoticeTitle().length() > 18) {
				String noticeTitle = list.get(i).getMiniNoticeTitle().substring(0, 17) + "...";
				
				list.get(i).setMiniNoticeTitle(noticeTitle);
			}
		}
		
		return list;
	}
	
	
	// 메인화면 미니 자유게시판 목록 불러오기
	@Override
	public List<MiniBoardVO> homeBoardList() {
		
		List<MiniBoardVO> list = mapper.homeBoardList();
		
		for(int i = 0; i < list.size(); i++) {
			
			if(list.get(i).getMiniBoardTitle().length() > 18) {
				String boardTitle = list.get(i).getMiniBoardTitle().substring(0, 17) + "...";
				
				list.get(i).setMiniBoardTitle(boardTitle);
			}
		}
		
		return list;
	}

	
	// 메인화면 미니 프로젝트 목록 불러오기
	@Override
	public List<MiniProjectVO> homeProjectList() {

		List<MiniProjectVO> list = mapper.homeProjectList();
		
		for(int i = 0; i < list.size(); i++) {
			
			if(list.get(i).getMiniProjectName().length() > 48) {
				String projectTitle = list.get(i).getMiniProjectName().substring(0, 47) + "...";
				
				list.get(i).setMiniProjectName(projectTitle);
			}
		}
		
		return list;
	}
	
}
