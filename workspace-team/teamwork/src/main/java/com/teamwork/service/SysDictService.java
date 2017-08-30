package com.teamwork.service;

import java.util.List;

import com.teamwork.pojo.SysDict;

public interface SysDictService {
	
	List<SysDict> getDictBySort(String sort);
	List<SysDict> getDictLikeSort(String sort);
}
