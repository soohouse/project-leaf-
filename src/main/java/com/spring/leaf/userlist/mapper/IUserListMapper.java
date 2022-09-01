package com.spring.leaf.userlist.mapper;

import java.util.List;

import com.spring.leaf.userlist.command.UserListDetailVO;
import com.spring.leaf.userlist.command.UserListVO;
import com.spring.leaf.util.PageVO;

//개발자 리스트 매퍼 인터페이스 : 2022-08-04 생성

public interface IUserListMapper {
	
	// 개발자 목록
	List<UserListVO> userList(PageVO vo);
	
	//자유게시판 총 게시물 수
	int getTotal(PageVO vo);

	// 개발자 목록 상세보기
	UserListDetailVO userListDetail(int userNO);

}
