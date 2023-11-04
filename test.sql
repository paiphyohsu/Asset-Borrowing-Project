-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 03, 2023 at 06:50 PM
-- Server version: 8.0.17
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `borrwer`
--

CREATE TABLE `borrwer` (
  `BID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `borrwings`
--

CREATE TABLE `borrwings` (
  `AssID` int(11) DEFAULT NULL,
  `BID` int(11) DEFAULT NULL,
  `whenTake` date DEFAULT NULL,
  `whenReturn` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `AssID` int(11) NOT NULL,
  `AssetName` varchar(25) NOT NULL,
  `AssImg` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `rrgister`
--

CREATE TABLE `rrgister` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(25) NOT NULL,
  `UserPass` varchar(25) NOT NULL,
  `UserMail` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `borrwer`
--
ALTER TABLE `borrwer`
  ADD PRIMARY KEY (`BID`),
  ADD KEY `UserID` (`UserID`);

--
-- Indexes for table `borrwings`
--
ALTER TABLE `borrwings`
  ADD KEY `AssID` (`AssID`),
  ADD KEY `BID` (`BID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`AssID`);

--
-- Indexes for table `rrgister`
--
ALTER TABLE `rrgister`
  ADD PRIMARY KEY (`UserID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `borrwer`
--
ALTER TABLE `borrwer`
  ADD CONSTRAINT `borrwer_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `rrgister` (`UserID`);

--
-- Constraints for table `borrwings`
--
ALTER TABLE `borrwings`
  ADD CONSTRAINT `borrwings_ibfk_1` FOREIGN KEY (`AssID`) REFERENCES `product` (`AssID`),
  ADD CONSTRAINT `borrwings_ibfk_2` FOREIGN KEY (`BID`) REFERENCES `borrwer` (`BID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
