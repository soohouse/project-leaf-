package com.spring.leaf.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.admin.command.CommonListVO;
import com.spring.leaf.admin.command.CommonVO;
import com.spring.leaf.admin.command.CompanyAcceptListVO;
import com.spring.leaf.admin.command.CompanyAcceptVO;
import com.spring.leaf.admin.command.UserDateVO;
import com.spring.leaf.admin.command.UserNewListVO;
import com.spring.leaf.admin.command.UserProfileCountVO;
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
	
}
