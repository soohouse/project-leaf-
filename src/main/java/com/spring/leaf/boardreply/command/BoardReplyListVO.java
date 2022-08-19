package com.spring.leaf.boardreply.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//

@Getter
@Setter
@ToString
public class BoardReplyListVO {

	private int boardReplyNum; //자유게시판 댓글 Num
	private int boardReplyNo; //자유게시판 댓글 번호
	private String boardReplyWriter; //자유게시판 댓글 작성자
	private String boardReplyContent; //자유게시판 댓글 내용
	private Timestamp boardReplyDate; //자유게시판 댓글 날짜
	private int boardNo; //자유게시판 번호
	
}
