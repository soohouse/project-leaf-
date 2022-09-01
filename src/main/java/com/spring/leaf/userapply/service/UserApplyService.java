package com.spring.leaf.userapply.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.userapply.command.UserApplyResultVO;
import com.spring.leaf.userapply.command.UserApplyStatusContentVO;
import com.spring.leaf.userapply.command.UserApplyStatusVO;
import com.spring.leaf.userapply.mapper.IUserApplyMapper;
import com.spring.leaf.userlist.command.UserListVO;
import com.spring.leaf.userlist.mapper.IUserListMapper;
import com.spring.leaf.util.PageApplyVO;
import com.spring.leaf.util.PageVO;

@Service
public class UserApplyService implements IUserApplyService {

	@Autowired
	private IUserApplyMapper mapper;
	
	//지원현황 리스트
	@Override
	public List<UserApplyStatusVO> applyStatusList(int userNO, PageApplyVO pvo) {
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("userNO", userNO);
		map.put("pvo", pvo);
		return mapper.applyStatusList(map);
	}
	
	//지원결과 리스트
	@Override
	public List<UserApplyResultVO> applyResultList(int userNO, PageVO vo) {
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("userNO", userNO);
		map.put("pvo", vo);
		return mapper.applyResultList(map);
	}
	
	@Override
	public UserApplyStatusContentVO applyStatusContent(int projectNO) {
		return null;
	}
	
	@Override
	public int projectApplyCount(int userNO) {
		
		return mapper.projectApplyCount(userNO);
	}
	
	@Override
	public int projectApplyCountSearch(int userNO, PageApplyVO pvo) {
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("userNO", userNO);
		map.put("pvo", pvo);
		
		return mapper.projectApplyCountSearch(map);
	}
	
}
