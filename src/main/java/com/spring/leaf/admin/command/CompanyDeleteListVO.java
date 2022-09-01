package com.spring.leaf.admin.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CompanyDeleteListVO {

	private int companyNO;
	private String companyID;
	private String companyName;
	private String companyEmail;
	private String companyPhone;
	private String companyAddress;
	private String companyDelete;
	
}
