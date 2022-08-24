package com.spring.leaf.message.mapper;

import com.spring.leaf.message.command.CompanyMessageVO;
import com.spring.leaf.message.command.UserMessageVO;

public interface IAdminMessageMapper {
	
		//쪽지 전송하기(관리자 -> 일반 UserMessage 테이블에 전송)
		void adminSendUserMessage(UserMessageVO vo);
				
		//쪽지 전송하기(관리자 -> 기업 CompanyMessage 테이블에 전송)
		void adminSendCompanyMessage(CompanyMessageVO vo);
}
