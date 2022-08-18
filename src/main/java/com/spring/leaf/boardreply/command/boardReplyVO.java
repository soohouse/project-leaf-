package com.spring.leaf.boardreply.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.ToString;
import lombok.Setter;

//reply VO : 2022-08-01 생성

@Getter
@Setter
@ToString
public class BoardReplyVO {
	
	private int boardReplyNo; //자유게시판 댓글 번호
	private String boardReplyWriter; //자유게시판 댓글 작성자
	private String boardReplyContent; //자유게시판  댓글 내용
	private Timestamp boardReplyDate; //자유게시판 댓글 날짜
	private int boardNo; //자유게시판 번호
	
	
}