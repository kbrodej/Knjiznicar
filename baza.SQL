-- --------------------------------------------------------
-- Host:                         Localhost
-- Server version:               10.1.13-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table knjiznicar.author
CREATE TABLE IF NOT EXISTS `author` (
  `id_author` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  `Surname` varchar(20) NOT NULL,
  PRIMARY KEY (`id_author`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table knjiznicar.author: ~1 rows (approximately)
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` (`id_author`, `Name`, `Surname`) VALUES
  (1, 'Klemen', 'Brodej');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;


-- Dumping structure for table knjiznicar.book
CREATE TABLE IF NOT EXISTS `book` (
  `id_book` int(11) NOT NULL AUTO_INCREMENT,
  `Title` varchar(55) NOT NULL,
  `ISBN` int(11) NOT NULL,
  `id_book_status` int(11) DEFAULT NULL,
  `id_publisher` int(11) DEFAULT NULL,
  `id_type` int(11) DEFAULT NULL,
  `id_language` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_book`),
  KEY `IX_Relationship1` (`id_book_status`),
  KEY `IX_Relationship7` (`id_publisher`),
  KEY `IX_Relationship11` (`id_type`),
  KEY `IX_Relationship12` (`id_language`),
  CONSTRAINT `Relationship1` FOREIGN KEY (`id_book_status`) REFERENCES `book_status` (`id_book_status`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Relationship11` FOREIGN KEY (`id_type`) REFERENCES `type` (`id_type`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship12` FOREIGN KEY (`id_language`) REFERENCES `language` (`id_language`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship7` FOREIGN KEY (`id_publisher`) REFERENCES `publisher` (`id_publisher`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table knjiznicar.book: ~1 rows (approximately)
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` (`id_book`, `Title`, `ISBN`, `id_book_status`, `id_publisher`, `id_type`, `id_language`) VALUES
  (1, 'Moja prva knjiga', 123456789, 1, 1, 1, 1);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;


-- Dumping structure for table knjiznicar.bookauthor
CREATE TABLE IF NOT EXISTS `bookauthor` (
  `id_bookauthor` int(11) NOT NULL AUTO_INCREMENT,
  `id_author` int(11) DEFAULT NULL,
  `id_book` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_bookauthor`),
  KEY `IX_Relationship4` (`id_author`),
  KEY `IX_Relationship17` (`id_book`),
  CONSTRAINT `Relationship17` FOREIGN KEY (`id_book`) REFERENCES `book` (`id_book`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship4` FOREIGN KEY (`id_author`) REFERENCES `author` (`id_author`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table knjiznicar.bookauthor: ~1 rows (approximately)
/*!40000 ALTER TABLE `bookauthor` DISABLE KEYS */;
INSERT INTO `bookauthor` (`id_bookauthor`, `id_author`, `id_book`) VALUES
  (1, 1, 1);
/*!40000 ALTER TABLE `bookauthor` ENABLE KEYS */;


-- Dumping structure for table knjiznicar.book_status
CREATE TABLE IF NOT EXISTS `book_status` (
  `id_book_status` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_book_status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table knjiznicar.book_status: ~2 rows (approximately)
/*!40000 ALTER TABLE `book_status` DISABLE KEYS */;
INSERT INTO `book_status` (`id_book_status`, `status`) VALUES
  (1, 1),
  (2, 2);
/*!40000 ALTER TABLE `book_status` ENABLE KEYS */;


-- Dumping structure for table knjiznicar.borrowed
CREATE TABLE IF NOT EXISTS `borrowed` (
  `id_borrowed` int(11) NOT NULL AUTO_INCREMENT,
  `Borrowed_date` date NOT NULL,
  `Return_date` date NOT NULL,
  `id_person` int(11) DEFAULT NULL,
  `num_book` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_borrowed`),
  KEY `IX_Relationship9` (`id_person`),
  KEY `IX_Relationship15` (`num_book`),
  CONSTRAINT `Relationship15` FOREIGN KEY (`num_book`) REFERENCES `copy` (`id_copy`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Relationship9` FOREIGN KEY (`id_person`) REFERENCES `person` (`id_person`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table knjiznicar.borrowed: ~0 rows (approximately)
/*!40000 ALTER TABLE `borrowed` DISABLE KEYS */;
/*!40000 ALTER TABLE `borrowed` ENABLE KEYS */;


-- Dumping structure for table knjiznicar.copy
CREATE TABLE IF NOT EXISTS `copy` (
  `id_copy` int(11) NOT NULL,
  `Number` int(11) NOT NULL,
  `id_book` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_copy`),
  KEY `IX_Relationship18` (`id_book`),
  CONSTRAINT `Relationship18` FOREIGN KEY (`id_book`) REFERENCES `book` (`id_book`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table knjiznicar.copy: ~0 rows (approximately)
/*!40000 ALTER TABLE `copy` DISABLE KEYS */;
/*!40000 ALTER TABLE `copy` ENABLE KEYS */;


-- Dumping structure for table knjiznicar.language
CREATE TABLE IF NOT EXISTS `language` (
  `id_language` int(11) NOT NULL AUTO_INCREMENT,
  `Language` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_language`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table knjiznicar.language: ~1 rows (approximately)
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` (`id_language`, `Language`) VALUES
  (1, 'SLO');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;


-- Dumping structure for table knjiznicar.person
CREATE TABLE IF NOT EXISTS `person` (
  `id_person` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  `Surname` varchar(20) NOT NULL,
  `Fee` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_person`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table knjiznicar.person: ~0 rows (approximately)
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
/*!40000 ALTER TABLE `person` ENABLE KEYS */;


-- Dumping structure for table knjiznicar.publisher
CREATE TABLE IF NOT EXISTS `publisher` (
  `id_publisher` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  PRIMARY KEY (`id_publisher`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table knjiznicar.publisher: ~1 rows (approximately)
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` (`id_publisher`, `Name`) VALUES
  (1, 'DZS');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;


-- Dumping structure for table knjiznicar.type
CREATE TABLE IF NOT EXISTS `type` (
  `id_type` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(20) NOT NULL,
  `Max_borrowed_days` int(11) NOT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table knjiznicar.type: ~1 rows (approximately)
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` (`id_type`, `Type`, `Max_borrowed_days`) VALUES
  (1, 'Pravljica', 15);
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
