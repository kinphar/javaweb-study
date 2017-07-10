package com.teamwork.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamwork.mapper.SysDictMapper;
import com.teamwork.pojo.SysDict;
import com.teamwork.pojo.SysDictExample;
import com.teamwork.pojo.SysDictExample.Criteria;
import com.teamwork.service.MiscService;

@Service
public class MiscServiceImpl implements MiscService {

	@Autowired
	private SysDictMapper sysDictMapper;
	
	@Override
	public List<SysDict> getTaskStatusDict() {
		SysDictExample example = new SysDictExample();
		Criteria createCriteria = example.createCriteria();
		createCriteria.andSortEqualTo("task_status");
		return sysDictMapper.selectByExample(example);
	}

}
