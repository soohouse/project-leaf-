package com.spring.leaf.archive.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//data VO : 2022-08-01 생성

@Getter
@Setter
@ToString
public class ArchiveVO {
	
	private int archiveNo;
	private String archiveTitle;
	private String archiveWriter;
	private String archiveContent;
	private Timestamp archiveDate;
	private int archiveViews;

}
