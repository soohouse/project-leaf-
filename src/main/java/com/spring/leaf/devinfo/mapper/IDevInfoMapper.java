package com.spring.leaf.devinfo.mapper;

import com.spring.leaf.devinfo.command.DevInfoVO;

public interface IDevInfoMapper {

	// 개발자 목록 상세보기
	DevInfoVO userListContent(int userNO);

}
