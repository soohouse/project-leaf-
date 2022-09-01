package com.spring.leaf.userapply.mapper;

import java.util.List;
import java.util.Map;

import com.spring.leaf.board.command.BoardVO;
import com.spring.leaf.userapply.command.UserApplyResultVO;
import com.spring.leaf.userapply.command.UserApplyStatusContentVO;
import com.spring.leaf.userapply.command.UserApplyStatusVO;
import com.spring.leaf.util.PageApplyVO;
import com.spring.leaf.util.PageVO;

public interface IUserApplyMapper {
	
	//지원결과 리스트
	List<UserApplyResultVO> applyResultList(Map<String, Object> map);
	
	//지원현황 리스트
	List<UserApplyStatusVO> applyStatusList(Map<String, Object> map);
	
	//지원현황 리스트 상세보기
	UserApplyStatusContentVO applyStatusContent(int projectNO);
	
	//지원한 프로젝트 개수 얻어오기 요청
	int projectApplyCount(int userNO);
	
	// 지원현황 프로젝트 개수 얻어오기 요청
	int projectApplyCountSearch(Map<String, Object> map);
	
}
