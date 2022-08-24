package com.spring.leaf.home.command;

import lombok.ToString;

import lombok.Setter;

import java.sql.Timestamp;

import lombok.Getter;

@Getter
@Setter
@ToString
public class MiniNoticeVO {

	private int miniNoticeNum;
	private int miniNoticeNO;
	private String miniNoticeTitle;
	private Timestamp miniNoticeDate;
	
}
