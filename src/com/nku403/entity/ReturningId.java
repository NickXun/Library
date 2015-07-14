package com.nku403.entity;

/**
 * ReturningId entity. @author MyEclipse Persistence Tools
 */

public class ReturningId implements java.io.Serializable {

	// Fields

	private Integer returnId;
	private User user;
	private Book book;

	// Constructors

	/** default constructor */
	public ReturningId() {
	}

	/** full constructor */
	public ReturningId(Integer returnId, User user, Book book) {
		this.returnId = returnId;
		this.user = user;
		this.book = book;
	}

	// Property accessors

	public Integer getReturnId() {
		return this.returnId;
	}

	public void setReturnId(Integer returnId) {
		this.returnId = returnId;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Book getBook() {
		return this.book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof ReturningId))
			return false;
		ReturningId castOther = (ReturningId) other;

		return ((this.getReturnId() == castOther.getReturnId()) || (this
				.getReturnId() != null && castOther.getReturnId() != null && this
				.getReturnId().equals(castOther.getReturnId())))
				&& ((this.getUser() == castOther.getUser()) || (this.getUser() != null
						&& castOther.getUser() != null && this.getUser()
						.equals(castOther.getUser())))
				&& ((this.getBook() == castOther.getBook()) || (this.getBook() != null
						&& castOther.getBook() != null && this.getBook()
						.equals(castOther.getBook())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getReturnId() == null ? 0 : this.getReturnId().hashCode());
		result = 37 * result
				+ (getUser() == null ? 0 : this.getUser().hashCode());
		result = 37 * result
				+ (getBook() == null ? 0 : this.getBook().hashCode());
		return result;
	}

}