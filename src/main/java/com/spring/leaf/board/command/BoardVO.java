package com.spring.leaf.board.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//Free VO : 2022-07-30 생성

@Getter
@Setter
@ToString
public class BoardVO {

	private int boardNo;
	private String boardTitle;
	private String boardWriter;
	private String boardContent;
	private Timestamp boardDate;
	private int boardViews;
	
	private int boardReplyCount; //join으로 추가 (댓글수)
	private int rn;//글번호
	
}
