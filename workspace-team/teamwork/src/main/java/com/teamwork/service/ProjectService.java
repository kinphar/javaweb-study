package com.teamwork.service;

import java.util.List;

import com.teamwork.common.pojo.FriendlyResult;
import com.teamwork.pojo.Project;

public interface ProjectService {
	
	List<Project> getAllProject();
	FriendlyResult createProject(Project project);
}
