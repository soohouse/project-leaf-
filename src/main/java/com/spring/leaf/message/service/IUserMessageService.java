package com.spring.leaf.message.service;

import java.util.List;

import com.spring.leaf.message.command.CompanyMessageVO;
import com.spring.leaf.message.command.UserMessageVO;

public interface IUserMessageService {

	
	//쪽지 목록보기 (관리자/기업으로부터 받은 쪽지를 userMessage 테이블에서 꺼내오기)
	List<UserMessageVO> userMessageList();
	
	//쪽지 상세보기 (쪽지목록 상세보기)
	UserMessageVO userMessageContent(int userMessageNO);

	//쪽지 삭제하기 (관리자로/기업으로부터 받은 쪽지를 UserMessage 테이블에서 삭제하기)
	void userMessageDelete(int userMessageNO);
}