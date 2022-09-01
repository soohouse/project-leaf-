package com.spring.leaf.admin.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProjectDeleteListVO {

	private int projectNO;
	private String projectName;
	private String projectManager;
	private String projectRequireRole;
	private String projectRequireDate1;
	private String projectRequireDate2;
	private String projectDate;
	private String commonValue;
	
}
