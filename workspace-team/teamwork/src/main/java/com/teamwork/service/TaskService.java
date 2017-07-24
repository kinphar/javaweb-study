package com.teamwork.service;

import java.util.List;

import com.teamwork.common.pojo.FriendlyResult;
import com.teamwork.common.pojo.TaskQuery;
import com.teamwork.pojo.Task;

public interface TaskService {
		
	Task getTaskById(String id);
	int getTaskNumByStatus(String status);
	List<Task> getAllTask();
	List<Task> getTaskByFilter(TaskQuery taskQuery);
	String getTaskStatusById(String id);
	List<Integer> getTaskNumByFilter(TaskQuery taskQuery);
	
	FriendlyResult deleteTaskById(String id);
	FriendlyResult updateTask(Task task);
	FriendlyResult createTask(Task task);

}
