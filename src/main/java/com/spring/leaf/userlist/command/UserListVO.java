package com.spring.leaf.userlist.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//일반회원 개발자리스트 VO : 2022-08-04 생성
@ToString
@Getter
@Setter
public class UserListVO {
	private int userNO;
	private String userID;
	private String userName;
	private String userEmail;
	private String userPhone;
	private String commonValue;
}
