package com.spring.leaf.archive.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.archive.command.ArchiveContentVO;
import com.spring.leaf.archive.command.ArchiveFileVO;
import com.spring.leaf.archive.command.ArchiveVO;
import com.spring.leaf.archive.mapper.IArchiveMapper;

//자료실 서비스 : 2022-08-03 생성

@Service
public class ArchiveService implements IArchiveService {

	@Autowired
	private IArchiveMapper mapper;
	
	//자료실 글 등록
	@Override
	public void archiveWrite(ArchiveVO vo) {
		mapper.archiveWrite(vo);
	}
	
	//자료실 글 목록
	@Override
	public List<ArchiveVO> archiveList() {
		
		List<ArchiveVO> list = mapper.archiveList();

		return list;
	}

	//자료실 상세보기
	@Override
	public ArchiveContentVO archiveContent(int archiveNo) {

		return mapper.archiveContent(archiveNo);
	}

	//자료실 수정
	@Override
	public void archiveModify(ArchiveVO vo) {

		mapper.archiveModify(vo);
	}

	//자료실 삭제
	@Override
	public void archiveDelete(int archiveNo) {

		mapper.archiveDelete(archiveNo);
	}
	
	//자료실 첨부파일 등록 요청
	@Override
	public void archiveFile(ArchiveFileVO vo) {
		mapper.archiveFile(vo);
		
	}
	
	//자료실 첨부파일 얻어오기 요청
	@Override
	public ArchiveFileVO archiveFileGet(int archiveNo) {
		return mapper.archiveFileGet(archiveNo);
	}
	
	//자료실 글번호 끌어오기
	@Override
	public int archiveNoGet() {

		return mapper.archiveNoGet();
	}

}
