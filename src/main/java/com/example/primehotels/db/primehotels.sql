-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2024 at 07:00 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `primehotels`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_city`
--

CREATE TABLE `tbl_city` (
  `cityId` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `customerId` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `comment` text DEFAULT NULL,
  `rating` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_district`
--

CREATE TABLE `tbl_district` (
  `districtId` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `cityId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_hotel`
--

CREATE TABLE `tbl_hotel` (
  `hotelId` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `townId` int(11) DEFAULT NULL,
  `address` text NOT NULL,
  `description` text DEFAULT NULL,
  `roomAvailable` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `rating` decimal(8,2) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_invoice`
--

CREATE TABLE `tbl_invoice` (
  `invoiceId` varchar(255) NOT NULL,
  `reservationId` varchar(255) NOT NULL,
  `invoiceDate` date NOT NULL,
  `totalPrice` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reservation`
--

CREATE TABLE `tbl_reservation` (
  `reservationId` varchar(255) NOT NULL,
  `customerId` varchar(255) NOT NULL,
  `hotelId` varchar(255) NOT NULL,
  `checkIn` date NOT NULL,
  `checkOut` date NOT NULL,
  `reserveDate` date NOT NULL,
  `deposit` decimal(8,2) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_town`
--

CREATE TABLE `tbl_town` (
  `townId` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `districtId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_city`
--
ALTER TABLE `tbl_city`
  ADD PRIMARY KEY (`cityId`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`customerId`);

--
-- Indexes for table `tbl_district`
--
ALTER TABLE `tbl_district`
  ADD PRIMARY KEY (`districtId`),
  ADD KEY `tbl_district_cityid_foreign` (`cityId`);

--
-- Indexes for table `tbl_hotel`
--
ALTER TABLE `tbl_hotel`
  ADD PRIMARY KEY (`hotelId`),
  ADD KEY `townId` (`townId`);

--
-- Indexes for table `tbl_invoice`
--
ALTER TABLE `tbl_invoice`
  ADD PRIMARY KEY (`invoiceId`),
  ADD KEY `tbl_invoice_reservationid_foreign` (`reservationId`);

--
-- Indexes for table `tbl_reservation`
--
ALTER TABLE `tbl_reservation`
  ADD PRIMARY KEY (`reservationId`),
  ADD KEY `tbl_reservation_customerid_foreign` (`customerId`),
  ADD KEY `hotelId` (`hotelId`);

--
-- Indexes for table `tbl_town`
--
ALTER TABLE `tbl_town`
  ADD PRIMARY KEY (`townId`),
  ADD KEY `tbl_town_districtid_foreign` (`districtId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_city`
--
ALTER TABLE `tbl_city`
  MODIFY `cityId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_district`
--
ALTER TABLE `tbl_district`
  MODIFY `districtId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_town`
--
ALTER TABLE `tbl_town`
  MODIFY `townId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_district`
--
ALTER TABLE `tbl_district`
  ADD CONSTRAINT `tbl_district_cityid_foreign` FOREIGN KEY (`cityId`) REFERENCES `tbl_city` (`cityId`);

--
-- Constraints for table `tbl_hotel`
--
ALTER TABLE `tbl_hotel`
  ADD CONSTRAINT `tbl_hotel_ibfk_1` FOREIGN KEY (`townId`) REFERENCES `tbl_town` (`townId`);

--
-- Constraints for table `tbl_invoice`
--
ALTER TABLE `tbl_invoice`
  ADD CONSTRAINT `tbl_invoice_reservationid_foreign` FOREIGN KEY (`reservationId`) REFERENCES `tbl_reservation` (`reservationId`);

--
-- Constraints for table `tbl_reservation`
--
ALTER TABLE `tbl_reservation`
  ADD CONSTRAINT `tbl_reservation_customerid_foreign` FOREIGN KEY (`customerId`) REFERENCES `tbl_customer` (`customerId`),
  ADD CONSTRAINT `tbl_reservation_ibfk_1` FOREIGN KEY (`hotelId`) REFERENCES `tbl_hotel` (`hotelId`);

--
-- Constraints for table `tbl_town`
--
ALTER TABLE `tbl_town`
  ADD CONSTRAINT `tbl_town_districtid_foreign` FOREIGN KEY (`districtId`) REFERENCES `tbl_district` (`districtId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
