-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 29, 2020 at 08:34 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `booked_package`
--

CREATE TABLE `booked_package` (
  `bp_auto_id` int(15) NOT NULL,
  `package_id` int(15) DEFAULT NULL,
  `booking_id` int(15) DEFAULT NULL,
  `is_luxury` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(15) NOT NULL,
  `guest_id` int(15) DEFAULT NULL,
  `room_id` int(15) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(15) NOT NULL,
  `category_description` varchar(150) DEFAULT NULL,
  `room_id` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cleaningschedule`
--

CREATE TABLE `cleaningschedule` (
  `cs_auto_id` int(15) NOT NULL,
  `room_id` int(15) DEFAULT NULL,
  `cleaning_date` date DEFAULT NULL,
  `social_sec_nr` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `social_sec_nr` int(15) NOT NULL,
  `employee_name` varchar(100) NOT NULL,
  `employee_address` varchar(100) NOT NULL,
  `is_attendant` bit(1) DEFAULT NULL,
  `is_caretaker` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE `guest` (
  `guest_id` int(11) NOT NULL,
  `guest_address` varchar(100) DEFAULT NULL,
  `guest_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `package_id` int(15) NOT NULL,
  `package_content` varchar(100) DEFAULT NULL,
  `subject_area_id` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `room_id` int(15) NOT NULL,
  `is_single_room` bit(1) DEFAULT NULL,
  `category_id` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subject_area`
--

CREATE TABLE `subject_area` (
  `subject_area_id` int(15) NOT NULL,
  `subject_description` varchar(150) DEFAULT NULL,
  `social_sec_nr` int(15) DEFAULT NULL,
  `package_id` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booked_package`
--
ALTER TABLE `booked_package`
  ADD PRIMARY KEY (`bp_auto_id`),
  ADD UNIQUE KEY `package_id` (`package_id`,`booking_id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD UNIQUE KEY `guest_id` (`guest_id`,`room_id`),
  ADD KEY `room_id` (`room_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `cleaningschedule`
--
ALTER TABLE `cleaningschedule`
  ADD PRIMARY KEY (`cs_auto_id`),
  ADD UNIQUE KEY `room_id` (`room_id`,`social_sec_nr`),
  ADD KEY `social_sec_nr` (`social_sec_nr`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`social_sec_nr`);

--
-- Indexes for table `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`guest_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`),
  ADD UNIQUE KEY `subject_area_id` (`subject_area_id`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`room_id`),
  ADD UNIQUE KEY `category_id` (`category_id`);

--
-- Indexes for table `subject_area`
--
ALTER TABLE `subject_area`
  ADD PRIMARY KEY (`subject_area_id`),
  ADD UNIQUE KEY `social_sec_nr` (`social_sec_nr`),
  ADD UNIQUE KEY `package_id` (`package_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booked_package`
--
ALTER TABLE `booked_package`
  MODIFY `bp_auto_id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cleaningschedule`
--
ALTER TABLE `cleaningschedule`
  MODIFY `cs_auto_id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `social_sec_nr` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `guest`
--
ALTER TABLE `guest`
  MODIFY `guest_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `package_id` int(15) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subject_area`
--
ALTER TABLE `subject_area`
  MODIFY `subject_area_id` int(15) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booked_package`
--
ALTER TABLE `booked_package`
  ADD CONSTRAINT `booked_package_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`),
  ADD CONSTRAINT `booked_package_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `package` (`package_id`);

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`guest_id`) REFERENCES `guest` (`guest_id`);

--
-- Constraints for table `cleaningschedule`
--
ALTER TABLE `cleaningschedule`
  ADD CONSTRAINT `cleaningschedule_ibfk_1` FOREIGN KEY (`social_sec_nr`) REFERENCES `employee` (`social_sec_nr`),
  ADD CONSTRAINT `cleaningschedule_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `room` (`room_id`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

--
-- Constraints for table `subject_area`
--
ALTER TABLE `subject_area`
  ADD CONSTRAINT `subject_area_ibfk_1` FOREIGN KEY (`subject_area_id`) REFERENCES `employee` (`social_sec_nr`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
