package com.spring.leaf.userapply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.userapply.command.UserApplyResultVO;
import com.spring.leaf.userapply.command.UserApplyStatusContentVO;
import com.spring.leaf.userapply.command.UserApplyStatusVO;
import com.spring.leaf.userapply.mapper.IUserApplyMapper;
import com.spring.leaf.userlist.command.UserListVO;
import com.spring.leaf.userlist.mapper.IUserListMapper;

@Service
public class UserApplyService implements IUserApplyService {

	@Autowired
	private IUserApplyMapper mapper;
	
	@Override
	public List<UserApplyResultVO> applyResultList(int userNO) {
		return mapper.applyResultList(userNO);
	}
	
	@Override
	public List<UserApplyStatusVO> applyStatusList(int userNO) {
		return mapper.applyStatusList(userNO);
	}
	
	@Override
	public UserApplyStatusContentVO applyStatusContent(int projectNO) {
		return null;
	}
	
	@Override
	public int projectApplyCount(int userNO) {
		return mapper.projectApplyCount(userNO);
	}
	
}
