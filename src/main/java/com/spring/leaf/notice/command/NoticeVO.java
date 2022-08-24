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
	
	private int noticeNo; //공지사항 번호
	private String noticeTitle; //공지사항 제목
	private String noticeWriter; //공지사항 작성자
	private String noticeContent; //공지사항 내용
	private Timestamp noticeDate; //공지사항 날짜
	private int noticeViews;  //공지사항 조회수
	
	private int rn;//글번호
	
}
