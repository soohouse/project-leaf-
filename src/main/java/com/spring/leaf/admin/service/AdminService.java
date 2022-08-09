package com.spring.leaf.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.admin.command.CommonListVO;
import com.spring.leaf.admin.command.CommonVO;
import com.spring.leaf.admin.command.CompanyAcceptListVO;
import com.spring.leaf.admin.command.CompanyAcceptVO;
import com.spring.leaf.admin.mapper.IAdminMapper;


// 관리자 서비스 : 2022-08-07 생성

@Service
public class AdminService implements IAdminService {

	// 관리자 매퍼 연결
	@Autowired
	private IAdminMapper mapper;
	
	
	// 공통코드 목록 불러오기
	@Override
	public List<CommonListVO> commonList() {
		return mapper.commonList();
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
	public List<CompanyAcceptListVO> companyAcceptList() {
		return mapper.companyAcceptList();
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
	
}
