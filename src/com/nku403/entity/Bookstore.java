package com.nku403.entity;

/**
 * Bookstore entity. @author MyEclipse Persistence Tools
 */

public class Bookstore implements java.io.Serializable {

	// Fields

	private BookstoreId id;

	// Constructors

	/** default constructor */
	public Bookstore() {
	}

	/** full constructor */
	public Bookstore(BookstoreId id) {
		this.id = id;
	}

	// Property accessors

	public BookstoreId getId() {
		return this.id;
	}

	public void setId(BookstoreId id) {
		this.id = id;
	}

}