package com.spring.leaf.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.spring.leaf.user.command.UserVO;


@Component
public class SocketHandler extends TextWebSocketHandler {

	
	// 웹소켓 세션을 담아둘 리스트 선언
	List<HashMap<String, Object>> roomListSessions = new ArrayList<>();
	

	// 메세지 발송 메소드
	@SuppressWarnings("unchecked")
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		String url = session.getUri().toString();
		
		String roomNO2 = url.split("/chat/")[1];
		
		int idx = 0;
		
		// 방 크기를 조사한다.
		if(roomListSessions.size() > 0) {
			
			for(int i = 0; i < roomListSessions.size(); i++) {
				String rn = (String) roomListSessions.get(i).get("roomNO");
				
				if(rn.equals(roomNO2)) {
					idx = i;
					break;
				}
			}
		
		}
		
		// JSON 형태의 String 메세지를 받은 후 JSON 데이터를 JSONObject로 파싱한다.
		String msg = message.getPayload();
		JSONObject obj = jsonToObjectParser(msg);
		obj.put("sessionCount", roomListSessions.get(idx).size() - 1);
		
		// 방의 번호를 찾고 메세지의 타입을 파악한다.
		String rn = (String) obj.get("roomNO");
		HashMap<String, Object> temp = new HashMap<String, Object>();
		
		
		if(roomListSessions.size() > 0) {
			
			for(int i = 0; i < roomListSessions.size(); i++) {
				
				// 세션 리스트에 저장된 방 번호 값을 가져온다.
				String roomNO = (String) roomListSessions.get(i).get("roomNO");
				
				// 만약 같은 값의 방이 존재하면
				if(roomNO.equals(rn)) {
					// 해당 방 번호의 세션리스트에 존재하는 모든 object 값을 가져온다.
					temp = roomListSessions.get(i);
					break;
				}
			}
			
			
			// 해당 방의 세션들만 찾아서 메세지를 발송한다.
			for(String k : temp.keySet()) {
				
				// 만약 방 번호랑 일치할 경우에는 건너뛴다.
				if(k.equals("roomNO")) {
					continue;
				}
				
				WebSocketSession wss = (WebSocketSession) temp.get(k);
				
				if(wss != null) {	
					try {
						wss.sendMessage(new TextMessage(obj.toJSONString()));
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
				
			}
		}
	}
	
	
	// 소켓 연결
	@SuppressWarnings("unchecked")
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		
		boolean flag = false;
		
		String url = session.getUri().toString();
		
		String roomNO = url.split("/chat/")[1];
		
		int idx = roomListSessions.size();
		
		// 방 크기를 조사한다.
		if(roomListSessions.size() > 0) {
			
			for(int i = 0; i < roomListSessions.size(); i++) {
				String rn = (String) roomListSessions.get(i).get("roomNO");
				
				if(rn.equals(roomNO)) {
					flag = true;
					idx = i;
					break;
				}
			}
		
		}
		
		// 존재하는 방이라면 세션만 추가한다.
		if(flag) {
			HashMap<String, Object> map = roomListSessions.get(idx);
			map.put(session.getId(), session);
		} else {		// 최초 생성하는 방이라면 방 번호와 세션을 추가한다.
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("roomNO", roomNO);
			map.put(session.getId(), session);
			
			roomListSessions.add(map);
		}
		
		// 세션 등록을 마치면 발급받은 세션 ID 값의 메세지를 발송한다.
		JSONObject obj = new JSONObject();
		obj.put("type", "getId");
		obj.put("sessionId", session.getId());
		obj.put("sessionCount", roomListSessions.get(idx).size() - 1);
		session.sendMessage(new TextMessage(obj.toJSONString()));
	}
	
	
	// 소켓 종료
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// 소켓이 종료되면 해당 세션값들을 찾아서 지운다.
		if(roomListSessions.size() > 0) {
			for(int i = 0; i < roomListSessions.size(); i++) {
				//System.out.println(roomListSessions.get(i).get(session.getId()));
				roomListSessions.get(i).remove(session.getId());
			}
		} 
		
		super.afterConnectionClosed(session, status);
	}
	
	
	private static JSONObject jsonToObjectParser(String jsonStr) {
		JSONParser parser = new JSONParser();
		JSONObject obj = null;
		try {
			obj = (JSONObject) parser.parse(jsonStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return obj;
	}
	
}
