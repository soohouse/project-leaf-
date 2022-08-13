package com.spring.leaf.userapply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.userapply.command.UserApplyResultVO;
import com.spring.leaf.userapply.mapper.IUserApplyMapper;
import com.spring.leaf.userlist.command.UserListVO;
import com.spring.leaf.userlist.mapper.IUserListMapper;

@Service
public class UserApplyService implements IUserApplyService {

	@Autowired
	private IUserApplyMapper mapper;
	
	@Override
	public List<UserApplyResultVO> applyResultList() {
		return mapper.applyResultList();
	}
	
}
