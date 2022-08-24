package com.spring.leaf.archivereply.command;

import lombok.ToString;

import lombok.Setter;

import java.sql.Timestamp;

import lombok.Getter;

//ArchiveReplyList VO : 2022-08-18 생성

@Getter
@Setter
@ToString
public class ArchiveReplyListVO {
	
	private int archiveReplyNum; //자료실 댓글 Num
	private int archiveReplyNo;
	private String archiveReplyWriter;
	private String archiveReplyContent;
	private Timestamp archiveReplyDate;
	private int archiveNo;
	
	private int userNo;
	private String userID;
	private int companyNo;
	private String companyID;

}
