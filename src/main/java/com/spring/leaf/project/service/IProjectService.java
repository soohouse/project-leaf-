package com.spring.leaf.project.service;

import java.util.List;
import java.util.Map;

import com.spring.leaf.project.command.ProjectContentVO;
import com.spring.leaf.project.command.ProjectDateVO;
import com.spring.leaf.project.command.ProjectImageVO;
import com.spring.leaf.project.command.ProjectLikeVO;
import com.spring.leaf.project.command.ProjectListVO;
import com.spring.leaf.project.command.ProjectRegistCountVO;
import com.spring.leaf.project.command.ProjectVO;
import com.spring.leaf.util.PageApplyVO;
import com.spring.leaf.util.PageVO;

public interface IProjectService {
	void projectputin(ProjectVO vo);
	
  
	List<ProjectListVO> projectadmin(int companyNO);


	List<ProjectListVO> projectadminAll();


	ProjectContentVO getContent(int projectNO);
	
	void updateProjectContent(ProjectContentVO vo);
	
	int projectNOGet();
	
	void projectImage(ProjectImageVO vo);
	
	ProjectImageVO projectImageGet(int projectNO);
	
	void projectImageUpdate(ProjectImageVO vo);
	
	void projectImageDelete(int projectNO);
  
	ProjectRegistCountVO projectRegistCount(int companyNO);
	
	ProjectDateVO projectDate();
	

	// 일반회원 프로젝트 좋아요 클릭 여부 체크
	int projectLikeCheck(int userNO, int projectNO);
	
	
	// 일반회원 좋아요 클릭
	void projectLikeOK(int userNO, int projectNO);
			
			
	// 일반회원 좋아요 취소
	void projectLikeCancel(int userNO, int projectNO);
	
	
	// 기업회원 프로젝트 좋아요 클릭 여부 체크
	int projectLikeCheckCompany(int companyNO, int projectNO);
	
	
	// 기업회원 좋아요 클릭
	void projectLikeCompanyOK(int companyNO, int projectNO);
				
				
	// 기업회원 좋아요 취소
	void projectLikeCompanyCancel(int companyNO, int projectNO);


	void deleteProject(int projectNO);
	
  
	int projectUserCheck(int projectNO);


	// 프로젝트 좋아요 수 얻어오기
	int projectLikeGet(int projectNO);
	
	List<ProjectListVO> projectlist(PageApplyVO pvo);
	
	
	//프로젝트 총 개수
	int getTotal(PageApplyVO pvo);
	

	// 현재 모집중인 프로젝트 검색
	List<ProjectListVO> projectNow(PageApplyVO pvo);
	
	
	// 현재 모집중인 프로젝트 총 개수
	int getTotalNow(PageApplyVO pvo);
	
	
	// 모집 마감 임박인 프로젝트 검색
	List<ProjectListVO> projectHurry(PageApplyVO pvo);
	
	
	// 마감 임박 프로젝트 총 개수
	int getTotalHurry(PageApplyVO pvo);

	
	// 모집이 종료된 프로젝트 검색
	List<ProjectListVO> projectEnd(PageApplyVO pvo);
	
	
	// 모집 종료된 프로젝트 총 개수
	int getTotalEnd(PageApplyVO pvo);
	
	
	// 일반회원 좋아요 누른 프로젝트 목록
	List<ProjectListVO> projectLikeUser(PageApplyVO pvo, int userNO);
	
	
	// 일반회원 좋아요 누른 프로젝트 수
	int getTotalLikeUser(int userNO);
		
		
	// 기업회원 좋아요 누른 프로젝트 목록
	List<ProjectListVO> projectLikeCompany(PageApplyVO pvo, int companyNO);
	
	
	// 기업회원 좋아요 누른 프로젝트 수
	int getTotalLikeCompany(int companyNO);
	
	
	// 날짜로 프로젝트 검색 목록
	List<ProjectListVO> projectSearchDate(PageApplyVO pvo, String date);
		
		
	// 날짜에 포함되는 프로젝트 수
	int getTotalSearchDate(String date);
	
	
	// 프로젝트 관리창 리스트 검색 목록
	List<ProjectListVO> projectadmin(PageApplyVO pvo, int companyNO);

	
	// 프로젝트 관리창 리스트 검색 목록 (관리자)
	List<ProjectListVO> projectadminAll(PageApplyVO pvo);

	
	// 프로젝트 관리창 프로젝트 수
	int getTotalAdmin(PageApplyVO pvo, int companyNO);

	
	// 프로젝트 관리창 프로젝트 수 (관리자)
	int getTotalAdminAll(PageApplyVO pvo);

}

