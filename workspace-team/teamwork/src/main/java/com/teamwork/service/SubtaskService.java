package com.teamwork.service;

import java.util.List;

import com.teamwork.common.pojo.FriendlyResult;
import com.teamwork.pojo.Subtask;
import com.teamwork.pojo.Task;

public interface SubtaskService {

	List<Subtask> getSubtaskByTasks(List<Task> tasks);
	List<Subtask> getSubtaskByParentId(String id);
	FriendlyResult updateSubtasks(List<Subtask> list, String parentId);
	FriendlyResult deleteSubtaskByParentId(String parentId);
	FriendlyResult updateSubtask(Subtask item);
	FriendlyResult deleteSubtaskById(Long id);
}
