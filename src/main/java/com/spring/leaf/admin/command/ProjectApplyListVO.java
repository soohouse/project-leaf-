package com.spring.leaf.admin.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProjectApplyListVO {

	private String projectName;
	private String projectRequireRole;
	private String projectRequireDate1;
	private String projectRequireDate2;
	private String commonValue;
	private int applyCount;
	
}
