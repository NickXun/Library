package com.nku403.entity;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Book entity. @author MyEclipse Persistence Tools
 */

public class Book implements java.io.Serializable {

	// Fields

	private Integer bookId;
	private Type type;
	private String bookName;
	private String bookAuthor;
	private String bookPress;
	private String bookPressTime;
	private String bookIsbn;
	private String bookPicture;
	private String bookInfo;
	private Timestamp bookAddTime;
	private String bookFindNumber;
	private Short bookTotalAmount;
	private Short bookAccessAmount;
	private Integer bookHistory;
	private Set borrows = new HashSet(0);
	private Set returnings = new HashSet(0);
	private Set bookstores = new HashSet(0);
	private Set subscribes = new HashSet(0);

	// Constructors

	/** default constructor */
	public Book() {
	}

	/** minimal constructor */
	public Book(Type type, String bookName, String bookAuthor,
			String bookPress, String bookPressTime, String bookIsbn,
			String bookPicture, String bookInfo, Timestamp bookAddTime,
			String bookFindNumber, Short bookTotalAmount, Short bookAccessAmount) {
		this.type = type;
		this.bookName = bookName;
		this.bookAuthor = bookAuthor;
		this.bookPress = bookPress;
		this.bookPressTime = bookPressTime;
		this.bookIsbn = bookIsbn;
		this.bookPicture = bookPicture;
		this.bookInfo = bookInfo;
		this.bookAddTime = bookAddTime;
		this.bookFindNumber = bookFindNumber;
		this.bookTotalAmount = bookTotalAmount;
		this.bookAccessAmount = bookAccessAmount;
	}

	/** full constructor */
	public Book(Type type, String bookName, String bookAuthor,
			String bookPress, String bookPressTime, String bookIsbn,
			String bookPicture, String bookInfo, Timestamp bookAddTime,
			String bookFindNumber, Short bookTotalAmount,
			Short bookAccessAmount, Integer bookHistory, Set borrows,
			Set returnings, Set bookstores, Set subscribes) {
		this.type = type;
		this.bookName = bookName;
		this.bookAuthor = bookAuthor;
		this.bookPress = bookPress;
		this.bookPressTime = bookPressTime;
		this.bookIsbn = bookIsbn;
		this.bookPicture = bookPicture;
		this.bookInfo = bookInfo;
		this.bookAddTime = bookAddTime;
		this.bookFindNumber = bookFindNumber;
		this.bookTotalAmount = bookTotalAmount;
		this.bookAccessAmount = bookAccessAmount;
		this.bookHistory = bookHistory;
		this.borrows = borrows;
		this.returnings = returnings;
		this.bookstores = bookstores;
		this.subscribes = subscribes;
	}

	// Property accessors

	public Integer getBookId() {
		return this.bookId;
	}

	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}

	public Type getType() {
		return this.type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public String getBookName() {
		return this.bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getBookAuthor() {
		return this.bookAuthor;
	}

	public void setBookAuthor(String bookAuthor) {
		this.bookAuthor = bookAuthor;
	}

	public String getBookPress() {
		return this.bookPress;
	}

	public void setBookPress(String bookPress) {
		this.bookPress = bookPress;
	}

	public String getBookPressTime() {
		return this.bookPressTime;
	}

	public void setBookPressTime(String bookPressTime) {
		this.bookPressTime = bookPressTime;
	}

	public String getBookIsbn() {
		return this.bookIsbn;
	}

	public void setBookIsbn(String bookIsbn) {
		this.bookIsbn = bookIsbn;
	}

	public String getBookPicture() {
		return this.bookPicture;
	}

	public void setBookPicture(String bookPicture) {
		this.bookPicture = bookPicture;
	}

	public String getBookInfo() {
		return this.bookInfo;
	}

	public void setBookInfo(String bookInfo) {
		this.bookInfo = bookInfo;
	}

	public Timestamp getBookAddTime() {
		return this.bookAddTime;
	}

	public void setBookAddTime(Timestamp bookAddTime) {
		this.bookAddTime = bookAddTime;
	}

	public String getBookFindNumber() {
		return this.bookFindNumber;
	}

	public void setBookFindNumber(String bookFindNumber) {
		this.bookFindNumber = bookFindNumber;
	}

	public Short getBookTotalAmount() {
		return this.bookTotalAmount;
	}

	public void setBookTotalAmount(Short bookTotalAmount) {
		this.bookTotalAmount = bookTotalAmount;
	}

	public Short getBookAccessAmount() {
		return this.bookAccessAmount;
	}

	public void setBookAccessAmount(Short bookAccessAmount) {
		this.bookAccessAmount = bookAccessAmount;
	}

	public Integer getBookHistory() {
		return this.bookHistory;
	}

	public void setBookHistory(Integer bookHistory) {
		this.bookHistory = bookHistory;
	}

	public Set getBorrows() {
		return this.borrows;
	}

	public void setBorrows(Set borrows) {
		this.borrows = borrows;
	}

	public Set getReturnings() {
		return this.returnings;
	}

	public void setReturnings(Set returnings) {
		this.returnings = returnings;
	}

	public Set getBookstores() {
		return this.bookstores;
	}

	public void setBookstores(Set bookstores) {
		this.bookstores = bookstores;
	}

	public Set getSubscribes() {
		return this.subscribes;
	}

	public void setSubscribes(Set subscribes) {
		this.subscribes = subscribes;
	}

}