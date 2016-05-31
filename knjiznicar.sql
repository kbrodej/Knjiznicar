-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2016 at 10:43 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `knjiznicar`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `id_author` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Surname` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`id_author`, `Name`, `Surname`) VALUES
(1, 'Klemen', 'Brodej');

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id_book` int(11) NOT NULL,
  `Title` varchar(55) NOT NULL,
  `ISBN` int(11) NOT NULL,
  `id_book_status` int(11) DEFAULT NULL,
  `id_publisher` int(11) DEFAULT NULL,
  `id_type` int(11) DEFAULT NULL,
  `id_language` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id_book`, `Title`, `ISBN`, `id_book_status`, `id_publisher`, `id_type`, `id_language`) VALUES
(1, 'Moja prva knjiga', 123456789, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bookauthor`
--

CREATE TABLE `bookauthor` (
  `id_bookauthor` int(11) NOT NULL,
  `id_author` int(11) DEFAULT NULL,
  `id_book` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bookauthor`
--

INSERT INTO `bookauthor` (`id_bookauthor`, `id_author`, `id_book`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `book_status`
--

CREATE TABLE `book_status` (
  `id_book_status` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book_status`
--

INSERT INTO `book_status` (`id_book_status`, `status`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `borrowed`
--

CREATE TABLE `borrowed` (
  `id_borrowed` int(11) NOT NULL,
  `Borrowed_date` date NOT NULL,
  `Return_date` date NOT NULL,
  `id_person` int(11) DEFAULT NULL,
  `num_book` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `copy`
--

CREATE TABLE `copy` (
  `id_copy` int(11) NOT NULL,
  `Number` int(11) NOT NULL,
  `id_book` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `id_language` int(11) NOT NULL,
  `Language` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`id_language`, `Language`) VALUES
(1, 'SLO');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `id_person` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Surname` varchar(20) NOT NULL,
  `Fee` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `id_publisher` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`id_publisher`, `Name`) VALUES
(1, 'DZS');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `id_type` int(11) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `Max_borrowed_days` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`id_type`, `Type`, `Max_borrowed_days`) VALUES
(1, 'Pravljica', 15);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`id_author`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id_book`),
  ADD KEY `IX_Relationship1` (`id_book_status`),
  ADD KEY `IX_Relationship7` (`id_publisher`),
  ADD KEY `IX_Relationship11` (`id_type`),
  ADD KEY `IX_Relationship12` (`id_language`);

--
-- Indexes for table `bookauthor`
--
ALTER TABLE `bookauthor`
  ADD PRIMARY KEY (`id_bookauthor`),
  ADD KEY `IX_Relationship4` (`id_author`),
  ADD KEY `IX_Relationship17` (`id_book`);

--
-- Indexes for table `book_status`
--
ALTER TABLE `book_status`
  ADD PRIMARY KEY (`id_book_status`);

--
-- Indexes for table `borrowed`
--
ALTER TABLE `borrowed`
  ADD PRIMARY KEY (`id_borrowed`),
  ADD KEY `IX_Relationship9` (`id_person`),
  ADD KEY `IX_Relationship15` (`num_book`);

--
-- Indexes for table `copy`
--
ALTER TABLE `copy`
  ADD PRIMARY KEY (`id_copy`),
  ADD KEY `IX_Relationship18` (`id_book`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id_language`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id_person`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`id_publisher`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id_type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `id_author` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id_book` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `bookauthor`
--
ALTER TABLE `bookauthor`
  MODIFY `id_bookauthor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `book_status`
--
ALTER TABLE `book_status`
  MODIFY `id_book_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `borrowed`
--
ALTER TABLE `borrowed`
  MODIFY `id_borrowed` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `id_language` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `id_person` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `id_publisher` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `Relationship1` FOREIGN KEY (`id_book_status`) REFERENCES `book_status` (`id_book_status`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Relationship11` FOREIGN KEY (`id_type`) REFERENCES `type` (`id_type`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Relationship12` FOREIGN KEY (`id_language`) REFERENCES `language` (`id_language`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Relationship7` FOREIGN KEY (`id_publisher`) REFERENCES `publisher` (`id_publisher`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bookauthor`
--
ALTER TABLE `bookauthor`
  ADD CONSTRAINT `Relationship17` FOREIGN KEY (`id_book`) REFERENCES `book` (`id_book`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Relationship4` FOREIGN KEY (`id_author`) REFERENCES `author` (`id_author`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `borrowed`
--
ALTER TABLE `borrowed`
  ADD CONSTRAINT `Relationship15` FOREIGN KEY (`num_book`) REFERENCES `copy` (`id_copy`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `Relationship9` FOREIGN KEY (`id_person`) REFERENCES `person` (`id_person`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `copy`
--
ALTER TABLE `copy`
  ADD CONSTRAINT `Relationship18` FOREIGN KEY (`id_book`) REFERENCES `book` (`id_book`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
