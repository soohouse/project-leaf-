package com.spring.leaf.project.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.project.command.ProjectContentVO;
import com.spring.leaf.project.command.ProjectLikeVO;
import com.spring.leaf.project.command.ProjectListVO;
import com.spring.leaf.project.command.ProjectVO;
import com.spring.leaf.project.mapper.IProjectMapper;

@Service
public class ProjectService implements IProjectService {

	private static final Logger logger = LoggerFactory.getLogger(ProjectService.class);

	@Autowired
	private IProjectMapper mapper;
	//프로젝트 등록 매퍼
	@Override
	public void projectputin(ProjectVO vo) {
		mapper.projectputin(vo);
	}
	//프로젝트 목록 매퍼
	@Override
	public List<ProjectListVO> projectlist() {
		List<ProjectListVO> list = mapper.projectlist();
		
		return list;
	}
	//프로젝트 상세보기 
	@Override
	public ProjectContentVO getContent(int projectNO){
		
		return mapper.getContent(projectNO);		
	}
	@Override
	public void createLike(ProjectLikeVO vo) {
		mapper.createLike(vo);
	}
	@Override
	public void deleteLike(ProjectLikeVO vo) {
		mapper.deleteLike(vo);
	}
	@Override
	public int searchLike(ProjectLikeVO vo) {
		return mapper.searchLike(vo);
	}
}