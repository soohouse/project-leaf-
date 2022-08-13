package com.spring.leaf.userapply.mapper;

import java.util.List;

import com.spring.leaf.userapply.command.UserApplyResultVO;

public interface IUserApplyMapper {
	
	//지원결과 리스트
	List<UserApplyResultVO> applyResultList();
}
