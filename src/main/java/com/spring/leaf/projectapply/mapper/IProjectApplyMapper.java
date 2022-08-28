package com.spring.leaf.projectapply.mapper;

import java.util.List;
import java.util.Map;

import com.spring.leaf.projectapply.command.ApplyVO;
import com.spring.leaf.projectapply.command.MyProjectApplyDetailVO;
import com.spring.leaf.projectapply.command.MyProjectApplyListVO;
import com.spring.leaf.projectapply.command.MyProjectStatusVO;
import com.spring.leaf.projectapply.command.ProjectApplyCountVO;
import com.spring.leaf.projectapply.command.ProjectPassListVO;

public interface IProjectApplyMapper {
	
	void projectapply(ApplyVO vo);
	
	
	// 사용자의 이력서 원본 이름 얻어오기 요청
	String userInfoGet(int userNO);
	
	
	// 조회수 증가 요청
	void projectViewCount(int projectNO);
	
	
	// 사용자의 지원현황 얻어오기 요청
	ApplyVO applyGet(Map<String, Object> numbers);
	
	
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
	
	
	// 지원 취소 처리
	void applyCancel(Map<String, Object> numbers);
	
	
	// 프로젝트 최종 합격자 수 조회 요청
	int applyPassCount(int projectNO);
	
	
	// 프로젝트 최종 합격자 목록 조회 요청
	List<ProjectPassListVO> applyPassList(int projectNO);
	
	
	// 프로젝트 별 지원자 수 얻어오기 요청 (통계)
	List<ProjectApplyCountVO> projectApplyCount(int companyNO);
	
}
