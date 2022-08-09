package com.spring.leaf.message.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class CompanyMessageVO {
	private int companyMessageNO;
	private String companyMessageWriter;
	private String companyMessageContent;
	private Timestamp companyMessageDate;
	private int companyNO;
}
