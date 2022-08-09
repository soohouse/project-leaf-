package com.spring.leaf.devinfo.service;

import com.spring.leaf.devinfo.command.DevInfoVO;

public interface IDevInfoService {
	
	// 개발자 목록 상세보기
	DevInfoVO userListContent(int userNO);
	
}
