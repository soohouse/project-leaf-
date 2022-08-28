package com.spring.leaf.admin.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserNewListVO {

	private int userNO;
	private String userID;
	private String userName;
	private String userEmail;
	private String userPhone;
	private String userDate;
	
}
