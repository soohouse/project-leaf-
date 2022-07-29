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
	
	@GetMapping("/qa_list")
	public String qa_list() {
		return "/board/qa_list";
	}
	
	@GetMapping("/qa_write")
	public String qa_write() {
		return "/board/qa_write";
	}
	
	@GetMapping("/qa_content")
	public String qa_content() {
		return "/board/qa_content";
	}

	@GetMapping("/qa_modify")
	public String qa_modify() {
		return "/board/qa_modify";
	}
	
	@GetMapping("/free_list")
	public String free_list() {
		return "/board/free_list";
	}
	
	@GetMapping("/free_write")
	public String free_write() {
		return "/board/free_write";
	}
	
	@GetMapping("/free_content")
	public String free_content() {
		return "/board/free_content";
	}

	@GetMapping("/free_modify")
	public String free_modify() {
		return "/board/free_modify";
	}
	
	@GetMapping("/data_list")
	public String data_list() {
		return "/board/data_list";
	}
	
	@GetMapping("/data_write")
	public String data_write() {
		return "/board/data_write";
	}
	
	@GetMapping("/data_content")
	public String data_content() {
		return "/board/data_content";
	}

	@GetMapping("/data_modify")
	public String data_modify() {
		return "/board/data_modify";
	}
	
	@GetMapping("/dev_list")
	public String dev_list() {
		return "/board/dev_list";
	}
	
	@GetMapping("/support_result_check")
	public String support_result_check() {
		return "/board/support_result_check";
	}
	
	
}

