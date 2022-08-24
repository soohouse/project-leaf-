package com.spring.leaf.projectapply.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProjectPassListVO {

	private int applyNum;
	private int userNO;
	private String userID;
	private String userName;
	private Timestamp applyDate;
	private String commonCODE;
	private String commonValue;
	
}
