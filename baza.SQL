/*
Created: 01-May-16
Modified: 14-May-16
Model: MySQL 5.6
Database: MySQL 5.6
*/


-- Create tables section -------------------------------------------------

-- Table Book

CREATE TABLE `Book`
(
  `id_book` Int NOT NULL AUTO_INCREMENT,
  `Title` Varchar(55) NOT NULL,
  `ISBN` Int NOT NULL,
  `Number` Int NOT NULL DEFAULT 1,
  `id_book_status` Int,
  `id_bookauthor` Int,
  `id_publisher` Int,
  `id_type` Int,
  `id_language` Int,
  PRIMARY KEY (`id_book`)
)
;

CREATE INDEX `IX_Relationship1` ON `Book` (`id_book_status`)
;

CREATE INDEX `IX_Relationship5` ON `Book` (`id_bookauthor`)
;

CREATE INDEX `IX_Relationship7` ON `Book` (`id_publisher`)
;

CREATE INDEX `IX_Relationship11` ON `Book` (`id_type`)
;

CREATE INDEX `IX_Relationship12` ON `Book` (`id_language`)
;

-- Table BookAuthor

CREATE TABLE `BookAuthor`
(
  `id_bookauthor` Int NOT NULL AUTO_INCREMENT,
  `id_author` Int,
  PRIMARY KEY (`id_bookauthor`)
)
;

CREATE INDEX `IX_Relationship4` ON `BookAuthor` (`id_author`)
;

-- Table Book_status

CREATE TABLE `Book_status`
(
  `id_book_status` Int NOT NULL AUTO_INCREMENT,
  `status` Bool NOT NULL,
  PRIMARY KEY (`id_book_status`)
)
;

-- Table Author

CREATE TABLE `Author`
(
  `id_author` Int NOT NULL AUTO_INCREMENT,
  `Name` Varchar(20) NOT NULL,
  `Surname` Varchar(20) NOT NULL,
  PRIMARY KEY (`id_author`)
)
;

-- Table Publisher

CREATE TABLE `Publisher`
(
  `id_publisher` Int NOT NULL AUTO_INCREMENT,
  `Name` Varchar(20) NOT NULL,
  PRIMARY KEY (`id_publisher`)
)
;

-- Table Person

CREATE TABLE `Person`
(
  `id_person` Int NOT NULL AUTO_INCREMENT,
  `Name` Varchar(20) NOT NULL,
  `Surname` Varchar(20) NOT NULL,
  `Fee` Int,
  PRIMARY KEY (`id_person`)
)
;

-- Table Borrowed

CREATE TABLE `Borrowed`
(
  `id_borrowed` Int NOT NULL AUTO_INCREMENT,
  `Borrowed_date` Date NOT NULL,
  `Return_date` Date NOT NULL,
  `Number` Int DEFAULT 1,
  `id_book` Int,
  `id_person` Int,
  PRIMARY KEY (`id_borrowed`)
)
;

CREATE INDEX `IX_Relationship8` ON `Borrowed` (`id_book`)
;

CREATE INDEX `IX_Relationship9` ON `Borrowed` (`id_person`)
;

-- Table Type

CREATE TABLE `Type`
(
  `id_type` Int NOT NULL AUTO_INCREMENT,
  `Type` Varchar(20) NOT NULL,
  `Max_borrowed_days` Int NOT NULL,
  PRIMARY KEY (`id_type`)
)
;

-- Table Language

CREATE TABLE `Language`
(
  `id_language` Int NOT NULL AUTO_INCREMENT,
  `Language` Varchar(100),
  PRIMARY KEY (`id_language`)
)
;

-- Create relationships section ------------------------------------------------- 

ALTER TABLE `Book` ADD CONSTRAINT `Relationship1` FOREIGN KEY (`id_book_status`) REFERENCES `Book_status` (`id_book_status`) ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE `BookAuthor` ADD CONSTRAINT `Relationship4` FOREIGN KEY (`id_author`) REFERENCES `Author` (`id_author`) ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE `Book` ADD CONSTRAINT `Relationship5` FOREIGN KEY (`id_bookauthor`) REFERENCES `BookAuthor` (`id_bookauthor`) ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE `Book` ADD CONSTRAINT `Relationship7` FOREIGN KEY (`id_publisher`) REFERENCES `Publisher` (`id_publisher`) ON DELETE CASCADE ON UPDATE CASCADE
;

ALTER TABLE `Borrowed` ADD CONSTRAINT `Relationship8` FOREIGN KEY (`id_book`) REFERENCES `Book` (`id_book`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Borrowed` ADD CONSTRAINT `Relationship9` FOREIGN KEY (`id_person`) REFERENCES `Person` (`id_person`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Book` ADD CONSTRAINT `Relationship11` FOREIGN KEY (`id_type`) REFERENCES `Type` (`id_type`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE `Book` ADD CONSTRAINT `Relationship12` FOREIGN KEY (`id_language`) REFERENCES `Language` (`id_language`) ON DELETE RESTRICT ON UPDATE RESTRICT
;

