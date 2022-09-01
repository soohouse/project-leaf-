package com.spring.leaf.admin.mapper;

import java.util.List;

import com.spring.leaf.admin.command.ApplyStatusListVO;
import com.spring.leaf.admin.command.CommonListVO;
import com.spring.leaf.admin.command.CommonVO;
import com.spring.leaf.admin.command.CompanyAcceptListVO;
import com.spring.leaf.admin.command.CompanyAcceptVO;
import com.spring.leaf.admin.command.CompanyArchiveCountVO;
import com.spring.leaf.admin.command.CompanyBoardCountVO;
import com.spring.leaf.admin.command.CompanyCRGVO;
import com.spring.leaf.admin.command.CompanyDeleteCountVO;
import com.spring.leaf.admin.command.CompanyDeleteListVO;
import com.spring.leaf.admin.command.CompanyLogoCountVO;
import com.spring.leaf.admin.command.CompanyMessageCountVO;
import com.spring.leaf.admin.command.CompanyNewListVO;
import com.spring.leaf.admin.command.CompanyProjectCountVO;
import com.spring.leaf.admin.command.CompanyRegionVO;
import com.spring.leaf.admin.command.CompanyRegistCountVO;
import com.spring.leaf.admin.command.CompanyStatusCountVO;
import com.spring.leaf.admin.command.ProjectApplyEndVO;
import com.spring.leaf.admin.command.ProjectApplyListVO;
import com.spring.leaf.admin.command.ProjectApplyNowVO;
import com.spring.leaf.admin.command.ProjectApplyVO;
import com.spring.leaf.admin.command.ProjectDeleteCountVO;
import com.spring.leaf.admin.command.ProjectDeleteListVO;
import com.spring.leaf.admin.command.ProjectLikesVO;
import com.spring.leaf.admin.command.ProjectNewListVO;
import com.spring.leaf.admin.command.ProjectStatusListVO;
import com.spring.leaf.admin.command.ProjectViewsVO;
import com.spring.leaf.admin.command.UserAnswerCountVO;
import com.spring.leaf.admin.command.UserApplyCountVO;
import com.spring.leaf.admin.command.UserArchiveCountVO;
import com.spring.leaf.admin.command.UserBoardCountVO;
import com.spring.leaf.admin.command.UserDateVO;
import com.spring.leaf.admin.command.UserDeleteCountVO;
import com.spring.leaf.admin.command.UserMessageCountVO;
import com.spring.leaf.admin.command.UserNewListVO;
import com.spring.leaf.admin.command.UserProfileCountVO;
import com.spring.leaf.admin.command.UserQuestionCountVO;
import com.spring.leaf.admin.command.UserRegistCountVO;
import com.spring.leaf.admin.command.UserResumeCountVO;
import com.spring.leaf.util.PageVO;
import com.spring.leaf.project.command.ProjectRegistCountVO;

public interface IAdminMapper {

	// 공통코드 목록 불러오기
	List<CommonListVO> commonList(PageVO vo);
	
	
	// 공통코드 상세 불러오기
	CommonListVO commonDetail(String commonCODE);
	
	
	// 공통코드 사용 여부 수정 (Y로)
	void commonModifyYes(String commmonCODE);
	
	
	// 공통코드 사용 여부 수정 (N으로)
	void commonModifyNo(String commonCODE);
	
	
	// 공통코드 등록
	void commonRegist(CommonVO vo);
	
	
	// 공통코드 중복 여부 체크
	int commonCheck(String commonCODE);
	
	
	// 공통코드 삭제
	void commonDelete(String commonCODE);
	
	
	// 가입 승인 대기중인 기업 목록 불러오기
	List<CompanyAcceptListVO> companyAcceptList(PageVO vo);
	
	//
	int getTotal(PageVO vo);
	
	
	// 가입 승인 대기중인 기업 상세보기
	CompanyAcceptVO companyAcceptDetail(int companyNO);
	
	
	// 가입 승인
	void companyAccept(int companyNO);
	
	
	// 가입 거부
	void companyDenied(int companyNO);
	
	
	// 개발자 날짜 정보 중 6개월 간의 날짜 정보를 얻기 위한 요청
	UserDateVO userDate();
	
	
	// 6개월 동안 일반회원(개발자) 신규 가입 수를 얻기 위한 요청
	UserRegistCountVO userRegistCount();
	
	
	// 개발자 프로필사진 등록 현황을 얻기 위한 요청
	UserProfileCountVO userProfileCount();
	
	
	// 개발자 이력서 등록 현황을 얻기 위한 요청
	UserResumeCountVO userResumeCount();
	
	
	// 한 달 동안 일반회원 신규가입자 목록을 얻기 위한 요청
	List<UserNewListVO> userNewList();
	
	
	// 6개월 동안 일반회원(개발자) 탈퇴 수를 얻기 위한 요청
	UserDeleteCountVO userDeleteCount();
	
	
	// 한 달 동안 일반회원 탈퇴자 목록을 얻기 위한 요청
	List<UserDeleteCountVO> userDeleteList();
	
	
	// 개발자 별 프로젝트 지원 수를 얻기 위한 요청
	List<UserApplyCountVO> userApplyCount();
	
	
	// 개발자 별 받은 쪽지 수를 얻기 위한 요청
	List<UserMessageCountVO> userMessageCount();
	
	
	// 개발자 별 작성한 자유게시판 게시글 수를 얻기 위한 요청
	List<UserBoardCountVO> userBoardCount();
	
	
	// 개발자 별 작성한 질문글 수를 얻기 위한 요청 
	List<UserQuestionCountVO> userQuestionCount();
	
	
	// 개발자 별 작성한 답변글 수를 얻기 위한 요청 
	List<UserAnswerCountVO> userAnswerCount();
	
	
	// 개발자 별 작성한 자료실 글 수를 얻기 위한 요청 
	List<UserArchiveCountVO> userArchiveCount();
	
	
	// 6개월 동안 기업회원 가입 수를 얻기 위한 요청
	CompanyRegistCountVO companyRegistCount();
	
	
	// 전체 기업들의 가입 상태 현황을 얻기 위한 요청
	List<CompanyStatusCountVO> companyStatus();
	
	
	// 각 기업들의 가입 상태 현황을 얻기 위한 요청
	List<CompanyCRGVO> companyCRG();
	
	
	// 한 달 동안 기업회원의 신규 가입 목록을 얻기 위한 요청
	List<CompanyNewListVO> companyNewList();
	
	
	// 지역 별 기업 위치 가져오기
	List<CompanyRegionVO> companyRegion();
	
	
	// 기업 회원 로고 사진 등록 여부를 얻기 위한 요청
	CompanyLogoCountVO companyLogoCount();
	
	
	// 6개월 동안 기업회원 탈퇴 수를 얻기 위한 요청
	CompanyDeleteCountVO companyDeleteCount();
	
	
	// 한 달 동안 탈퇴한 기업 수를 얻기 위한 요청
	List<CompanyDeleteListVO> companyDeleteList();
	
	
	// 기업 별 프로젝트 등록 수를 얻기 위한 요청
	List<CompanyProjectCountVO> companyProjectCount();
	
	
	// 기업 별 보낸 쪽지 수를 얻기 위한 요청
	List<CompanyMessageCountVO> companyMessageCount();
	
	
	// 기업 별 작성한 자유게시판 게시글 수를 얻기 위한 요청
	List<CompanyBoardCountVO> companyBoardCount();
	
	
	// 기업 별 작성한 자료실 게시글 수를 얻기 위한 요청
	List<CompanyArchiveCountVO> companyArchiveCount();
	
	
	// 6개월 동안 전체 프로젝트 등록 수를 얻기 위한 요청
	com.spring.leaf.admin.command.ProjectRegistCountVO projectRegistCount();
	
	
	// 6개월 동안 전체 프로젝트 삭제 수를 얻기 위한 요청
	ProjectDeleteCountVO projectDeleteCount();
	
	
	// 한 달 동안 등록한 프로젝트 수를 얻기 위한 요청
	List<ProjectNewListVO> projectNewList();
	
	
	// 한 달 동안 삭제한 프로젝트 수를 얻기 위한 요청
	List<ProjectDeleteListVO> projectDeleteList();
	
	
	// 모집 중인 프로젝트의 지원 수를 얻기 위한 요청
	List<ProjectApplyNowVO> projectApplyNow();
	
	
	// 모집이 종료된 프로젝트의 지원 수를 얻기 위한 요청
	List<ProjectApplyEndVO> projectApplyEnd();
	
	
	// 전체 프로젝트의 지원 수를 얻기 위한 요청
	List<ProjectApplyVO> projectApply();
	
	
	// 전체 프로젝트의 지원 수 목록을 얻기 위한 요청
	List<ProjectApplyListVO> projectApplyList();
	
	
	// 프로젝트 별 조회수를 얻기 위한 요청
	List<ProjectViewsVO> projectViews();
	
	
	// 프로젝트 별 좋아요 수를 얻기 위한 요청
	List<ProjectLikesVO> projectLikes();
	
	
	// 프로젝트들의 현재 상태들을 얻기 위한 요청
	List<ProjectStatusListVO> projectStatusList();
	
	
	// 전체 지원 상태들을 얻기 위한 요청
	List<ApplyStatusListVO> applyStatusList();
		
}
