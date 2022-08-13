package com.spring.leaf.message.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.message.command.UserMessageVO;
import com.spring.leaf.message.mapper.IUserMessageMapper;
import com.spring.leaf.notice.mapper.INoticeMapper;

@Service
public class UserMessageService implements IUserMessageService {

	@Autowired
	private IUserMessageMapper mapper;
	
	@Override
	public List<UserMessageVO> userMessageList(int userNO) {
		return mapper.userMessageList(userNO);
	}

	@Override
	public UserMessageVO userMessageContent(int userMessageNO) {
		return mapper.userMessageContent(userMessageNO);
	}

	@Override
	public void userMessageDelete(int userMessageNO) {
		mapper.userMessageDelete(userMessageNO);

	}

}
