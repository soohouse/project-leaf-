package com.spring.leaf.question.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//Answer VO : 2022-07-30 생성

@Getter
@Setter
@ToString
public class AnswerVO {
	
	private int answerNo;
	private String answerTitle;
	private String answerWriter;
	private String answerContent;
	private Timestamp answerDate;
	private int answerViews;
	
	private int questionNo;
	

}
