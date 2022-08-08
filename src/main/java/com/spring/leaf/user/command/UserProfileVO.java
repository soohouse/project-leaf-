package com.spring.leaf.user.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


// 일반회원 프로필 VO : 2022-07-31 생성

@Getter
@Setter
@ToString
public class UserProfileVO {

	private int userProfileNO;  
	private String userProfileFilename;
	private String userProfileUploadpath;
	private String userProfileRealname;
	private int userNO;
	
}
