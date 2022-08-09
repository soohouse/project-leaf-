package com.spring.leaf.userlist.mapper;

import com.spring.leaf.userlist.command.UserListDetailVO;
import com.spring.leaf.userlist.command.UserListVO;

public interface IUserListDetailMapper {
	
	// 개발자 목록 상세보기
		UserListDetailVO userListDetail(int userNO);
}
