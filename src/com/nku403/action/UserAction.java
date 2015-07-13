package com.nku403.action;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.nku403.entity.User;
import com.nku403.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {
	private User user;
	private String userName;
	private String userPassword;
	private int userId;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public String logout(){
		ActionContext.getContext().getSession().clear();
		return SUCCESS;
	}
	
	
	public String insertUser(){
		ServletContext sc = ServletActionContext.getRequest().getSession()
		.getServletContext();

		ApplicationContext ac = WebApplicationContextUtils
		.getWebApplicationContext(sc);
		
		UserService service = (UserService) ac.getBean("UserService");
		User LibAdmin = new User();
		LibAdmin.setUseright((short) 1);
		LibAdmin.setUserName(userName);
		LibAdmin.setUserPassword(encryption(userPassword));
		
		service.add(LibAdmin);
		
		
		return "insert";
	}
	
	
	public void getLibraryAdmin(){
		ServletContext sc = ServletActionContext.getRequest().getSession()
		.getServletContext();

		ApplicationContext ac = WebApplicationContextUtils
		.getWebApplicationContext(sc);
		
		UserService service = (UserService) ac.getBean("UserService");
		
		List temp = service.findUserByRight((short) 1);
		ServletActionContext.getRequest().setAttribute("libAdmin", temp);
		
	}
	
	public String deleteUser(){
		ServletContext sc = ServletActionContext.getRequest().getSession()
		.getServletContext();

		ApplicationContext ac = WebApplicationContextUtils
		.getWebApplicationContext(sc);
		
		UserService service = (UserService) ac.getBean("UserService");
		
		service.delUser(service.findUserById(userId));
		ServletActionContext.getRequest().setAttribute("delsuccess", "success");
		return "delete";
	}
	
	public String encryption(String plainText) {
        String re_md5 = new String();
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(plainText.getBytes());
            byte b[] = md.digest();
 
            int i;
 
            StringBuffer buf = new StringBuffer("");
            for (int offset = 0; offset < b.length; offset++) {
                i = b[offset];
                if (i < 0)
                    i += 256;
                if (i < 16)
                    buf.append("0");
                buf.append(Integer.toHexString(i));
            }
 
            re_md5 = buf.toString();
 
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return re_md5;
    }
}
