package com.spring.leaf.user.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PasswordVO {

	private String oldPassword;
	private String newPassword;
	private int userNO;
	
}
