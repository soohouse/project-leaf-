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
		return mapper.homeNoticeList();
	}
	
	
	// 메인화면 미니 자유게시판 목록 불러오기
	@Override
	public List<MiniBoardVO> homeBoardList() {
		return mapper.homeBoardList();
	}

	
	// 메인화면 미니 프로젝트 목록 불러오기
	@Override
	public List<MiniProjectVO> homeProjectList() {
		return mapper.homeProjectList();
	}
	
}
