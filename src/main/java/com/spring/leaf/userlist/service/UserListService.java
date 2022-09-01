package com.spring.leaf.userlist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.admin.command.CompanyAcceptListVO;
import com.spring.leaf.admin.command.CompanyAcceptVO;
import com.spring.leaf.board.command.BoardVO;
import com.spring.leaf.devinfo.command.DevInfoVO;
import com.spring.leaf.notice.mapper.INoticeMapper;
import com.spring.leaf.userlist.command.UserListDetailVO;
import com.spring.leaf.userlist.command.UserListVO;
import com.spring.leaf.userlist.mapper.IUserListMapper;
import com.spring.leaf.util.PageVO;

//개발자목록 보기 서비스 : 2022-08-04 생성


@Service
public class UserListService implements IUserListService {
	
	@Autowired
	private IUserListMapper mapper;

	//일반회원 목록 보기
	@Override
	public List<UserListVO> userList(PageVO vo) {
		List<UserListVO> list = mapper.userList(vo);
		return list;
	}
	
	//일반회원 상세 보기
	@Override
	public UserListDetailVO userListDetail(int userNO) {
		// TODO Auto-generated method stub
		return mapper.userListDetail(userNO);
	}
	
	//개발자 목록
	@Override
	public int getTotal(PageVO vo) {
		return mapper.getTotal(vo);
	}
	
	
}
