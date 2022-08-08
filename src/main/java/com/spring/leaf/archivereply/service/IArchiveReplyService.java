package com.spring.leaf.archivereply.service;

import java.util.List;

import com.spring.leaf.archivereply.command.ArchiveReplyVO;


//자료실 댓글 서비스 인터페이스 생성 : 2022-08-07

public interface IArchiveReplyService {

	//댓글 등록
	void archiveReplyWrite(ArchiveReplyVO vo);
	
	//댓글 목록
	List<ArchiveReplyVO> archiveReplyList(int archiveReplyNo);
	
	//댓글 개수
	int archiveReplyTotal(int archvieReplyNo);
	
	//댓글 수정
	
	//댓글 삭제
}
