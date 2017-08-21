package com.teamwork.common.pojo;

import java.util.List;

import com.teamwork.pojo.Subtask;
import com.teamwork.pojo.Task;

public class NewTaskInfo {
	
	private Task task;
	private List<Subtask> subtask;
	
	public Task getTask() {
		return task;
	}
	public void setTask(Task task) {
		this.task = task;
	}
	public List<Subtask> getSubtask() {
		return subtask;
	}
	public void setSubtask(List<Subtask> subtask) {
		this.subtask = subtask;
	}
}
