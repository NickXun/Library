package com.nku403.action;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.nku403.entity.Book;
import com.nku403.entity.Borrow;
import com.nku403.entity.BorrowId;
import com.nku403.entity.Returning;
import com.nku403.entity.ReturningId;
import com.nku403.entity.User;
import com.nku403.service.BookService;
import com.nku403.service.BorrowService;
import com.nku403.service.ReturningService;
import com.nku403.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ReturingAction extends ActionSupport {
	private int bookId;
	private int userId;

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public int getBookId() {
		return bookId;
	}
	
	public void returnBook() throws IOException, ParseException{
		ServletContext sc = ServletActionContext.getRequest().getSession()
		.getServletContext();

		ApplicationContext ac = WebApplicationContextUtils
		.getWebApplicationContext(sc);
		
		ReturningService retservice = (ReturningService) ac.getBean("ReturningService");
		UserService uservice = (UserService) ac.getBean("UserService");
		BookService bookservice = (BookService) ac.getBean("BookService");
		BorrowService boservice = (BorrowService) ac.getBean("BorrowService");
		
		JSONObject json = new JSONObject();
		
		User user = uservice.findUserById(userId);
		if(user == null){
			json.accumulate("retinfo", "nouser");
			ServletActionContext.getResponse().getWriter().print(json.toString());
			return;
		}
		Book book = bookservice.findBookById(bookId);
		if(book == null){
			json.accumulate("retinfo", "nobook");
			ServletActionContext.getResponse().getWriter().print(json.toString());
			return;
		}
		BorrowId borrowid = new BorrowId();
		borrowid.setBook(book);
		borrowid.setUser(user);
		
		Borrow borrow = boservice.findBorrowById(borrowid);
		if(borrow == null){
			json.accumulate("retinfo", "noborrow");
			ServletActionContext.getResponse().getWriter().print(json.toString());
			return;
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date retdate = sdf.parse(sdf.format(new Date()));
		System.out.println(retdate);
		Date bordate = sdf.parse(sdf.format(borrow.getBorrowDate()));
		
		boservice.delBorrow(borrow);
		
		book.setBookAccessAmount((short) (book.getBookAccessAmount() + 1));
		
		bookservice.updateHistory(book);
		
		ReturningId retId = new ReturningId();
		retId.setBook(book);
		retId.setUser(user);
		
		Returning ret = new Returning();
		ret.setBorrowDate(bordate);
		ret.setReturnDate(retdate);
		ret.setId(retId);
		
		retservice.ReturnBook(ret);
		json.accumulate("retinfo", "success");
		ServletActionContext.getResponse().getWriter().print(json.toString());
		
	}

	public void findHistory(){
		ServletContext sc = ServletActionContext.getRequest().getSession()
		.getServletContext();

		ApplicationContext ac = WebApplicationContextUtils
		.getWebApplicationContext(sc);
		
		ReturningService retservice = (ReturningService) ac.getBean("ReturningService");
		
		User user = (User) ActionContext.getContext().getSession().get("user");
		
		List temp = retservice.FindHistory(user);
		
		ServletActionContext.getRequest().setAttribute("hisList", temp);
		
	}
	
	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getUserId() {
		return userId;
	}
}
