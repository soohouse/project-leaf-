package com.spring.leaf.userlist.service;

import com.spring.leaf.userlist.command.UserListDetailVO;
import com.spring.leaf.userlist.command.UserListVO;

public interface IUserListDetailService {
	// 개발자 목록 상세보기
	UserListDetailVO userListDetail(int userNO);

}
