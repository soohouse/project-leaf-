package com.spring.leaf.util;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/* 검색기능 */
@Getter
@Setter
@ToString
public class SearchVO extends PageVO {
	
	private String keyword;
	private String condition;
	
}
