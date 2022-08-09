package com.spring.leaf.userlist.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class UserListDetailVO {
	private int userNO;
	private String userID;
	private String userName;
	private String userEmail;
	private String userPhone;
	private String userIntro;
	
		
	private int resumeNO;
	private String resumeFilename;
	private String resumeUploadpath;
	private String resumeRealname;
}
