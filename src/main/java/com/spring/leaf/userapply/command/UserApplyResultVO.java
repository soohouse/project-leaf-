package com.spring.leaf.userapply.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class UserApplyResultVO {
	private int applyNO;
	private String projectName;
	private Timestamp applyDate;
	private Timestamp projectRequireDate1;
	private Timestamp projectRequireDate2;
	private String commonValue;
	
	private int rn;//글번호
}
