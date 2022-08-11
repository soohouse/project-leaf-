package com.spring.leaf.archive.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ArchiveContentVO {

	private int archiveNo;
	private String archiveWriter;
	private String archiveTitle;
	private String archiveContent;
	private Timestamp archiveDate;
	private int archiveViews;
	private  int archiveFileNo;
	private String archiveFileRealname;
}
