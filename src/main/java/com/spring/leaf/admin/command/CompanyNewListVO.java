package com.spring.leaf.admin.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CompanyNewListVO {

	private int companyNO;
	private String companyID;
	private String companyName;
	private String companyEmail;
	private String companyPhone;
	private String companyAddress;
	private String companyDate;
	
}
