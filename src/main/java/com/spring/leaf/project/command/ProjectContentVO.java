package com.spring.leaf.project.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


// 프로젝트 상세보기 VO : 2022-08-04 생성

@Getter
@Setter
@ToString
public class ProjectContentVO {

	private int projectNO;
	private String projectName;
	private String projectDesc;
	private String projectManager;
	private String projectManagerPhone;
	private String projectManagerEmail;
	private String projectRequireLicense;
	private String projectRequireRole;
	private String projectRequirePeople;
	private String projectRequireDate1;
	private String projectRequireDate2;
	private int projectViews;
	private int companyNO;
	private String companyName;
	private String companyPhone1;
	private String companyPhone2;
	private String companyPhone3;
	private String companyAddress1;
	private String companyAddress2;
	private String companyAddress3;
	private String commonCODE;
	private String commonValue;
}
