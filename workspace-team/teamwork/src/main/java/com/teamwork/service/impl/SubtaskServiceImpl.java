package com.teamwork.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamwork.common.pojo.FriendlyResult;
import com.teamwork.common.utils.IDUtils;
import com.teamwork.mapper.SubtaskMapper;
import com.teamwork.pojo.Subtask;
import com.teamwork.pojo.SubtaskExample;
import com.teamwork.pojo.Task;
import com.teamwork.service.SubtaskService;

@Service
public class SubtaskServiceImpl implements SubtaskService {
	
	@Autowired
	private SubtaskMapper subtaskMapper;

	@Override
	public List<Subtask> getSubtaskByTasks(List<Task> tasks) {
		List<Subtask> list = null;
		for (Task item : tasks) {
			if (list == null) {
				list = getSubtaskByParentId(item.getId());
			} else {
				list.addAll(getSubtaskByParentId(item.getId()));
			}
		}
		return list;
	}

	@Override
	public List<Subtask> getSubtaskByParentId(String id) {
		SubtaskExample example = new SubtaskExample();
		example.createCriteria().andParentIdEqualTo(id);		
		return subtaskMapper.selectByExample(example);
	}

	@Override
	public FriendlyResult updateSubtasks(List<Subtask> list, String parentId) {
		if (list != null && list.size() > 0) {
			//delete all first.
			deleteSubtaskByParentId(parentId);
			
			for (Subtask item : list) {
				if (item.getStatus() == null || item.getDescription() == null) {
					continue; //to delete item.
				}
				Date date = new Date();
				item.setParentId(parentId);
				item.setCreateDate(date);
				item.setUpdateDate(date);
				item.setDelFlag("0");
				subtaskMapper.insert(item);
			}			
		}

		return FriendlyResult.ok();
	}

	@Override
	public FriendlyResult deleteSubtaskByParentId(String parentId) {
		SubtaskExample example = new SubtaskExample();
		example.createCriteria().andParentIdEqualTo(parentId);
		subtaskMapper.deleteByExample(example);
		return FriendlyResult.ok();
	}

	@Override
	public FriendlyResult updateSubtask(Subtask item) {
		Long id = item.getId();
		System.out.println("id=" + id);
		Long newId = (long) 0;
		if (id == null) {	
			newId = IDUtils.getIdByTimeStamp();
			item.setId(newId);
			item.setCreateDate(new Date());
			item.setUpdateDate(new Date());
			subtaskMapper.insertSelective(item);
		} else {
			newId = id;
			item.setUpdateDate(new Date());
			subtaskMapper.updateByPrimaryKeySelective(item);			
		}
		
		return FriendlyResult.ok(newId);
	}

	@Override
	public FriendlyResult deleteSubtaskById(Long id) {
		subtaskMapper.deleteByPrimaryKey(id);
		return FriendlyResult.ok();
	}
	
}
