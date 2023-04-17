-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 16, 2023 at 07:32 PM
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
-- Database: `NRWA`
--

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `company_name` varchar(45) DEFAULT NULL,
  `address` varchar(70) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `fax` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `website` varchar(45) DEFAULT NULL,
  `description` varchar(450) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Company table contains information about retail store';

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `company_name`, `address`, `phone`, `fax`, `email`, `website`, `description`) VALUES
(1, 'Ferrandino', 'Albany', '518963254', '', 'fer@email.com', 'ferrandino.com', 'Maintanance company'),
(2, 'Pioneers Properties', 'New Jersey', '831-869-7423', '8884563217', 'pioneer@pioneeer.com', '', 'Contractors'),
(3, 'Gap', 'New York', '907-963-8521', '', 'admin@gap.com', 'gap.com', 'Retail store'),
(4, 'Wallmart', 'Chicago', '800-987-2591', '888-723-4916', '', 'walmart.com', 'Retail'),
(5, 'TD Bank', 'Benington, VT', '800-742-4691', '800-943-75182', 'ask@tdbank.com', 'tdbank.com', 'Bank ');

-- --------------------------------------------------------

--
-- Table structure for table `contractor`
--

CREATE TABLE `contractor` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `rate` varchar(45) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `contractor`
--

INSERT INTO `contractor` (`id`, `name`, `address`, `phone`, `email`, `rate`, `users_id`) VALUES
(1, 'Roman', 'Lake George', '518-366-8521', 'email@email', '55', 31),
(2, 'Alex', 'Albany', '518-777-5482', 'alex@email.com', '53', 2),
(3, 'John Doe', 'Chicago', '787-852-1593', 'john@handyman.com', '75', 8);

-- --------------------------------------------------------

--
-- Table structure for table `dispatcher`
--

CREATE TABLE `dispatcher` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `dispatcher`
--

INSERT INTO `dispatcher` (`id`, `name`, `phone`, `users_id`) VALUES
(1, 'Tom Benny', '518-742-4268', NULL),
(2, 'Corbent Hall', '548-953-7429', NULL),
(3, 'Alexa Larbe', '631-852-7419', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `company_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Retail store location';

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `name`, `address`, `phone`, `email`, `company_id`) VALUES
(1, 'Gap', 'Test', '55555', '', 3),
(4, 'Gap', 'Albany', '518-365-9874', '', 3),
(6, 'Walmart', 'Albant', '518-742-8532', '', 4),
(7, 'Walmart', 'Albany', '518-742-4366', '', 4),
(8, 'Walmart', 'Troy', '518-742-8533', '', 4);

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `users_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Retail store manager';

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`id`, `name`, `location_id`, `users_id`) VALUES
(13, 'Alex Mint', 1, NULL),
(18, 'Jenna Miller', 6, NULL),
(19, 'Roman Babushkin', 7, NULL),
(20, 'John Doe', 4, NULL),
(21, 'Tom Presto', 8, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `received_wo`
--

CREATE TABLE `received_wo` (
  `id` int(11) NOT NULL,
  `dispatcher_id` int(11) DEFAULT NULL,
  `workorder_id` int(11) NOT NULL,
  `contractor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='Workorders received by a dispatcher and assigned to a contractor.';

--
-- Dumping data for table `received_wo`
--

INSERT INTO `received_wo` (`id`, `dispatcher_id`, `workorder_id`, `contractor_id`) VALUES
(1, 1, 1, NULL),
(2, 2, 2, 1),
(41, 1, 1, 1),
(42, 1, 3, 1),
(43, 1, 15, 1),
(44, 1, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(10) NOT NULL,
  `password` varchar(45) NOT NULL,
  `role` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `password`, `role`) VALUES
(2, 'Alex', 'test', 'contractor'),
(3, 'admin', '0000', 'admin'),
(4, 'Roland', '9999', NULL),
(5, 'Jessika', 'TEST', 'dispatcher'),
(7, 'Jenna', '111110000', NULL),
(8, 'John Doe', '77777', 'contractor'),
(13, 'Test', 'rrrrr', 'admin'),
(15, 'Paul', 'fdhfdhgfh', 'client'),
(17, 'Tom', 'Clinton', 'contractor'),
(21, 'Roman', '0000', 'admin'),
(23, 'Dimka', '1111', 'contractor'),
(31, 'Roman', '222', 'contractor'),
(33, 'Alex', 'password', 'dispatcher'),
(36, 'Jenna', '111', 'client'),
(38, 'Sarah', '1234', 'admin'),
(39, 'Dimka', '1111', 'contractor'),
(40, '', '', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `workorder`
--

CREATE TABLE `workorder` (
  `id` int(11) NOT NULL,
  `description` varchar(450) DEFAULT NULL,
  `estimate` double DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `received` date DEFAULT NULL,
  `scheduled` date DEFAULT NULL,
  `compleated` varchar(45) DEFAULT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `workorder`
--

INSERT INTO `workorder` (`id`, `description`, `estimate`, `location`, `received`, `scheduled`, `compleated`, `location_id`) VALUES
(1, 'Drywall repair', 470, 'Albany', NULL, NULL, NULL, 1),
(2, 'Roofing', 2500, 'Saratoga', NULL, NULL, NULL, 4),
(3, 'Hardwood floor repair', 500, 'Lake George', '2018-05-18', '2018-12-18', '', 1),
(4, 'Hardwood floor repair', 500, 'Lake George', '0003-05-18', '2031-12-18', '', 1),
(6, 'Door installation', 350, 'Troy', '0001-02-18', '2012-04-18', '', 8),
(7, 'Tile', 333, 'Albany', '2002-02-18', '2002-03-18', '', 1),
(8, 'Tile', 333, 'Albany', '2002-02-18', '2002-03-18', '', 1),
(15, 'Tile', 222, 'Albany', '2010-10-18', '2010-11-18', '', 4),
(16, 'Tile', 222, 'Albany', '2010-10-18', '2010-11-18', '', 4),
(17, 'Tile', 222, 'Albany', '2010-10-18', '2010-11-18', '', 4),
(18, 'Test', 2000, 'Troy', '2004-05-18', '2014-12-18', 'no', 4),
(19, 'Test', 222, 'Albany', '2018-04-07', '2018-04-18', 'no', 4),
(20, 'Test', 222, 'Albany', '2018-04-07', '2018-04-18', 'no', 4),
(21, 'Test', 222, 'Albany', '2018-04-07', '2018-04-18', 'no', 4),
(22, 'Test', 222, 'Albany', '2018-04-07', '2018-04-18', 'no', 4),
(23, 'Test', 222, 'Albany', '2018-04-07', '2018-04-18', 'no', 4),
(24, 'Test df', 55555, 'Troy', '2018-04-07', '2018-04-13', 'no', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contractor`
--
ALTER TABLE `contractor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_contractor_users1_idx` (`users_id`);

--
-- Indexes for table `dispatcher`
--
ALTER TABLE `dispatcher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_dispatcher_users1_idx` (`users_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_location_company_idx` (`company_id`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_manager_location1_idx` (`location_id`),
  ADD KEY `fk_manager_users1_idx` (`users_id`);

--
-- Indexes for table `received_wo`
--
ALTER TABLE `received_wo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_received_wo_dispatcher1_idx` (`dispatcher_id`),
  ADD KEY `fk_received_wo_workorder1_idx` (`workorder_id`),
  ADD KEY `fk_received_wo_contractor1_idx` (`contractor_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workorder`
--
ALTER TABLE `workorder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_workorder_location1_idx` (`location_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contractor`
--
ALTER TABLE `contractor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dispatcher`
--
ALTER TABLE `dispatcher`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `manager`
--
ALTER TABLE `manager`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `received_wo`
--
ALTER TABLE `received_wo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `workorder`
--
ALTER TABLE `workorder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contractor`
--
ALTER TABLE `contractor`
  ADD CONSTRAINT `fk_contractor_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dispatcher`
--
ALTER TABLE `dispatcher`
  ADD CONSTRAINT `fk_dispatcher_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `fk_location_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `manager`
--
ALTER TABLE `manager`
  ADD CONSTRAINT `fk_manager_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_manager_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `received_wo`
--
ALTER TABLE `received_wo`
  ADD CONSTRAINT `fk_received_wo_contractor1` FOREIGN KEY (`contractor_id`) REFERENCES `contractor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_received_wo_dispatcher1` FOREIGN KEY (`dispatcher_id`) REFERENCES `dispatcher` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_received_wo_workorder1` FOREIGN KEY (`workorder_id`) REFERENCES `workorder` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `workorder`
--
ALTER TABLE `workorder`
  ADD CONSTRAINT `fk_workorder_location1` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
