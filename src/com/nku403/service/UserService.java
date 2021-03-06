package com.nku403.service;

import java.util.List;

import com.nku403.entity.User;

public interface UserService {
	public void add(User user);
	
	public List findUser(User user);
	
	public List findUserByRight(short i);
	
	public User findUserById(int id);
	
	public void delUser(User user);
	
}
