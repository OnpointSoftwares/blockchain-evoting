-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 16, 2024 at 08:07 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aadhar`
--

-- --------------------------------------------------------

--
-- Table structure for table `aadhar_info`
--

CREATE TABLE `aadhar_info` (
  `Aadharno` varchar(12) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Dob` date DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Is_registered` enum('YES','NO') DEFAULT 'NO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `aadhar_info`
--

INSERT INTO `aadhar_info` (`Aadharno`, `Name`, `Dob`, `Email`, `Is_registered`) VALUES
('1072', 'shadrack Kiprono', '1998-01-05', 'kipronoshadrack84@gmail.com', 'YES'),
('1692', 'VINCENT', '1999-01-11', 'vincentbettoh@gmail.com', 'YES'),
('4730', 'VINCENT', '1997-12-28', 'vincentkipkurui@kabarak.ac.ke', 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `registered_users`
--

CREATE TABLE `registered_users` (
  `User_id` int(11) NOT NULL,
  `Account_address` varchar(255) DEFAULT NULL,
  `Is_registered` enum('YES','NO') DEFAULT 'NO'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registered_users`
--

INSERT INTO `registered_users` (`User_id`, `Account_address`, `Is_registered`) VALUES
(4, '0xC87348CD7a640460fae7ab7818306428eD16Ae2b', 'YES'),
(5, '0xdbBb19c7989B64ef6f6611324DEDA52A98a277c2', 'YES'),
(6, '0xcb4F6FE82f58017F5b4D3e81721B8cF49E49F2ba', 'YES'),
(7, '0xcb4F6FE82f58017F5b4D3e81721B8cF49E49F2ba', 'YES'),
(8, '0xcb4F6FE82f58017F5b4D3e81721B8cF49E49F2ba', 'YES');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `confirm_password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`id`, `first_name`, `email_address`, `password`, `confirm_password`) VALUES
(20, 'VINCENT', 'vincentbettoh@gmail.com', '123456', '123456'),
(21, 'VINCENT', 'vincentkipkurui@kabarak.ac.ke', '12345', '12345'),
(22, 'shadrack Kiprono', 'kipronoshadrack84@gmail.com', '123456', '123456');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aadhar_info`
--
ALTER TABLE `aadhar_info`
  ADD PRIMARY KEY (`Aadharno`);

--
-- Indexes for table `registered_users`
--
ALTER TABLE `registered_users`
  ADD PRIMARY KEY (`User_id`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_address` (`email_address`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `registered_users`
--
ALTER TABLE `registered_users`
  MODIFY `User_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
