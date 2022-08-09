package com.spring.leaf.message.mapper;

import java.util.List;

import com.spring.leaf.message.command.UserMessageVO;

public interface IUserMessageMapper {
	

		//쪽지 목록보기 (관리자/기업으로부터 받은 쪽지를 userMessage 테이블에서 꺼내오기)
		//(UserMessage table에 있는 쪽지 목록을 WHERE절을 이용하여 UserNo가 일치하는 목록을 싹 끌고오기)
		List<UserMessageVO> userMessageList();
		
		//쪽지 상세보기 (쪽지목록 상세보기)
		UserMessageVO userMessageContent(int userMessageNO);

		//쪽지 삭제하기 (관리자로/기업으로부터 받은 쪽지를 UserMessage 테이블에서 삭제하기)
		// (UserMessage table에 있는 쪽지 목록 삭제하기)
		void userMessageDelete(int userMessageNO);
}
