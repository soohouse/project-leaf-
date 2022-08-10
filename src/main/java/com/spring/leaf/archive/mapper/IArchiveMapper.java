package com.spring.leaf.archive.mapper;

import java.util.List;

import com.spring.leaf.archive.command.ArchiveFileVO;
import com.spring.leaf.archive.command.ArchiveVO;

//자료실 매퍼 인터페이스 : 2022-08-03 생성

public interface IArchiveMapper {

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
		
		//자료실 첨부파일 등록 요청
		void archiveFile(ArchiveFileVO vo);
		
		//자료실 첨부파일 얻어오기 요청
		ArchiveFileVO archiveFileGet(int archiveNo);
		
		//자료실 번호 끌어오기
		int archiveNoGet ();
}
