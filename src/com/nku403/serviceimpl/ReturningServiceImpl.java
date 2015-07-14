package com.nku403.serviceimpl;

import java.util.List;

import com.nku403.daoimpl.ReturningDAO;
import com.nku403.entity.Returning;
import com.nku403.entity.User;
import com.nku403.service.ReturningService;

public class ReturningServiceImpl implements ReturningService {
	private ReturningDAO returningDAO;
	@Override
	public void ReturnBook(Returning returning) {
		// TODO Auto-generated method stub
		returningDAO.save(returning);
	}
	public ReturningDAO getReturningDAO() {
		return returningDAO;
	}
	public void setReturningDAO(ReturningDAO returningDAO) {
		this.returningDAO = returningDAO;
	}
	@Override
	public List FindHistory(User user) {
		// TODO Auto-generated method stub
		
		return returningDAO.findByProperty("id.user", user);
	}

}
