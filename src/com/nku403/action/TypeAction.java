package com.nku403.action;

import java.util.List;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.nku403.entity.Type;
import com.nku403.service.TypeService;
import com.opensymphony.xwork2.ActionSupport;

public class TypeAction extends ActionSupport {
	private Type type;

	/*private TypeService typeservice;
	
	public TypeService getTypeservice() {
		return typeservice;
	}

	public void setTypeservice(TypeService typeservice) {
		this.typeservice = typeservice;
	}*/

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}
	
	
	
	public String addType(){
		ServletContext sc = ServletActionContext.getRequest().getSession()
		.getServletContext();

		ApplicationContext ac = WebApplicationContextUtils
		.getWebApplicationContext(sc);
		
		TypeService typeservice =  (TypeService) ac.getBean("TypeService");
		
		typeservice.addType(type);
		ServletActionContext.getRequest().setAttribute("addsuccess", "success");
		return SUCCESS;
	}
	public void getAllType(){
		ServletContext sc = ServletActionContext.getRequest().getSession()
		.getServletContext();

		ApplicationContext ac = WebApplicationContextUtils
		.getWebApplicationContext(sc);
		
		TypeService service =  (TypeService) ac.getBean("TypeService");
		
		List temp = service.getAllType();
		
		ServletActionContext.getRequest().setAttribute("allType", temp);
	}
}
