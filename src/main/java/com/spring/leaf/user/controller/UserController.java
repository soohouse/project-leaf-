package com.spring.leaf.user.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
import org.springframework.web.util.WebUtils;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import com.spring.leaf.user.command.AutoLoginVO;
import com.spring.leaf.user.command.PasswordVO;
import com.spring.leaf.user.command.ResumeVO;
import com.spring.leaf.user.command.UserProfileVO;
import com.spring.leaf.user.command.UserVO;
import com.spring.leaf.user.service.IUserService;
import com.spring.leaf.util.MailService;


// 일반회원 유저 컨트롤러 : 2022-07-27 생성

@Controller
@RequestMapping("/user")
public class UserController {

	// 로그 출력을 위한 Logger 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	
	// 일반회원 유저 서비스 연결
	@Autowired
	private IUserService service;
	
	
	// 이메일 인증을 위한 서비스 연결
	@Autowired
	private MailService mailService;
	
	
	// 회원가입 페이지 이동 요청
	@GetMapping("/userRegist")
	public String userRegist() {
		logger.info("/user/userRegist : GET (회원가입 페이지 이동)");
		
		return "/register/register";
	}
	
	
	// 회원가입 처리 요청
	@PostMapping("/userRegist")
	public String userRegist(UserVO vo, RedirectAttributes ra) {
		logger.info("/user/userRegist : POST (회원가입 처리 요청)");
		
		service.userRegist(vo);
		
		ra.addFlashAttribute("msg", "성공적으로 회원가입 되었습니다.");
		
		return "redirect:/";
	}
	
	
	// 사용자 아이디 중복체크 요청
	@PostMapping("/userIDCheck")
	@ResponseBody
	public String userIDCheck(@RequestBody String userID) {
		logger.info("/user/userIDCheck : POST (회원가입 아이디 중복체크 처리 요청)");
		
		int check = service.userIDCheck(userID);
		
		if(check == 0) {
			return "checkSuccess";
		} else {
			return "checkFail";
		}
	}
	
	
	// 사용자 이메일 중복체크 요청
	@PostMapping("/userEmailCheck")
	@ResponseBody
	public String userEmailCheck(@RequestParam Map<String, Object> emails) {
		logger.info("/user/userEmailCheck : POST (이메일 중복체크 처리 요청)");
		
		int check = service.userEmailCheck(emails);
		
		if(check == 0) {
			return "emailCheckSuccess";
		} else {
			return "emailCheckFail";
		}
	}
	
	
	// 사용자 이메일 인증 요청
	@GetMapping("/userEmailAuth")
	@ResponseBody
	public String userEmailAuth(@RequestParam("email") String email) {
		logger.info("/user/userEmailAuth : GET (이메일 인증 요청)");
		
		logger.info("인증 이메일 : " + email);
		
		return mailService.joinEmail(email);
	}
	
	
	// 사용자 로그인 요청
	@PostMapping("/userLogin")
	public String userLogin(String userID, String userPW, Boolean userAutoLogin, Model model) {
		logger.info("/user/userLogin : POST (로그인 요청)");
		
		// 로그인 모달에서 form으로 userID와 userPW, 로그인 유지 체크박스 값을 받아온 후
		// 로그인 한 사용자의 정보를 가져온다.
		UserVO vo = service.userGetInfo(userID);
		
		// 가져온 사용자 정보를 인터셉터에게 전달한다.
		model.addAttribute("userLogin", vo);
		// 가져온 사용자의 비밀번호를 인터셉터에게 전달한다. (비밀번호 비교를 위해)
		model.addAttribute("userPW", userPW);
		// 로그인 유지 체크 여부를 인터셉터에게 전달한다. (자동로그인)
		model.addAttribute("autoCheck", userAutoLogin);
		
		/* 일반회원 로그인 인터셉터 발동 */
		
		return "home";
	}
	
	
	// 사용자 로그아웃 요청
	@PostMapping("/userLogout")
	@ResponseBody
	public String userLogout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		logger.info("/user/userLogout : POST (사용자 로그아웃 요청)");

		UserVO vo = (UserVO) session.getAttribute("user");
		
		// 로그아웃 시 저장된 사용자 정보와 프로필 사진 정보가 담긴 세션을 지운다.
		session.removeAttribute("user");
		
		// 자동로그인 체크때 생성한 쿠키를 가져온다.
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		
		// 자동로그인 체크를 했었기 때문에 쿠키가 존재하는 상태라면
		if(loginCookie != null) {
			loginCookie.setPath("/");
			// 쿠키의 지속시간을 0으로 한다.
			loginCookie.setMaxAge(0);
			
			// 지속시간이 0인 쿠키로 쿠키를 교체하여 사실상 삭제되도록 한다.
			response.addCookie(loginCookie);
			
			// 쿠키를 삭제한 후 사용자 데이터베이스에도 세션 ID와 쿠키 지속시간을 null로 바꾼다.
			AutoLoginVO avo = new AutoLoginVO();
			avo.setSessionID(null);
			avo.setSessionLimit(null);
			avo.setUserID(vo.getUserID());
			
			service.userAutoLogin(avo);
		}

		return "logoutSuccess";
	}
	
	
	// 사용자 비밀번호 변경 요청
	@PostMapping("/userPasswordChange")
	@ResponseBody
	public String userPasswordChange(HttpSession session, PasswordVO pvo) {
		logger.info("/user/userPasswordChange : POST (사용자 비밀번호 변경 요청)");
		
		UserVO vo = (UserVO) session.getAttribute("user");
		
		// 암호화된 비밀번호의 비교를 위해 BcryptPasswordEncoder 객체 생성
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		if(encoder.matches(pvo.getOldPassword(), vo.getUserPW())) {
			service.userPasswordChange(pvo);
			return "YesChange";
		} else {
			return "NoChange";
		}
	}
	
	
	// 사용자 비밀번호 체크 요청
	@PostMapping("/userPasswordCheck")
	@ResponseBody
	public String userPasswordCheck(String inputPW, HttpSession session) {
		logger.info("/user/userPasswordCheck : POST (사용자 비밀번호 체크 요청)");
		
		UserVO vo = (UserVO) session.getAttribute("user");
		
		// 암호화된 비밀번호의 비교를 위해 BcryptPasswordEncoder 객체 생성
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
				
		if(encoder.matches(inputPW, vo.getUserPW())) {
			return "YesCheck";
		} else {
			return "NoCheck";
		}
	}
	
	
	// 사용자 회원탈퇴 요청
	@PostMapping("/userDelete")
	@ResponseBody
	public String userDelete(int userNO) {
		logger.info("/user/userDelete : POST (사용자 회원탈퇴 요청)");
		
		service.userDelete(userNO);
		
		return "YesUserDelete";
	}
	
	
	// 사용자 ID 찾기 요청
	@PostMapping("/userIDFind")
	@ResponseBody
	public Map<String, Object> userIDFind(String userName) {
		logger.info("/user/userIDFind : POST (사용자 ID 찾기 요청)");
		
		List<UserVO> IDList = service.userIDFind(userName);
		
		Map<String, Object> map = new HashMap<>();
		map.put("IDList", IDList);
		
		return map;
	}
	
	
	// 사용자 ID 검색 후 인증번호 발송
	@PostMapping("/userPWFindEmail")
	@ResponseBody
	public String userPWFindEmail(String userID) {
		logger.info("/user/userPWFindEmail : POST (사용자 ID 검색 후 인증번호 발송 요청)");
		
		UserVO vo = service.userGetInfo(userID);
		
		if(vo == null) {
			return "NoFindEmail";
		} else {
			String email = vo.getUserEmail1() + '@' + vo.getUserEmail2();
			
			return mailService.joinEmail(email);
		}
	}
	
	
	// 사용자 비밀번호 초기화 요청
	@PostMapping("/userPWReset")
	@ResponseBody
	public String userPWReset(String newPassword, String userID) {
		logger.info("/user/userPWReset : POST (사용자 비밀번호 초기화 요청)");
		
		service.userPWReset(newPassword, userID);
		
		return "YesUserPWReset";
	}
	
	
	// 사용자 번호 구하기 요청
	@PostMapping("/userNOGet")
	@ResponseBody
	public int userNOGet() {
		logger.info("/user/userNOGet : POST (가입하고자 하는 사람의 회원 번호 구하는 요청");
		
		int userNO = service.userNOGet();
		
		return userNO;
	}
	
	
	// 사용자 프로필사진 등록 요청
	@PostMapping("/userProfile/{userNO}")
	@ResponseBody
	public String userProfile(@RequestParam("userProfile") MultipartFile profile, @PathVariable("userNO") int userNO) throws Exception {
		logger.info("/user/userProfile : POST (프로필사진 등록 요청)");
		
		// 날짜별로 폴더를 생성해서 파일을 관리한다.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

		Date date = new Date();

		String location = sdf.format(date);

		// 저장할 폴더 경로
		String uploadPath = "C:\\userProfile\\" + location;

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
		String realName = profile.getOriginalFilename();
		// 확장자 추출
		String extention = realName.substring(realName.indexOf("."), realName.length());

		// 고유한 문자와 확장자를 합쳐 새로운 랜덤이름의 파일이름을 만들어준다.
		String name = uuids + extention;

		// 업로드한 파일을 서버 컴퓨터 내의 지정한 경로로 실제 저장
		File saveFile = new File(uploadPath + "\\" + name);

		try {
			profile.transferTo(saveFile);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 받은 파일의 정보를 UserProfileVO 안에 넣고 데이터베이스에 저장한다.
		UserProfileVO vo = new UserProfileVO();
		vo.setUserProfileFilename(name);
		vo.setUserProfileUploadpath(uploadPath);
		vo.setUserProfileRealname(realName);
		vo.setUserNO(userNO);

		service.userProfile(vo);
		
		
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
			channelSftp.put(uploadPath + "\\" + name, "/home/leaf/userProfile");
			
			// 이건 다운로드, 나중에 프로필사진 불러오기 할 때 참고해서 사용하자!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			// 앞에는 서버에서 받아올 파일, 뒤에는 로컬에서 받을 폴더 위치 경로
			//channelSftp.get("/home/leaf/userProfile/" + name, uploadPath + "\\");
			
		} catch(JSchException e) {
			e.printStackTrace();
		} finally {
			// 전송이 완료되면 접속 종료
			if(channel != null) {
				channel.disconnect();
			}
			
			// 전송이 완료되면 접속 종료
			if(session != null) {
				session.disconnect();
			}
		}
		
		return "YesProfile";
	} 
	
	
	// 사용자 프로필사진 삭제 요청
	@PostMapping("/userProfileDelete/{userNO}")
	@ResponseBody
	public String userProfileDelete(@PathVariable("userNO") int userNO) throws Exception {
		logger.info("/user/userProfileDelete : POST (프로필사진 삭제 요청)");

		// 해당 사용자의 프로필 사진 정보를 얻어옴
		UserProfileVO vo = service.userProfileGet(userNO);

		// 해당 경로에 있는 파일을 삭제한다.
		File deleteFile = new File(vo.getUserProfileUploadpath() + "\\" + vo.getUserProfileFilename());

		if (deleteFile.exists()) {
			deleteFile.delete();
		}

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

			// 서버 컴퓨터에 저장되어 있는 해당 파일을 삭제한다.
			ChannelSftp channelSftp = (ChannelSftp) channel;
			// channelSftp.put(uploadPath + "\\" + name, "/home/leaf/userResume");
			channelSftp.rm("/home/leaf/userProfile/" + vo.getUserProfileFilename());

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

		service.userProfileDelete(userNO);

		return "YesProfileDelete";
	}
	
	
	// 사용자 프로필사진 수정 요청
	@PostMapping("/userProfileUpdate/{userNO}")
	@ResponseBody
	public String userProfileUpdate(@RequestParam("newProfile") MultipartFile newProfile, @PathVariable("userNO") int userNO) throws Exception {
		logger.info("/user/userProfileUpdate : POST (프로필사진 재업로드 요청)");

		// 날짜별로 폴더를 생성해서 파일을 관리한다.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

		Date date = new Date();

		String location = sdf.format(date);

		// 저장할 폴더 경로
		String uploadPath = "C:\\userProfile\\" + location;

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
		String realName = newProfile.getOriginalFilename();
		// 확장자 추출
		String extention = realName.substring(realName.indexOf("."), realName.length());

		// 고유한 문자와 확장자를 합쳐 새로운 랜덤이름의 파일이름을 만들어준다.
		String name = uuids + extention;

		// 업로드한 파일을 서버 컴퓨터 내의 지정한 경로로 실제 저장
		File saveFile = new File(uploadPath + "\\" + name);

		try {
			newProfile.transferTo(saveFile);
		} catch (IOException e) {
			e.printStackTrace();
		}

		// 받은 파일의 정보를 ResumeVO 안에 넣고 데이터베이스에 저장한다.
		UserProfileVO vo = new UserProfileVO();
		vo.setUserProfileFilename(name);
		vo.setUserProfileUploadpath(uploadPath);
		vo.setUserProfileRealname(realName);
		vo.setUserNO(userNO);
		
		service.userProfileUpdate(vo);


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
			channelSftp.put(uploadPath + "\\" + name, "/home/leaf/userProfile");

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

		return "YesProfileUpdate";
	}
	
	
	// 사용자 프로필사진 존재 여부 체크
	@PostMapping("/userProfileCheck/{userNO}")
	@ResponseBody
	public String userProfileCheck(@PathVariable("userNO") int userNO) {
		logger.info("/user/userProfileCheck : POST (사용자 프로필사진 존재 여부 체크 요청)");

		int check = service.userProfileCheck(userNO);

		if (check == 1) {
			return "YesProfileCheck";
		} else {
			return "NoProfileCheck";
		}
	}
	
	
	// 사용자 프로필사진 없이 등록 요청
	@PostMapping("/userProfileNo/{userNO}")
	@ResponseBody
	public String userProfileNo(@PathVariable("userNO") int userNO) {
		logger.info("/user/userProfileNo : POST (프로필사진 없이 회원가입 요청)");
		
		UserProfileVO vo = new UserProfileVO();
		vo.setUserNO(userNO);
		
		service.userProfile(vo);
		
		return "NoProfile";
	}
	
	
	// 사용자 프로필사진 불러오기 요청
	@GetMapping("/userProfileGet")
	public ResponseEntity<byte[]> userProfileGet(@RequestParam int userNO, HttpServletRequest request) throws Exception {
		logger.info("/user/userProfileGet : GET (프로필사진 불러오기 요청)");
		
		UserProfileVO vo = service.userProfileGet(userNO);
		
		// 사용자가 등록한 프로필사진이 없을 경우
		if(vo.getUserProfileFilename() == null) {
			ResponseEntity<byte[]> result = null;
			
			String context = request.getRealPath("/");
			
			// 기본 프로필사진을 불러온다.
			File noProfile = new File(context + "/resources/img/profile.png");
			
			// 응답 헤더파일에 여러가지 정보를 담아서 전송하는 것도 가능하다.
			HttpHeaders headers = new HttpHeaders();

			try {
				// ResponseEntity<>(응답 객체에 담을 내용, 헤더에 담을 내용, 상태 메세지)
				// FileCopyUtils : 파일 및 스트림 데이터 복사를 위한 간단한 유틸리티 메소드의 집합체
				// file 객체 안에 있는 내용을 복사하여 byte 배열로 변환한 후 바디에 담아 화면에 전달한다.
				// 만약 리턴이 ResponseEntity<byte[]>가 아니라 그냥 byte[]라면 FileCopyUtils.copyToByteArray(file)만 써주면 된다.
				result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(noProfile), headers, HttpStatus.OK);

			} catch (IOException e) {
				e.printStackTrace();
			}

			return result;
			
		} else {
			// 받은 업로드 경로와 파일 이름으로 프로필사진을 불러온다.
			File profile = new File(vo.getUserProfileUploadpath() + "\\" + vo.getUserProfileFilename());
			
			// 사진을 불러오고자 하는 클라이언트에 해당 사진이 없을 경우
			// 서버에 저장된 사진 파일을 SFTP를 이용하여 다운받아 적혀있는 경로에 저장한 후 그 사진을 불러온다.
			if(!profile.exists()) {

				File folder = new File(vo.getUserProfileUploadpath());

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
					channelSftp.get("/home/leaf/userProfile/" + vo.getUserProfileFilename(), vo.getUserProfileUploadpath() + "\\");
					
				} catch(JSchException e) {
					e.printStackTrace();
				} finally {
					// 전송이 완료되면 접속 종료
					if(channel != null) {
						channel.disconnect();
					}
						
					// 전송이 완료되면 접속 종료
					if(session != null) {
						session.disconnect();
					}
				}
				
				ResponseEntity<byte[]> result = null;
				
				// 응답 헤더파일에 여러가지 정보를 담아서 전송하는 것도 가능하다.
				HttpHeaders headers = new HttpHeaders();

				try {
					// probeContentType : 파라미터로 전달받은 파일의 타입을 문자열로 변환해 주는 메소드
					// 사용자에게 보여주고자 하는 데이터가 어떤 파일인지를 검사해서 응답상태 코드를 다르게 리턴할 수도 있다.
					headers.add("Content-Type", Files.probeContentType(profile.toPath()));

					// ResponseEntity<>(응답 객체에 담을 내용, 헤더에 담을 내용, 상태 메세지)
					// FileCopyUtils : 파일 및 스트림 데이터 복사를 위한 간단한 유틸리티 메소드의 집합체
					// file 객체 안에 있는 내용을 복사하여 byte 배열로 변환한 후 바디에 담아 화면에 전달한다.
					// 만약 리턴이 ResponseEntity<byte[]>가 아니라 그냥 byte[]라면 FileCopyUtils.copyToByteArray(file)만 써주면 된다.
					result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(profile), headers, HttpStatus.OK);

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
					headers.add("Content-Type", Files.probeContentType(profile.toPath()));

					// ResponseEntity<>(응답 객체에 담을 내용, 헤더에 담을 내용, 상태 메세지)
					// FileCopyUtils : 파일 및 스트림 데이터 복사를 위한 간단한 유틸리티 메소드의 집합체
					// file 객체 안에 있는 내용을 복사하여 byte 배열로 변환한 후 바디에 담아 화면에 전달한다.
					// 만약 리턴이 ResponseEntity<byte[]>가 아니라 그냥 byte[]라면 FileCopyUtils.copyToByteArray(file)만 써주면 된다.
					result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(profile), headers, HttpStatus.OK);

				} catch (IOException e) {
					e.printStackTrace();
				}

				return result;
			}
		}
	}
	
	
	// 사용자 이력서파일 등록 요청
	@PostMapping("/userResume/{userNO}")
	@ResponseBody
	public String userResume(@RequestParam("userResume") MultipartFile resume, @PathVariable("userNO") int userNO) throws Exception {
		logger.info("/user/userResume : POST (이력서 등록 요청)");

		// 날짜별로 폴더를 생성해서 파일을 관리한다.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

		Date date = new Date();

		String location = sdf.format(date);

		// 저장할 폴더 경로
		String uploadPath = "C:\\userResume\\" + location;

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
		String realName = resume.getOriginalFilename();
		// 확장자 추출
		String extention = realName.substring(realName.indexOf("."), realName.length());

		// 고유한 문자와 확장자를 합쳐 새로운 랜덤이름의 파일이름을 만들어준다.
		String name = uuids + extention;

		// 업로드한 파일을 서버 컴퓨터 내의 지정한 경로로 실제 저장
		File saveFile = new File(uploadPath + "\\" + name);

		try {
			resume.transferTo(saveFile);
		} catch (IOException e) {
			e.printStackTrace();
		}

		// 받은 파일의 정보를 ResumeVO 안에 넣고 데이터베이스에 저장한다.
		ResumeVO vo = new ResumeVO();
		vo.setResumeFilename(name);
		vo.setResumeUploadpath(uploadPath);
		vo.setResumeRealname(realName);
		vo.setUserNO(userNO);

		service.userResume(vo);

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
			channelSftp.put(uploadPath + "\\" + name, "/home/leaf/userResume");

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

		return "YesResume";
	}
	
	
	// 사용자 이력서파일 삭제 요청
	@PostMapping("/userResumeDelete/{userNO}")
	@ResponseBody
	public String userResumeDelete(@PathVariable("userNO") int userNO) throws Exception {
		logger.info("/user/userResumeDelete : POST (이력서 삭제 요청)");

		// 해당 사용자의 이력서 파일 정보를 얻어옴
		ResumeVO vo = service.userResumeGet(userNO);

		// 해당 경로에 있는 파일을 삭제한다.
		File deleteFile = new File(vo.getResumeUploadpath() + "\\" + vo.getResumeFilename());

		if(deleteFile.exists()) {
			deleteFile.delete();
		}

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

			// 서버 컴퓨터에 저장되어 있는 해당 파일을 삭제한다.
			ChannelSftp channelSftp = (ChannelSftp) channel;
			//channelSftp.put(uploadPath + "\\" + name, "/home/leaf/userResume");
			channelSftp.rm("/home/leaf/userResume/" + vo.getResumeFilename());

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
		
		service.userResumeDelete(userNO);

		return "YesResumeDelete";
	}
	
	
	// 사용자 이력서파일 수정 요청
	@PostMapping("/userResumeUpdate/{userNO}")
	@ResponseBody
	public String userResumeUpdate(@RequestParam("newResume") MultipartFile newResume, @PathVariable("userNO") int userNO) throws Exception {
		logger.info("/user/userResumeUpdate : POST (이력서 재업로드 요청)");

		// 날짜별로 폴더를 생성해서 파일을 관리한다.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

		Date date = new Date();

		String location = sdf.format(date);

		// 저장할 폴더 경로
		String uploadPath = "C:\\userResume\\" + location;

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
		String realName = newResume.getOriginalFilename();
		// 확장자 추출
		String extention = realName.substring(realName.indexOf("."), realName.length());

		// 고유한 문자와 확장자를 합쳐 새로운 랜덤이름의 파일이름을 만들어준다.
		String name = uuids + extention;

		// 업로드한 파일을 서버 컴퓨터 내의 지정한 경로로 실제 저장
		File saveFile = new File(uploadPath + "\\" + name);

		try {
			newResume.transferTo(saveFile);
		} catch (IOException e) {
			e.printStackTrace();
		}

		// 받은 파일의 정보를 ResumeVO 안에 넣고 데이터베이스에 저장한다.
		ResumeVO vo = new ResumeVO();
		vo.setResumeFilename(name);
		vo.setResumeUploadpath(uploadPath);
		vo.setResumeRealname(realName);
		vo.setUserNO(userNO);

		service.userResumeUpdate(vo);

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
			channelSftp.put(uploadPath + "\\" + name, "/home/leaf/userResume");

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

		return "YesResumeUpdate";
	}
	
	
	// 사용자 이력서파일 존재 여부 체크
	@PostMapping("/userResumeCheck/{userNO}")
	@ResponseBody
	public String userResumeCheck(@PathVariable("userNO") int userNO) {
		logger.info("/user/userResumeCheck : POST (사용자 이력서 존재 여부 체크 요청)");
		
		int check = service.userResumeCheck(userNO);
		
		if(check == 1) {
			return "YesResumeCheck";
		} else {
			return "NoResumeCheck";
		}
	}
	
 	
	// 사용자 이력서파일 없이 등록 요청
	@PostMapping("/userResumeNo/{userNO}")
	@ResponseBody
	public String userResumeNo(@PathVariable("userNO") int userNO) {
		logger.info("/user/userResumeNo : POST (이력서 파일 없이 회원가입 요청)");
		
		ResumeVO vo = new ResumeVO();
		vo.setUserNO(userNO);
		
		service.userResume(vo);
		
		return "NoResume";
	}
	
	
	// 이력서 다운로드 요청
	@GetMapping("/userResume/download")
	public void userResumeDownload(@RequestParam("userNO") int userNO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		logger.info("/user/userResume/download : GET (이력서 다운로드 요청)");
		
		// PrintWriter객체를 사용해 알림창을 띄울 때 한글깨짐을 방지하는 부분
		response.setContentType("text/html; charset=UTF-8");
		
		ResumeVO vo = service.userResumeGet(userNO);
		
		// 사용자가 등록한 이력서 파일이 없다면
		if(vo == null || vo.getResumeFilename() == null) {
			// class 파일에서 자바스크립트 경고창을 띄우기 위한 PrintWriter 사용
			PrintWriter writer = response.getWriter();
			writer.print("<script>" + "alert('해당 사용자는 첨부한 이력서가 없습니다.');" + "location.replace('/');" + "</script>");
			writer.flush();
			writer.close();
			
		} else {		// 사용자가 등록한 이력서 파일이 있다면
			File resume = new File(vo.getResumeUploadpath() + "\\" + vo.getResumeFilename());
			
			// 사진을 불러오고자 하는 클라이언트에 해당 사진이 없을 경우
			// 서버에 저장된 사진 파일을 SFTP를 이용하여 다운받아 적혀있는 경로에 저장한 후 그 사진을 불러온다.
			if (!resume.exists()) {

				File folder = new File(vo.getResumeUploadpath());

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
					channelSftp.get("/home/leaf/userResume/" + vo.getResumeFilename(), vo.getResumeUploadpath() + "\\");

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
				byte fileByte[] = FileUtils.readFileToByteArray(resume);
				
				// 파일 다운로드 응답 형식을 설정한다. 어플리케이션  파일이 리턴된다.
				response.setContentType("application/octet-stream");
				// 파일 사이즈 지정
				response.setContentLength(fileByte.length);
				
				// 다운로드 시 파일 원본 이름을 가져와서 원본이름을 적용시킨다.
				response.setHeader("Content-Disposition","attachment; fileName=\"" + URLEncoder.encode(vo.getResumeRealname(), "UTF-8") + "\";");
				// application/octet-stream은 바이너리 데이터이므로 binary로 인코딩해준다.
				response.setHeader("Content-Transfer-Encoding", "binary");
				
				// 버퍼에 파일을 담아 스트림으로 출력한다.
				response.getOutputStream().write(fileByte);
				response.getOutputStream().flush();
				response.getOutputStream().close();

			} else {
				// 파일을 byte 배열로 변환한다.
				byte fileByte[] = FileUtils.readFileToByteArray(resume);
				
				// 파일 다운로드 응답 형식을 설정한다. 어플리케이션  파일이 리턴된다.
				response.setContentType("application/octet-stream");
				// 파일 사이즈 지정
				response.setContentLength(fileByte.length);
				
				// 다운로드 시 파일 원본 이름을 가져와서 원본이름을 적용시킨다.
				response.setHeader("Content-Disposition","attachment; fileName=\"" + URLEncoder.encode(vo.getResumeRealname(), "UTF-8") + "\";");
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
