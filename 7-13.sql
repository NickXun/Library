-- phpMyAdmin SQL Dump
-- version 4.3.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2015-07-13 11:48:18
-- 服务器版本： 5.6.21-log
-- PHP Version: 5.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- 表的结构 `book`
--

CREATE TABLE IF NOT EXISTS `book` (
`bookId` int(11) NOT NULL,
  `bookName` varchar(80) NOT NULL,
  `bookAuthor` varchar(20) NOT NULL,
  `bookPress` varchar(30) NOT NULL,
  `bookPressTime` varchar(4) NOT NULL,
  `bookISBN` varchar(100) NOT NULL,
  `bookPicture` varchar(100) NOT NULL,
  `bookType` int(11) NOT NULL,
  `bookInfo` text NOT NULL,
  `bookAddTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `bookFindNumber` varchar(20) NOT NULL,
  `bookTotalAmount` tinyint(4) NOT NULL,
  `bookAccessAmount` tinyint(4) NOT NULL,
  `bookHistory` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `bookstore`
--

CREATE TABLE IF NOT EXISTS `bookstore` (
  `userId` int(11) NOT NULL DEFAULT '0',
  `bookId` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `borrow`
--

CREATE TABLE IF NOT EXISTS `borrow` (
`borrowId` int(11) NOT NULL,
  `userId` int(11) NOT NULL DEFAULT '0',
  `bookId` int(11) NOT NULL DEFAULT '0',
  `borrowDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `borrowReturnDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `returning`
--

CREATE TABLE IF NOT EXISTS `returning` (
`returnId` int(11) NOT NULL,
  `userId` int(11) NOT NULL DEFAULT '0',
  `bookId` int(11) NOT NULL DEFAULT '0',
  `returnDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `subscribe`
--

CREATE TABLE IF NOT EXISTS `subscribe` (
`subscribId` int(11) NOT NULL,
  `userId` int(11) NOT NULL DEFAULT '0',
  `bookId` int(11) NOT NULL DEFAULT '0',
  `stete` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `type`
--

CREATE TABLE IF NOT EXISTS `type` (
`typeId` int(11) NOT NULL,
  `typeName` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`userId` int(11) NOT NULL,
  `userName` varchar(16) NOT NULL,
  `userPassword` char(32) NOT NULL,
  `useright` tinyint(4) DEFAULT '0',
  `userNickname` varchar(20) DEFAULT NULL,
  `userEmail` varchar(50) DEFAULT NULL,
  `userPhone` varchar(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`userId`, `userName`, `userPassword`, `useright`, `userNickname`, `userEmail`, `userPhone`) VALUES
(14, 'caoxun01', 'df1af3438da74c1fda32b1f2490b6114', 0, NULL, '410507696@qq.com', '13902011060'),
(15, 'caoxun02', 'df1af3438da74c1fda32b1f2490b6114', 0, NULL, '410507696@qq.com', '13902011060'),
(16, 'admin', '670b14728ad9902aecba32e22fa4f6bd', 2, NULL, '410507696@qq.com', '13902011060'),
(20, 'library04', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, NULL, NULL),
(21, 'library05', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, NULL, NULL),
(24, 'library06', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, NULL, NULL),
(26, 'library07', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, NULL, NULL),
(28, 'library08', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
 ADD PRIMARY KEY (`bookId`), ADD UNIQUE KEY `bookISBN` (`bookISBN`), ADD UNIQUE KEY `bookFindNumber` (`bookFindNumber`), ADD KEY `book_type_fk1` (`bookType`);

--
-- Indexes for table `bookstore`
--
ALTER TABLE `bookstore`
 ADD PRIMARY KEY (`userId`,`bookId`), ADD KEY `bookStore_book_fk1` (`bookId`);

--
-- Indexes for table `borrow`
--
ALTER TABLE `borrow`
 ADD PRIMARY KEY (`borrowId`,`userId`,`bookId`), ADD KEY `borrow_user_fk1` (`userId`), ADD KEY `borrow_book_fk1` (`bookId`);

--
-- Indexes for table `returning`
--
ALTER TABLE `returning`
 ADD PRIMARY KEY (`returnId`,`userId`,`bookId`), ADD KEY `return_user_fk1` (`userId`), ADD KEY `return_book_fk1` (`bookId`);

--
-- Indexes for table `subscribe`
--
ALTER TABLE `subscribe`
 ADD PRIMARY KEY (`subscribId`,`userId`,`bookId`), ADD KEY `subscribe_user_fk1` (`userId`), ADD KEY `subscribe_book_fk1` (`bookId`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
 ADD PRIMARY KEY (`typeId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`userId`), ADD UNIQUE KEY `userName` (`userName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
MODIFY `bookId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `borrow`
--
ALTER TABLE `borrow`
MODIFY `borrowId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `returning`
--
ALTER TABLE `returning`
MODIFY `returnId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `subscribe`
--
ALTER TABLE `subscribe`
MODIFY `subscribId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
MODIFY `typeId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- 限制导出的表
--

--
-- 限制表 `book`
--
ALTER TABLE `book`
ADD CONSTRAINT `book_type_fk1` FOREIGN KEY (`bookType`) REFERENCES `type` (`typeId`);

--
-- 限制表 `bookstore`
--
ALTER TABLE `bookstore`
ADD CONSTRAINT `bookStore_book_fk1` FOREIGN KEY (`bookId`) REFERENCES `book` (`bookId`),
ADD CONSTRAINT `bookStore_user_fk1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`);

--
-- 限制表 `borrow`
--
ALTER TABLE `borrow`
ADD CONSTRAINT `borrow_book_fk1` FOREIGN KEY (`bookId`) REFERENCES `book` (`bookId`),
ADD CONSTRAINT `borrow_user_fk1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`);

--
-- 限制表 `returning`
--
ALTER TABLE `returning`
ADD CONSTRAINT `return_book_fk1` FOREIGN KEY (`bookId`) REFERENCES `book` (`bookId`),
ADD CONSTRAINT `return_user_fk1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`);

--
-- 限制表 `subscribe`
--
ALTER TABLE `subscribe`
ADD CONSTRAINT `subscribe_book_fk1` FOREIGN KEY (`bookId`) REFERENCES `book` (`bookId`),
ADD CONSTRAINT `subscribe_user_fk1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
