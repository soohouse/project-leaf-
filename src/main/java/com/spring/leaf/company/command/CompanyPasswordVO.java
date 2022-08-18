package com.spring.leaf.company.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CompanyPasswordVO {

	private String oldPassword;
	private String newPassword;
	private int companyNO;
	
}
