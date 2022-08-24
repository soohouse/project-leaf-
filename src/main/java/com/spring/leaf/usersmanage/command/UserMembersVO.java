package com.spring.leaf.usersmanage.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//사용자 관리(관리자 페이지)
@ToString
@Getter
@Setter
public class UserMembersVO {
	private int userNO;
	private String userID;
	private String userName;
	private String userPhone;
	private String userEmail;
	private String commonValue;
}
