package com.spring.leaf.archive.service;

import java.util.List;

import com.spring.leaf.archive.command.ArchiveContentVO;
import com.spring.leaf.archive.command.ArchiveFileVO;
import com.spring.leaf.archive.command.ArchiveVO;
import com.spring.leaf.util.PageVO;

//자료실 서비스 인터페이스 : 2022-08-03 생성

public interface IArchiveService {
	
	//자료실 글 등록
	void archiveWrite(ArchiveVO vo);
			
	//자료실 글 목록
	List<ArchiveVO> archiveList(PageVO vo);
	
	//자료실 글 총 수
	int archiveTotal(PageVO vo);
			
	//자료실 상세보기
	ArchiveContentVO archiveContent(int archiveNo);
			
	//자료실 수정
	void archiveModify(ArchiveVO vo);
	void archiveFileModify(ArchiveFileVO fvo);
	
			
	//자료실 삭제
	void archiveDelete(int archiveNo);
	void archiveFileDelete(int archiveNo);
	
	//자료실 첨부파일 등록 요청
	void archiveFile(ArchiveFileVO vo);
	
	//자료실 첨부파일 얻어오기 요청
	ArchiveFileVO archiveFileGet(int archiveNo);
	
	//자료실 번호 끌어오기
	int archiveNoGet ();


}
