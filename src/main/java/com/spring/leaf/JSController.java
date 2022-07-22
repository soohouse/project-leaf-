package com.spring.leaf;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class JSController {

	@GetMapping("/notice_list")
	public String notice_list() {
		return "/board/notice_list";
	}
	
	@GetMapping("/notice_write")
	public String notice_write() {
		return "/board/notice_write";
	}
	
	@GetMapping("/notice_content")
	public String notice_content() {
		return "/board/notice_content";
	}
	
	@GetMapping("/notice_modify")
	public String notice_modify() {
		return "/board/notice_modify";
	}
	
}

