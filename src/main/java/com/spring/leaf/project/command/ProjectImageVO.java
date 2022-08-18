package com.spring.leaf.project.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


// 프로젝트 이미지 VO : 2022-08-01 생성

@Getter
@Setter
@ToString
public class ProjectImageVO {

	private int projectImageNO;
	private String projectImageFilename;
	private String projectImageUploadpath;
	private String projectImageRealname;
	private int projectNO;
}
