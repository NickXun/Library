package com.nku403.service;

import com.nku403.entity.Borrow;
import com.nku403.entity.BorrowId;

public interface BorrowService {
	public void addBorrow(Borrow borrow);
	
	public Borrow findBorrowById(BorrowId borrowid);
}
