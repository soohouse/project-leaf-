package com.spring.leaf.message.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CompanySendMessageVO {

	private String userID;
	private String userName;
	private String userMessageContent;
	private Timestamp userMessageDate;
	private int userMessageNO;
	
}
