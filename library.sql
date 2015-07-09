-- book表
-- totalamount是总数，accessamount是可借总数 bookHistory是历史借阅量
create table book(
	bookId int AUTO_INCREMENT,
	bookName varchar(80) not null,
	bookAuthor varchar(20) not null,
	bookPress varchar(30) not null,
	bookPressTime varchar(4) not null,
	bookISBN varchar(20) unique not null ,
	bookPicture varchar(100)  not null,
	bookType int not null,
	bookInfo text not null,
	bookAddTime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	bookFindNumber varchar(20) unique not null,
	bookTotalAmount tinyint(4) not null,
	bookAccessAmount tinyint(4) not null,
	bookHistory int DEFAULT '0',
	primary key(bookId)
)DEFAULT CHARSET=utf8;

-- user
-- 用户权限 0-会员 1-图书管理员 2-系统管理员
create table user(
	userId int AUTO_INCREMENT,
	userName varchar(16) not null unique,
	userPassword char(32) not null,
	useright tinyint(4) DEFAULT '0',
	userNickname varchar(20),
	userEmail varchar(50) not null,
	userPhone varchar(11) not null,
	primary key(userId)
)DEFAULT CHARSET=utf8;

-- type
create table type(
	typeId int AUTO_INCREMENT,
	typeName varchar(20) not null,
	primary key(typeId)
)DEFAULT CHARSET=utf8;

alter table book
add constraint book_type_fk1 foreign key(bookType) references type(typeId);

create table borrow(
	borrowId int AUTO_INCREMENT,
	userId int,
	bookId int,
	borrowDate timestamp,
	borrowReturnDate timestamp,
	primary key (borrowId,userId,bookId)
)DEFAULT CHARSET=utf8;

alter table borrow
add constraint borrow_user_fk1 foreign key(userId) references user(userId),
add constraint borrow_book_fk1 foreign key(bookId) references book(bookId);

create table returning(
	returnId int AUTO_INCREMENT,
	userId int,
	bookId int,
	returnDate timestamp,
	primary key(returnId,userId,bookId)
)DEFAULT CHARSET=utf8;

alter table returning
add constraint return_user_fk1 foreign key(userId) references user(userId),
add constraint return_book_fk1 foreign key(bookId) references book(bookId);

create table bookStore(
	userId int,
	bookId int,
	primary key(userId,bookId)
)DEFAULT CHARSET=utf8;

alter table bookStore
add constraint bookStore_user_fk1 foreign key(userId) references user(userId),
add constraint bookStore_book_fk1 foreign key(bookId) references book(bookId);


create table subscribe(
	subscribId int AUTO_INCREMENT,
	userId int,
	bookId int,
	stete varchar(20),
	primary key (subscribId,userId,bookId)
) DEFAULT CHARSET=utf8;

alter table subscribe
add constraint subscribe_user_fk1 foreign key(userId) references user(userId),
add constraint subscribe_book_fk1 foreign key(bookId) references book(bookId);
