package com.spring.leaf.devinfo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.devinfo.command.DevInfoVO;
import com.spring.leaf.devinfo.mapper.IDevInfoMapper;
import com.spring.leaf.userlist.command.UserListVO;

@Service
public class DevInfoService implements IDevInfoService {

	@Autowired
	private IDevInfoMapper mapper;
	
	//일반회원 목록 상세보기
	@Override
	public DevInfoVO userListContent(int userNO) {

		return mapper.userListContent(userNO);
	}
	
	
	
	

}
