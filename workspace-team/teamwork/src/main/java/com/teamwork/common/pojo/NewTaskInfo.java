package com.teamwork.common.pojo;

import java.util.List;

import com.teamwork.pojo.Task;
import com.teamwork.pojo.TaskChecklist;

public class NewTaskInfo {
	
	private Task task;
	private List<TaskChecklist> checkList;
	
	public Task getTask() {
		return task;
	}
	public void setTask(Task task) {
		this.task = task;
	}
	public List<TaskChecklist> getCheckList() {
		return checkList;
	}
	public void setCheckList(List<TaskChecklist> checkList) {
		this.checkList = checkList;
	}
}
