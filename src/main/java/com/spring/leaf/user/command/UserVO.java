package com.spring.leaf.user.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


// 일반회원 VO : 2022-07-27 생성

@Getter
@Setter
@ToString
public class UserVO {

	private int userNO;
	private String userID;
	private String userPW;
	private String userName;
	private String userEmail1;
	private String userEmail2;
	private String userPhone1;
	private String userPhone2;
	private String userPhone3;
	private Timestamp userDate;
	private String userIntro;
	private String sessionID;
	private Timestamp sessionLimit;
	private Timestamp userDelete;
	private String commonCODE;
	
}
