package com.spring.leaf.usersmanage.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class CompanyMembersVO {
	private int companyNO;
	private String companyID;
	private String companyName;
	private String companyPhone;
	private String companyEmail;
	private String commonValue;
}
