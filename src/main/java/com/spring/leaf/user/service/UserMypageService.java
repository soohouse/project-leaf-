package com.spring.leaf.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.user.command.UserVO;
import com.spring.leaf.user.mapper.IUserMapper;
import com.spring.leaf.user.mapper.IUserMypageMapper;

@Service
public class UserMypageService implements IUserMypageService {

	@Autowired
	private IUserMypageMapper mapper;
	
	
	@Override
	public UserVO getInfo(int UserNO) {
		return mapper.getInfo(UserNO);
	}

	@Override
	public void updateUser(UserVO vo) {
		mapper.updateUser(vo);
	}

	@Override
	public void deleteUser(String id, String pw) {
		// TODO Auto-generated method stub

	}

}
