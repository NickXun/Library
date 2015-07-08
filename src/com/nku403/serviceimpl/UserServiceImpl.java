package com.nku403.serviceimpl;

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
}
