package com.spring.leaf.archivereply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.archivereply.command.ArchiveReplyVO;
import com.spring.leaf.archivereply.mapper.IArchiveReplyMapper;

//자료실 댓글 서비스 생성 : 2022-08-07  (ArchiveReplyService)

@Service
public class ArchiveReplyService implements IArchiveReplyService {

	@Autowired
	private IArchiveReplyMapper mapper;
	
	//댓글 작성
	public void archiveReplyWrite(ArchiveReplyVO vo) {
		mapper.archiveReplyWrite(vo);
	}

	//댓글 목록
	@Override
	public List<ArchiveReplyVO> archiveReplyList(int archiveReplyNo) {
		return mapper.archiveReplyList(archiveReplyNo);
	}

	@Override
	public int archiveReplyTotal(int archvieReplyNo) {
		return mapper.archiveReplyTotal(archvieReplyNo);
	}

	@Override
	public void archiveReplyUpdate(int archiveReplyNo) {
		mapper.archiveReplyUpdate(archiveReplyNo);
	}

	@Override
	public void archiveReplyDelete(int archiveReplyNo) {
		mapper.archiveReplyDelete(archiveReplyNo);
	}

}
