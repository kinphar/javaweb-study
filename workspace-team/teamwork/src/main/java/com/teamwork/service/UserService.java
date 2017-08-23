package com.teamwork.service;

import java.util.List;

import com.teamwork.pojo.User;

public interface UserService {
	
	List<User> getAllUser();
	List<User> getUserByEmailAndPassword(String email, String password);
	User getUserByEmail(String email);
	String getEmailByUserName(String name);
}
