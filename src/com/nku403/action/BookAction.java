package com.nku403.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;

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
	
}
