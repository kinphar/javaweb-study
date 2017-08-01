package com.teamwork.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamwork.mapper.UserMapper;
import com.teamwork.pojo.User;
import com.teamwork.pojo.UserExample;
import com.teamwork.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;

	@Override
	public List<User> getAllUser() {
		UserExample example = new UserExample();
		return userMapper.selectByExample(example);
	}

	@Override
	public List<User> getUserByEmailAndPassword(String email, String password) {
		UserExample example = new UserExample();
		example.createCriteria().andEmailEqualTo(email).andPasswordEqualTo(password);
		return userMapper.selectByExample(example);		
	}

}
