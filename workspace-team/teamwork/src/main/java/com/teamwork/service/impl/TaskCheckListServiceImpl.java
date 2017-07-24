package com.teamwork.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamwork.common.pojo.FriendlyResult;
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

	@Override
	public FriendlyResult updateCheckLists(List<TaskCheckList> list, String parentId) {
		for (TaskCheckList item : list) {
			Long checkListId = item.getId();
			if (checkListId != null && checkListId > 0) {
				taskCheckListMapper.updateByPrimaryKeySelective(item);				
			} else {
				Date date = new Date();
				item.setParentId(parentId);
				item.setCreateDate(date);
				item.setUpdateDate(date);
				item.setDelFlag("0");
				taskCheckListMapper.insert(item);
			}
		}
		return FriendlyResult.ok();
	}
	
}
