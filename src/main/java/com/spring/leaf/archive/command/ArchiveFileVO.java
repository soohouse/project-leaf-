package com.spring.leaf.archive.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//ArchiveVO : 2022-08-01 생성

@Getter
@Setter
@ToString
public class ArchiveFileVO {
	
	
	private int archiveFileNo;
	private String archiveFileFilename;
	private String archiveFileUploadpath;
	private String archiveFileRealname;
	
	private int archiveNo;

	

}