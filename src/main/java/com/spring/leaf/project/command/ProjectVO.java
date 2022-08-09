package com.spring.leaf.project.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


// 프로젝트 VO : 2022-08-01 생성

@Getter
@Setter
@ToString
public class ProjectVO {

	private int projectNO;
	private String projectName;
	private Timestamp projectDate;
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
	private String commonCODE;
}
