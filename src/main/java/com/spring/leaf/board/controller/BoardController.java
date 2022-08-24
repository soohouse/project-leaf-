package com.spring.leaf.board.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Calendar;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import com.spring.leaf.board.command.BoardVO;
import com.spring.leaf.board.command.BoardWriterVO;
import com.spring.leaf.board.service.IBoardService;
import com.spring.leaf.boardreply.service.IBoardReplyService;
import com.spring.leaf.user.command.UserProfileVO;
import com.spring.leaf.user.command.UserVO;
import com.spring.leaf.user.controller.UserController;
import com.spring.leaf.util.PageCreator;
import com.spring.leaf.util.PageVO;


// free 컨트롤러 : 2022-07-30 생성

@Controller
@RequestMapping("/board")
public class BoardController {
	
	// 로그 출력을 위한 Logger 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	//자유게시판 서비스 연결
	@Autowired
	private IBoardService service;
	
	//자유게시판 댓글 전체개수 불러오기 위해 사용
	@Autowired
	private IBoardReplyService rservice;
	
	
	//자유게시판 목록 페이지로 이동 요청
	@GetMapping("/boardList")
	public String boardList(PageVO vo, Model model) {
		
		//페이징
		System.out.println(vo);
		PageCreator pc = new PageCreator();
		pc.setPaging(vo);
		pc.setArticleTotalCount(service.getTotal(vo));
		System.out.println(pc);
		
		//현재시간 구하기 (뉴마크) https://mingbocho.tistory.com/11참고
	    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	    Calendar cal = Calendar.getInstance();
	    cal.add(Calendar.DAY_OF_MONTH, -1); //게시글 등록 후 1일간 뉴마크 표시.
	    String nowday = format.format(cal.getTime());
	    
	    model.addAttribute("nowday",nowday);
		model.addAttribute("boardList", service.boardList(vo));
		model.addAttribute("pc", pc);
		
		return "/board/free_list";
	}
	
	//자유게시판 글쓰기 페이지로 이동 요청
	@GetMapping("/boardWrite")
	public String boardWrite() {
		return "/board/free_write";
	}
	
	//글쓰기 요청
	@PostMapping("/boardWrite")
	public String boardWrite(BoardVO vo) {
		
		service.boardWrite(vo);
		
		return "redirect:/board/boardList";
	}
	
	//글 상세보기
	@GetMapping("/boardContent/{boardNo}")
	public String boardContent(@PathVariable int boardNo, Model model) {
	
		BoardVO vo = service.boardContent(boardNo);
		
		BoardWriterVO writerNumbers = service.boardwriterProfile(vo.getBoardWriter(), boardNo);
		
		model.addAttribute("board", vo);
		model.addAttribute("boardWriterNumbers", writerNumbers);
		
//		UserProfileVO writerProfile = service.boardwriterProfile(userNO);
//		model.addAttribute("writerprofile", writerProfile);
		
		//댓글수
		int ReplyTotal = rservice.boardReplyTotal(boardNo);
		model.addAttribute("boardReplyCount", ReplyTotal);
		
		// 조회수 증가
		service.boardViews(boardNo);
		
		return "board/free_content";
	}
	
	//글 수정 페이지 이동
	@GetMapping("/boardModify")
	public String boardModify(@RequestParam("boardNo") int boardNo, Model model) {
		
		model.addAttribute("board", service.boardContent(boardNo));
		
		return "board/free_modify";
	}
	
	//글 수정 처리
	@PostMapping("/boardUpdate")
	public String boardUpdate(BoardVO vo, RedirectAttributes ra) {
		
		service.boardModify(vo);
		ra.addFlashAttribute("msg", "수정하였습니다!");
		return "redirect:/board/boardContent/" + vo.getBoardNo();
	}
	
	//글 삭제 처리
	@PostMapping("/boardDelete")
	public String boardDelete(BoardVO vo, RedirectAttributes ra) {
		
		service.boardDelete(vo.getBoardNo());
		ra.addFlashAttribute("msg", "삭제하였습니다!");
		return "redirect:/board/boardList";
	}
	
	/*
	//글쓴이 프로필사진 불러오기 요청
	@GetMapping("/boardwriterProfile")
	public ResponseEntity<byte[]> boardwriterProfile(int userNO) throws Exception {
		logger.info("/board/boardwriterProfile : GET (프로필사진 불러오기 요청)");
		
		UserProfileVO vo = service.boardwriterProfile(userNO);
		
		// 사용자가 등록한 프로필사진이 없을 경우
		if(vo.getUserProfileFilename() == null) {
			ResponseEntity<byte[]> result = null;
			
			// 기본 프로필사진을 불러온다.
			File noProfile = new File("C:/leaf/Leaf/src/main/webapp/resources/img/profile.png");
			
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
	*/
	
}
