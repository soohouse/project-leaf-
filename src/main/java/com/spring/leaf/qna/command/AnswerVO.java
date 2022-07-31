package com.spring.leaf.qna.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//Answer VO : 2022-07-30 생성

@Getter
@Setter
@ToString
public class AnswerVO {
	
	private int ansNo;
	private String ansTitle;
	private String ansWriter;
	private String ansContent;
	private Timestamp ansDate;
	private int ansViews;

}
