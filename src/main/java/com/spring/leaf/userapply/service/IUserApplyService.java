package com.spring.leaf.userapply.service;

import java.util.List;

import com.spring.leaf.userapply.command.UserApplyResultVO;
import com.spring.leaf.userapply.command.UserApplyStatusContentVO;
import com.spring.leaf.userapply.command.UserApplyStatusVO;
import com.spring.leaf.userlist.command.UserListVO;

public interface IUserApplyService {
	
	//지원결과 리스트
	List<UserApplyResultVO> applyResultList(int userNO);
	
	//지원현황 리스트
	List<UserApplyStatusVO> applyStatusList(int userNO);
	
	//지원현황 리스트
	UserApplyStatusContentVO applyStatusContent(int projectNO);
}
