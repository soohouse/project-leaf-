package com.spring.leaf.project.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

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
import com.spring.leaf.company.command.CompanyLogoVO;
import com.spring.leaf.company.command.CompanyVO;
import com.spring.leaf.project.command.ProjectContentVO;
import com.spring.leaf.project.command.ProjectImageVO;
import com.spring.leaf.project.command.ProjectLikeVO;
import com.spring.leaf.project.command.ProjectVO;
import com.spring.leaf.project.service.IProjectService;
import com.spring.leaf.projectapply.command.ApplyVO;
import com.spring.leaf.projectapply.service.IProjectApplyService;
import com.spring.leaf.user.command.UserProfileVO;
import com.spring.leaf.user.command.UserVO;


@Controller
@RequestMapping("/project")
public class ProjectController {
	@Autowired
	private IProjectService service;
	
	@Autowired
	private IProjectApplyService aservice;
	
	//프로젝트 목록 
	@GetMapping("/project")
	public String project(Model model) {
		
		model.addAttribute("projectlist", service.projectlist());
		
		return "project/project-list";
	}
	
	//프로젝트 상세보기
	@GetMapping("/projectview")
	public String project1(@RequestParam int projectNO, HttpSession session, Model model) {
		
		if(session.getAttribute("user") != null) {
			UserVO vo = (UserVO) session.getAttribute("user");
			
			ApplyVO avo = aservice.applyGet(projectNO, vo.getUserNO());
			
			model.addAttribute("apply", avo);
		} 
		
		if(session.getAttribute("company") != null) {
			CompanyVO vo = (CompanyVO) session.getAttribute("company");
			
			model.addAttribute("companyNO", vo.getCompanyNO());
		}
		
		model.addAttribute("projectview", service.getContent(projectNO));
		model.addAttribute("projectPassCount", aservice.applyPassCount(projectNO));
		
		// 조회수 증가
		aservice.projectViewCount(projectNO);
		
		return "project/project-view";
	}
	
	
	// 좋아요 버튼 클릭 처리
	@PostMapping("/projectview")
	@ResponseBody
	public String likeConfirm(@RequestBody ProjectLikeVO vo) {
		System.out.println(vo.getProjectNO());
		System.out.println(vo.getUserNo());
		
		int result = service.searchLike(vo);
		if(result == 0) {
			service.createLike(vo);
			return "like";
		} else {
			service.deleteLike(vo);
			return "delete";
		}
	}
	
	//기업 - 프로젝트 등록하기
	@GetMapping("/projectputin")
	public String project2() {
		return "company_mypage/projectreg";
	}
	// 지원 후 목록 창 이동 
	@PostMapping("/projectputin")
	public String projectputin(ProjectVO vo) {
		service.projectputin(vo);
		return "redirect:/project/project";
	}
	
	//프로젝트 관리 창 
	@GetMapping("/projectadmin")
	public String project5(Model model) {
		
		model.addAttribute("projectlist", service.projectlist());
		
		return "project/project-admin";
	}
	
	// 프로젝트 상세보기 수정하기 이동 요청
	@GetMapping("/projectviewfix")
	public String project4(@RequestParam int projectNO, Model model) {

		model.addAttribute("projectview", service.getContent(projectNO));

		return "project/project-view-fix";
	}
	
	//프로젝트 상세보기 수정 로직
	@PostMapping("/updateProjectContent")
	public String UpdateProjectCondent(ProjectContentVO vo,RedirectAttributes ra) {
		
		service.updateProjectContent(vo);
		
		ra.addFlashAttribute("msg", "수정이 완료되었습니다.");
		return "redirect:/project/projectview";
		
	}

	
	// 프로젝트 번호 구하기 요청
	@PostMapping("/projectNOGet")
	@ResponseBody
	public int projectNOGet() {
		
		int projectNO = service.projectNOGet();

		return projectNO;
	}
	
  
  // 기업 프로젝트 목록 상세보기 창 
	@GetMapping("/projectviewcompany")
	public String project5(@RequestParam int projectNO, Model model) {
			
		model.addAttribute("projectview", service.getContent(projectNO));
			
		return "project/project-view-company";
	}
  
	
	// 사용자 프로필사진 등록 요청
	@PostMapping("/projectImage/{projectNO}")
	@ResponseBody
	public String projectImage(@RequestParam("projectImage") MultipartFile image, @PathVariable("projectNO") int projectNO)
			throws Exception {

		// 날짜별로 폴더를 생성해서 파일을 관리한다.
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");

		Date date = new Date();

		String location = sdf.format(date);

		// 저장할 폴더 경로
		String uploadPath = "C:\\projectImage\\" + location;

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
		String realName = image.getOriginalFilename();
		// 확장자 추출
		String extention = realName.substring(realName.indexOf("."), realName.length());

		// 고유한 문자와 확장자를 합쳐 새로운 랜덤이름의 파일이름을 만들어준다.
		String name = uuids + extention;

		// 업로드한 파일을 서버 컴퓨터 내의 지정한 경로로 실제 저장
		File saveFile = new File(uploadPath + "\\" + name);

		try {
			image.transferTo(saveFile);
		} catch (IOException e) {
			e.printStackTrace();
		}

		// 받은 파일의 정보를 ProjectImageVO 안에 넣고 데이터베이스에 저장한다.
		ProjectImageVO vo = new ProjectImageVO();
		vo.setProjectImageFilename(name);
		vo.setProjectImageUploadpath(uploadPath);
		vo.setProjectImageRealname(realName);
		vo.setProjectNO(projectNO);

		service.projectImage(vo);

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
			channelSftp.put(uploadPath + "\\" + name, "/home/leaf/projectImage");

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

		return "YesImage";
	}

	
	// 프로젝트 사진 불러오기 요청
	@GetMapping("/projectImageGet")
	public ResponseEntity<byte[]> projectImageGet(int projectNO) throws Exception {
		
		ProjectImageVO vo = service.projectImageGet(projectNO);

		// 받은 업로드 경로와 파일 이름으로 파일 객체를 선언한다.
		File image = new File(vo.getProjectImageUploadpath() + "\\" + vo.getProjectImageFilename());
		
		// 사진을 불러오고자 하는 클라이언트에 해당 사진이 없을 경우
		// 서버에 저장된 사진 파일을 SFTP를 이용하여 다운받아 적혀있는 경로에 저장한 후 그 사진을 불러온다.
		if (!image.exists()) {

			File folder = new File(vo.getProjectImageUploadpath());

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
				channelSftp.get("/home/leaf/projectImage/" + vo.getProjectImageFilename(), vo.getProjectImageUploadpath() + "\\");

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
				headers.add("Content-Type", Files.probeContentType(image.toPath()));

				// ResponseEntity<>(응답 객체에 담을 내용, 헤더에 담을 내용, 상태 메세지)
				// FileCopyUtils : 파일 및 스트림 데이터 복사를 위한 간단한 유틸리티 메소드의 집합체
				// file 객체 안에 있는 내용을 복사하여 byte 배열로 변환한 후 바디에 담아 화면에 전달한다.
				// 만약 리턴이 ResponseEntity<byte[]>가 아니라 그냥 byte[]라면
				// FileCopyUtils.copyToByteArray(file)만 써주면 된다.
				result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(image), headers, HttpStatus.OK);

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
				headers.add("Content-Type", Files.probeContentType(image.toPath()));

				// ResponseEntity<>(응답 객체에 담을 내용, 헤더에 담을 내용, 상태 메세지)
				// FileCopyUtils : 파일 및 스트림 데이터 복사를 위한 간단한 유틸리티 메소드의 집합체
				// file 객체 안에 있는 내용을 복사하여 byte 배열로 변환한 후 바디에 담아 화면에 전달한다.
				// 만약 리턴이 ResponseEntity<byte[]>가 아니라 그냥 byte[]라면
				// FileCopyUtils.copyToByteArray(file)만 써주면 된다.
				result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(image), headers, HttpStatus.OK);

			} catch (IOException e) {
				e.printStackTrace();
			}

			return result;
		}
		
	}
}
