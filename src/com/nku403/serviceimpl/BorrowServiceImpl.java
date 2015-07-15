package com.nku403.serviceimpl;

import java.util.List;

import com.nku403.daoimpl.BorrowDAO;
import com.nku403.entity.Borrow;
import com.nku403.entity.BorrowId;
import com.nku403.entity.User;
import com.nku403.service.BorrowService;

public class BorrowServiceImpl implements BorrowService {
	private BorrowDAO borrowDAO;
	@Override
	public void addBorrow(Borrow borrow) {
		// TODO Auto-generated method stub
		borrowDAO.save(borrow);
	}
	public void setBorrowDAO(BorrowDAO borrowDAO) {
		this.borrowDAO = borrowDAO;
	}
	public BorrowDAO getBorrowDAO() {
		return borrowDAO;
	}
	@Override
	public Borrow findBorrowById(BorrowId borrowid) {
		// TODO Auto-generated method stub
		return borrowDAO.findById(borrowid);
	}
	@Override
	public void delBorrow(Borrow borrow) {
		// TODO Auto-generated method stub
		borrowDAO.delete(borrow);
	}
	@Override
	public List curBorrow(User user) {
		// TODO Auto-generated method stub
		return borrowDAO.findByProperty("id.user", user);
	}
	@Override
	public void againBorrow(Borrow borrow) {
		// TODO Auto-generated method stub
		borrowDAO.attachDirty(borrow);
	}
	

}
