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
import com.spring.leaf.projectapply.command.ProjectApplyCountVO;
import com.spring.leaf.projectapply.command.ProjectPassListVO;
import com.spring.leaf.projectapply.mapper.IProjectApplyMapper;


@Service
public class ProjectApplyService implements IProjectApplyService {
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectApplyService.class);
	
	@Autowired
	private IProjectApplyMapper mapper;
	
	
	// 조회수 증가 요청
	@Override
	public void projectViewCount(int projectNO) {
		mapper.projectViewCount(projectNO);
	}
	
	
	@Override
	public void projectapply(ApplyVO vo) {
		vo.setApplyMsg(vo.getApplyMsg().replace("\n", "<br>"));
		
		mapper.projectapply(vo);
	}
	
	
	// 사용자의 이력서 원본 이름 얻어오기 요청
	@Override
	public String userInfoGet(int userNO) {
		return mapper.userInfoGet(userNO);
	}
	
	
	// 사용자의 지원현황 얻어오기 요청
	@Override
	public ApplyVO applyGet(int projectNO, int userNO) {
		
		Map<String, Object> numbers = new HashMap<>();
		numbers.put("projectNO", projectNO);
		numbers.put("userNO", userNO);
		
		return mapper.applyGet(numbers);
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
	
	
	// 지원 취소 처리
	@Override
	public void applyCancel(int userNO, int projectNO) {

		Map<String, Object> numbers = new HashMap<>();
		numbers.put("userNO", userNO);
		numbers.put("projectNO", projectNO);
		
		mapper.applyCancel(numbers);
	}
	
	
	// 프로젝트 최종 합격자 수 조회 요청
	@Override
	public int applyPassCount(int projectNO) {
		return mapper.applyPassCount(projectNO);
	}
	
	
	// 프로젝트 최종 합격자 목록 조회 요청
	@Override
	public List<ProjectPassListVO> applyPassList(int projectNO) {
		
		List<ProjectPassListVO> list = mapper.applyPassList(projectNO);
		
		for(int i = 0; i < list.size(); i++) {
			
			// ID 절반 감추기 로직
			ProjectPassListVO vo = list.get(i);

			int length = vo.getUserID().length();
			
			String stars = "";
			
			for(int j = 0; j < length / 2; j++) {
				stars += "*";
			}
			
			vo.setUserID(vo.getUserID().replace(vo.getUserID().substring(length / 2, length), stars));
			
			
			// 이름 가운데 감추기 로직
			int length2 = vo.getUserName().length();

			vo.setUserName(vo.getUserName().replace(vo.getUserName().substring((length2 - 1) / 2, length2 / 2 + 1), "*"));
		}
		
		return list;
	}
	
	
	// 프로젝트 별 지원자 수 얻어오기 요청 (통계)
	@Override
	public List<ProjectApplyCountVO> projectApplyCount(int companyNO) {
		return mapper.projectApplyCount(companyNO);
	}
}
