package com.teamwork.service.impl;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mysql.fabric.xmlrpc.base.Array;
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
	public FriendlyResult deleteTaskById(String id) {
		//logic delete.
		TaskExample example = new TaskExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andIdEqualTo(id);		
		Task task = new Task();
		task.setDelFlag("1");		
		taskMapper.updateByExampleSelective(task, example);
		
		//删除关联检查项；
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

	@Override
	public FriendlyResult updateTask(NewTaskInfo newTaskInfo) {
		Task task = newTaskInfo.getTask();
		task.setUpdateDate(new Date());
		taskMapper.updateByPrimaryKeySelective(task);
		
		//add checkupdate.
		return null;
	}

	@Override
	public List<Integer> getTaskNumByFilter(TaskQuery taskQuery) {
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
		}
		
		createCriteria.andDelFlagIsNotNull().andDelFlagNotEqualTo("1");
		List<Task> tasks = taskMapper.selectByExample(example);
		
		int n_all = tasks.size();
		int n_10001 = 0, n_10002 = 0, n_10003 = 0, n_10005 = 0;
		for (Task item : tasks) {
			switch (item.getStatus()) {
				case "10001" :
					n_10001++; break;
				case "10002" :
					n_10002++; break;
				case "10003" :
					n_10003++; break;
				case "10005" :
					n_10005++; break;
			}
		}
		List<Integer> nums = Arrays.asList(n_all, n_10001, n_10002, n_10003, n_10005);
		return nums;
	}		
}
