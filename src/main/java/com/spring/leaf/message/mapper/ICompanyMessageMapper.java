package com.spring.leaf.message.mapper;

import java.util.List;

import com.spring.leaf.message.command.CompanyMessageVO;
import com.spring.leaf.message.command.CompanySendMessageVO;
import com.spring.leaf.message.command.UserMessageVO;
import com.spring.leaf.notice.command.NoticeVO;

public interface ICompanyMessageMapper {
	
	//쪽지 전송하기(기업 -> 일반 UserMessage 테이블에 전송)
	void userSendMessage(UserMessageVO vo);
	
	//쪽지 목록보기 (관리자로부터 받은 쪽지를 CompanyMessage 테이블에서 꺼내오기)
	List<CompanyMessageVO> companyMessageList(int companyNO);
			
	//쪽지 상세보기 (관리자로부터 받은 쪽지목록 상세보기)
	CompanyMessageVO companyMessageContent(int companyMessageNO);
	
	//쪽지 목록보기 (기업 -> 일반유저에게 보낸 쪽지 목록보기)
	List<CompanySendMessageVO> companySendList(String userMessageWriter);

	//쪽지 상세보기 (유저에게 보낸 쪽지목록 상세보기)
	UserMessageVO sendMessageContent(int userMessageNO);
}

