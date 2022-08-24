package com.spring.leaf.message.service;

import com.spring.leaf.message.command.CompanyMessageVO;
import com.spring.leaf.message.command.UserMessageVO;

//관리자 쪽지 서비스 인터페이스 : 2022-08-21 생성

public interface IAdminMessageService {
	
		//쪽지 전송하기(관리자 -> 일반 UserMessage 테이블에 전송)
		void adminSendUserMessage(UserMessageVO vo);
			
		//쪽지 전송하기(관리자 -> 기업 CompanyMessage 테이블에 전송)
		void adminSendCompanyMessage(CompanyMessageVO vo);
}
