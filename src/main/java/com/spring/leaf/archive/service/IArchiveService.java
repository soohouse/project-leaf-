package com.spring.leaf.archive.service;

import java.util.List;

import com.spring.leaf.archive.command.ArchiveVO;

//자료실 서비스 인터페이스 : 2022-08-03 생성

public interface IArchiveService {
	
	//자료실 글 등록
	void archiveWrite(ArchiveVO vo);
			
	//자료실 글 목록
	List<ArchiveVO> archiveList();
			
	//자료실 상세보기
	ArchiveVO archiveContent(int archiveNo);
			
	//자료실 수정
	void archiveModify(ArchiveVO vo);
			
	//자료실 삭제
	void archiveDelete(int archiveNo);

}
