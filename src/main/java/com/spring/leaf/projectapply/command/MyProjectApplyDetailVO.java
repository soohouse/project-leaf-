package com.spring.leaf.projectapply.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MyProjectApplyDetailVO {

	private int applyNO;
	private int userNO;
	private String userID;
	private String userName;
	private String userPhone;
	private String userEmail;
	private String userIntro;
	private String resumeRealname;
	private int projectNO;
	private String commonCODE;
	private String commonValue;
	private String applyMsg;
	
}
