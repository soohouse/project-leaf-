package com.spring.leaf.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
import com.spring.leaf.admin.command.ProjectRegistCountVO;
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
import com.spring.leaf.admin.mapper.IAdminMapper;
import com.spring.leaf.util.PageVO;


// 관리자 서비스 : 2022-08-07 생성

@Service
public class AdminService implements IAdminService {

	// 관리자 매퍼 연결
	@Autowired
	private IAdminMapper mapper;
	
	
	// 공통코드 목록 불러오기
	@Override
	public List<CommonListVO> commonList(PageVO vo) {
		List<CommonListVO> list = mapper.commonList(vo);
		return list;
	}
	
	
	// 공통코드 상세 불러오기
	@Override
	public CommonListVO commonDetail(String commonCODE) {
		return mapper.commonDetail(commonCODE);
	}
	
	
	// 공통코드 사용 여부 수정 (Y로)
	@Override
	public void commonModifyYes(String commmonCODE) {
		mapper.commonModifyYes(commmonCODE);
	}
	
	
	// 공통코드 사용 여부 수정 (N으로)
	@Override
	public void commonModifyNo(String commonCODE) {
		mapper.commonModifyNo(commonCODE);
	}
	
	
	// 공통코드 등록
	@Override
	public void commonRegist(CommonVO vo) {
		mapper.commonRegist(vo);
	}
	
	
	// 공통코드 중복 여부 체크
	@Override
	public int commonCheck(String commonCODE) {
		return mapper.commonCheck(commonCODE);
	}
	
	
	// 공통코드 삭제
	@Override
	public void commonDelete(String commonCODE) {
		mapper.commonDelete(commonCODE);
	}
	
	
	// 가입 승인 대기중인 기업 목록 불러오기
	@Override
	public List<CompanyAcceptListVO> companyAcceptList(PageVO vo) {
		List<CompanyAcceptListVO> list = mapper.companyAcceptList(vo);
		return list;
	}
	
	//
	@Override
	public int getTotal(PageVO vo) {
		return mapper.getTotal(vo);
	}
	
	
	// 가입 승인 대기중인 기업 상세보기
	@Override
	public CompanyAcceptVO companyAcceptDetail(int companyNO) {
		return mapper.companyAcceptDetail(companyNO);
	}
	
	
	// 가입 승인
	@Override
	public void companyAccept(int companyNO) {
		mapper.companyAccept(companyNO);
	}
	
	
	// 가입 거부
	@Override
	public void companyDenied(int companyNO) {
		mapper.companyDenied(companyNO);	
	}
	
	
	// 개발자 날짜 정보 중 6개월 간의 날짜 정보를 얻기 위한 요청
	@Override
	public UserDateVO userDate() {
		return mapper.userDate();
	}
	
	
	// 6개월 동안 일반회원(개발자) 신규 가입 수를 얻기 위한 요청
	@Override
	public UserRegistCountVO userRegistCount() {
		return mapper.userRegistCount();
	}
	
	
	// 개발자 이력서 등록 현황을 얻기 위한 요청
	@Override
	public UserResumeCountVO userResumeCount() {
		return mapper.userResumeCount();
	}
	
	
	// 개발자 프로필사진 등록 현황을 얻기 위한 요청
	@Override
	public UserProfileCountVO userProfileCount() {
		return mapper.userProfileCount();
	}
	
	
	// 한 달 동안 일반회원 신규가입자 목록을 얻기 위한 요청
	@Override
	public List<UserNewListVO> userNewList() {
		return mapper.userNewList();
	}
	
	
	// 6개월 동안 일반회원(개발자) 탈퇴 수를 얻기 위한 요청
	@Override
	public UserDeleteCountVO userDeleteCount() {
		return mapper.userDeleteCount();
	}
	
	
	// 한 달 동안 일반회원 탈퇴자 목록을 얻기 위한 요청
	@Override
	public List<UserDeleteCountVO> userDeleteList() {
		return mapper.userDeleteList();
	}
	
	
	// 개발자 별 프로젝트 지원 수를 얻기 위한 요청
	@Override
	public List<UserApplyCountVO> userApplyCount() {
		return mapper.userApplyCount();
	}
	
	
	// 개발자 별 받은 쪽지 수를 얻기 위한 요청
	@Override
	public List<UserMessageCountVO> userMessageCount() {
		return mapper.userMessageCount();
	}
	
	
	// 개발자 별 작성한 자유게시판 게시글 수를 얻기 위한 요청
	@Override
	public List<UserBoardCountVO> userBoardCount() {
		return mapper.userBoardCount();
	}

	
	// 개발자 별 작성한 질문글 수를 얻기 위한 요청 
	@Override
	public List<UserQuestionCountVO> userQuestionCount() {
		return mapper.userQuestionCount();
	}
	
	
	// 개발자 별 작성한 답변글 수를 얻기 위한 요청 
	@Override
	public List<UserAnswerCountVO> userAnswerCount() {
		return mapper.userAnswerCount();
	}
	
	
	// 개발자 별 작성한 자료실 글 수를 얻기 위한 요청 
	@Override
	public List<UserArchiveCountVO> userArchiveCount() {
		return mapper.userArchiveCount();
	}
	
	
	// 6개월 동안 기업회원 가입 수를 얻기 위한 요청
	@Override
	public CompanyRegistCountVO companyRegistCount() {
		return mapper.companyRegistCount();
	}
	
	
	// 기업들의 가입 상태 현황을 얻기 위한 요청
	@Override
	public List<CompanyStatusCountVO> companyStatus() {
		return mapper.companyStatus();
	}
	
	
	// 각 기업들의 가입 상태 현황을 얻기 위한 요청
	@Override
	public List<CompanyCRGVO> companyCRG() {
		return mapper.companyCRG();
	}
	
	
	// 한 달 동안 기업회원의 신규 가입 목록을 얻기 위한 요청
	@Override
	public List<CompanyNewListVO> companyNewList() {
		return mapper.companyNewList();
	}
	
	
	// 지역 별 기업 위치 가져오기
	@Override
	public List<CompanyRegionVO> companyRegion() {

		List<CompanyRegionVO> list = mapper.companyRegion();
		
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getCompanyRegion().equals("서울")) {
				list.get(i).setCompanyRegion("KR-11");
			} else if(list.get(i).getCompanyRegion().equals("부산")) {
				list.get(i).setCompanyRegion("KR-26");
			} else if(list.get(i).getCompanyRegion().equals("대구")) {
				list.get(i).setCompanyRegion("KR-27");
			} else if(list.get(i).getCompanyRegion().equals("대전")) {
				list.get(i).setCompanyRegion("KR-30");
			} else if(list.get(i).getCompanyRegion().equals("광주")) {
				list.get(i).setCompanyRegion("KR-29");
			} else if(list.get(i).getCompanyRegion().equals("인천")) {
				list.get(i).setCompanyRegion("KR-28");
			} else if(list.get(i).getCompanyRegion().equals("울산")) {
				list.get(i).setCompanyRegion("KR-31");
			} else if(list.get(i).getCompanyRegion().equals("충북")) {
				list.get(i).setCompanyRegion("KR-43");
			} else if(list.get(i).getCompanyRegion().equals("충남")) {
				list.get(i).setCompanyRegion("KR-44");
			} else if(list.get(i).getCompanyRegion().equals("강원")) {
				list.get(i).setCompanyRegion("KR-42");
			} else if(list.get(i).getCompanyRegion().equals("경기")) {
				list.get(i).setCompanyRegion("KR-41");
			} else if(list.get(i).getCompanyRegion().equals("경북")) {
				list.get(i).setCompanyRegion("KR-47");
			} else if(list.get(i).getCompanyRegion().equals("경남")) {
				list.get(i).setCompanyRegion("KR-48");
			} else if(list.get(i).getCompanyRegion().equals("제주")) {
				list.get(i).setCompanyRegion("KR-49");
			} else if(list.get(i).getCompanyRegion().equals("전북")) {
				list.get(i).setCompanyRegion("KR-45");
			} else if(list.get(i).getCompanyRegion().equals("전남")) {
				list.get(i).setCompanyRegion("KR-46");
			} else {
				list.get(i).setCompanyRegion("KR-11");
			}
		}
		
		return list;
	}
	
	
	// 기업 회원 로고 사진 등록 여부를 얻기 위한 요청
	@Override
	public CompanyLogoCountVO companyLogoCount() {
		return mapper.companyLogoCount();
	}
	
	
	// 6개월 동안 기업회원 탈퇴 수를 얻기 위한 요청
	@Override
	public CompanyDeleteCountVO companyDeleteCount() {
		return mapper.companyDeleteCount();
	}
	
	
	// 한 달 동안 탈퇴한 기업 수를 얻기 위한 요청
	@Override
	public List<CompanyDeleteListVO> companyDeleteList() {
		return mapper.companyDeleteList();
	}
	
	
	// 기업 별 프로젝트 등록 수를 얻기 위한 요청
	@Override
	public List<CompanyProjectCountVO> companyProjectCount() {
		return mapper.companyProjectCount();
	}
	
	
	// 기업 별 보낸 쪽지 수를 얻기 위한 요청
	@Override
	public List<CompanyMessageCountVO> companyMessageCount() {
		return mapper.companyMessageCount();
	}
	
	
	// 기업 별 작성한 자유게시판 게시글 수를 얻기 위한 요청
	@Override
	public List<CompanyBoardCountVO> companyBoardCount() {
		return mapper.companyBoardCount();
	}
	
	
	// 기업 별 작성한 자료실 게시글 수를 얻기 위한 요청
	@Override
	public List<CompanyArchiveCountVO> companyArchiveCount() {
		return mapper.companyArchiveCount();
	}
	
	
	// 6개월 동안 전체 프로젝트 등록 수를 얻기 위한 요청
	@Override
	public ProjectRegistCountVO projectRegistCount() {
		return mapper.projectRegistCount();
	}
	
	
	// 6개월 동안 전체 프로젝트 삭제 수를 얻기 위한 요청
	@Override
	public ProjectDeleteCountVO projectDeleteCount() {
		return mapper.projectDeleteCount();
	}
	
	
	// 한 달 동안 등록한 프로젝트 수를 얻기 위한 요청
	@Override
	public List<ProjectNewListVO> projectNewList() {
		return mapper.projectNewList();
	}
	
	
	// 한 달 동안 삭제한 프로젝트 수를 얻기 위한 요청
	@Override
	public List<ProjectDeleteListVO> projectDeleteList() {
		return mapper.projectDeleteList();
	}
	
	
	// 모집 중인 프로젝트의 지원 수를 얻기 위한 요청
	@Override
	public List<ProjectApplyNowVO> projectApplyNow() {
		return mapper.projectApplyNow();
	}
	
	
	// 모집이 종료된 프로젝트의 지원 수를 얻기 위한 요청
	@Override
	public List<ProjectApplyEndVO> projectApplyEnd() {
		return mapper.projectApplyEnd();
	}
	
	
	// 전체 프로젝트의 지원 수를 얻기 위한 요청
	@Override
	public List<ProjectApplyVO> projectApply() {
		return mapper.projectApply();
	}
	
	
	// 전체 프로젝트의 지원 수 목록을 얻기 위한 요청
	@Override
	public List<ProjectApplyListVO> projectApplyList() {
		return mapper.projectApplyList();
	}
	
	
	// 프로젝트 별 조회수를 얻기 위한 요청
	@Override
	public List<ProjectViewsVO> projectViews() {
		return mapper.projectViews();
	}
	
	
	// 프로젝트 별 좋아요 수를 얻기 위한 요청
	@Override
	public List<ProjectLikesVO> projectLikes() {
		return mapper.projectLikes();
	}
	
	
	// 프로젝트들의 현재 상태들을 얻기 위한 요청
	@Override
	public List<ProjectStatusListVO> projectStatusList() {
		return mapper.projectStatusList();
	}
	
	
	// 전체 지원 상태들을 얻기 위한 요청
	@Override
	public List<ApplyStatusListVO> applyStatusList() {
		return mapper.applyStatusList();
	}
	
}
