package com.spring.leaf.message.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class AdminSendCompanyMessageVO {
	private String companyID;
	private String companyName;
	private String companyMessageContent;
	private Timestamp companyMessageDate;
	private int companyMessageNO;
}
