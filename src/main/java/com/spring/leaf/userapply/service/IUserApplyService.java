package com.spring.leaf.userapply.service;

import java.util.List;
import java.util.Map;

import com.spring.leaf.userapply.command.UserApplyResultVO;
import com.spring.leaf.userapply.command.UserApplyStatusContentVO;
import com.spring.leaf.userapply.command.UserApplyStatusVO;
import com.spring.leaf.userlist.command.UserListVO;
import com.spring.leaf.util.PageApplyVO;
import com.spring.leaf.util.PageVO;

public interface IUserApplyService {
	
	//지원결과 리스트
	List<UserApplyResultVO> applyResultList(int userNO, PageVO vo);
	
	//지원현황 리스트
	List<UserApplyStatusVO> applyStatusList(int userNO, PageApplyVO pvo);
	
	//지원현황 리스트
	UserApplyStatusContentVO applyStatusContent(int projectNO);
	
	//지원한 프로젝트 개수 얻어오기 요청
	int projectApplyCount(int userNO);

	// 지원현황 프로젝트 개수 얻어오기 요청
	int projectApplyCountSearch(int userNO, PageApplyVO vo);
	
}
