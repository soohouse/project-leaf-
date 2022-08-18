package com.spring.leaf.userapply.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class UserApplyStatusVO {
	private int applyNO;
	private String projectName;
	private String projectRequireRole;
	private Timestamp projectRequireDate1;
	private Timestamp projectRequireDate2;
	private int projectNO;
	private String companyName;
	private String commonValue;
}
