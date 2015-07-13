package com.nku403.serviceimpl;

import com.nku403.daoimpl.BookDAO;
import com.nku403.entity.Book;
import com.nku403.service.BookService;

public class BookServiceImpl implements BookService {
	private BookDAO bookDAO;
	public BookDAO getBookDAO() {
		return bookDAO;
	}
	public void setBookDAO(BookDAO bookDAO) {
		this.bookDAO = bookDAO;
	}
	@Override
	public void addBook(Book book) {
		// TODO Auto-generated method stub
		bookDAO.save(book);
	}

}
