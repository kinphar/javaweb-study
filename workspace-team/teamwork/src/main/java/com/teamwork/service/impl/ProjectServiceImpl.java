package com.teamwork.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamwork.common.pojo.FriendlyResult;
import com.teamwork.common.utils.IDUtils;
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

	@Override
	public FriendlyResult createProject(Project project) {
		Date date = new Date();
		String id = IDUtils.genIdStartWith("P");
		
		project.setId(id);
		project.setCreateDate(date);
		project.setUpdateDate(date);
		project.setExpectFinishDate(date);
		project.setDelFlag("0");
		project.setStatus("0");
		project.setProgress("0%");
		projectMapper.insert(project);
		return FriendlyResult.ok();
	}
}

