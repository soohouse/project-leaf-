package com.spring.leaf.archivereply.mapper;

import java.util.List;

import com.spring.leaf.archivereply.command.ArchiveReplyVO;


//자료실 댓글 매퍼 인터페이스 생성 : 2022-08-07

public interface IArchiveReplyMapper {

	//댓글 등록
	void archiveReplyWrite(ArchiveReplyVO vo);
	
	//댓글 목록
	List<ArchiveReplyVO> archiveReplyList(int archiveReplyNo);
	
	//댓글 개수
	int archiveReplyTotal(int archvieReplyNo);
	
	//댓글 수정
	void archiveReplyUpdate(int archiveReplyNo);
	
	//댓글 삭제
	void archiveReplyDelete(int archiveReplyNo);
}
