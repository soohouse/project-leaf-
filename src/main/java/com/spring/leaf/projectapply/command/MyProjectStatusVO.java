package com.spring.leaf.projectapply.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MyProjectStatusVO {

	private int projectNO;
	private String projectName;
	private String projectRequireRole;
	private Timestamp projectRequireDate1;
	private Timestamp projectRequireDate2;
	private String companyName;
	private int applyCount;

}
