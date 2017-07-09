package com.teamwork.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamwork.mapper.ProjectMapper;
import com.teamwork.pojo.Project;
import com.teamwork.pojo.ProjectExample;
import com.teamwork.service.ProjectService;

@Service
public class ProjectServiceImpl implements ProjectService {
	
	@Autowired
	private ProjectMapper projectMapper;

	@Override
	public List<Project> getAllProject() {		
		ProjectExample example = new ProjectExample();
		return projectMapper.selectByExample(example);
	}
}
