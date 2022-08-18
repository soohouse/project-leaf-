package com.spring.leaf.boardreply.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardReplyListVO {

	private int boardReplyNum;
	private int boardReplyNo;
	private String boardReplyWriter; 
	private String boardReplyContent; 
	private Timestamp boardReplyDate;
	private int boardNo;
	
}
