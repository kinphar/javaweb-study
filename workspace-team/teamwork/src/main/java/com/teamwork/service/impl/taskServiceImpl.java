package com.teamwork.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.teamwork.common.pojo.FriendlyResult;
import com.teamwork.common.pojo.TaskQuery;
import com.teamwork.common.utils.IDUtils;
import com.teamwork.mapper.TaskMapper;
import com.teamwork.pojo.Task;
import com.teamwork.pojo.TaskExample;
import com.teamwork.pojo.TaskExample.Criteria;
import com.teamwork.service.TaskService;

@Service
public class taskServiceImpl implements TaskService {
	
	@Autowired
	private TaskMapper taskMapper;

	@Override
	public FriendlyResult createTask(Task task) {
		
		task.setId(IDUtils.genTaskId());	

		Date date = new Date();
		task.setCreateDate(date);
		task.setUpdageDate(date);
		task.setProgress("0");
		taskMapper.insert(task);
		return FriendlyResult.ok();
	}

	@Override
	public List<Task> getAllTask() {
		TaskExample example = new TaskExample();		
		return taskMapper.selectByExample(example);
	}

	@Override
	public List<Task> getTaskByFilter(TaskQuery taskQuery) {
		TaskExample example = new TaskExample();		
		Criteria createCriteria = example.createCriteria();
		
		if (taskQuery.getQueryTask() != null) {
			String projectName = taskQuery.getQueryTask().getProjectName();
			if (!StringUtils.isBlank(projectName) && !projectName.equals("所有项目")) {
				createCriteria.andProjectNameEqualTo(projectName);
			}
			String assignTo = taskQuery.getQueryTask().getAssignTo();
			if (!StringUtils.isBlank(assignTo) && !assignTo.equals("所有人")) {
				createCriteria.andAssignToEqualTo(assignTo);
			}
			String status = taskQuery.getQueryTask().getStatus();
			if (!StringUtils.isBlank(status) && !status.equals("10000")) {
				createCriteria.andStatusEqualTo(status);
			}
		}

		return taskMapper.selectByExample(example);
	}
}
