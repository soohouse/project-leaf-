package com.spring.leaf.projectapply.mapper;

import java.util.List;
import java.util.Map;

import com.spring.leaf.projectapply.command.ApplyVO;
import com.spring.leaf.projectapply.command.MyProjectApplyDetailVO;
import com.spring.leaf.projectapply.command.MyProjectApplyListVO;
import com.spring.leaf.projectapply.command.MyProjectStatusVO;

public interface IProjectApplyMapper {
	
	void projectapply(ApplyVO vo);
	
	
	// 기업회원 지원 현황 내 프로젝트 목록 요청
	List<MyProjectStatusVO> myProjectStatus(int companyNO);
	
	
	// 기업회원 등록 프로젝트 개수 얻어오기 요청
	int myProjectCount(int companyNO);
	
	
	// 기업회원의 프로젝트를 지원한 지원자 목록 요청
	List<MyProjectApplyListVO> myProjectApplyList(int projectNO);
	
	
	// 기업회원의 프로젝트 지원자 수 얻어오기 요청
	int myProjectApplyCount(int projectNO);
	
	
	// 기업회원의 프로젝트 지원자 상세보기 요청
	MyProjectApplyDetailVO myProjectApplyDetail(Map<String, Object> numbers);
	
	
	// 1차 서류 합격 처리
	void applySetPrimary(int applyNO);
	
	
	// 2차 면접 인터뷰 합격 처리
	void applySetSecondary(int applyNO);
		
		
	// 최종 합격 처리
	void applySetFinally(int applyNO);
	
	
	// 불합격 처리
	void applySetNo(int applyNO);
	
}
