-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 26, 2020 at 07:23 PM
-- Server version: 5.6.37
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `CMMS`
--

-- --------------------------------------------------------

--
-- Table structure for table `Equipment`
--

CREATE TABLE IF NOT EXISTS `Equipment` (
  `Asset_ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Serial_number` varchar(11) NOT NULL,
  `Model_number` varchar(100) NOT NULL,
  `Model_name` varchar(255) NOT NULL,
  `Manufacturer` varchar(100) NOT NULL,
  `Installation_date` date NOT NULL,
  `Warranty_expires` date NOT NULL,
  `Facility` varchar(100) NOT NULL,
  `Building` int(11) NOT NULL,
  `Floor` int(11) NOT NULL,
  `Department` varchar(100) NOT NULL,
  `Scrapping_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Equipment`
--

INSERT INTO `Equipment` (`Asset_ID`, `Name`, `Serial_number`, `Model_number`, `Model_name`, `Manufacturer`, `Installation_date`, `Warranty_expires`, `Facility`, `Building`, `Floor`, `Department`, `Scrapping_date`) VALUES
(1, 'Syringe pump', '2100587', 'SPLF2', 'MO-SPLF2', 'Holmark', '2017-02-01', '2022-02-01', 'Cairo hospital', 1, 1, 'ICU', '0000-00-00'),
(2, 'Electric ICU Bed', '3140687', 'AG-BY003C', 'AG-BY003C', 'AEgEA', '2016-10-08', '2022-10-08', 'Cairo hospital', 1, 1, 'ICU', '0000-00-00'),
(3, 'Defibrillator', '5170687', 'M4735A', 'Heart start XL', 'Philips', '2014-03-01', '2022-03-01', 'Cairo hospital', 1, 1, 'ICU', '0000-00-00'),
(4, 'CT scanner', '6150487', 'CT6000ICT', 'CT6000ICT', 'Philips', '2015-05-17', '2026-05-17', 'Cairo hospital', 2, 1, 'Radiology', '0000-00-00'),
(5, 'MRI Machine', '9145687', 'Siemens Aera 1.5T', 'Siemens Aera 1.5T', 'Siemens', '2014-07-01', '2027-07-01', 'Cairo hospital', 2, 1, 'Radiology', '0000-00-00'),
(6, '3D-4D Ultrasound', '2175987', 'SAX8LV-EXP', 'Sonoae X8', 'Samsung', '2018-04-07', '2023-04-07', 'Cairo hospital', 3, 2, 'Obstetrics and Gynecology', '0000-00-00'),
(7, '3D-4D Ultrasound', '3140954', 'USS-SAR7C3U', 'Sonoace R7', 'Samsung', '2019-08-03', '2024-08-03', 'Cairo hospital', 3, 2, 'Obstetrics and Gynecology', '0000-00-00'),
(8, 'CARDIOHELP', '5320187', '', 'CARDIOHELP System', 'GETINGE', '2013-04-20', '2018-04-10', 'Cairo hospital', 2, 1, 'Emergency Room', '2020-04-20'),
(9, 'Tourniquet', '6740587', '4000', 'A.T.S.4000 Tourniquet Systems', 'zimmer Biomet', '2017-10-01', '2024-10-01', 'Cairo hospital', 3, 2, 'Operating Theater ', '0000-00-00'),
(10, 'Heart-Lung machine', '5940687', 'HL 20', 'HL 20 Vario Flex', 'MAQUET', '2013-05-21', '2020-05-21', 'Cairo hospital', 3, 2, 'Operating Theater', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `Technicians`
--

CREATE TABLE IF NOT EXISTS `Technicians` (
  `SSN` int(30) NOT NULL,
  `Phone_number` int(30) NOT NULL,
  `Company` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Work_on`
--

CREATE TABLE IF NOT EXISTS `Work_on` (
  `SSN` int(11) NOT NULL,
  `Order_number` int(11) NOT NULL,
  `Number_of_hours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Work_orders`
--

CREATE TABLE IF NOT EXISTS `Work_orders` (
  `Order_number` int(11) NOT NULL,
  `Asset_ID` int(11) NOT NULL,
  `Name` varchar(11) NOT NULL,
  `Status` varchar(11) NOT NULL,
  `Creation__date` date NOT NULL,
  `Demand/PM` varchar(11) NOT NULL,
  `Start_date` date NOT NULL,
  `Due_date` date NOT NULL,
  `PM_date` date NOT NULL,
  `PM_frequency` varchar(11) NOT NULL,
  `Priority` varchar(11) NOT NULL,
  `Description` text NOT NULL,
  `Associations` varchar(11) NOT NULL,
  `Demand_cost` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Equipment`
--
ALTER TABLE `Equipment`
  ADD PRIMARY KEY (`Asset_ID`);

--
-- Indexes for table `Technicians`
--
ALTER TABLE `Technicians`
  ADD PRIMARY KEY (`SSN`);

--
-- Indexes for table `Work_on`
--
ALTER TABLE `Work_on`
  ADD KEY `SSN` (`SSN`),
  ADD KEY `Order_number` (`Order_number`);

--
-- Indexes for table `Work_orders`
--
ALTER TABLE `Work_orders`
  ADD PRIMARY KEY (`Order_number`),
  ADD KEY `Asset ID` (`Asset_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Work_on`
--
ALTER TABLE `Work_on`
  ADD CONSTRAINT `work_on_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `Technicians` (`SSN`),
  ADD CONSTRAINT `work_on_ibfk_2` FOREIGN KEY (`Order_number`) REFERENCES `Work_orders` (`Order_number`);

--
-- Constraints for table `Work_orders`
--
ALTER TABLE `Work_orders`
  ADD CONSTRAINT `work_orders_ibfk_1` FOREIGN KEY (`Asset_ID`) REFERENCES `Equipment` (`Asset_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
