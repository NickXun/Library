package com.nku403.dao;

import java.util.List;

import com.nku403.entity.User;

public interface IUserDAO {

	public abstract void save(User transientInstance);

	public abstract User findById(java.lang.Integer id);

	public abstract List findByUserName(Object userName);

}