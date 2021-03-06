package com.nku403.serviceimpl;

import java.util.List;

import com.nku403.daoimpl.UserDAO;
import com.nku403.entity.User;
import com.nku403.service.UserService;

public class UserServiceImpl implements UserService {
	private UserDAO userDAO;
	public UserDAO getUserDAO() {
		return userDAO;
	}
	public void setUserDAO(UserDAO userDao) {
		this.userDAO = userDao;
	}
	@Override
	public void add(User user) {
		// TODO Auto-generated method stub
		userDAO.save(user);
	}
	@Override
	public List findUser(User user) {
		// TODO Auto-generated method stub
		return userDAO.findByExample(user);
	}
	@Override
	public List findUserByRight(short right) {
		// TODO Auto-generated method stub
		
		return userDAO.findByUseright(right);
	}
	@Override
	public User findUserById(int id) {
		return userDAO.findById(id);
		// TODO Auto-generated method stub
	}
	@Override
	public void delUser(User user) {
		// TODO Auto-generated method stub
		userDAO.delete(user);
	}
}
