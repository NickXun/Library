package com.nku403.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.nku403.entity.Book;
import com.nku403.entity.Bookstore;
import com.nku403.entity.BookstoreId;
import com.nku403.entity.User;
import com.nku403.service.BookService;
import com.nku403.service.BookStoreService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BookStoreAction extends ActionSupport {
	private int bookId;

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public int getBookId() {
		return bookId;
	}
	
	public void addToBookStore() throws IOException{
		
		ServletContext sc = ServletActionContext.getRequest().getSession()
		.getServletContext();

		ApplicationContext ac = WebApplicationContextUtils
		.getWebApplicationContext(sc);
		BookStoreService bsservice = (BookStoreService) ac.getBean("BookStoreService");
		BookService bservice = (BookService) ac.getBean("BookService");
		
		User user = (User) ActionContext.getContext().getSession().get("user");
		
		Book book = bservice.findBookById(bookId);
		System.out.println(user.getUserName());
		BookstoreId bookstoreid = new BookstoreId();
		bookstoreid.setBook(book);
		bookstoreid.setUser(user);

		Bookstore bookstore = new Bookstore();
		bookstore.setId(bookstoreid);
		
		Bookstore temp = bsservice.findBookInBookStore(bookstoreid);
		JSONObject json = new JSONObject();
		if(temp != null){
			json.accumulate("info", "exist");
			System.out.println(json.toString());
			ServletActionContext.getResponse().getWriter().print(json.toString());
			return;
		}
		bsservice.addToBookStore(bookstore);
		json.accumulate("info", "success");
		System.out.println(json.toString());
		ServletActionContext.getResponse().getWriter().print(json.toString());
		//service.addToBookStore(); 
		
	   
	}
	
	public void borrowBook(){
		ServletContext sc = ServletActionContext.getRequest().getSession()
		.getServletContext();

		ApplicationContext ac = WebApplicationContextUtils
		.getWebApplicationContext(sc);
		
	}
	
}
