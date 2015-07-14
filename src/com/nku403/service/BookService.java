package com.nku403.service;

import java.util.List;

import com.nku403.entity.Book;

public interface BookService {
	public void addBook(Book book);
	
	public List findAllBook();
	
	public Book findBookById(int bookId);
	
	public void updateHistory(Book book);
	
}
