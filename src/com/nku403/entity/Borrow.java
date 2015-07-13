package com.nku403.entity;

import java.sql.Timestamp;

/**
 * Borrow entity. @author MyEclipse Persistence Tools
 */

public class Borrow implements java.io.Serializable {

	// Fields

	private BorrowId id;
	private Timestamp borrowDate;
	private Timestamp borrowReturnDate;

	// Constructors

	/** default constructor */
	public Borrow() {
	}

	/** full constructor */
	public Borrow(BorrowId id, Timestamp borrowDate, Timestamp borrowReturnDate) {
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

	public Timestamp getBorrowDate() {
		return this.borrowDate;
	}

	public void setBorrowDate(Timestamp borrowDate) {
		this.borrowDate = borrowDate;
	}

	public Timestamp getBorrowReturnDate() {
		return this.borrowReturnDate;
	}

	public void setBorrowReturnDate(Timestamp borrowReturnDate) {
		this.borrowReturnDate = borrowReturnDate;
	}

}