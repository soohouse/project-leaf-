package com.spring.leaf.message.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.message.command.CompanyMessageVO;
import com.spring.leaf.message.command.UserMessageVO;
import com.spring.leaf.message.mapper.IAdminMessageMapper;

@Service
public class AdminMessageService implements IAdminMessageService {

	@Autowired
	private IAdminMessageMapper mapper;
	
	@Override
	public void adminSendUserMessage(UserMessageVO vo) {
		mapper.adminSendUserMessage(vo);
	}

	@Override
	public void adminSendCompanyMessage(CompanyMessageVO vo) {
		mapper.adminSendCompanyMessage(vo);
	}
	
}
