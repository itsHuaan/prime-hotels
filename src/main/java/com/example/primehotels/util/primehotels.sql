-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2024 at 07:51 PM
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
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `customerId` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`customerId`, `name`, `tel`, `email`) VALUES
('001201007756', 'Tran Hoang Long', '0375976671', 'long1187@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_facility`
--

CREATE TABLE `tbl_facility` (
  `facilityId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_facility`
--

INSERT INTO `tbl_facility` (`facilityId`, `name`) VALUES
(1, 'Free Wi-Fi'),
(2, 'Swimming Pool'),
(3, 'Gym'),
(4, 'Spa'),
(5, 'Restaurant');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_facilitylist`
--

CREATE TABLE `tbl_facilitylist` (
  `facilityListId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `facilityId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_facilitylist`
--

INSERT INTO `tbl_facilitylist` (`facilityListId`, `name`, `facilityId`) VALUES
(1, 'Sunshine Hotel Facilities', 1),
(1, 'Sunshine Hotel Facilities', 2),
(2, 'Mountain Retreat Facilities', 1),
(2, 'Mountain Retreat Facilities', 3),
(3, 'City Lights Hotel Facilities', 1),
(3, 'City Lights Hotel Facilities', 4),
(3, 'City Lights Hotel Facilities', 5),
(4, 'Forest Lodge Facilities', 1),
(4, 'Forest Lodge Facilities', 3),
(5, 'Desert Oasis Facilities', 1),
(5, 'Desert Oasis Facilities', 2),
(5, 'Desert Oasis Facilities', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_hotel`
--

CREATE TABLE `tbl_hotel` (
  `hotelId` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `locationId` int(11) NOT NULL,
  `address` mediumtext NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `roomAvailable` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(10,0) NOT NULL,
  `discount` int(11) DEFAULT NULL,
  `rating` decimal(10,0) NOT NULL,
  `status` int(1) NOT NULL,
  `facilityListId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_hotel`
--

INSERT INTO `tbl_hotel` (`hotelId`, `name`, `locationId`, `address`, `description`, `roomAvailable`, `image`, `price`, `discount`, `rating`, `status`, `facilityListId`) VALUES
('H001', 'Sunshine Hotel', 1, '123 Ocean Drive, Beach City', 'A seaside hotel with ocean views', 50, 'sunshine_hotel.jpg', 150, 0, 5, 1, 1),
('H002', 'Mountain Retreat', 2, '456 Mountain Road, High Peaks', 'A cozy retreat in the mountains', 20, 'mountain_retreat.jpg', 200, 0, 5, 1, 2),
('H003', 'City Lights Hotel', 3, '789 Central Avenue, Metropolis', 'A luxury hotel in the heart of the city', 100, 'city_lights.jpg', 300, 0, 5, 1, 3),
('H004', 'Forest Lodge', 4, '101 Forest Lane, Greenwoods', 'A peaceful lodge surrounded by nature', 30, 'forest_lodge.jpg', 120, 0, 4, 1, 4),
('H005', 'Desert Oasis', 5, '202 Desert Road, Sandville', 'An exotic hotel in the desert', 25, 'desert_oasis.jpg', 180, 0, 5, 1, 5),
('test', 'fsdf', 1, 'rwer', 'dfasdasd', 4, NULL, 125434, 44, 5, 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_invoice`
--

CREATE TABLE `tbl_invoice` (
  `invoiceId` varchar(255) NOT NULL,
  `reservationId` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `totalPrice` double NOT NULL,
  `paymentId` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_location`
--

CREATE TABLE `tbl_location` (
  `locationId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_location`
--

INSERT INTO `tbl_location` (`locationId`, `name`, `parentId`, `type`) VALUES
(1, 'Hà Nội', NULL, 1),
(2, 'Hà Giang', NULL, 1),
(3, 'Cao Bằng', NULL, 1),
(4, 'Bắc Kạn', NULL, 1),
(5, 'Tuyên Quang', NULL, 1),
(6, 'Lào Cai', NULL, 1),
(7, 'Điện Biên', NULL, 1),
(8, 'Lai Châu', NULL, 1),
(9, 'Sơn La', NULL, 1),
(10, 'Yên Bái', NULL, 1),
(11, 'Hoà Bình', NULL, 1),
(12, 'Thái Nguyên', NULL, 1),
(13, 'Lạng Sơn', NULL, 1),
(14, 'Quảng Ninh', NULL, 1),
(15, 'Bắc Giang', NULL, 1),
(16, 'Phú Thọ', NULL, 1),
(17, 'Vĩnh Phúc', NULL, 1),
(18, 'Bắc Ninh', NULL, 1),
(19, 'Hải Dương', NULL, 1),
(20, 'Hải Phòng', NULL, 1),
(21, 'Hưng Yên', NULL, 1),
(22, 'Thái Bình', NULL, 1),
(23, 'Hà Nam', NULL, 1),
(24, 'Nam Định', NULL, 1),
(25, 'Ninh Bình', NULL, 1),
(26, 'Thanh Hóa', NULL, 1),
(27, 'Nghệ An', NULL, 1),
(28, 'Hà Tĩnh', NULL, 1),
(29, 'Quảng Bình', NULL, 1),
(30, 'Quảng Trị', NULL, 1),
(31, 'Thừa Thiên Huế', NULL, 1),
(32, 'Đà Nẵng', NULL, 1),
(33, 'Quảng Nam', NULL, 1),
(34, 'Quảng Ngãi', NULL, 1),
(35, 'Bình Định', NULL, 1),
(36, 'Phú Yên', NULL, 1),
(37, 'Khánh Hòa', NULL, 1),
(38, 'Ninh Thuận', NULL, 1),
(39, 'Bình Thuận', NULL, 1),
(40, 'Kon Tum', NULL, 1),
(41, 'Gia Lai', NULL, 1),
(42, 'Đắk Lắk', NULL, 1),
(43, 'Đắk Nông', NULL, 1),
(44, 'Lâm Đồng', NULL, 1),
(45, 'Bình Phước', NULL, 1),
(46, 'Tây Ninh', NULL, 1),
(47, 'Bình Dương', NULL, 1),
(48, 'Đồng Nai', NULL, 1),
(49, 'Bà Rịa - Vũng Tàu', NULL, 1),
(50, 'Hồ Chí Minh', NULL, 1),
(51, 'Long An', NULL, 1),
(52, 'Tiền Giang', NULL, 1),
(53, 'Bến Tre', NULL, 1),
(54, 'Trà Vinh', NULL, 1),
(55, 'Vĩnh Long', NULL, 1),
(56, 'Đồng Tháp', NULL, 1),
(57, 'An Giang', NULL, 1),
(58, 'Kiên Giang', NULL, 1),
(59, 'Cần Thơ', NULL, 1),
(60, 'Hậu Giang', NULL, 1),
(61, 'Sóc Trăng', NULL, 1),
(62, 'Bạc Liêu', NULL, 1),
(63, 'Cà Mau', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payment`
--

CREATE TABLE `tbl_payment` (
  `paymentId` varchar(255) NOT NULL,
  `paymentType` varchar(255) NOT NULL,
  `rating` decimal(10,0) DEFAULT NULL,
  `comment` mediumtext DEFAULT NULL
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
  `createdAt` datetime NOT NULL,
  `deposit` decimal(10,0) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_reservation`
--

INSERT INTO `tbl_reservation` (`reservationId`, `customerId`, `hotelId`, `checkIn`, `checkOut`, `createdAt`, `deposit`, `status`) VALUES
('192413c0-d721-414c-a634-d2154d7be332', '001201007756', 'test', '2024-10-23', '2024-10-24', '2024-10-20 17:59:49', 23180, 1),
('b1c045a4-985d-41a2-acda-6e3b838bf316', '001201007756', 'H001', '2024-10-26', '2024-10-29', '2024-10-20 18:10:02', 149, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`customerId`),
  ADD UNIQUE KEY `customerId` (`customerId`);

--
-- Indexes for table `tbl_facility`
--
ALTER TABLE `tbl_facility`
  ADD PRIMARY KEY (`facilityId`),
  ADD UNIQUE KEY `facilityId` (`facilityId`);

--
-- Indexes for table `tbl_facilitylist`
--
ALTER TABLE `tbl_facilitylist`
  ADD KEY `tbl_facilityList_index_0` (`facilityId`),
  ADD KEY `facilityListId` (`facilityListId`);

--
-- Indexes for table `tbl_hotel`
--
ALTER TABLE `tbl_hotel`
  ADD PRIMARY KEY (`hotelId`),
  ADD UNIQUE KEY `hotelId` (`hotelId`),
  ADD KEY `tbl_hotel_index_0` (`facilityListId`,`locationId`) USING BTREE,
  ADD KEY `locationId` (`locationId`);

--
-- Indexes for table `tbl_invoice`
--
ALTER TABLE `tbl_invoice`
  ADD PRIMARY KEY (`invoiceId`),
  ADD UNIQUE KEY `invoiceId` (`invoiceId`),
  ADD KEY `tbl_invoice_index_0` (`paymentId`,`reservationId`),
  ADD KEY `reservationId` (`reservationId`);

--
-- Indexes for table `tbl_location`
--
ALTER TABLE `tbl_location`
  ADD PRIMARY KEY (`locationId`),
  ADD UNIQUE KEY `locationId` (`locationId`);

--
-- Indexes for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD PRIMARY KEY (`paymentId`),
  ADD UNIQUE KEY `paymentId` (`paymentId`);

--
-- Indexes for table `tbl_reservation`
--
ALTER TABLE `tbl_reservation`
  ADD PRIMARY KEY (`reservationId`),
  ADD UNIQUE KEY `reservationId` (`reservationId`),
  ADD KEY `tbl_reservation_index_0` (`customerId`),
  ADD KEY `hotelId` (`hotelId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_facility`
--
ALTER TABLE `tbl_facility`
  MODIFY `facilityId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_location`
--
ALTER TABLE `tbl_location`
  MODIFY `locationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_facilitylist`
--
ALTER TABLE `tbl_facilitylist`
  ADD CONSTRAINT `tbl_facilitylist_ibfk_1` FOREIGN KEY (`facilityId`) REFERENCES `tbl_facility` (`facilityId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_hotel`
--
ALTER TABLE `tbl_hotel`
  ADD CONSTRAINT `tbl_hotel_ibfk_1` FOREIGN KEY (`locationId`) REFERENCES `tbl_location` (`locationId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_hotel_ibfk_2` FOREIGN KEY (`facilityListId`) REFERENCES `tbl_facilitylist` (`facilityListId`);

--
-- Constraints for table `tbl_invoice`
--
ALTER TABLE `tbl_invoice`
  ADD CONSTRAINT `tbl_invoice_ibfk_1` FOREIGN KEY (`reservationId`) REFERENCES `tbl_reservation` (`reservationId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_payment`
--
ALTER TABLE `tbl_payment`
  ADD CONSTRAINT `tbl_payment_ibfk_1` FOREIGN KEY (`paymentId`) REFERENCES `tbl_invoice` (`paymentId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_reservation`
--
ALTER TABLE `tbl_reservation`
  ADD CONSTRAINT `tbl_reservation_ibfk_1` FOREIGN KEY (`hotelId`) REFERENCES `tbl_hotel` (`hotelId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_reservation_ibfk_2` FOREIGN KEY (`customerId`) REFERENCES `tbl_customer` (`customerId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
