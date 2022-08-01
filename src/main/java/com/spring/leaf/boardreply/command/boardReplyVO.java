package com.spring.leaf.boardreply.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

//reply VO : 2022-08-01 생성

@Getter
@Setter
@ToString
public class boardReplyVO {
	
	private int boardReplyNo;
	private String boardReplyWriter;
	private String boardReplyContent;
	private Timestamp boardReplyDate;

}
