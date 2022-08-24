package com.spring.leaf.usersmanage.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class UserMembersDetailVO {
	private int userNO;
	private String userID;
	private String userName;
	private String userEmail;
	private String userPhone;
	private String userIntro;
	private String resumeRealname;
}
