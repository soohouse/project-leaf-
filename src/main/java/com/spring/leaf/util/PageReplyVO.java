package com.spring.leaf.util;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/* 페이징 */
@Getter
@Setter
@ToString
public class PageReplyVO {
	
	private int pageNum; //사용자가 선택한 페이지 번호
	private int cpp; //사용자가 선택한 화면에 보여질 게시물 개수
	
	public PageReplyVO() {
		this.pageNum = 1;
		this.cpp = 10; //한 페이지에 cpp개의 게시물을 보여준다.
	}
	
}
