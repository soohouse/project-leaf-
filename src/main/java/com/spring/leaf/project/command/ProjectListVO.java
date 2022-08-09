package com.spring.leaf.project.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProjectListVO {
	private int projectNO;
	private String projectName;
	private String projectRequireLicense;
	private String projectRequireDate1;
	private String projectRequireDate2;
	private int companyNO;
	private String companyName;
	private String commonCODE;
	private String commonValue;
}
