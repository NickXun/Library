package com.nku403.service;

import java.util.List;

import com.nku403.entity.Borrow;
import com.nku403.entity.BorrowId;
import com.nku403.entity.User;

public interface BorrowService {
	public void addBorrow(Borrow borrow);
	
	public Borrow findBorrowById(BorrowId borrowid);
	
	public void delBorrow(Borrow borrow);
	
	public List curBorrow(User user);
	
	public void againBorrow(Borrow borrow);
}
