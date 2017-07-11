package com.teamwork.service;

import java.util.List;

import com.teamwork.common.pojo.FriendlyResult;
import com.teamwork.pojo.Task;

public interface TaskService {
	
	FriendlyResult createTask(Task task);
	List<Task> getAllTask();
}
