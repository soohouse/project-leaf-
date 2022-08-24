package com.spring.leaf.archivereply.mapper;

import java.util.List;
import java.util.Map;

import com.spring.leaf.archivereply.command.ArchiveReplyVO;


//자료실 댓글 매퍼 인터페이스 생성 : 2022-08-07

public interface IArchiveReplyMapper {

	//댓글 등록
	void archiveReplyWrite(ArchiveReplyVO vo);
	
	//댓글 목록
	List<ArchiveReplyVO> archiveReplyList(Map<String, Object> data);
	
	//댓글 개수
	int archiveReplyTotal(int archvieNo);
	
	//댓글 수정
	void archiveReplyUpdate(ArchiveReplyVO vo);
	
	//댓글 삭제
	void archiveReplyDelete(int archiveReplyNo);
	
	// 사용자 프로필사진 불러오기 요청
	int rarchivewriterProfile(Map<String, Object> rarchiveInfo);
}
