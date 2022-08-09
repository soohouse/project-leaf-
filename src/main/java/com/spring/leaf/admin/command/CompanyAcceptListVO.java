package com.spring.leaf.admin.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


// 기업 회원 가입 승인 VO : 2022-08-08 생성

@Getter
@Setter
@ToString
public class CompanyAcceptListVO {

	private int companyNO;
	private String companyID;
	private String companyName;
	private String companyPhone;
	private String companyEmail;
	private String commonValue;
	
}
