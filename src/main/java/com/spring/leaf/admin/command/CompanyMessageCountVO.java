package com.spring.leaf.admin.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CompanyMessageCountVO {

	private String companyName;
	private int userMessageCount;
	
}
