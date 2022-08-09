package com.spring.leaf.company.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import com.spring.leaf.company.command.CompanyIntroVO;
import com.spring.leaf.company.command.CompanyLogoVO;
import com.spring.leaf.company.command.CompanyVO;
import com.spring.leaf.company.service.ICompanyService;
import com.spring.leaf.util.MailService;


// 기업회원 유저 컨트롤러 : 2022-07-28 생성

@Controller
@RequestMapping("/company")
public class CompanyController {

	// 로그 출력을 위한 Logger 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(CompanyController.class);
	
	
	// 기업회원 서비스 연결
	@Autowired
	private ICompanyService service;
	
	
	// 이메일 인증을 위한 서비스 연결
	@Autowired
	private MailService mailService;
	
	
	// 기업 회원가입 처리 요청
	@PostMapping("/companyRegist")
	public String companyRegist(CompanyVO vo, RedirectAttributes ra) {
		logger.info("/company/companyRegist : POST (기업 회원가입 처리 요청)");
		
		service.companyRegist(vo);
		
		ra.addFlashAttribute("msg", "기업 회원가입 신청이 완료되었습니다. 관리자의 승인을 기다려주세요.");
		
		return "redirect:/";
	}
	
	
	// 기업 아이디 중복체크 요청
	@PostMapping("/companyIDCheck")
	@ResponseBody
	public String companyIDCheck(@RequestBody String companyID) {
		logger.info("/company/companyIDCheck : POST (기업 아이디 중복체크 처리 요청)");
		
		int check = service.companyIDCheck(companyID);
		
		if(check == 0) {
			return "checkSuccess";
		} else {
			return "checkFail";
		}
	}
	
	
	// 기업 이메일 중복체크 요청
	@PostMapping("/companyEmailCheck")
	@ResponseBody
	public String companyEmailCheck(@RequestParam Map<String, Object> emails) {
		logger.info("/company/companyEmailCheck : POST (이메일 중복체크 처리 요청)");
			
		int check = service.companyEmailCheck(emails);
			
		if(check == 0) {
			return "emailCheckSuccess";
		} else {
			return "emailCheckFail";
		}
	}
	
	
	// 기업 이메일 인증 요청
	@GetMapping("/companyEmailAuth")
	@ResponseBody
	public String companyEmailAuth(@RequestParam("email") String email) {
		logger.info("/company/companyEmailAuth : GET (이메일 인증 요청)");

		logger.info("인증 이메일 : " + email);

		return mailService.joinEmail(email);
	}
	
	
	// 기업 로그인 요청
	@PostMapping("/companyLogin")
	public String companyLogin(String companyID, String companyPW, Model model) {
		logger.info("/company/companyLogin : POST (로그인 요청)");

		// 로그인 한 사용자의 정보를 가져온다.
		CompanyVO vo = service.companyGetInfo(companyID);
		CompanyLogoVO lvo = null;
		
		// 로그인 중 받아온 기업회원 정보가 없다면 CompanyLogoVO를 null로 보냄
		// 기업 로고 사진 정보를 얻어오기 위해서는 CompanyVO에 담긴 것을 가져와야 하는데 CompanyVO가 null이면 예외가 발생하기 때문에 사전에 방지
		if (vo == null) {
			lvo = null;
		} else {
			lvo = service.companyLogoGet(vo.getCompanyNO());
		}

		// 가져온 사용자 정보를 인터셉터에게 전달한다.
		model.addAttribute("companyLogin", vo);
		// 기져온 사용자의 프로필사진 정보를 인터셉터에게 전달한다.
		model.addAttribute("companyLogo", lvo);
		// 가져온 사용자의 비밀번호를 인터셉터에게 전달한다. (비밀번호 비교를 위해)
		model.addAttribute("companyPW", companyPW);

		/* 기업 로그인 인터셉터 발동 */

		return "home";
	}
	
	
	// 기업회원 로그아웃 요청
	@PostMapping("/companyLogout")
	@ResponseBody
	public String companyLogout(HttpSession session) {

		logger.info("/company/companyLogout : POST (기업 로그아웃 요청)");

		// 로그아웃 시 저장된 사용자 정보와 프로필 사진 정보가 담긴 세션을 지운다.
		session.removeAttribute("company");

		return "logoutSuccess";
	}
	
	
	// 기업회원 번호 구하기 요청
	@PostMapping("/companyNOGet")
	@ResponseBody
	public int companyNOGet() {
		logger.info("/company/companyNOGet : POST (가입하고자 하는 기업 회원의 번호 구하는 요청");

		int companyNO = service.companyNOGet();

		return companyNO;
	}
	
	
	// 기업회원 로고사진 등록 요청
	@PostMapping("/companyLogo/{companyNO}")
	@ResponseBody
	public String companyLogo(@RequestParam("companyLogo") MultipartFile logo, @PathVariable("companyNO") int companyNO)
			throws Exception {
		logger.info("/company/companyLogo : POST (프로필사진 등록 요청)");

		// 날짜별로 폴더를 생성해서 파일을 관리한다.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

		Date date = new Date();

		String location = sdf.format(date);

		// 저장할 폴더 경로
		String uploadPath = "C:\\companyLogo\\" + location;

		File folder = new File(uploadPath);

		// 폴더가 존재하지 않는다면 생성한다.
		if (!folder.exists()) {
			folder.mkdirs();
		}

		// 파일명을 고유한 랜덤 문자로 생성
		UUID uuid = UUID.randomUUID();
		// 랜덤으로 생성된 문자에 있는 - 을 모두 지운다.
		String uuids = uuid.toString().replaceAll("-", "");

		// 사용자가 원래 가지고 있던 원본 파일 명
		String realName = logo.getOriginalFilename();
		// 확장자 추출
		String extention = realName.substring(realName.indexOf("."), realName.length());

		// 고유한 문자와 확장자를 합쳐 새로운 랜덤이름의 파일이름을 만들어준다.
		String name = uuids + extention;

		// 업로드한 파일을 서버 컴퓨터 내의 지정한 경로로 실제 저장
		File saveFile = new File(uploadPath + "\\" + name);

		try {
			logo.transferTo(saveFile);
		} catch (IOException e) {
			e.printStackTrace();
		}

		// 받은 파일의 정보를 UserProfileVO 안에 넣고 데이터베이스에 저장한다.
		CompanyLogoVO vo = new CompanyLogoVO();
		vo.setCompanyLogoFilename(name);
		vo.setCompanyLogoUploadpath(uploadPath);
		vo.setCompanyLogoRealname(realName);
		vo.setCompanyNO(companyNO);

		service.companyLogo(vo);

		// 파일을 로컬이 아닌 서버에도 저장한다.
		// SSH 원격접속을 위한 username, ip, port, password
		String username = "leaf";
		String host = "35.203.164.40";
		int port = 22;
		String password = "1q2w3e4r";

		Session session = null;
		Channel channel = null;

		try {
			// 파일을 원격서버로 보내기 위해 JSch 객체를 선언한다. (SFTP)
			JSch jsch = new JSch();

			// 세션 객체 생성 (JSch를 이용해 서버에 원격접속을 하기 위해서)
			session = jsch.getSession(username, host, port);
			session.setPassword(password);

			// ssh_config에 호스트 key 없이 접속이 가능하도록 property 설정 (이건 잘 모르겠다,. 따로 공부해야 할 듯)
			java.util.Properties config = new java.util.Properties();
			config.put("StrictHostKeyChecking", "no");
			session.setConfig(config);

			// 접속 시도
			session.connect();

			// SFTP 채널 오픈 및 연결
			channel = session.openChannel("sftp");

			// SFTP 접속 시도
			channel.connect();

			// 로컬에 저장된 파일과 동일한 파일을 서버 /home/leaf/project 디렉토리 경로로 보낸다.
			// 앞에는 로컬에서 보낼 파일, 뒤에는 서버에서 받을 디렉토리 위치 경로
			ChannelSftp channelSftp = (ChannelSftp) channel;
			channelSftp.put(uploadPath + "\\" + name, "/home/leaf/companyLogo");

			// 이건 다운로드, 나중에 프로필사진 불러오기 할 때 참고해서
			// 사용하자!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			// 앞에는 서버에서 받아올 파일, 뒤에는 로컬에서 받을 폴더 위치 경로
			// channelSftp.get("/home/leaf/userProfile/" + name, uploadPath + "\\");

		} catch (JSchException e) {
			e.printStackTrace();
		} finally {
			// 전송이 완료되면 접속 종료
			if (channel != null) {
				channel.disconnect();
			}

			// 전송이 완료되면 접속 종료
			if (session != null) {
				session.disconnect();
			}
		}

		return "YesLogo";
	}

	
	// 기업회원 로고사진 없이 등록 요청
	@PostMapping("/companyLogoNo/{companyNO}")
	@ResponseBody
	public String companyLogoNo(@PathVariable("companyNO") int companyNO) {
		logger.info("/company/companyLogoNo : POST (기업 로고사진 없이 회원가입 요청)");

		CompanyLogoVO vo = new CompanyLogoVO();
		vo.setCompanyNO(companyNO);

		service.companyLogo(vo);

		return "NoLogo";
	}
	
	
	// 기업 로고사진 불러오기 요청
	@GetMapping("/companyLogoGet")
	public ResponseEntity<byte[]> companyLogoGet(int companyNO) throws Exception {
		logger.info("/company/companyLogoGet : GET (기업 로고 불러오기 요청)");
		
		CompanyLogoVO vo = service.companyLogoGet(companyNO);
		
		if(vo.getCompanyLogoFilename() == null) {
			ResponseEntity<byte[]> result = null;
			
			// 기본 프로필사진을 불러온다.
			File noLogo = new File("C:/leaf/Leaf/src/main/webapp/resources/img/profile.png");
			
			// 응답 헤더파일에 여러가지 정보를 담아서 전송하는 것도 가능하다.
			HttpHeaders headers = new HttpHeaders();

			try {
				// ResponseEntity<>(응답 객체에 담을 내용, 헤더에 담을 내용, 상태 메세지)
				// FileCopyUtils : 파일 및 스트림 데이터 복사를 위한 간단한 유틸리티 메소드의 집합체
				// file 객체 안에 있는 내용을 복사하여 byte 배열로 변환한 후 바디에 담아 화면에 전달한다.
				// 만약 리턴이 ResponseEntity<byte[]>가 아니라 그냥 byte[]라면 FileCopyUtils.copyToByteArray(file)만 써주면 된다.
				result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(noLogo), headers, HttpStatus.OK);

			} catch (IOException e) {
				e.printStackTrace();
			}

			return result;
		} else {
			// 받은 업로드 경로와 파일 이름으로 파일 객체를 선언한다.
			File logo = new File(vo.getCompanyLogoUploadpath() + "\\" + vo.getCompanyLogoFilename());

			// 사진을 불러오고자 하는 클라이언트에 해당 사진이 없을 경우
			// 서버에 저장된 사진 파일을 SFTP를 이용하여 다운받아 적혀있는 경로에 저장한 후 그 사진을 불러온다.
			if (!logo.exists()) {
				
				File folder = new File(vo.getCompanyLogoUploadpath());

				// 폴더가 존재하지 않는다면 생성한다.
				if (!folder.exists()) {
					folder.mkdirs();
				}
				
				// 파일을 서버에서 다운로드 받아 로컬에도 저장한다.
				// SSH 원격접속을 위한 계정 정보 및 주소 정보
				String username = "leaf";
				String host = "35.203.164.40";
				int port = 22;
				String password = "1q2w3e4r";

				Session session = null;
				Channel channel = null;

				try {
					// 파일을 원격서버로 보내기 위해 JSch 객체를 선언한다. (SFTP)
					JSch jsch = new JSch();

					// 세션 객체 생성 (JSch를 이용해 서버에 원격접속을 하기 위해서)
					session = jsch.getSession(username, host, port);
					session.setPassword(password);

					// ssh_config에 호스트 key 없이 접속이 가능하도록 property 설정 (이건 잘 모르겠다,. 따로 공부해야 할 듯)
					java.util.Properties config = new java.util.Properties();
					config.put("StrictHostKeyChecking", "no");
					session.setConfig(config);

					// 접속 시도
					session.connect();

					// SFTP 채널 오픈 및 연결
					channel = session.openChannel("sftp");

					// SFTP 접속 시도
					channel.connect();

					// 로컬에 저장된 파일과 동일한 파일을 서버 /home/leaf/project 디렉토리 경로로 보낸다.
					// 앞에는 로컬에서 보낼 파일, 뒤에는 서버에서 받을 디렉토리 위치 경로
					ChannelSftp channelSftp = (ChannelSftp) channel;

					// 앞에는 서버에서 받아올 파일, 뒤에는 로컬에서 받을 폴더 위치 경로
					channelSftp.get("/home/leaf/companyLogo/" + vo.getCompanyLogoFilename(), vo.getCompanyLogoUploadpath() + "\\");

				} catch (JSchException e) {
					e.printStackTrace();
				} finally {
					// 전송이 완료되면 접속 종료
					if (channel != null) {
						channel.disconnect();
					}

					// 전송이 완료되면 접속 종료
					if (session != null) {
						session.disconnect();
					}
				}

				ResponseEntity<byte[]> result = null;

				// 응답 헤더파일에 여러가지 정보를 담아서 전송하는 것도 가능하다.
				HttpHeaders headers = new HttpHeaders();

				try {
					// probeContentType : 파라미터로 전달받은 파일의 타입을 문자열로 변환해 주는 메소드
					// 사용자에게 보여주고자 하는 데이터가 어떤 파일인지를 검사해서 응답상태 코드를 다르게 리턴할 수도 있다.
					headers.add("Content-Type", Files.probeContentType(logo.toPath()));

					// ResponseEntity<>(응답 객체에 담을 내용, 헤더에 담을 내용, 상태 메세지)
					// FileCopyUtils : 파일 및 스트림 데이터 복사를 위한 간단한 유틸리티 메소드의 집합체
					// file 객체 안에 있는 내용을 복사하여 byte 배열로 변환한 후 바디에 담아 화면에 전달한다.
					// 만약 리턴이 ResponseEntity<byte[]>가 아니라 그냥 byte[]라면
					// FileCopyUtils.copyToByteArray(file)만 써주면 된다.
					result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(logo), headers, HttpStatus.OK);

				} catch (IOException e) {
					e.printStackTrace();
				}

				return result;

			} else {
				// 이미 불러오고자 하는 클라이언트에 해당 사진이 저장되어있을 경우
				// 따로 SFTP로 서버에서 이미지를 다운받아오는 작업을 진행하지 않고 바로 저장되어있는 사진만 불러온다.
				// 매번 서버에서 파일을 다운받아오는 행위는 너무 낭비이므로 수정함
				ResponseEntity<byte[]> result = null;

				// 응답 헤더파일에 여러가지 정보를 담아서 전송하는 것도 가능하다.
				HttpHeaders headers = new HttpHeaders();

				try {
					// probeContentType : 파라미터로 전달받은 파일의 타입을 문자열로 변환해 주는 메소드
					// 사용자에게 보여주고자 하는 데이터가 어떤 파일인지를 검사해서 응답상태 코드를 다르게 리턴할 수도 있다.
					headers.add("Content-Type", Files.probeContentType(logo.toPath()));

					// ResponseEntity<>(응답 객체에 담을 내용, 헤더에 담을 내용, 상태 메세지)
					// FileCopyUtils : 파일 및 스트림 데이터 복사를 위한 간단한 유틸리티 메소드의 집합체
					// file 객체 안에 있는 내용을 복사하여 byte 배열로 변환한 후 바디에 담아 화면에 전달한다.
					// 만약 리턴이 ResponseEntity<byte[]>가 아니라 그냥 byte[]라면
					// FileCopyUtils.copyToByteArray(file)만 써주면 된다.
					result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(logo), headers, HttpStatus.OK);

				} catch (IOException e) {
					e.printStackTrace();
				}

				return result;
			}
		}
	}
	
	
	// 기업 회사 소개서 파일 등록 요청
	@PostMapping("/companyIntro/{companyNO}")
	@ResponseBody
	public String companyIntro(@RequestParam("companyIntro") MultipartFile intro, @PathVariable("companyNO") int companyNO) throws Exception {
		logger.info("/company/companyIntro : POST (회사 소개서 등록 요청)");

		// 날짜별로 폴더를 생성해서 파일을 관리한다.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

		Date date = new Date();

		String location = sdf.format(date);

		// 저장할 폴더 경로
		String uploadPath = "C:\\companyIntro\\" + location;

		File folder = new File(uploadPath);

		// 폴더가 존재하지 않는다면 생성한다.
		if (!folder.exists()) {
			folder.mkdirs();
		}

		// 파일명을 고유한 랜덤 문자로 생성
		UUID uuid = UUID.randomUUID();
		// 랜덤으로 생성된 문자에 있는 - 을 모두 지운다.
		String uuids = uuid.toString().replaceAll("-", "");

		// 사용자가 원래 가지고 있던 원본 파일 명
		String realName = intro.getOriginalFilename();
		// 확장자 추출
		String extention = realName.substring(realName.indexOf("."), realName.length());

		// 고유한 문자와 확장자를 합쳐 새로운 랜덤이름의 파일이름을 만들어준다.
		String name = uuids + extention;

		// 업로드한 파일을 서버 컴퓨터 내의 지정한 경로로 실제 저장
		File saveFile = new File(uploadPath + "\\" + name);

		try {
			intro.transferTo(saveFile);
		} catch (IOException e) {
			e.printStackTrace();
		}

		// 받은 파일의 정보를 CompanyIntroVO 안에 넣고 데이터베이스에 저장한다.
		CompanyIntroVO vo = new CompanyIntroVO();
		vo.setCompanyIntroFilename(name);
		vo.setCompanyIntroUploadpath(uploadPath);
		vo.setCompanyIntroRealname(realName);
		vo.setCompanyNO(companyNO);
		
		service.companyIntro(vo);

		// 파일을 로컬이 아닌 서버에도 저장한다.
		// SSH 원격접속을 위한 username, ip, port, password
		String username = "leaf";
		String host = "35.203.164.40";
		int port = 22;
		String password = "1q2w3e4r";

		Session session = null;
		Channel channel = null;

		try {
			// 파일을 원격서버로 보내기 위해 JSch 객체를 선언한다. (SFTP)
			JSch jsch = new JSch();

			// 세션 객체 생성 (JSch를 이용해 서버에 원격접속을 하기 위해서)
			session = jsch.getSession(username, host, port);
			session.setPassword(password);

			// ssh_config에 호스트 key 없이 접속이 가능하도록 property 설정 (이건 잘 모르겠다,. 따로 공부해야 할 듯)
			java.util.Properties config = new java.util.Properties();
			config.put("StrictHostKeyChecking", "no");
			session.setConfig(config);

			// 접속 시도
			session.connect();

			// SFTP 채널 오픈 및 연결
			channel = session.openChannel("sftp");

			// SFTP 접속 시도
			channel.connect();

			// 로컬에 저장된 파일과 동일한 파일을 서버 /home/leaf/project 디렉토리 경로로 보낸다.
			// 앞에는 로컬에서 보낼 파일, 뒤에는 서버에서 받을 디렉토리 위치 경로
			ChannelSftp channelSftp = (ChannelSftp) channel;
			channelSftp.put(uploadPath + "\\" + name, "/home/leaf/companyIntro");

			// 이건 다운로드, 나중에 프로필사진 불러오기 할 때 참고해서
			// 사용하자!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			// 앞에는 서버에서 받아올 파일, 뒤에는 로컬에서 받을 폴더 위치 경로
			// channelSftp.get("/home/leaf/userProfile/" + name, uploadPath + "\\");

		} catch (JSchException e) {
			e.printStackTrace();
		} finally {
			// 전송이 완료되면 접속 종료
			if (channel != null) {
				channel.disconnect();
			}

			// 전송이 완료되면 접속 종료
			if (session != null) {
				session.disconnect();
			}
		}

		return "YesCompanyIntro";
	}
	
	
	// 회사 소개서 다운로드 요청
	@GetMapping("/companyIntro/download")
	public void companyIntroDownload(@RequestParam("companyNO") int companyNO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("/company/companyIntro/download : GET (회사 소개서 다운로드 요청)");
		
		// PrintWriter객체를 사용해 알림창을 띄울 때 한글깨짐을 방지하는 부분
		response.setContentType("text/html; charset=UTF-8");
		
		CompanyIntroVO vo = service.companyIntroGet(companyNO);
		
		// 사용자가 등록한 이력서 파일이 없다면
		if(vo == null || vo.getCompanyIntroFilename() == null) {
			// class 파일에서 자바스크립트 경고창을 띄우기 위한 PrintWriter 사용
			PrintWriter writer = response.getWriter();
			writer.print("<script>" + "alert('해당 사용자는 첨부한 회사 소개서가 없습니다.');" + "location.replace('/');" + "</script>");
			writer.flush();
			writer.close();

		} else {
			File intro = new File(vo.getCompanyIntroUploadpath() + "\\" + vo.getCompanyIntroFilename());
			
			// 사진을 불러오고자 하는 클라이언트에 해당 사진이 없을 경우
			// 서버에 저장된 사진 파일을 SFTP를 이용하여 다운받아 적혀있는 경로에 저장한 후 그 사진을 불러온다.
			if (!intro.exists()) {

				File folder = new File(vo.getCompanyIntroUploadpath());

				// 폴더가 존재하지 않는다면 생성한다.
				if (!folder.exists()) {
					folder.mkdirs();
				}

				// 파일을 서버에서 다운로드 받아 로컬에도 저장한다.
				// SSH 원격접속을 위한 계정 정보 및 주소 정보
				String username = "leaf";
				String host = "35.203.164.40";
				int port = 22;
				String password = "1q2w3e4r";

				Session session = null;
				Channel channel = null;

				try {
					// 파일을 원격서버로 보내기 위해 JSch 객체를 선언한다. (SFTP)
					JSch jsch = new JSch();

					// 세션 객체 생성 (JSch를 이용해 서버에 원격접속을 하기 위해서)
					session = jsch.getSession(username, host, port);
					session.setPassword(password);

					// ssh_config에 호스트 key 없이 접속이 가능하도록 property 설정 (이건 잘 모르겠다,. 따로 공부해야 할 듯)
					java.util.Properties config = new java.util.Properties();
					config.put("StrictHostKeyChecking", "no");
					session.setConfig(config);

					// 접속 시도
					session.connect();

					// SFTP 채널 오픈 및 연결
					channel = session.openChannel("sftp");

					// SFTP 접속 시도
					channel.connect();

					// 로컬에 저장된 파일과 동일한 파일을 서버 /home/leaf/project 디렉토리 경로로 보낸다.
					// 앞에는 로컬에서 보낼 파일, 뒤에는 서버에서 받을 디렉토리 위치 경로
					ChannelSftp channelSftp = (ChannelSftp) channel;

					// 앞에는 서버에서 받아올 파일, 뒤에는 로컬에서 받을 폴더 위치 경로
					channelSftp.get("/home/leaf/companyIntro/" + vo.getCompanyIntroFilename(), vo.getCompanyIntroUploadpath() + "\\");

				} catch (JSchException e) {
					e.printStackTrace();
				} finally {
					// 전송이 완료되면 접속 종료
					if (channel != null) {
						channel.disconnect();
					}

					// 전송이 완료되면 접속 종료
					if (session != null) {
						session.disconnect();
					}
				}

				// 파일을 byte 배열로 변환한다.
				byte fileByte[] = FileUtils.readFileToByteArray(intro);
				
				// 파일 다운로드 응답 형식을 설정한다. 어플리케이션  파일이 리턴된다.
				response.setContentType("application/octet-stream");
				// 파일 사이즈 지정
				response.setContentLength(fileByte.length);
				
				// 다운로드 시 파일 원본 이름을 가져와서 원본이름을 적용시킨다.
				response.setHeader("Content-Disposition","attachment; fileName=\"" + URLEncoder.encode(vo.getCompanyIntroRealname(), "UTF-8") + "\";");
				// application/octet-stream은 바이너리 데이터이므로 binary로 인코딩해준다.
				response.setHeader("Content-Transfer-Encoding", "binary");
				
				// 버퍼에 파일을 담아 스트림으로 출력한다.
				response.getOutputStream().write(fileByte);
				response.getOutputStream().flush();
				response.getOutputStream().close();

			} else {
				// 파일을 byte 배열로 변환한다.
				byte fileByte[] = FileUtils.readFileToByteArray(intro);
				
				// 파일 다운로드 응답 형식을 설정한다. 어플리케이션  파일이 리턴된다.
				response.setContentType("application/octet-stream");
				// 파일 사이즈 지정
				response.setContentLength(fileByte.length);
				
				// 다운로드 시 파일 원본 이름을 가져와서 원본이름을 적용시킨다.
				response.setHeader("Content-Disposition","attachment; fileName=\"" + URLEncoder.encode(vo.getCompanyIntroRealname(), "UTF-8") + "\";");
				// application/octet-stream은 바이너리 데이터이므로 binary로 인코딩해준다.
				response.setHeader("Content-Transfer-Encoding", "binary");
				
				// 버퍼에 파일을 담아 스트림으로 출력한다.
				response.getOutputStream().write(fileByte);
				response.getOutputStream().flush();
				response.getOutputStream().close();
			}
		}
	}
}
