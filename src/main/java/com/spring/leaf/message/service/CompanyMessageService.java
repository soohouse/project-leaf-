package com.spring.leaf.message.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.message.command.CompanyMessageVO;
import com.spring.leaf.message.command.CompanySendMessageVO;
import com.spring.leaf.message.command.UserMessageVO;
import com.spring.leaf.message.mapper.ICompanyMessageMapper;


//기업 쪽지 서비스 : 2022-08-04 생성

@Service
public class CompanyMessageService implements ICompanyMessageService {
	
	@Autowired
	private ICompanyMessageMapper mapper;

	@Override
	public void userSendMessage(UserMessageVO vo) {
		mapper.userSendMessage(vo);
	}

	@Override
	public List<CompanyMessageVO> companyMessageList(int companyNO) {
		return mapper.companyMessageList(companyNO);
	}

	@Override
	public CompanyMessageVO companyMessageContent(int companyMessageNO) {
		return mapper.companyMessageContent(companyMessageNO);
	}
	
	@Override
	public List<CompanySendMessageVO> companySendList(String userMessageWriter) {
		return mapper.companySendList(userMessageWriter);
	}

	@Override
	public UserMessageVO sendMessageContent(int userMessageNO) {
		return mapper.sendMessageContent(userMessageNO);
	}


}
