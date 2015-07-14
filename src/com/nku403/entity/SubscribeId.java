package com.nku403.entity;

/**
 * SubscribeId entity. @author MyEclipse Persistence Tools
 */

public class SubscribeId implements java.io.Serializable {

	// Fields

	private User user;
	private Book book;

	// Constructors

	/** default constructor */
	public SubscribeId() {
	}

	/** full constructor */
	public SubscribeId(User user, Book book) {
		this.user = user;
		this.book = book;
	}

	// Property accessors

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
		if (!(other instanceof SubscribeId))
			return false;
		SubscribeId castOther = (SubscribeId) other;

		return ((this.getUser() == castOther.getUser()) || (this.getUser() != null
				&& castOther.getUser() != null && this.getUser().equals(
				castOther.getUser())))
				&& ((this.getBook() == castOther.getBook()) || (this.getBook() != null
						&& castOther.getBook() != null && this.getBook()
						.equals(castOther.getBook())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getUser() == null ? 0 : this.getUser().hashCode());
		result = 37 * result
				+ (getBook() == null ? 0 : this.getBook().hashCode());
		return result;
	}

}