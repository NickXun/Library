package com.nku403.service;

import java.util.List;

import com.nku403.entity.Bookstore;
import com.nku403.entity.BookstoreId;

public interface BookStoreService {
	public void addToBookStore(Bookstore bookstore);
	
	public Bookstore findBookInBookStore(BookstoreId bookstoreid);
}
