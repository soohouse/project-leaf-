package com.spring.leaf.archive.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.archive.command.ArchiveContentVO;
import com.spring.leaf.archive.command.ArchiveFileVO;
import com.spring.leaf.archive.command.ArchiveVO;
import com.spring.leaf.archive.command.ArchiveWriterVO;
import com.spring.leaf.archive.mapper.IArchiveMapper;
import com.spring.leaf.util.PageVO;

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
	public List<ArchiveVO> archiveList(PageVO vo) {
		
		List<ArchiveVO> list = mapper.archiveList(vo);

		return list;
	}
	
	@Override
	public int archiveTotal(PageVO vo) {
		return mapper.archiveTotal(vo);
	}

	//자료실 상세보기
	@Override
	public ArchiveContentVO archiveContent(int archiveNo) {

		return mapper.archiveContent(archiveNo);
	}
	
	//자료실 프로필 사진 불러오기
	@Override
	public ArchiveWriterVO archivewriterProfile(String archiveWriter, int archiveNo) {
		
		Map<String, Object> archiveInfo = new HashMap<>();
		
		archiveInfo.put("archiveWriter",archiveWriter);
		archiveInfo.put("archiveNo",archiveNo);
		
		return mapper.archivewriterProfile(archiveInfo);
	}

	//자료실 수정
	@Override
	public void archiveModify(ArchiveVO vo) {

		mapper.archiveModify(vo);
	}
	
	//자료실 파일 수정
	@Override
	public void archiveFileModify(ArchiveFileVO fvo) {
		
		mapper.archiveFileModify(fvo);
		
	}

	//자료실 삭제
	@Override
	public void archiveDelete(int archiveNo) {

		mapper.archiveDelete(archiveNo);
	}
	
	//자료실 파일 삭제
	@Override
	public void archiveFileDelete(int archiveNo) {
		mapper.archiveFileDelete(archiveNo);
		
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
	
	
	@Override
	public int archiveViews(int archiveNo) {
		return mapper.archiveViews(archiveNo);
	}
	

}
