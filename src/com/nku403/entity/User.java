package com.nku403.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	private Integer userId;
	private String userName;
	private String userPassword;
	private Short useright;
	private String userNickname;
	private String userEmail;
	private String userPhone;
	private Set returnings = new HashSet(0);
	private Set borrows = new HashSet(0);
	private Set bookstores = new HashSet(0);

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String userName, String userPassword, String userEmail,
			String userPhone) {
		this.userName = userName;
		this.userPassword = userPassword;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
	}

	/** full constructor */
	public User(String userName, String userPassword, Short useright,
			String userNickname, String userEmail, String userPhone,
			Set returnings, Set borrows, Set bookstores) {
		this.userName = userName;
		this.userPassword = userPassword;
		this.useright = useright;
		this.userNickname = userNickname;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.returnings = returnings;
		this.borrows = borrows;
		this.bookstores = bookstores;
	}

	// Property accessors

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return this.userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public Short getUseright() {
		return this.useright;
	}

	public void setUseright(Short useright) {
		this.useright = useright;
	}

	public String getUserNickname() {
		return this.userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public String getUserEmail() {
		return this.userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPhone() {
		return this.userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public Set getReturnings() {
		return this.returnings;
	}

	public void setReturnings(Set returnings) {
		this.returnings = returnings;
	}

	public Set getBorrows() {
		return this.borrows;
	}

	public void setBorrows(Set borrows) {
		this.borrows = borrows;
	}

	public Set getBookstores() {
		return this.bookstores;
	}

	public void setBookstores(Set bookstores) {
		this.bookstores = bookstores;
	}

}