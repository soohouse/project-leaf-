package com.spring.leaf.archivereply.service;

import java.util.List;
import java.util.Map;

import com.spring.leaf.archivereply.command.ArchiveReplyVO;
import com.spring.leaf.util.PageVO;

//자료실 댓글 서비스 인터페이스 생성 : 2022-08-07

public interface IArchiveReplyService {

	//댓글 등록
	void archiveReplyWrite(ArchiveReplyVO vo);
	
	//댓글 목록
	List<ArchiveReplyVO> archiveReplyList(PageVO vo, int archvieNo);
	
	//댓글 개수
	int archiveReplyTotal(int archvieNo);
	
	//댓글 수정
	void archiveReplyUpdate(int archiveReplyNo, String archiveReplyContent);
	
	//댓글 삭제
	void archiveReplyDelete(int archvieReplyNo);
	
	// 사용자 프로필사진 불러오기 요청
	int rarchivewriterProfile(String archiveReplyWriter, int archiveReplyNo);
}
