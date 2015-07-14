package com.nku403.action;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
import com.nku403.entity.User;
import com.nku403.service.BookService;
import com.nku403.service.BorrowService;
import com.opensymphony.xwork2.ActionSupport;

public class BorrowAction extends ActionSupport {
	private int bookId;

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public int getBookId() {
		return bookId;
	}
	
	public void borrowBook() throws ParseException, IOException{
		ServletContext sc = ServletActionContext.getRequest().getSession()
		.getServletContext();

		ApplicationContext ac = WebApplicationContextUtils
		.getWebApplicationContext(sc);
		
		BorrowService boservice = (BorrowService) ac.getBean("BorrowService");
		BookService bservice = (BookService) ac.getBean("BookService");
		
		Book book = bservice.findBookById(bookId);
		User user = (User) ServletActionContext.getContext().getSession().get("user");
		
		
		BorrowId borrowid = new BorrowId();
		borrowid.setBook(book);
		borrowid.setUser(user);
		
		Borrow temp = boservice.findBorrowById(borrowid);
		
		JSONObject json = new JSONObject();
		if(temp != null)
		{
			json.accumulate("borinfo", "exist");
			System.out.print(json.toString());
			ServletActionContext.getResponse().getWriter().print(json.toString());
			return;
		}
		if(book.getBookAccessAmount() == 0)
		{
			json.accumulate("borinfo", "less");
			ServletActionContext.getResponse().getWriter().print(json.toString());
			return;
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date bordate = sdf.parse(sdf.format(new Date()));
		System.out.println("11"+bordate);
		
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(bordate);
		calendar.add(Calendar.MONTH, 1);
		
		Date retdate = sdf.parse(sdf.format(calendar.getTime()));
		System.out.println("22"+retdate);
		
		Borrow borrow = new Borrow();
		borrow.setBorrowDate(bordate);
		borrow.setBorrowReturnDate(retdate);
		borrow.setId(borrowid);
		borrow.setIsAgainBor((short) 0);
		borrow.setIsLate((short) 0);
		
		boservice.addBorrow(borrow);
		json.accumulate("borinfo", "success");
		System.out.println(json.toString());
		ServletActionContext.getResponse().getWriter().print(json.toString());
		
		book.setBookHistory(book.getBookHistory() + 1);
		book.setBookAccessAmount((short) (book.getBookAccessAmount() - 1));
		
		bservice.updateHistory(book);
	}
	
}
