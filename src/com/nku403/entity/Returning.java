package com.nku403.entity;

import java.util.Date;

/**
 * Returning entity. @author MyEclipse Persistence Tools
 */

public class Returning implements java.io.Serializable {

	// Fields

	private ReturningId id;
	private Date borrowDate;
	private Date returnDate;

	// Constructors

	/** default constructor */
	public Returning() {
	}

	/** minimal constructor */
	public Returning(ReturningId id) {
		this.id = id;
	}

	/** full constructor */
	public Returning(ReturningId id, Date borrowDate, Date returnDate) {
		this.id = id;
		this.borrowDate = borrowDate;
		this.returnDate = returnDate;
	}

	// Property accessors

	public ReturningId getId() {
		return this.id;
	}

	public void setId(ReturningId id) {
		this.id = id;
	}

	public Date getBorrowDate() {
		return this.borrowDate;
	}

	public void setBorrowDate(Date borrowDate) {
		this.borrowDate = borrowDate;
	}

	public Date getReturnDate() {
		return this.returnDate;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

}