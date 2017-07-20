package com.teamwork.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamwork.mapper.TaskCheckListMapper;
import com.teamwork.pojo.Task;
import com.teamwork.pojo.TaskCheckList;
import com.teamwork.pojo.TaskCheckListExample;
import com.teamwork.service.TaskCheckListService;

@Service
public class TaskCheckListServiceImpl implements TaskCheckListService {
	
	@Autowired
	private TaskCheckListMapper taskCheckListMapper;

	@Override
	public List<TaskCheckList> getCheckListByTasks(List<Task> tasks) {
		List<TaskCheckList> list = null;
		for (Task item : tasks) {
			if (list == null) {
				list = getCheckListByParentId(item.getId());
			} else {
				list.addAll(getCheckListByParentId(item.getId()));
			}
		}
		return list;
	}

	@Override
	public List<TaskCheckList> getCheckListByParentId(String id) {
		TaskCheckListExample example = new TaskCheckListExample();
		example.createCriteria().andParentIdEqualTo(id);		
		return taskCheckListMapper.selectByExample(example);
	}

}
