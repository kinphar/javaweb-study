package com.teamwork.common.pojo;

import java.util.List;

import com.teamwork.pojo.Task;
import com.teamwork.pojo.TaskCheckList;

public class NewTaskInfo {
	
	private Task task;
	private List<TaskCheckList> checkList;
	
	public Task getTask() {
		return task;
	}
	public void setTask(Task task) {
		this.task = task;
	}
	public List<TaskCheckList> getCheckList() {
		return checkList;
	}
	public void setCheckList(List<TaskCheckList> checkList) {
		this.checkList = checkList;
	}
}
