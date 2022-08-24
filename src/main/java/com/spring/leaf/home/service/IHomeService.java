package com.spring.leaf.home.service;

import java.util.List;

import com.spring.leaf.home.command.MiniBoardVO;
import com.spring.leaf.home.command.MiniNoticeVO;
import com.spring.leaf.home.command.MiniProjectVO;

public interface IHomeService {

	// 메인화면 미니 공지사항 목록 불러오기
	List<MiniNoticeVO> homeNoticeList();
	
	
	// 메인화면 미니 자유게시판 목록 불러오기
	List<MiniBoardVO> homeBoardList();
	
	
	// 메인화면 미니 프로젝트 목록 불러오기
	List<MiniProjectVO> homeProjectList();
	
}
