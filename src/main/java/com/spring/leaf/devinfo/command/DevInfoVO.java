package com.spring.leaf.devinfo.command;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//2022-08-05 DevInfoVO(개발자 목록 모달) 생성
@ToString
@Setter
@Getter
public class DevInfoVO {
	private int userNO;
	private String userID;
	private String userName;
	private String userEmail1;
	private String userEmail2;
	private String userPhone1;
	private String userPhone2;
	private String userPhone3;
	private String userIntro;
	
	private int userProfileNO;
	private String userProfileFilename;
	private String userProfileUploadpath;
	private String userProfileRealname;
	
	private int resumeNO;
	private String resumeFilename;
	private String resumeUploadpath;
	private String resumeRealname;

}
