package com.teamwork.common.pojo;

import java.util.List;

import com.teamwork.pojo.Project;
import com.teamwork.pojo.Task;
import com.teamwork.pojo.User;

public class TaskQuery {
		
	private List<Project> selectProjects;
	private List<User> selectUsers;
	private Task queryTask;
	
	public List<Project> getSelectProjects() {
		return selectProjects;
	}
	public void setSelectProjects(List<Project> selectProjects) {
		this.selectProjects = selectProjects;
	}
	public List<User> getSelectUsers() {
		return selectUsers;
	}
	public void setSelectUsers(List<User> selectUsers) {
		this.selectUsers = selectUsers;
	}
	public Task getQueryTask() {
		return queryTask;
	}
	public void setQueryTask(Task queryTask) {
		this.queryTask = queryTask;
	}
}
