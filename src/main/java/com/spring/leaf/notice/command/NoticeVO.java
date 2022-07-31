package com.spring.leaf.notice.command;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//notice VO : 2022-07-29 생성

@Getter
@Setter
@ToString
public class NoticeVO {
	
	private int noticeNo;
	private String noticeTitle;
	private String noticeWriter;
	private String noticeContent;
	private Timestamp noticeDate;
	private int noticeViews;
		
}
