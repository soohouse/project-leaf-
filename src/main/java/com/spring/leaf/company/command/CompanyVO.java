package com.spring.leaf.company.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

// 기업회원 VO : 2022-07-28 생성

@Getter
@Setter
@ToString
public class CompanyVO {
	
	private int companyNO;
	private String companyID;
	private String companyPW;
	private String companyName;
	private String companyEmail1;
	private String companyEmail2;
	private String companyPhone1;
	private String companyPhone2;
	private String companyPhone3;
	private String companyAddress1;
	private String companyAddress2;
	private String companyAddress3;
	private Timestamp companyDate;
	private String companyIntro;
	private String companyDelete;
	private String commonCODE;
	
}
