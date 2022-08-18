package com.spring.leaf.util;

import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.spring.leaf.user.command.AutoLoginVO;
import com.spring.leaf.user.command.UserVO;
import com.spring.leaf.user.service.IUserService;
import com.spring.leaf.util.UserLoginInterceptor;


// 일반회원 로그인 처리 인터셉터 : 2022-07-28 생성

public class UserLoginInterceptor implements HandlerInterceptor {
	
	// 로그 출력을 위한 Logger 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(UserLoginInterceptor.class);
	
	
	// 일반회원 유저 서비스 연결
	@Autowired
	private IUserService service;
	
	
	// 컨트롤러에서 요청 처리 후 작동하는 postHandle 인터셉터 (로그인 요청 후)
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		// PrintWriter객체를 사용해 알림창을 띄울 때 한글깨짐을 방지하는 부분
		response.setContentType("text/html; charset=UTF-8");

		logger.info("UserLoginInterceptor : 인터셉터 작동");

		// 로그인 세션을 저장하기 위한 세션 객체 생성
		HttpSession session = request.getSession();

		// 암호화된 비밀번호의 비교를 위해 BcryptPasswordEncoder 객체 생성
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		// 컨트롤러에서 보낸 model들을 ModelMap으로 받아내어 변수에 저장
		ModelMap modelMap = modelAndView.getModelMap();
		UserVO vo = (UserVO) modelMap.get("userLogin");
		String userPW = (String) modelMap.get("userPW");
		Boolean autoCheck = (Boolean) modelMap.get("autoCheck");
		
		
		// 만약 불러온 정보가 null이 아니라면, 즉 로그인 화면에서 입력한 아이디로 사용자를 검색했을 때 null이 아니라면
		if(vo != null) {
			// 로그인 화면에서 입력한 비밀번호와 해당 사용자의 비밀번호가 일치한지 비교한다.
			if(encoder.matches(userPW, vo.getUserPW())) {
				
				logger.info("UserLoginInterceptor : Login 성공");

				// 로그인에 성공한 후 사용자 정보를 user 라는 세션에 담아 저장한다.
				session.setAttribute("user", vo);
				
				// 로그인 유지가 체크되어 있는 상황이라면
				if(autoCheck != null) {
					logger.info("UserLoginInterceptor : 자동로그인 활성화");
					
					// 로그인 될 때 생성된 해당 클라이언트의 고유 세션 ID를 쿠키에 저장한다.
					Cookie loginCookie = new Cookie("loginCookie", session.getId());
					// 쿠키를 찾을 경로를 Context 경로로 설정해줘서 모든 경로에서 쿠키를 찾을 수 있도록 설정한다.
					loginCookie.setPath("/");
					
					// 쿠키의 지속시간을 7일로 설정한다. 
					int amount = 60 * 60 * 24 * 7;
					loginCookie.setMaxAge(amount);
					
					// 마지막으로 쿠키를 적용시킨다.
					response.addCookie(loginCookie);
					
					// 쿠키 지속시간을 Timestamp 형식으로 변환한다.
					Timestamp sessionLimit = new Timestamp(System.currentTimeMillis() + (1000 * amount));
					
					// 쿠키를 적용시킨 후 사용자 데이터베이스에도 세션 ID와 쿠키 지속시간을 저장한다.
					AutoLoginVO avo = new AutoLoginVO();
					avo.setSessionID(session.getId());
					avo.setSessionLimit(sessionLimit);
					avo.setUserID(vo.getUserID());
					
					service.userAutoLogin(avo);
				}

				response.sendRedirect("/");

			} else {
				logger.info("UserLoginInterceptor : Login 실패 (비밀번호가 일치하지 않음)");

				// class 파일에서 자바스크립트 경고창을 띄우기 위한 PrintWriter 사용
				PrintWriter writer = response.getWriter();
				writer.print("<script>" + "alert('아이디와 비밀번호를 확인해주세요.');" + "location.replace('/');" + "</script>");
				writer.flush();
				writer.close();
			}
		} else {
			logger.info("UserLoginInterceptor : Login 실패 (아이디와 비밀번호가 일치하는 데이터가 없음)");

			// class 파일에서 자바스크립트 경고창을 띄우기 위한 PrintWriter 사용
			PrintWriter writer = response.getWriter();
			writer.print("<script>" + "alert('아이디와 비밀번호를 확인해주세요.');" + "location.replace('/');" + "</script>");
			writer.flush();
			writer.close();
		}
	}
}
