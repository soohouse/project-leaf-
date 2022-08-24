package com.spring.leaf.archivereply.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.archivereply.command.ArchiveReplyVO;
import com.spring.leaf.archivereply.mapper.IArchiveReplyMapper;
import com.spring.leaf.util.PageVO;

//자료실 댓글 서비스 생성 : 2022-08-07  (ArchiveReplyService)

@Service
public class ArchiveReplyService implements IArchiveReplyService {

	@Autowired
	private IArchiveReplyMapper mapper;
	
	//댓글 작성
	public void archiveReplyWrite(ArchiveReplyVO vo) {
		//댓글줄바꿈
		vo.setArchiveReplyContent(vo.getArchiveReplyContent().replace("\n", "<br>"));
		
		mapper.archiveReplyWrite(vo);
	}

	//댓글 목록
	@Override
	public List<ArchiveReplyVO> archiveReplyList(PageVO vo, int archiveNo) {
		Map<String, Object> data = new HashMap<>();
		data.put("paging", vo);
		data.put("archiveNo", archiveNo);
		
		return mapper.archiveReplyList(data);
	}
	
	//자료실 댓글 프로필 사진 불러오기
	@Override
	public int rarchivewriterProfile(String archiveReplyWriter, int archiveReplyNo) {
		
		Map<String, Object> rarchiveInfo = new HashMap<>();
		
		rarchiveInfo.put("archiveReplyWriter", archiveReplyWriter);
		rarchiveInfo.put("archiveReplyNo", archiveReplyNo);
		
		return mapper.rarchivewriterProfile(rarchiveInfo);
	}

	//댓글 개수
	@Override
	public int archiveReplyTotal(int archvieReplyNo) {
		return mapper.archiveReplyTotal(archvieReplyNo);
	}

	//댓글 수정
	@Override
	public void archiveReplyUpdate(int archiveReplyNo, String archiveReplyContent) {
		ArchiveReplyVO vo = new ArchiveReplyVO();
		vo.setArchiveReplyNo(archiveReplyNo);
		vo.setArchiveReplyContent(archiveReplyContent);
		
		//댓글줄바꿈
		vo.setArchiveReplyContent(vo.getArchiveReplyContent().replace("\n", "<br>"));
		
		mapper.archiveReplyUpdate(vo);
	}

	//댓글 삭제
	@Override
	public void archiveReplyDelete(int archiveReplyNo) {
		mapper.archiveReplyDelete(archiveReplyNo);
	}

}
