package com.spring.leaf.company.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CompanyAutoLoginVO {

	private String sessionID;
	private Timestamp sessionLimit;
	private String companyID;
	
}
