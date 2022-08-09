package com.spring.leaf.projectapply.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


// 프로젝트 지원 VO : 2022-08-06 생성

@Getter
@Setter
@ToString
public class ApplyVO {

	private int applyNO;
	private int userNO;
	private int projectNO;
	private Timestamp applyDate;
	private String applyMsg;
	private String commonCODE;
}
