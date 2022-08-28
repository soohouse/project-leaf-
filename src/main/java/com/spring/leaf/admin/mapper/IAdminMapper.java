package com.spring.leaf.admin.mapper;

import java.util.List;

import com.spring.leaf.admin.command.CommonListVO;
import com.spring.leaf.admin.command.CommonVO;
import com.spring.leaf.admin.command.CompanyAcceptListVO;
import com.spring.leaf.admin.command.CompanyAcceptVO;
import com.spring.leaf.admin.command.UserDateVO;
import com.spring.leaf.admin.command.UserNewListVO;
import com.spring.leaf.admin.command.UserProfileCountVO;
import com.spring.leaf.admin.command.UserRegistCountVO;
import com.spring.leaf.admin.command.UserResumeCountVO;
import com.spring.leaf.util.PageVO;

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
	
}
