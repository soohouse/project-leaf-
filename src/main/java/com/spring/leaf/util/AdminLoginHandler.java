package com.spring.leaf.util;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.spring.leaf.user.command.UserVO;

public class AdminLoginHandler implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		UserVO vo = (UserVO) session.getAttribute("user");
		
		if(vo.getCommonCODE().equals("ADM001")) {		// 로그인 한 상태인지 확인
			response.setContentType("text/html; charset=utf-8");
			
			PrintWriter out = response.getWriter();
			out.print("<script>"
							+ "alert('관리자만 이용 가능한 서비스입니다.');"
							+ "location.href='/'" 
					+ "</script>");
			out.flush();
			out.close();
			
			return false;		// false를 리턴하면 컨트롤러로 접근하는 것을 막는다.
		}
		
		return true;			// true로 리턴하면 컨트롤러로 접근한다. 즉 로그인 한 사람만 컨트롤러의 요청으로 정상적으로 접근
	}
	
}
