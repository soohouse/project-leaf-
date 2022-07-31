package com.spring.leaf.qna.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//Question VO : 2022-07-30 생성

@Getter
@Setter
@ToString
public class QuestionVO {
	
	private int queNo;
	private String queTitle;
	private String queWriter;
	private String queContent;
	private Timestamp queDate;
	private int queViews;

}
