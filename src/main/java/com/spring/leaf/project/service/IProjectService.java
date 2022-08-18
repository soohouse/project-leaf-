package com.spring.leaf.project.service;

import java.util.List;

import com.spring.leaf.project.command.ProjectContentVO;
import com.spring.leaf.project.command.ProjectImageVO;
import com.spring.leaf.project.command.ProjectLikeVO;
import com.spring.leaf.project.command.ProjectListVO;
import com.spring.leaf.project.command.ProjectVO;

public interface IProjectService {
	void projectputin(ProjectVO vo);
	
	List<ProjectListVO> projectlist();

	ProjectContentVO getContent(int projectNO);
	
	int projectNOGet();
	
	void projectImage(ProjectImageVO vo);
	
	ProjectImageVO projectImageGet(int projectNO);
	
	int searchLike(ProjectLikeVO vo);
	
	void createLike(ProjectLikeVO vo);
	
	void deleteLike(ProjectLikeVO vo);
	
	void deleteProject(ProjectVO vo);
	
}
