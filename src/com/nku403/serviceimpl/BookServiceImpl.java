package com.nku403.serviceimpl;

import java.util.List;

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
	@Override
	public List findAllBook() {
		// TODO Auto-generated method stub
		return bookDAO.findAll();
	}
	@Override
	public Book findBookById(int bookId) {
		// TODO Auto-generated method stub
		return bookDAO.findById(bookId);
	}
	@Override
	public void updateHistory(Book book) {
		// TODO Auto-generated method stub
		bookDAO.attachDirty(book);
	}
	@Override
	public List getHotBooks() {
		// TODO Auto-generated method stub
		return bookDAO.findByHotBook();
	}
	@Override
	public List findSpecialBooks(String queryName, String value) {
		// TODO Auto-generated method stub
		return bookDAO.findSpecialBooks(queryName, value);
	}

}
