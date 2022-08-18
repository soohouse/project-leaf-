package com.spring.leaf.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.spring.leaf.company.command.CompanyVO;
import com.spring.leaf.company.service.ICompanyService;
import com.spring.leaf.user.command.UserVO;
import com.spring.leaf.user.service.IUserService;


// 자동로그인 처리 인터셉터 : 2022-08-16 생성

public class AutoLoginInterceptor implements HandlerInterceptor {

	// 로그 출력을 위한 Logger 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(AutoLoginInterceptor.class);
	
	
	// 일반회원 유저 서비스 연결
	@Autowired
	private IUserService uservice;
	
	
	// 기업회원 서비스 연결
	@Autowired
	private ICompanyService cservice;
	
	
	// 컨트롤러에서 요청 처리 후 작동하는 postHandle 인터셉터 (메인화면 컨트롤러 요청 후)
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		// 세션 객체를 가져온다.
		HttpSession session = request.getSession();
		
		Object obj = null;
		
		// 메인화면으로 이동하기 전 로그인 세션을 가져온다.
		if(session.getAttribute("user") != null) {
			obj = session.getAttribute("user");
		} else if(session.getAttribute("company") != null) {
			obj = session.getAttribute("company");
		} else {
			// 로그인 세션이 없다면 null로 남긴다.
			obj = null;
		}
		
		// 로그인 된 세션이 없다면
		if(obj == null) {		
			// 자동로그인 할 때 생성했던 쿠키를 가져온다.
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			// 자동로그인 체크를 했었다면 쿠키가 남아있게 된다.
			// 쿠키가 존재할 경우
			if(loginCookie != null) {
				// 쿠키에 존재하는 세션 ID를 가져온다.
				String sessionID = loginCookie.getValue();
				
				// 일반회원이라면 세션 ID를 이용해서 자동로그인을 활성화했던 사용자의 정보를 가져온다.
				UserVO uvo = uservice.userAutoGet(sessionID);
				
				// 기업회원이라면 세션 ID를 이용해서 자동로그인을 활성화했던 기업의 정보를 가져온다.
				CompanyVO cvo = cservice.companyAutoGet(sessionID);
				
				// 세션 ID로 사용자의 정보를 잘 가져온 후
				if(uvo != null) {
					// 가져온 정보가 일반회원 정보라면
					// 해당 세션 ID의 일반회원 정보를 user 세션에 담은 후 메인화면으로 이동한다.
 					session.setAttribute("user", uvo);
				} else {
					// 가져온 정보가 기업회원 정보라면
					// 해당 세션 ID의 기업회원 정보를 company 세션에 담은 후 메인화면으로 이동한다.
					session.setAttribute("company", cvo);
				}
			}
		}
		
	}
}
