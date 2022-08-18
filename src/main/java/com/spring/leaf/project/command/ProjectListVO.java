package com.spring.leaf.project.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProjectListVO {
	private int projectNO;
	private String projectName;
	private String projectRequireRole;
	private Timestamp projectRequireDate1;
	private Timestamp projectRequireDate2;
	private int companyNO;
	private String companyName;
	private String commonCODE;
	private String commonValue;
}
