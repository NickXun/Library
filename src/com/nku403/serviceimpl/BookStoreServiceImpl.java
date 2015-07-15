package com.nku403.serviceimpl;

import java.util.List;

import com.nku403.daoimpl.BookstoreDAO;
import com.nku403.entity.Bookstore;
import com.nku403.entity.BookstoreId;
import com.nku403.entity.User;
import com.nku403.service.BookStoreService;

public class BookStoreServiceImpl implements BookStoreService {
	private BookstoreDAO bookStoreDAO;
	@Override
	public void addToBookStore(Bookstore bookstore) {
		// TODO Auto-generated method stub
		bookStoreDAO.save(bookstore);
		
	}
	public void setBookStoreDAO(BookstoreDAO bookStoreDAO) {
		this.bookStoreDAO = bookStoreDAO;
	}
	public BookstoreDAO getBookStoreDAO() {
		return bookStoreDAO;
	}
	@Override
	public Bookstore findBookInBookStore(BookstoreId bookstoreid) {
		// TODO Auto-generated method stub
		return bookStoreDAO.findById(bookstoreid);
	}
	@Override
	public List getBookStoreList(User user) {
		// TODO Auto-generated method stub
		return bookStoreDAO.findByProperty("id.user", user);
	}
	
	

}
