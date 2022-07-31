package com.spring.leaf.util;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.spring.leaf.user.command.UserVO;
import com.spring.leaf.util.UserLoginInterceptor;


// 일반회원 로그인 처리 인터셉터 : 2022-07-28 생성

public class UserLoginInterceptor implements HandlerInterceptor {
	
	// 로그 출력을 위한 Logger 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(UserLoginInterceptor.class);
	
	
	// 컨트롤러에서 요청 처리 후 작동하는 postHandle 인터셉터
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
		//ProfileVO pvo = (ProfileVO) modelMap.get("profile");
		String userPW = (String) modelMap.get("userPW");

		
		// 만약 불러온 정보가 null이 아니라면, 즉 로그인 화면에서 입력한 아이디로 사용자를 검색했을 때 null이 아니라면
		if (vo != null) {
			// 로그인 화면에서 입력한 비밀번호와 해당 사용자의 비밀번호가 일치한지 비교한다.
			if (encoder.matches(userPW, vo.getUserPW())) {
				logger.info("UserLoginInterceptor : Login 성공");

				// 로그인에 성공한 후 사용자 정보를 user 라는 세션에 담아 저장한다.
				session.setAttribute("user", vo);
				// 로그인에 성공한 후 사용자의 프로필 사진 정보를 profile 이라는 세션에 담아 저장한다.
				//session.setAttribute("profile", pvo);

				response.sendRedirect("/");

			} else {
				logger.info("UserLoginInterceptor : Login 실패 (비밀번호가 일치하지 않음)");

				// class 파일에서 자바스크립트 경고창을 띄우기 위한 PrintWriter 사용
				PrintWriter writer = response.getWriter();
				writer.print("<script>" + "alert('아이디와 비밀번호를 확인해주세요.');" + "history.back();" + "</script>");
				writer.flush();
				writer.close();
			}
		} else {
			logger.info("UserLoginInterceptor : Login 실패 (아이디와 비밀번호가 일치하는 데이터가 없음)");

			// class 파일에서 자바스크립트 경고창을 띄우기 위한 PrintWriter 사용
			PrintWriter writer = response.getWriter();
			writer.print("<script>" + "alert('아이디와 비밀번호를 확인해주세요.');" + "history.back();" + "</script>");
			writer.flush();
			writer.close();
		}
	}
}
