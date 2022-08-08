package com.spring.leaf.archivereply.command;

import lombok.ToString;

import lombok.Setter;

import java.sql.Timestamp;

import lombok.Getter;

//ArchiveReply VO : 2022-08-01 생성

@Getter
@Setter
@ToString
public class ArchiveReplyVO {
	
	private int archiveReplyNo;
	private String archiveReplyWriter;
	private String archiveReplyContent;
	private Timestamp archiveReplyDate;
	private int archiveNo;

}
