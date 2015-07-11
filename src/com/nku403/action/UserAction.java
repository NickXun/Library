package com.nku403.action;

import com.nku403.entity.User;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport {
	private User user;

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
}
