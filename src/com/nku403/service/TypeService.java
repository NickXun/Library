package com.nku403.service;

import java.util.List;

import com.nku403.entity.Type;

public interface TypeService {
	public String addType(Type type);
	
	public List getAllType();
	
	public Type findTypeById(int id);
}
