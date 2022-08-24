package com.spring.leaf.usersmanage.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class CompanyMembersDetailVO {
	private int companyNO;
	private String companyID;
	private String companyName;
	private String companyEmail;
	private String companyPhone;
	private String companyIntro;
	private String companyIntroRealname;
}	
