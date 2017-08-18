package com.teamwork.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamwork.common.pojo.FriendlyResult;
import com.teamwork.common.utils.IDUtils;
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
		if (list != null && list.size() > 0) {
			//delete all first.
			deleteCheckListByParentId(parentId);
			
			for (TaskCheckList item : list) {
				if (item.getStatus() == null || item.getDescription() == null) {
					continue; //to delete item.
				}
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

	@Override
	public FriendlyResult deleteCheckListByParentId(String parentId) {
		TaskCheckListExample example = new TaskCheckListExample();
		example.createCriteria().andParentIdEqualTo(parentId);
		taskCheckListMapper.deleteByExample(example);
		return FriendlyResult.ok();
	}

	@Override
	public FriendlyResult updateCheckList(TaskCheckList item) {
		Long id = item.getId();
		System.out.println("id=" + id);
		Long newId = (long) 0;
		if (id == null) {	
			newId = IDUtils.getCheckListId();
			item.setId(newId);
			item.setCreateDate(new Date());
			item.setUpdateDate(new Date());
			taskCheckListMapper.insertSelective(item);
		} else {
			newId = id;
			item.setUpdateDate(new Date());
			taskCheckListMapper.updateByPrimaryKeySelective(item);			
		}
		
		return FriendlyResult.ok(newId);
	}

	@Override
	public FriendlyResult deleteCheckListById(Long id) {
		taskCheckListMapper.deleteByPrimaryKey(id);
		return FriendlyResult.ok();
	}
	
}
