package com.spring.leaf.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.leaf.chat.command.ChatRoomVO;
import com.spring.leaf.company.command.CompanyVO;
import com.spring.leaf.user.command.UserVO;


@Controller
@RequestMapping("/chat")
public class ChatController {

	List<ChatRoomVO> roomList = new ArrayList<ChatRoomVO>();
	static int roomNO = 0;
	
	
	// 채팅 메인 화면
	@GetMapping("/chatMain")
	public String chatMain() {
		
		return "/popup/popup-chat-main";
	}
	
	
	// 채팅창
	@GetMapping("/chatPage")
	public String chatPage() {
		
		return "/popup/popup-chat";
	}
	
	
	// 방 만들기
	@PostMapping("/chatCreateRoom")
	@ResponseBody
	public List<ChatRoomVO> chatCreateRoom(@RequestParam HashMap<Object, Object> params, HttpSession session) {
		
		String roomName = (String) params.get("roomName");
		
		if(roomName != null && !roomName.trim().equals("")) {
			ChatRoomVO vo = new ChatRoomVO();
			vo.setRoomNumber(++roomNO);
			vo.setRoomName(roomName);
			
			if(session.getAttribute("user") != null) {
				UserVO uvo = (UserVO) session.getAttribute("user");
				
				if(uvo.getUserID().equals("admin")) {
					vo.setRoomOwner("관리자");
				} else {
					vo.setRoomOwner(uvo.getUserID());
				}
			} 
			
			if(session.getAttribute("company") != null) {
				CompanyVO cvo = (CompanyVO) session.getAttribute("company");
				vo.setRoomOwner(cvo.getCompanyName() + "ⓒ");
			}
			
			roomList.add(vo);
		}
		
		return roomList;
	}
	
	
	// 방 얻어오기
	@PostMapping("/chatRoomList")
	@ResponseBody
	public List<ChatRoomVO> chatRoomList(@RequestParam HashMap<Object, Object> params) {
		
		return roomList;
	}
	
	
	@GetMapping("/chatMove")
	public ModelAndView chatMove(@RequestParam HashMap<Object, Object> params) {
		
		ModelAndView mv = new ModelAndView();
		int roomNO = Integer.parseInt((String) params.get("roomNO"));
		
		List<ChatRoomVO> new_list = roomList.stream().filter(o->o.getRoomNumber()==roomNO).collect(Collectors.toList());
		
		if(new_list != null && new_list.size() > 0) {
			mv.addObject("roomName", params.get("roomName"));
			mv.addObject("roomNO", params.get("roomNO"));
			mv.setViewName("/popup/popup-chat");
		} else {
			mv.setViewName("/popup/popup-chat-main");
		}
		
		return mv;
	}
	
	
	
}