package com.teamwork.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamwork.common.pojo.FriendlyResult;
import com.teamwork.common.pojo.NewTaskInfo;
import com.teamwork.common.pojo.TaskQuery;
import com.teamwork.common.utils.IDUtils;
import com.teamwork.mapper.TaskCheckListMapper;
import com.teamwork.mapper.TaskMapper;
import com.teamwork.pojo.Task;
import com.teamwork.pojo.TaskCheckList;
import com.teamwork.pojo.TaskCheckListExample;
import com.teamwork.pojo.TaskExample;
import com.teamwork.pojo.TaskExample.Criteria;
import com.teamwork.service.TaskService;

@Service
public class taskServiceImpl implements TaskService {
	
	@Autowired
	private TaskMapper taskMapper;
	@Autowired
	private TaskCheckListMapper taskCheckListMapper;

	@Override
	public FriendlyResult createTask(NewTaskInfo newTaskInfo) {		
		Task taskBase = newTaskInfo.getTask();
		String taskId = IDUtils.genTaskId();
		taskBase.setId(taskId);	

		Date date = new Date();
		taskBase.setCreateDate(date);
		taskBase.setUpdateDate(date);
		taskBase.setProgress("0");
		taskBase.setDelFlag("0");
		taskMapper.insert(taskBase);
		
		List<TaskCheckList> list = newTaskInfo.getCheckList();
		for (TaskCheckList item : list) {		
			item.setParentId(taskId);
			item.setCreateDate(date);
			item.setUpdateDate(date);
			item.setDelFlag("0");
			taskCheckListMapper.insert(item);
		}
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
			if (!StringUtils.isBlank(projectName) && !projectName.equals("all")) {
				createCriteria.andProjectNameEqualTo(projectName);
			}
			String assignTo = taskQuery.getQueryTask().getAssignTo();
			if (!StringUtils.isBlank(assignTo) && !assignTo.equals("all")) {
				createCriteria.andAssignToEqualTo(assignTo);
			}
			String status = taskQuery.getQueryTask().getStatus();
			if (!StringUtils.isBlank(status) && !status.equals("all")) {
				createCriteria.andStatusEqualTo(status);
			}
		}
		
		createCriteria.andDelFlagIsNotNull().andDelFlagNotEqualTo("1");
		return taskMapper.selectByExample(example);
	}

	@Override
	public FriendlyResult deleteTask(String id) {
		//logic delete.
		TaskExample example = new TaskExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andIdEqualTo(id);		
		Task task = new Task();
		task.setDelFlag("1");		
		taskMapper.updateByExampleSelective(task, example);
		
		TaskCheckListExample exampleCheckList = new TaskCheckListExample();
		exampleCheckList.createCriteria().andParentIdEqualTo(id);
		List<TaskCheckList> list = taskCheckListMapper.selectByExample(exampleCheckList);
		
		for (TaskCheckList item : list) {
			item.setDelFlag("1");
			taskCheckListMapper.updateByPrimaryKey(item);
		}
		return FriendlyResult.ok();
	}

	@Override
	public Task getTaskById(String id) {
		return taskMapper.selectByPrimaryKey(id);
	}

	@Override
	public int getTaskNumByStatus(String status) {
		TaskExample example = new TaskExample();
		Criteria createCriteria = example.createCriteria();
		if (!status.equals("all")) {
			createCriteria.andStatusEqualTo(status);
		}
		createCriteria.andDelFlagNotEqualTo("1");
		return taskMapper.countByExample(example);
	}

	@Override
	public String getTaskStatusById(String id) {
		Task task = taskMapper.selectByPrimaryKey(id);
		return task.getStatus();
	}	
	
}
