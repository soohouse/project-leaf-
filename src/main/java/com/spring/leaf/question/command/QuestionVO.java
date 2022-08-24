package com.spring.leaf.question.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//Question VO : 2022-07-30 생성

@Getter
@Setter
@ToString
public class QuestionVO {
	
	private int questionNo;
	private String questionTitle;
	private String questionWriter;
	private String questionContent;
	private Timestamp questionDate;
	private int questionViews;
	
	private int answerCount;
	private int rn;//글번호

}
