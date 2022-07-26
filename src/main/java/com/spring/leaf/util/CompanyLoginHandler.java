package com.spring.leaf.util;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.spring.leaf.user.command.UserVO;


// 기업회원 권한 체크 핸들러 : 2022-07-28 생성

public class CompanyLoginHandler implements HandlerInterceptor {

	// 기업회원 권한이 필요한 페이지 요청이 들어올 때, 요청을 가로채 기업회원으로 로그인 여부를 확인할 인터셉터이다.
	// 권힌이 없다면 메인페이지로 보내버린다.
	
	// 컨트롤러로 요청이 들어가기 전에 요청을 가로채야 로그인 여부를 확인할 수 있으므로 preHandle로 선언한다.
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		// 관리자는 모든 요청을 허용한다.
		UserVO uvo = null;
		
		if(session.getAttribute("user") != null) {
			uvo = (UserVO) session.getAttribute("user");
			
			if(uvo.getCommonCODE().equals("ADM002")) {
				return true;
			}
		}
		
		if(session.getAttribute("company") == null) {		// "company" 세션이 있는지 없는지 확인, 없다면 로그인 안 한 것이다.
			response.setContentType("text/html; charset=utf-8");
			
			PrintWriter out = response.getWriter();
			out.print("<script>"
							+ "alert('기업회원만 이용 가능한 서비스입니다.');"
							+ "location.href='/'" 
					+ "</script>");
			out.flush();
			out.close();
			
			return false;		// false를 리턴하면 컨트롤러로 접근하는 것을 막는다.
		}
		
		return true;			// true로 리턴하면 컨트롤러로 접근한다. 즉 로그인 한 사람만 컨트롤러의 요청으로 정상적으로 접근
	}
}
