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
	private Short isLate;
	private Short isAgainBor;

	// Constructors

	/** default constructor */
	public Borrow() {
	}

	/** minimal constructor */
	public Borrow(BorrowId id) {
		this.id = id;
	}

	/** full constructor */
	public Borrow(BorrowId id, Date borrowDate, Date borrowReturnDate,
			Short isLate, Short isAgainBor) {
		this.id = id;
		this.borrowDate = borrowDate;
		this.borrowReturnDate = borrowReturnDate;
		this.isLate = isLate;
		this.isAgainBor = isAgainBor;
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

	public Short getIsLate() {
		return this.isLate;
	}

	public void setIsLate(Short isLate) {
		this.isLate = isLate;
	}

	public Short getIsAgainBor() {
		return this.isAgainBor;
	}

	public void setIsAgainBor(Short isAgainBor) {
		this.isAgainBor = isAgainBor;
	}

}