package com.spring.leaf.home.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MiniBoardVO {

	private int miniBoardNum;
	private int miniBoardNO;
	private String miniBoardTitle;
	private Timestamp miniBoardDate;
	
}
