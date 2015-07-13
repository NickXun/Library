package com.nku403.serviceimpl;

import java.util.List;

import com.nku403.daoimpl.TypeDAO;
import com.nku403.entity.Type;
import com.nku403.service.TypeService;

public class TypeServiceImpl implements TypeService {
	private TypeDAO typeDAO;

	public TypeDAO getTypeDAO() {
		return typeDAO;
	}

	public void setTypeDAO(TypeDAO typeDAO) {
		this.typeDAO = typeDAO;
	}

	@Override
	public String addType(Type type) {
		// TODO Auto-generated method stub
		
		typeDAO.save(type);
		return "success";
	}

	@Override
	public List getAllType() {
		// TODO Auto-generated method stub
		return typeDAO.findAll();
	}

	@Override
	public Type findTypeById(int id) {
		// TODO Auto-generated method stub
		return typeDAO.findById(id);
	}
	
	
	
}
