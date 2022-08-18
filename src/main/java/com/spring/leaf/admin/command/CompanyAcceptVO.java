package com.spring.leaf.admin.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


// 가입 승인 대기중인 회원 VO : 2022-08-08 생성

@Getter
@Setter
@ToString
public class CompanyAcceptVO {
	
	private int companyNO;
	private String companyID;
	private String companyName;
	private String companyPhone;
	private String companyEmail;
	private String companyIntro;
	private String companyIntroRealname;
	private String commonValue;
		
}
