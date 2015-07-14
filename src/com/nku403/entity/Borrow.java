package com.nku403.entity;

import java.util.Date;

/**
 * Borrow entity. @author MyEclipse Persistence Tools
 */

public class Borrow implements java.io.Serializable {

	// Fields

	private BorrowId id;
	private Date borrowDate;
	private Date borrowReturnDate;

	// Constructors

	/** default constructor */
	public Borrow() {
	}

	/** full constructor */
	public Borrow(BorrowId id, Date borrowDate, Date borrowReturnDate) {
		this.id = id;
		this.borrowDate = borrowDate;
		this.borrowReturnDate = borrowReturnDate;
	}

	// Property accessors

	public BorrowId getId() {
		return this.id;
	}

	public void setId(BorrowId id) {
		this.id = id;
	}

	public Date getBorrowDate() {
		return this.borrowDate;
	}

	public void setBorrowDate(Date borrowDate) {
		this.borrowDate = borrowDate;
	}

	public Date getBorrowReturnDate() {
		return this.borrowReturnDate;
	}

	public void setBorrowReturnDate(Date borrowReturnDate) {
		this.borrowReturnDate = borrowReturnDate;
	}

}