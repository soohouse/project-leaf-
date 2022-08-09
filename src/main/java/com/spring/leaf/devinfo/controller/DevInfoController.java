package com.spring.leaf.devinfo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.leaf.devinfo.command.DevInfoVO;
import com.spring.leaf.devinfo.mapper.IDevInfoMapper;
import com.spring.leaf.devinfo.service.IDevInfoService;
import com.spring.leaf.userlist.command.UserListVO;

@Controller
@RequestMapping("/userList")
public class DevInfoController {

	@Autowired
	private IDevInfoService service; 
	
	// 일반회원 목록 상세보기
	@GetMapping("/userListContent")
	@ResponseBody
	public DevInfoVO userListContent(Model model, @PathVariable int userNO) {
		return service.userListContent(userNO);
	}
}




