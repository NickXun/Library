package com.nku403.entity;

import java.sql.Timestamp;

/**
 * Returning entity. @author MyEclipse Persistence Tools
 */

public class Returning implements java.io.Serializable {

	// Fields

	private ReturningId id;
	private Timestamp returnDate;

	// Constructors

	/** default constructor */
	public Returning() {
	}

	/** full constructor */
	public Returning(ReturningId id, Timestamp returnDate) {
		this.id = id;
		this.returnDate = returnDate;
	}

	// Property accessors

	public ReturningId getId() {
		return this.id;
	}

	public void setId(ReturningId id) {
		this.id = id;
	}

	public Timestamp getReturnDate() {
		return this.returnDate;
	}

	public void setReturnDate(Timestamp returnDate) {
		this.returnDate = returnDate;
	}

}