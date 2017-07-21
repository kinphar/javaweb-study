package com.teamwork.service;

import java.util.List;

import com.teamwork.common.pojo.FriendlyResult;
import com.teamwork.common.pojo.NewTaskInfo;
import com.teamwork.common.pojo.TaskQuery;
import com.teamwork.pojo.Task;

public interface TaskService {
	
	FriendlyResult createTask(NewTaskInfo newTaskInfo);
	List<Task> getAllTask();
	List<Task> getTaskByFilter(TaskQuery taskQuery);
	FriendlyResult deleteTask(String id);
	Task getTaskById(String id);
	int getTaskNumByStatus(String status);
	String getTaskStatusById(String id);
}
