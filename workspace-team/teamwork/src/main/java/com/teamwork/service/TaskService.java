package com.teamwork.service;

import com.teamwork.common.pojo.FriendlyResult;
import com.teamwork.pojo.Task;

public interface TaskService {
	
	FriendlyResult createTask(Task task);
	
}
