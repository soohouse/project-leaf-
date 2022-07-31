package com.spring.leaf.util;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;


// 회원 이메일 인증 서비스 : 2022-07-28 생성

@Service
public class MailService {

	
	// JavaMailSender 사용을 위한 선언
	@Autowired
	private JavaMailSender mailSender;
	
	
	// 인증번호 변수 선언
	private int authCODE;
	
	
	// 랜덤 6자리 숫자 생성 메소드 선언
	public void makeRandomNumber() {
		// 랜덤 숫자의 범위 : 111111 ~ 999999, 숫자 6자로 랜덤으로 만들어서 제공
		Random r = new Random();

		int checkNum = r.nextInt(888888) + 111111; // 범위 설정, 111111 에서 999999까지
		System.out.println("인증번호 : " + checkNum);

		authCODE = checkNum;
	}
	
	
	// 이메일 전송 양식 설정 메소드
	public String joinEmail(String email) {

		makeRandomNumber(); // 인증번호 랜덤 생성 메소드 호출

		String setFrom = "runwith2022@naver.com"; // 발신자, email-config에 설정한 이메일 주소
		String toMail = email; // 수신받을 이메일
		String title = "RunWith 인증번호 요청입니다."; // 이메일 제목
		String content = "회원가입을 환영합니다." + "<br><br>" + "인증 번호는   '" + authCODE + "'   입니다." + "<br>"
				+ "해당 인증 번호를 인증번호 확인란에 기입해주세요."; // 이메일 내용

		mailSend(setFrom, toMail, title, content);

		return Integer.toString(authCODE); // 정수를 문자열로 변경해서 리턴
	}
	
	
	// 이메일 전송 메소드 선언
	public void mailSend(String setFrom, String toMail, String title, String content) {

		try {

			// SimpleMailMessage도 가능하지만 텍스트만 가능하다. MimeMessage는 이미지도 가능하기 때문에 MimeMessage가 더
			// 많이 사용된다.
			MimeMessage message = mailSender.createMimeMessage();

			// 기타 설정들을 담당할 MimeMessageHelper 객체를 생성한다.
			// 생성자의 매개값으로 MimeMessage 객체, bool, 문자 인코딩 설정
			// bool에 true를 넣으면 MultiPart(이미지나 오디오 등의 여러가지) 형식의 메세지 전달이 가능하다. false면 단순 텍스트만
			// 전달한다.
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");

			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			// true를 전달해야 html 형식으로 전송하겠다는 의미, 아무것도 작성하지 않으면 단순 텍스트
			helper.setText(content, true);

			mailSender.send(message);

		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	
}
