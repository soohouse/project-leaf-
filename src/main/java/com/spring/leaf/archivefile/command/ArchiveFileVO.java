package com.spring.leaf.archivefile.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//ArchiveVO : 2022-08-01 생성

@Getter
@Setter
@ToString
public class ArchiveFileVO {
	
	
	private int archiveFileNo;
	private String archiveFileName;
	private String archiveFileUploadpath;
	private String archiveFileRealname;

	

}