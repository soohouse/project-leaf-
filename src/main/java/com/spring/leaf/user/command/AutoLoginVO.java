package com.spring.leaf.user.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AutoLoginVO {

	private String sessionID;
	private Timestamp sessionLimit;
	private String userID;
	
}
