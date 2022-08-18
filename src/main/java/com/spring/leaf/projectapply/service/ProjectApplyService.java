package com.spring.leaf.projectapply.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.projectapply.command.ApplyVO;
import com.spring.leaf.projectapply.command.MyProjectApplyDetailVO;
import com.spring.leaf.projectapply.command.MyProjectApplyListVO;
import com.spring.leaf.projectapply.command.MyProjectStatusVO;
import com.spring.leaf.projectapply.mapper.IProjectApplyMapper;


@Service
public class ProjectApplyService implements IProjectApplyService {
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectApplyService.class);
	
	@Autowired
	private IProjectApplyMapper mapper;
	
	@Override
	public void projectapply(ApplyVO vo) {
		vo.setApplyMsg(vo.getApplyMsg().replace("\n", "<br>"));
		
		mapper.projectapply(vo);
	}
	
	
	// 기업회원 지원 현황 내 프로젝트 목록 요청
	@Override
	public List<MyProjectStatusVO> myProjectStatus(int companyNO) {
		return mapper.myProjectStatus(companyNO);
	}
	
	
	// 기업회원 등록 프로젝트 개수 얻어오기 요청
	@Override
	public int myProjectCount(int companyNO) {
		return mapper.myProjectCount(companyNO);
	}
	
	
	// 기업회원의 프로젝트를 지원한 지원자 목록 요청
	@Override
	public List<MyProjectApplyListVO> myProjectApplyList(int projectNO) {
		return mapper.myProjectApplyList(projectNO);
	}
	
	
	// 기업회원의 프로젝트 지원자 수 얻어오기 요청
	@Override
	public int myProjectApplyCount(int projectNO) {
		return mapper.myProjectApplyCount(projectNO);
	}
	
	
	// 기업회원의 프로젝트 지원자 상세보기 요청
	@Override
	public MyProjectApplyDetailVO myProjectApplyDetail(int userNO, int projectNO) {
		
		Map<String, Object> numbers = new HashMap<>();
		numbers.put("userNO", userNO);
		numbers.put("projectNO", projectNO);
		
		return mapper.myProjectApplyDetail(numbers);
	}

	
	// 1차 서류 합격 처리
	@Override
	public void applySetPrimary(int applyNO) {
		mapper.applySetPrimary(applyNO);
	}
	
	
	// 2차 면접 인터뷰 합격 처리
	@Override
	public void applySetSecondary(int applyNO) {
		mapper.applySetSecondary(applyNO);
	}
	
	
	// 최종 합격 처리
	@Override
	public void applySetFinally(int applyNO) {
		mapper.applySetFinally(applyNO);
	}
	
	
	// 불합격 처리
	@Override
	public void applySetNo(int applyNO) {
		mapper.applySetNo(applyNO);
	}
}
