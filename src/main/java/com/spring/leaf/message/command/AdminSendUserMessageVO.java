package com.spring.leaf.message.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class AdminSendUserMessageVO {
	private String userID;
	private String userName;
	private String userMessageContent;
	private Timestamp userMessageDate;
	private int userMessageNO;
}
