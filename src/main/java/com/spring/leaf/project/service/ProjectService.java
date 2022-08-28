package com.spring.leaf.project.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.leaf.project.command.ProjectContentVO;
import com.spring.leaf.project.command.ProjectDateVO;
import com.spring.leaf.project.command.ProjectImageVO;
import com.spring.leaf.project.command.ProjectLikeVO;
import com.spring.leaf.project.command.ProjectListVO;
import com.spring.leaf.project.command.ProjectRegistCountVO;
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
	
	@Override
	public List<ProjectListVO> projectadmin(int companyNO) {
		return mapper.projectadmin(companyNO);
	}
	//프로젝트 상세보기 
	@Override
	public ProjectContentVO getContent(int projectNO){
		
		return mapper.getContent(projectNO);		
	}
	
	@Override
	public void updateProjectContent(ProjectContentVO vo) {
		mapper.updateProjectContent(vo);
		
	}
	
	
	@Override
	public int projectNOGet() {
		return mapper.projectNOGet();
	}
	
	
	@Override
	public void projectImage(ProjectImageVO vo) {
		mapper.projectImage(vo);
	}
	
	
	@Override
	public ProjectImageVO projectImageGet(int projectNO) {
		return mapper.projectImageGet(projectNO);
	}
	
	@Override
	public void projectImageUpdate(ProjectImageVO vo) {
		
		mapper.projectImageUpdate(vo);
	}
	
	@Override
	public void projectImageDelete(int projectNO) {
		
		mapper.projectImageDelete(projectNO);
	}
	
	@Override
	public ProjectRegistCountVO projectRegistCount(int companyNO) {
		return mapper.projectRegistCount(companyNO);
	}
	
	
	@Override
	public ProjectDateVO projectDate() {
		return mapper.projectDate();
	}
	
	
	//좋아요 생성
	@Override
	public void createLike(ProjectLikeVO vo) {
		mapper.createLike(vo);
	}
	//좋아요 삭제
	@Override
	public void deleteLike(ProjectLikeVO vo) {
		mapper.deleteLike(vo);
	}
	//좋아요 검색
	@Override
	public int searchLike(ProjectLikeVO vo) {
		return mapper.searchLike(vo);
	}
	
	@Override
	public void deleteProject(ProjectVO vo) {
		mapper.deleteProject(vo);
		
	}
}