package com.spring.leaf.admin.service;

import java.util.List;

import com.spring.leaf.admin.command.CommonListVO;
import com.spring.leaf.admin.command.CommonVO;
import com.spring.leaf.admin.command.CompanyAcceptListVO;
import com.spring.leaf.admin.command.CompanyAcceptVO;

public interface IAdminService {

	// 공통코드 목록 불러오기
	List<CommonListVO> commonList();
	
	
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
	List<CompanyAcceptListVO> companyAcceptList();
	
	
	// 가입 승인 대기중인 기업 상세보기
	CompanyAcceptVO companyAcceptDetail(int companyNO);
	
	
	// 가입 승인
	void companyAccept(int companyNO);
	
}
