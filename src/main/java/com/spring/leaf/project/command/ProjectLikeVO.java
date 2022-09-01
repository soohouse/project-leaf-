package com.spring.leaf.project.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


// 프로젝트 좋아요 VO : 2022-08-01 생성

@Getter
@Setter
@ToString
public class ProjectLikeVO {

	private int projectLikeNO;
	private int projectNO;
	private int userNO;
	private int companyNO;
}
