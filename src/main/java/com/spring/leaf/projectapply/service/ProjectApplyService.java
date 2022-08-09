package com.spring.leaf.projectapply.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.projectapply.command.ApplyVO;
import com.spring.leaf.projectapply.mapper.IProjectApplyMapper;


@Service
public class ProjectApplyService implements IProjectApplyService {
	
	private static final Logger logger = LoggerFactory.getLogger(ProjectApplyService.class);
	
	@Autowired
	private IProjectApplyMapper mapper;
	
	@Override
	public void projectapply(ApplyVO vo) {
		mapper.projectapply(vo);
	}

}
