package com.spring.leaf.user.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


// 이력서 VO : 2022-08-04 생성

@Getter
@Setter
@ToString
public class ResumeVO {

	private int resumeNO;
	private String resumeFilename;
	private String resumeUploadpath;
	private String resumeRealname;
	private int userNO;
	
}
