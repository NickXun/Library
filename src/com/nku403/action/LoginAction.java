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

public class LoginAction extends ActionSupport {
	private User user;
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		ServletContext sc = ServletActionContext.getRequest().getSession()
				.getServletContext();

		ApplicationContext ac = WebApplicationContextUtils
				.getWebApplicationContext(sc);

		UserService service = (UserService) ac.getBean("UserService");
		user.setUserPassword(encryption(user.getUserPassword()));
		List temp = service.findUser(user);
		if (temp.size() > 0) {
			ActionContext.getContext().getSession().put("user", temp.get(0));
			User t = (User) temp.get(0);
			if(t.getUseright() == 2){
				return "system";
			}else if(t.getUseright() == 1){
				return "library";
			}
			return "login";
		}
		return "input";
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
