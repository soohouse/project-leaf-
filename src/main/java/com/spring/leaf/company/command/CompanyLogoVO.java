package com.spring.leaf.company.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


// 기업회원 로고 VO : 2022-08-01 생성

@Getter
@Setter
@ToString
public class CompanyLogoVO {

	private int companyLogoNO;
	private String companyLogoFilename;
	private String companyLogoUploadpath;
	private String companyLogoRealname;
	private int companyNO;
	
}
