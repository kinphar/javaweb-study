package com.teamwork.service;

import java.util.List;

import com.teamwork.pojo.Task;
import com.teamwork.pojo.TaskCheckList;

public interface TaskCheckListService {

	List<TaskCheckList> getCheckListByTasks(List<Task> tasks);
	List<TaskCheckList> getCheckListByParentId(String id);
}
