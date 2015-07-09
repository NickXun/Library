package com.nku403.action;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;


import com.nku403.entity.User;
import com.nku403.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {
	private String userName;
	private String userPassword;
	private String userRePassword;
	private String userEmail;
	private String userPhone;

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return SUCCESS;
	}
	
	public String login() {
		ServletContext sc = ServletActionContext.getRequest().getSession()
				.getServletContext();

		ApplicationContext ac = WebApplicationContextUtils
				.getWebApplicationContext(sc);

		UserService service = (UserService) ac.getBean("UserService");
		User user = new User();
		user.setUserName(userName);
		user.setUserPassword(userPassword);
		user.setUserEmail(userEmail);
		user.setUserPhone(userPhone);
		user.setUseright((short) 0);

		service.add(user);
		return SUCCESS;
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

	public String getUserRePassword() {
		return userRePassword;
	}

	public void setUserRePassword(String userRePassword) {
		this.userRePassword = userRePassword;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
		

}
