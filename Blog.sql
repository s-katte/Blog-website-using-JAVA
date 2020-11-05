-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 05, 2020 at 01:32 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `blog_id` varchar(60) NOT NULL,
  `created_by` varchar(15) NOT NULL,
  `thumbnail` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `title` text NOT NULL,
  `visibility` int(11) NOT NULL DEFAULT 0,
  `topic` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog`
--

INSERT INTO `blog` (`blog_id`, `created_by`, `thumbnail`, `content`, `created_at`, `title`, `visibility`, `topic`) VALUES
('da61c95f-ac37-40ca-90db-00bd1e0d1fdf', 'johndoe', 'testt.png', 'A class that represents an immutable universally unique identifier (UUID). A UUID represents a 128-bit value. There exist different variants of these global identifiers. The methods of this class are for manipulating the Leach-Salz variant, although the constructors allow the creation of any variant of UUID (described below).\r\nThere are four different basic types of UUIDs: time-based, DCE security, name-based, and randomly generated UUIDs. These types have a version value of 1, 2, 3 and 4, respectively.\r\n\r\nUsed to create session id in web application. It is also used to create transaction id.\r\nIt extends Object class.\r\nIt implements Serializable and Comparable interfaces.', '2020-11-05 12:31:52', 'Data Converter Web App', 0, 'Entertainmnt'),
('f818b62d-e708-4100-9495-e685ef9eb958', 'johndoe', 'testt.png', 'a content', '2020-11-05 12:31:26', 'Data Converter Web App', 0, 'Science');

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `name` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`name`) VALUES
('Entertainmnt'),
('Environment'),
('Language'),
('Literature'),
('Science'),
('Space'),
('Technology');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_name` varchar(15) NOT NULL,
  `email` varchar(25) NOT NULL,
  `password` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `first_name` varchar(10) NOT NULL,
  `last_name` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_name`, `email`, `password`, `created_at`, `first_name`, `last_name`) VALUES
('abc', 'shubhamkatte99@gmail.com', '111', '2020-11-02 11:21:03', 'Shubham', 'Katte'),
('acsa', 'shubhamkatte99@gmail.com', '111', '2020-11-03 14:36:50', 'Shubham', 'Katte'),
('ashv', 'shubhamkatte99@gmail.com', '11', '2020-11-02 08:59:33', 'Shubham', 'Katte'),
('johndoe', 'shubhamkatte99@gmail.com', '1111', '2020-11-02 11:03:43', 'Shubham', 'Katte');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`blog_id`),
  ADD KEY `topic` (`topic`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_name`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog`
--
ALTER TABLE `blog`
  ADD CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`topic`) REFERENCES `topic` (`name`),
  ADD CONSTRAINT `blog_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `user` (`user_name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
