-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2017 at 07:11 PM
-- Server version: 10.1.25-MariaDB
-- PHP Version: 7.1.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pizza`
--

-- --------------------------------------------------------

--
-- Table structure for table `edge`
--

CREATE TABLE `edge` (
  `edge` varchar(100) NOT NULL,
  `price` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `edge`
--

INSERT INTO `edge` (`edge`, `price`) VALUES
('กุ้ง', 75),
('ชีส', 45),
('ปกติ', 45),
('ปู', 65);

-- --------------------------------------------------------

--
-- Table structure for table `face`
--

CREATE TABLE `face` (
  `face` varchar(100) NOT NULL,
  `price` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `face`
--

INSERT INTO `face` (`face`, `price`) VALUES
('กุ้ง', 25),
('ซีส', 20),
('สับปะรด', 15),
('หัวหอม', 15),
('แฮม', 20),
('ไก่', 20);

-- --------------------------------------------------------

--
-- Table structure for table `flour`
--

CREATE TABLE `flour` (
  `flour` varchar(100) NOT NULL,
  `price` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `flour`
--

INSERT INTO `flour` (`flour`, `price`) VALUES
('กรอบ', 30),
('นุ่ม', 30);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `member` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`member`) VALUES
('Gold'),
('nothing'),
('other'),
('Platinum'),
('Silver');

-- --------------------------------------------------------

--
-- Table structure for table `orderbuy`
--

CREATE TABLE `orderbuy` (
  `orderID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `flour` varchar(100) NOT NULL,
  `size` varchar(100) NOT NULL,
  `price` int(100) NOT NULL,
  `face` varchar(100) NOT NULL,
  `edge` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

CREATE TABLE `size` (
  `size` varchar(100) NOT NULL,
  `price` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `size`
--

INSERT INTO `size` (`size`, `price`) VALUES
('กลาง', 195),
('เล็ก', 145),
('ใหญ่', 225);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status`) VALUES
('พนักงาน\r\n'),
('ลูกค้า');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `member` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `username`, `password`, `member`, `status`) VALUES
(1, 'nattakit325', '0879595974', 'Gold', 'ลูกค้า'),
(2, 'nattakit415', '0821485363', 'other', 'พนักงาน\r\n');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `edge`
--
ALTER TABLE `edge`
  ADD PRIMARY KEY (`edge`);

--
-- Indexes for table `face`
--
ALTER TABLE `face`
  ADD PRIMARY KEY (`face`);

--
-- Indexes for table `flour`
--
ALTER TABLE `flour`
  ADD PRIMARY KEY (`flour`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`member`);

--
-- Indexes for table `orderbuy`
--
ALTER TABLE `orderbuy`
  ADD PRIMARY KEY (`orderID`),
  ADD KEY `FK_flour_orderBUY` (`flour`),
  ADD KEY `FK_size_orderBUY` (`size`),
  ADD KEY `FK_user_orderBUY` (`userID`);

--
-- Indexes for table `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`size`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `FK_status_user` (`status`),
  ADD KEY `FK_member_user` (`member`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orderbuy`
--
ALTER TABLE `orderbuy`
  MODIFY `orderID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `orderbuy`
--
ALTER TABLE `orderbuy`
  ADD CONSTRAINT `FK_flour_orderBUY` FOREIGN KEY (`flour`) REFERENCES `flour` (`flour`),
  ADD CONSTRAINT `FK_size_orderBUY` FOREIGN KEY (`size`) REFERENCES `size` (`size`),
  ADD CONSTRAINT `FK_user_orderBUY` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_member_user` FOREIGN KEY (`member`) REFERENCES `member` (`member`),
  ADD CONSTRAINT `FK_status_user` FOREIGN KEY (`status`) REFERENCES `status` (`status`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
