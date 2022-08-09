package com.spring.leaf.message.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class UserMessageVO {
	private int userMessageNO;
	private String userMessageWriter;
	private String userMessageContent;
	private Timestamp userMessageDate;
	private int userNO;
}
