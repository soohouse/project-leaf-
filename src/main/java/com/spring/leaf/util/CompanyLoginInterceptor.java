package com.spring.leaf.util;

import java.io.PrintWriter;
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

import com.spring.leaf.company.command.CompanyAutoLoginVO;
import com.spring.leaf.company.command.CompanyLogoVO;
import com.spring.leaf.company.command.CompanyVO;
import com.spring.leaf.company.service.ICompanyService;
import com.spring.leaf.user.command.AutoLoginVO;
import com.spring.leaf.user.command.UserVO;
import com.spring.leaf.util.CompanyLoginInterceptor;


// 기업회원 로그인 처리 인터셉터 : 2022-07-28 생성

public class CompanyLoginInterceptor implements HandlerInterceptor {
	
	// 로그 출력을 위한 Logger 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(CompanyLoginInterceptor.class);
	
	
	// 기업회원 서비스 연결
	@Autowired
	private ICompanyService service;
	
	
	// 컨트롤러에서 요청 처리 후 작동하는 postHandle 인터셉터
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		// PrintWriter객체를 사용해 알림창을 띄울 때 한글깨짐을 방지하는 부분
		response.setContentType("text/html; charset=UTF-8");

		logger.info("CompanyLoginInterceptor : 인터셉터 작동");

		// 로그인 세션을 저장하기 위한 세션 객체 생성
		HttpSession session = request.getSession();

		// 암호화된 비밀번호의 비교를 위해 BcryptPasswordEncoder 객체 생성
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

		// 컨트롤러에서 보낸 model들을 ModelMap으로 받아내어 변수에 저장
		ModelMap modelMap = modelAndView.getModelMap();
		CompanyVO vo = (CompanyVO) modelMap.get("companyLogin");
		String companyPW = (String) modelMap.get("companyPW");
		Boolean companyAutoCheck = (Boolean) modelMap.get("companyAutoCheck");

		
		// 만약 불러온 정보가 null이 아니라면, 즉 로그인 화면에서 입력한 아이디로 기업을 검색했을 때 null이 아니라면
		if(vo != null) {
			// 로그인 화면에서 입력한 비밀번호와 해당 사용자의 비밀번호가 일치한지 비교한다.
			if (encoder.matches(companyPW, vo.getCompanyPW())) {
				// 관리자가 기업 회원가입을 승인했는지 체크한다.
				if(vo.getCommonCODE().equals("CRG001")) {
					logger.info("CompanyLoginInterceptor : Login 실패 (관리자가 아직 가입을 승인하지 않음)");

					// class 파일에서 자바스크립트 경고창을 띄우기 위한 PrintWriter 사용
					PrintWriter writer = response.getWriter();
					writer.print("<script>" + "alert('가입 승인 대기중인 계정입니다. 관리자에게 문의하세요.');" + "location.replace('/');" + "</script>");
					writer.flush();
					writer.close();
				} else if(vo.getCommonCODE().equals("CRG003")) {
					logger.info("CompanyLoginInterceptor : Login 실패 (가입이 거절된 계정)");

					// class 파일에서 자바스크립트 경고창을 띄우기 위한 PrintWriter 사용
					PrintWriter writer = response.getWriter();
					writer.print("<script>" + "alert('가입이 거절된 계정입니다. 관리자에게 문의하세요.');" + "location.replace('/');" + "</script>");
					writer.flush();
					writer.close();
				} else {
					logger.info("CompanyLoginInterceptor : Login 성공");

					// 로그인에 성공한 후 기업 정보를 company 라는 세션에 담아 저장한다.
					session.setAttribute("company", vo);
					
					// 로그인 유지가 체크되어 있는 상황이라면
					if(companyAutoCheck != null) {
						logger.info("CompanyLoginInterceptor : 자동로그인 활성화");
						
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
						
						// 쿠키를 적용시킨 후 기업 데이터베이스에도 세션 ID와 쿠키 지속시간을 저장한다.
						CompanyAutoLoginVO cavo = new CompanyAutoLoginVO();
						cavo.setSessionID(session.getId());
						cavo.setSessionLimit(sessionLimit);
						cavo.setCompanyID(vo.getCompanyID());
						
						service.companyAutoLogin(cavo);
					}

					response.sendRedirect("/");
				}
			} else {
				logger.info("CompanyLoginInterceptor : Login 실패 (비밀번호가 일치하지 않음)");

				// class 파일에서 자바스크립트 경고창을 띄우기 위한 PrintWriter 사용
				PrintWriter writer = response.getWriter();
				writer.print("<script>" + "alert('아이디와 비밀번호를 확인해주세요.');" + "location.replace('/');" + "</script>");
				writer.flush();
				writer.close();
			}
		} else {
			logger.info("CompanyLoginInterceptor : Login 실패 (아이디와 비밀번호가 일치하는 데이터가 없음)");

			// class 파일에서 자바스크립트 경고창을 띄우기 위한 PrintWriter 사용
			PrintWriter writer = response.getWriter();
			writer.print("<script>" + "alert('아이디와 비밀번호를 확인해주세요.');" + "location.replace('/');" + "</script>");
			writer.flush();
			writer.close();
		}
	}
}
