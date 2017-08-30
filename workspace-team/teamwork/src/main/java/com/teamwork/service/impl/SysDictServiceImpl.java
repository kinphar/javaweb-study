package com.teamwork.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamwork.mapper.SysDictMapper;
import com.teamwork.pojo.SysDict;
import com.teamwork.pojo.SysDictExample;
import com.teamwork.service.SysDictService;

@Service
public class SysDictServiceImpl implements SysDictService {

	@Autowired
	private SysDictMapper sysDictMapper;
	
	@Override
	public List<SysDict> getDictBySort(String sort) {		
		SysDictExample example = new SysDictExample();
		example.createCriteria().andSortEqualTo(sort);
		return sysDictMapper.selectByExample(example);
	}

	@Override
	public List<SysDict> getDictLikeSort(String sort) {
		SysDictExample example = new SysDictExample();
		example.createCriteria().andSortLike(sort);
		return sysDictMapper.selectByExample(example);
	}

	
}
