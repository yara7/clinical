-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 07, 2020 at 02:39 AM
-- Server version: 8.0.18
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cmmss`
--

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
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
  `Scrapping_date` date NOT NULL,
  `Data_sheet` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`Asset_ID`, `Name`, `Serial_number`, `Model_number`, `Model_name`, `Manufacturer`, `Installation_date`, `Warranty_expires`, `Facility`, `Building`, `Floor`, `Department`, `Scrapping_date`, `Data_sheet`) VALUES
(1, 'Syringe pump', '2100587', 'SPLF2', 'MO-SPLF2', 'Holmark', '2017-02-01', '2022-02-01', 'Cairo hospital', 1, 1, 'ICU', '0000-00-00', 'Syringe pump_1.pdf'),
(2, 'Electric ICU Bed', '3140687', 'AG-BY003C', 'AG-BY003C', 'AEgEA', '2016-10-08', '2022-10-08', 'Cairo hospital', 1, 1, 'ICU', '0000-00-00', 'Electric ICU Bed_2.pdf'),
(3, 'Defibrillator', '5170687', 'M4735A', 'Heart start XL', 'Philips', '2014-03-01', '2022-03-01', 'Cairo hospital', 1, 1, 'ICU', '0000-00-00', 'Defibrillator_3.pdf'),
(4, 'CT scanner', '6150487', 'CT6000ICT', 'CT6000ICT', 'Philips', '2015-05-17', '2026-05-17', 'Cairo hospital', 2, 1, 'Radiology', '0000-00-00', 'CT scanner_4.pdf'),
(5, 'MRI Machine', '9145687', 'Siemens Aera 1.5T', 'Siemens Aera 1.5T', 'Siemens', '2014-07-01', '2027-07-01', 'Cairo hospital', 2, 1, 'Radiology', '0000-00-00', 'MRI Machine_5.pdf'),
(6, '3D-4D Ultrasound', '2175987', 'SAX8LV-EXP', 'Sonoae X8', 'Samsung', '2018-04-07', '2023-04-07', 'Cairo hospital', 3, 2, 'Obstetrics and Gynecology', '0000-00-00', '3D-4D Ultrasound_6.pdf'),
(7, '3D-4D Ultrasound', '3140954', 'USS-SAR7C3U', 'Sonoace R7', 'Samsung', '2019-08-03', '2024-08-03', 'Cairo hospital', 3, 2, 'Obstetrics and Gynecology', '0000-00-00', '3D-4D Ultrasound_7.pdf'),
(8, 'CARDIOHELP', '5320187', '', 'CARDIOHELP System', 'MAQUET', '2013-04-20', '2018-04-10', 'Cairo hospital', 2, 1, 'Emergency Room', '2020-04-20', 'CARDIOHELP_8.pdf'),
(9, 'Tourniquet', '6740587', '4000', 'A.T.S.4000 Tourniquet Systems', 'zimmer Biomet', '2017-10-01', '2024-10-01', 'Cairo hospital', 3, 1, 'Operating Theater ', '0000-00-00', 'Tourniquet_9.pdf'),
(10, 'Heart-Lung machine', '5940687', 'HL 20', 'HL 20 Vario Flex', 'MAQUET', '2013-05-21', '2020-05-21', 'Cairo hospital', 3, 1, 'Operating Theater', '0000-00-00', 'Heart-Lung machine_10.pdf'),
(11, 'Ventilator', '8957157', 'Servo-i Ventilator', 'Servo-i Ventilator', 'MAQUET', '2012-05-19', '2016-05-19', 'Cairo hospital', 1, 1, 'ICU', '0000-00-00', 'Ventilator_11.pdf'),
(12, 'Vital signs monitor', '2009807', 'VS30', 'EarlyVue', 'Philips', '2019-09-08', '2021-09-08', 'Cairo hospital', 3, 3, 'In patients', '0000-00-00', 'Vital signs monitor_12.pdf'),
(13, 'Electric steam sterilizer', '2190787', 'SCF284/03', 'Philips Avent 3-in-1 electric steam\r\nsterilizer', 'Philips', '2017-04-11', '2020-04-11', 'Cairo hospital', 1, 2, 'Central sterile services department', '0000-00-00', 'Electric steam sterilizer_13.pdf'),
(14, 'Anesthesia Machine', '9812345', 'GE Datex Ohmeda Aisys', 'GE Datex Ohmeda Aisys', 'Soma Tech Intl', '2020-03-18', '2022-03-18', 'Cairo hospital', 3, 1, 'Operating Theater', '0000-00-00', 'Anesthesia Machine_14.pdf'),
(15, 'Cardiograph', '5463127', 'TC70', 'PageWriter', 'Philips', '2017-05-06', '2019-05-06', 'Cairo hospital', 2, 2, 'Cardiology ', '0000-00-00', 'Cardiograph_15.pdf'),
(16, 'Electrosurgical unit', '6100487', 'Shark II', 'Bovie Aaron Smoke Shark II', 'Soma Tech Intl', '2014-07-13', '2016-07-13', 'Cairo hospital', 3, 1, 'Operating Theater', '0000-00-00', 'Electrosurgical unit_16.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `Part_Number` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Asset_ID` int(11) NOT NULL,
  `Vendor` varchar(100) NOT NULL,
  `Cost_USD` varchar(100) NOT NULL,
  `Quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`Part_Number`, `Name`, `Asset_ID`, `Vendor`, `Cost_USD`, `Quantity`) VALUES
(1, 'Anti-Siphon Plate Adjustment Knob', 1, 'Holmark', '50 ', 6),
(2, 'Servo Duo Guard filter', 11, 'MAQUET', '100 ', 8),
(3, 'Aerogen Solo Nebulizer', 11, 'MAQUET', '150 ', 2),
(4, 'HLS Module Advanced', 8, 'MAQUET', '500 ', 2),
(5, 'Guide Rod Collar Clamp', 1, 'Holmark', '15 ', 7),
(6, 'Bubble sensor', 8, 'MAQUET', '200 ', 3),
(46918, 'Syringe', 1, 'Holmark', '45', 70),
(10128486, 'QUENCH ELBOW ASSY-FLANGED', 5, 'siemens', '435', 4),
(10128499, 'Aux. Vent blank(BD END)', 5, 'siemens', '640', 8),
(10128723, 'Aux. Vent Blank(elbow end)', 5, 'siemens', '270', 15),
(10128733, 'De-Mountable pin fitting kit', 5, 'siemens', '890', 1),
(10128734, 'QV elbow fitting kit', 5, 'siemens', '2700', 1),
(10128742, 'air and sea Freight assy', 5, 'siemens', '750', 5),
(10128924, 'Li battery', 5, 'siemens', '250', 10),
(10128974, 'de-coupler fitting kit', 5, 'siemens', '375', 1),
(10129376, '4k filtered PRV adapter', 5, 'siemens', '360', 6),
(10129669, 'OR98 pipe set kit', 5, 'siemens', '500', 3),
(10129671, 'FCL pin kit', 5, 'siemens', '2000', 2),
(10129672, 'quench valve', 5, 'siemens', '1500', 1),
(58998123, 'Li battary', 4, 'philips', '140', 9),
(110040031, 'Couch Down position switch', 4, 'PHILIPS', '550', 3),
(110065761, 'ROTOR BELT', 4, 'PHILIPS', '100', 6),
(110190131, 'patient table limit swich cab', 4, 'PHILIPS', '900', 2),
(566016252, 'external 4x CD ROM', 4, 'PHILIPS', '765', 15),
(566017651, 'BRAKE SOLENOID', 4, 'PHILIPS', '520', 1),
(566019761, 'fuse 150A/700V', 4, 'PHILIPS', '30', 11),
(566308451, 'CLAMP ASSY', 4, 'PHILIPS', '700', 3),
(567474001, 'portuguese', 4, 'PHILIPS', '390', 2);

-- --------------------------------------------------------

--
-- Table structure for table `technicians`
--

CREATE TABLE `technicians` (
  `SSN` int(30) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Phone_number` int(30) NOT NULL,
  `Company` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `technicians`
--

INSERT INTO `technicians` (`SSN`, `Name`, `Phone_number`, `Company`) VALUES
(1230470140, 'Ayman', 147258369, 'Samsung'),
(2047080647, 'Mahmoud', 101234798, 'Holmark'),
(2147483647, 'Ahemd', 101234798, 'Pilips');

-- --------------------------------------------------------

--
-- Table structure for table `work_on`
--

CREATE TABLE `work_on` (
  `SSN` int(20) NOT NULL,
  `Order_number` int(11) NOT NULL,
  `Number_of_hours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `work_on`
--

INSERT INTO `work_on` (`SSN`, `Order_number`, `Number_of_hours`) VALUES
(2147483647, 1, 7),
(1230470140, 2, 10),
(2147483647, 2, 10);

-- --------------------------------------------------------

--
-- Table structure for table `work_orders`
--

CREATE TABLE `work_orders` (
  `Order_number` int(20) NOT NULL,
  `Asset_ID` int(20) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Status` varchar(50) NOT NULL,
  `Creation__date` date NOT NULL,
  `Repair/PM` varchar(20) NOT NULL,
  `Due_date` date NOT NULL,
  `PM_date` date NOT NULL,
  `PM_frequency` varchar(20) NOT NULL,
  `Priority` varchar(20) NOT NULL,
  `Description` text NOT NULL,
  `Repair_cost` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `work_orders`
--

INSERT INTO `work_orders` (`Order_number`, `Asset_ID`, `Name`, `Status`, `Creation__date`, `Repair/PM`, `Due_date`, `PM_date`, `PM_frequency`, `Priority`, `Description`, `Repair_cost`) VALUES
(1, 1, 'Guide Rod Collar Clamp broken', 'Not started', '2020-05-02', 'Repair', '2020-05-14', '0000-00-00', '', 'High', 'Guide Rod Collar Clamp of the syringe pump is broken, please fix. ', ''),
(2, 5, 'Inspection', 'Completed', '2019-03-05', 'PM', '2019-03-10', '2019-03-10', 'Monthly', 'High', 'Inspecting and recording the MRI’s cryogen levels.', ''),
(3, 4, 'fix', 'in', '2020-05-04', 'Repair', '2020-05-30', '2020-06-17', 'yearly', 'Low', 'rotor error', '300'),
(4, 4, 'fix', 'complete', '2020-03-31', 'Repair', '2020-04-06', '2020-06-17', 'yearly', 'High', 'fatal error', '700'),
(5, 1, 'fix', 'in ', '0000-00-00', 'PM', '0000-00-00', '0000-00-00', '', 'Low', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `work_order_parts`
--

CREATE TABLE `work_order_parts` (
  `Order_number` int(11) NOT NULL,
  `Part_used` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `work_order_parts`
--

INSERT INTO `work_order_parts` (`Order_number`, `Part_used`) VALUES
(4, 'Li battary'),
(3, 'ROTOR BELT');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`Asset_ID`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`Part_Number`),
  ADD KEY `Asset_ID` (`Asset_ID`);

--
-- Indexes for table `technicians`
--
ALTER TABLE `technicians`
  ADD PRIMARY KEY (`SSN`);

--
-- Indexes for table `work_on`
--
ALTER TABLE `work_on`
  ADD KEY `Order_number` (`Order_number`),
  ADD KEY `SSN` (`SSN`);

--
-- Indexes for table `work_orders`
--
ALTER TABLE `work_orders`
  ADD PRIMARY KEY (`Order_number`),
  ADD KEY `Asset ID` (`Asset_ID`);

--
-- Indexes for table `work_order_parts`
--
ALTER TABLE `work_order_parts`
  ADD KEY `Order_number` (`Order_number`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`Asset_ID`) REFERENCES `equipment` (`Asset_ID`);

--
-- Constraints for table `work_on`
--
ALTER TABLE `work_on`
  ADD CONSTRAINT `work_on_ibfk_2` FOREIGN KEY (`Order_number`) REFERENCES `work_orders` (`Order_number`),
  ADD CONSTRAINT `work_on_ibfk_3` FOREIGN KEY (`SSN`) REFERENCES `technicians` (`SSN`);

--
-- Constraints for table `work_orders`
--
ALTER TABLE `work_orders`
  ADD CONSTRAINT `work_orders_ibfk_1` FOREIGN KEY (`Asset_ID`) REFERENCES `equipment` (`Asset_ID`);

--
-- Constraints for table `work_order_parts`
--
ALTER TABLE `work_order_parts`
  ADD CONSTRAINT `work_order_parts_ibfk_1` FOREIGN KEY (`Order_number`) REFERENCES `work_orders` (`Order_number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
