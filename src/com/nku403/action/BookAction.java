package com.nku403.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.nku403.entity.Book;
import com.nku403.service.BookService;
import com.nku403.service.TypeService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BookAction extends ActionSupport {
	private Book book;
	private File upload;
	private String uploadContentType;
	private String uploadFileName;
	private String savePath;
	private int booktype;
	private int bookId;
	private String queryName;
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public int getBooktype() {
		return booktype;
	}
	public void setBooktype(int booktype) {
		this.booktype = booktype;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	@SuppressWarnings("deprecation")
	public String getSavePath() {
		return ServletActionContext.getRequest().getRealPath(savePath);
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	
	public String addBook() throws IOException{
		ServletContext sc = ServletActionContext.getRequest().getSession()
		.getServletContext();

		ApplicationContext ac = WebApplicationContextUtils
		.getWebApplicationContext(sc);
		
		//ServletActionContext.getRequest().setAttribute("select", "aa"+booktype);
		//return SUCCESS;
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyMMddhhmmss");  
		String nowDate=sdf.format(new java.util.Date()); 
		
		String fileName = getSavePath()+"\\"+nowDate+getUploadFileName();
		
		String saveName = "http://localhost:8000/LibraryTest/context/img/book/"+nowDate+uploadFileName;
		
		ServletActionContext.getRequest().setAttribute("addsuccess", "success");
		
		FileOutputStream fos = new FileOutputStream(fileName);
		
		FileInputStream fis = new FileInputStream(getUpload()); 
		
		byte[] b = new byte[1024];
		
		int len = 0;
		
		while((len = fis.read(b)) >0){
			fos.write(b,0,len);
		}
		
		TypeService tservice = (TypeService) ac.getBean("TypeService");
		
		this.book.setBookPicture(saveName);
		this.book.setType(tservice.findTypeById(booktype));
		this.book.setBookHistory(0);
		
		
		BookService service = (BookService) ac.getBean("BookService");
		
		service.addBook(book);
		
		return SUCCESS;
	}
	
	public String findAllBook(){
		
		ServletContext sc = ServletActionContext.getRequest().getSession()
		.getServletContext();

		ApplicationContext ac = WebApplicationContextUtils
		.getWebApplicationContext(sc);
		BookService service = (BookService) ac.getBean("BookService");
		List temp = service.findAllBook();
		
		ServletActionContext.getRequest().setAttribute("bookList", temp);
		
		return SUCCESS;
	}
	public String findSingleBook(){
		ServletContext sc = ServletActionContext.getRequest().getSession()
		.getServletContext();

		ApplicationContext ac = WebApplicationContextUtils
		.getWebApplicationContext(sc);
		BookService service = (BookService) ac.getBean("BookService");
		
		Book temp = service.findBookById(bookId);
		
		ServletActionContext.getRequest().setAttribute("book", temp);
		ServletActionContext.getRequest().setAttribute("type", temp.getType().getTypeName());
		
		return SUCCESS;
	}
	
	public void findOneBook(){
		ServletContext sc = ServletActionContext.getRequest().getSession()
		.getServletContext();

		ApplicationContext ac = WebApplicationContextUtils
		.getWebApplicationContext(sc);
		BookService service = (BookService) ac.getBean("BookService");
		List temp = service.findAllBook();
		Random random = new Random();
		int num = random.nextInt(temp.size());
		
		ServletActionContext.getRequest().setAttribute("bookList", temp);
		ServletActionContext.getRequest().setAttribute("num", num);
	}
	
	public void findHotBooks(){
		ServletContext sc = ServletActionContext.getRequest().getSession()
		.getServletContext();

		ApplicationContext ac = WebApplicationContextUtils
		.getWebApplicationContext(sc);
		BookService service = (BookService) ac.getBean("BookService");
		
		List temp = service.getHotBooks();
		ServletActionContext.getRequest().setAttribute("hotBookList", temp);
		
	}
	
	public String querySpecialBooks() throws UnsupportedEncodingException{
		ServletContext sc = ServletActionContext.getRequest().getSession()
		.getServletContext();

		ApplicationContext ac = WebApplicationContextUtils
		.getWebApplicationContext(sc);
		BookService service = (BookService) ac.getBean("BookService");
		String queryValue = new String(ServletActionContext.getRequest().getParameter("queryValue").getBytes("ISO-8859-1"),"utf-8");
		List temp = null;
		System.out.println(queryName);
		if(queryName.equals("name")){
			temp = service.findSpecialBooks("bookName", queryValue);
			System.out.println(queryValue);
		}else if(queryName.equals("findnum")){
			temp = service.findSpecialBooks("bookFindNumber", queryValue);
			System.out.println(queryName);
		}
		System.out.println("queryValue"+queryValue);
		ServletActionContext.getRequest().setAttribute("bookList", temp);
		return SUCCESS;
	}
	
	
	public void setQueryName(String queryName) {
		this.queryName = queryName;
	}
	public String getQueryName() {
		return queryName;
	}
}
