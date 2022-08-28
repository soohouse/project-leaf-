package com.spring.leaf.util;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class PageApplyVO {

	private int pageNum; //사용자가 선택한 페이지 번호
	private int cpp; //사용자가 선택한 화면에 보여질 게시물 개수
	
	private int skip;
	
	//검색기능
	private String keyword; //검색한단어
	private String condition; //드롭박스 내용
	
	public PageApplyVO() {
		this.pageNum = 1;
		this.cpp = 5; //한 페이지에 cpp개의 게시물을 보여준다.
		this.skip=0;
	}
	
	public PageApplyVO(int pageNum, int cpp) {
		this.pageNum = pageNum;
		this.cpp = cpp;
	}
	
	public int getSkip() {
		return (this.pageNum-1) * cpp;
	}

	

}
