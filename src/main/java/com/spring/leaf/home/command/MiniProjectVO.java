package com.spring.leaf.home.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MiniProjectVO {

	private int miniProjectNum;
	private int miniProjectNO;
	private String miniProjectName;
	private String miniCompanyName;
	private Timestamp miniProjectDate1;
	private Timestamp miniProjectDate2;
	
}
