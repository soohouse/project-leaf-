package com.spring.leaf.util;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class Search2VO extends PageApplyVO{
	private String keyword;
	private String condition;
}
