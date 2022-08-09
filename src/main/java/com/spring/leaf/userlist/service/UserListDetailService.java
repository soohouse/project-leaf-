package com.spring.leaf.userlist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.userlist.command.UserListDetailVO;
import com.spring.leaf.userlist.command.UserListVO;
import com.spring.leaf.userlist.mapper.IUserListDetailMapper;
import com.spring.leaf.userlist.mapper.IUserListMapper;

@Service
public class UserListDetailService implements IUserListDetailService {


	@Autowired
	private IUserListDetailMapper mapper;
	
	@Override
	public UserListDetailVO userListDetail(int userNO) {
		// TODO Auto-generated method stub
		return mapper.userListDetail(userNO);
	}
	
}
