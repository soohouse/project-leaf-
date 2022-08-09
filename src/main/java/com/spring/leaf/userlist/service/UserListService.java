package com.spring.leaf.userlist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.devinfo.command.DevInfoVO;
import com.spring.leaf.notice.mapper.INoticeMapper;
import com.spring.leaf.userlist.command.UserListVO;
import com.spring.leaf.userlist.mapper.IUserListMapper;

//개발자목록 보기 서비스 : 2022-08-04 생성


@Service
public class UserListService implements IUserListService {
	
	@Autowired
	private IUserListMapper mapper;

	//일반회원 목록 보기
	@Override
	public List<UserListVO> userList() {
		List<UserListVO> list = mapper.userList();
		return list;
	}
	
	
	

}
