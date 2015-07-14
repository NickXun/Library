package com.nku403.service;

import java.util.List;

import com.nku403.entity.Bookstore;

public interface BookStoreService {
	public void addToBookStore(Bookstore bookstore);
	
	public List findBookInBookStore(Bookstore bookstore);
}
