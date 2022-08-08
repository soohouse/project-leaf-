package com.spring.leaf.company.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

// 회사 소개서 VO : 2022-08-05 생성

@Getter
@Setter
@ToString
public class CompanyIntroVO {

	private int companyIntroNO;
	private String companyIntroFilename;
	private String companyIntroUploadpath;
	private String companyIntroRealname;
	private int companyNO;
	
}
