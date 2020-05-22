-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 19, 2020 at 11:59 AM
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
-- Table structure for table `equipment`
--

CREATE TABLE IF NOT EXISTS `equipment` (
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
(1, 'Syringe pump', '2100587', 'SPLF2', 'MO-SPLF2', 'Holmark', '2019-02-01', '2024-02-01', 'Cairo hospital', 1, 1, 'ICU', '0000-00-00', 'Syringe pump_1.pdf'),
(2, 'Electric ICU Bed', '3140687', 'AG-BY003C', 'AG-BY003C', 'AEgEA', '2016-10-08', '2021-10-08', 'Cairo hospital', 1, 1, 'ICU', '0000-00-00', 'Electric ICU Bed_2.pdf'),
(3, 'Defibrillator', '5170687', 'M4735A', 'Heart start XL', 'Philips', '2014-03-01', '2022-03-01', 'Cairo hospital', 1, 1, 'ICU', '0000-00-00', 'Defibrillator_3.pdf'),
(4, 'CT scanner', '6150487', 'CT6000ICT', 'CT6000ICT', 'Philips', '2015-05-17', '2026-05-17', 'Cairo hospital', 2, 1, 'Radiology', '0000-00-00', 'CT scanner_4.pdf'),
(5, 'MRI Machine', '9145687', 'Siemens Aera 1.5T', 'Siemens Aera 1.5T', 'Siemens', '2014-07-01', '2027-07-01', 'Cairo hospital', 2, 1, 'Radiology', '0000-00-00', 'MRI Machine_5.pdf'),
(6, '3D-4D Ultrasound', '2175987', 'SAX8LV-EXP', 'Sonoae X8', 'Samsung', '2018-04-07', '2023-04-07', 'Cairo hospital', 3, 2, 'Obstetrics and Gynecology', '0000-00-00', '3D-4D Ultrasound_6.pdf'),
(7, '3D-4D Ultrasound', '3140954', 'USS-SAR7C3U', 'Sonoace R7', 'Samsung', '2019-08-03', '2024-08-03', 'Cairo hospital', 3, 2, 'Obstetrics and Gynecology', '0000-00-00', '3D-4D Ultrasound_7.pdf'),
(8, 'CARDIOHELP', '5320187', '', 'CARDIOHELP System', 'MAQUET', '2013-04-20', '2018-04-10', 'Cairo hospital', 2, 1, 'Cardiology', '2020-04-20', 'CARDIOHELP_8.pdf'),
(9, 'Tourniquet', '6740587', '4000', 'A.T.S.4000 Tourniquet Systems', 'zimmer Biomet', '2017-10-01', '2024-10-01', 'Cairo hospital', 3, 1, 'Operating Theater ', '0000-00-00', 'Tourniquet_9.pdf'),
(10, 'Heart-Lung machine', '5940687', 'HL 20', 'HL 20 Vario Flex', 'MAQUET', '2013-05-21', '2020-05-21', 'Cairo hospital', 3, 1, 'Operating Theater', '0000-00-00', 'Heart-Lung machine_10.pdf'),
(11, 'Ventilator', '8957157', 'SVM950', 'Servo-i Ventilator', 'MAQUET', '2012-05-19', '2016-05-19', 'Cairo hospital', 1, 1, 'ICU', '0000-00-00', 'Ventilator_11.pdf'),
(12, 'Vital signs monitor', '2009807', 'VS30', 'EarlyVue', 'Philips', '2019-09-08', '2022-09-08', 'Cairo hospital', 3, 3, 'ICU', '0000-00-00', 'Vital signs monitor_12.pdf'),
(13, 'Electric steam sterilizer', '2190787', 'SCF284/03', 'Philips Avent 3-in-1 electric steam\r\nsterilizer', 'Philips', '2017-04-11', '2020-04-11', 'Cairo hospital', 1, 2, 'Central sterile services department', '0000-00-00', 'Electric steam sterilizer_13.pdf'),
(14, 'Anesthesia Machine', '9812345', 'GDOA847', 'GE Datex Ohmeda Aisys', 'Soma Tech Intl', '2020-03-18', '2022-03-18', 'Cairo hospital', 3, 1, 'Operating Theater', '0000-00-00', 'Anesthesia Machine_14.pdf'),
(15, 'Cardiograph', '5463127', 'TC70', 'PageWriter', 'Philips', '2017-05-06', '2019-05-06', 'Cairo hospital', 2, 2, 'Cardiology ', '0000-00-00', 'Cardiograph_15.pdf'),
(16, 'Electrosurgical unit', '6100487', 'Shark II', 'Bovie Aaron Smoke Shark II', 'Soma Tech Intl', '2014-07-13', '2016-07-13', 'Cairo hospital', 3, 1, 'Operating Theater', '0000-00-00', 'Electrosurgical unit_16.pdf'),
(17, 'Vital signs monitor', '6172487', '863283', 'VS4', 'Philips', '2018-03-02', '2021-03-02', 'Cairo hospital', 3, 3, 'ICU', '0000-00-00', 'Vital signs monitor_17.pdf'),
(18, 'Vital signs monitor', '6936487', '863283', 'VS4', 'Philips', '2020-04-02', '2023-04-02', 'Cairo hospital', 3, 3, 'ICU', '0000-00-00', 'Vital signs monitor_17.pdf'),
(19, 'Vital signs monitor', '9385487', '67NCTX-B', 'Connex 6700', 'Welch Allyn', '2017-10-02', '2020-10-02', 'Cairo hospital', 3, 3, 'ICU', '0000-00-00', 'Vital signs monitor_19.pdf'),
(20, 'Electric ICU Bed', '3040687', 'ES-96HD', 'ES-96HD', 'JosonCare', '2018-10-20', '2023-10-20', 'Cairo hospital', 1, 1, 'ICU', '0000-00-00', 'Electric ICU Bed_20.pdf'),
(21, 'Electric ICU Bed', '3040649', 'ES-96HD', 'ES-96HD', 'JosonCare', '2018-11-15', '2023-11-15', 'Cairo hospital', 1, 1, 'ICU', '0000-00-00', 'Electric ICU Bed_20.pdf'),
(22, 'Electric ICU Bed', '8360649', 'ES-12DW', 'ES-12DW', 'JosonCare', '2017-02-15', '2022-02-15', 'Cairo hospital', 1, 1, 'ICU', '0000-00-00', 'Electric ICU Bed_22.pdf'),
(23, 'Ventilator', '9134729', '980', 'Puritan Bennett 980', 'Puritan Bennett', '2017-08-19', '2021-08-19', 'Cairo hospital', 1, 1, 'ICU', '0000-00-00', 'Ventilator_23.pdf'),
(24, 'Ventilator', '9705255', 'Newport_HT70_Plus', 'HT70', 'Covidien', '2018-01-01', '2022-01-01', 'Cairo hospital', 1, 1, 'ICU', '0000-00-00', 'Ventilator_24.pdf'),
(25, '3D C-Arm', '2800649', 'ARCADIS Orbic 3D', '3000T', 'Siemens', '2017-02-15', '2022-02-15', 'Cairo hospital', 2, 1, 'Radiology', '0000-00-00', '3D C-Arm_25.pdf'),
(26, 'Portable X-Ray', '1362149', 'Optima', 'XR200MAX', 'Philips', '2016-03-01', '2020-03-01', 'Cairo hospital', 2, 1, 'Radiology', '0000-00-00', 'Portable X-Ray_26.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE IF NOT EXISTS `inventory` (
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
(10144747, 'Anti-Siphon Plate Adjustment Knob', 1, 'Holmark', '50 ', 6),
(10152525, 'Servo Duo Guard filter', 11, 'MAQUET', '100 ', 8),
(31014789, 'Aerogen Solo Nebulizer', 11, 'MAQUET', '150 ', 2),
(41014789, 'HLS Module Advanced', 8, 'MAQUET', '500 ', 2),
(51014732, 'Guide Rod Collar Clamp', 1, 'Holmark', '15 ', 7),
(58998123, 'Li battary', 4, 'PHILIPS', '140', 9),
(61014859, 'Bubble sensor', 8, 'MAQUET', '200 ', 3),
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

CREATE TABLE IF NOT EXISTS `technicians` (
  `SSN` int(30) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Phone_number` int(30) NOT NULL,
  `Company` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `technicians`
--

INSERT INTO `technicians` (`SSN`, `Name`, `Phone_number`, `Company`) VALUES
(534890245, 'Mahmoud', 318459362, 'Soma Tech Intl'),
(546896213, 'Ashraf', 1111647852, 'MAQUET'),
(632598751, 'Hany', 100025487, 'Siemens'),
(1023589637, 'Samy', 1125896472, 'Philips'),
(1100235612, 'Yasser', 211063542, 'MAQUET'),
(1230470140, 'Ayman', 147258369, 'Samsung'),
(1283421801, 'Khaled', 132990153, 'Samsung'),
(1365987450, 'Khaled', 1289751264, 'zimmer Biomet'),
(1429932802, 'Ehab', 321045128, 'MAQUET'),
(1550221561, 'Haitham', 182246042, 'Zimmer Biomet'),
(1628129635, 'Kareem', 291583547, 'Soma Tech Intl'),
(1723091235, 'Basem', 172532981, 'AEgEA'),
(1723642532, 'Mahmoud', 1215301432, 'Soma Tech Intl'),
(1882044351, 'Eslam', 182251618, 'Siemens'),
(1902213572, 'Eyad', 201872417, 'AEgEA'),
(2019335814, 'Yassin', 207135512, 'Zimmer Biomet'),
(2047080647, 'Mahmoud', 101234798, 'Holmark'),
(2147483647, 'Ahmed', 101234798, 'Philips');

-- --------------------------------------------------------

--
-- Table structure for table `work_on`
--

CREATE TABLE IF NOT EXISTS `work_on` (
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
(2147483647, 3, 10),
(1365987450, 4, 8),
(546896213, 5, 8),
(632598751, 6, 8),
(2047080647, 7, 5),
(546896213, 8, 4),
(632598751, 9, 9),
(1365987450, 10, 3),
(1230470140, 11, 3),
(546896213, 12, 4),
(2147483647, 13, 5),
(1365987450, 14, 1),
(2047080647, 15, 3),
(2147483647, 16, 3),
(546896213, 17, 5),
(1230470140, 18, 7),
(2147483647, 19, 8),
(1365987450, 20, 4),
(546896213, 21, 4),
(632598751, 22, 6),
(546896213, 23, 3),
(2147483647, 24, 4),
(1230470140, 25, 4),
(546896213, 26, 2),
(632598751, 27, 4),
(2147483647, 28, 4),
(1365987450, 29, 9),
(546896213, 30, 4),
(1230470140, 31, 4),
(2147483647, 32, 6),
(1365987450, 33, 2),
(632598751, 34, 4),
(546896213, 35, 4),
(1365987450, 36, 4),
(2047080647, 37, 3),
(2147483647, 38, 5),
(1365987450, 39, 4);

-- --------------------------------------------------------

--
-- Table structure for table `work_orders`
--

CREATE TABLE IF NOT EXISTS `work_orders` (
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
(1, 1, 'Inspection, PM', 'Completed ', '2020-04-15', 'PM', '2020-05-01', '2020-05-01', 'Monthly', 'Low', 'Checked power, battery, alarms, tubes, cleaning and calibration', ''),
(2, 5, 'Inspection, PM', 'Completed', '2019-06-05', 'PM', '2019-07-02', '2019-07-01', 'Monthly', 'High', 'Inspecting and recording the MRI’s cryogen levels.', ''),
(3, 4, 'fix error', 'complete', '2020-03-31', 'Repair', '2020-04-06', '2020-05-17', 'Yearly', 'High', 'fatal error', '700'),
(4, 4, 'fix rotor error', 'In progress', '2020-05-04', 'Repair', '2020-05-30', '2020-05-17', 'Yearly', 'Low', 'rotor error', '300'),
(5, 1, 'fix', 'Not started', '2020-05-02', 'Repair', '2020-05-14', '2020-06-01', 'Monthly', 'High', 'Guide Rod Collar Clamp of the syringe pump is broken, please fix. ', ''),
(6, 3, 'Inspection, PM', 'Not Started', '2020-05-08', 'PM', '2020-05-20', '2020-05-20', 'Yearly', 'High', 'Checking electrodes, battery, synchronizer, connectors', ''),
(7, 6, 'Inspection, PM', 'Not Started', '2020-04-03', 'PM', '2020-04-10', '2020-04-07', 'Yearly', 'Low', 'Checking battery, probes, lamps and cleaning filters, transducers, keyboard', ''),
(8, 14, 'Inspection, PM', 'Completed', '0000-00-00', 'PM', '2019-03-18', '2019-03-18', 'Yearly', 'High', 'Checked battery, indicators, alarms, fuse, tubes, fluid levels', ''),
(9, 7, 'Inspection, PM', 'Not Started', '2020-05-08', 'PM', '2020-08-03', '2020-08-03', 'Yearly', 'Low', 'Checking battery, probes, lamps and cleaning filters, transducers, keyboard', ''),
(10, 6, 'fix image artifacts', 'Completed', '2020-03-20', 'Repair', '2019-04-10', '2021-05-07', 'Yearly', 'Low', 'Artifacts in the images, fixed by replacing transducer', ''),
(11, 3, 'fix battery failure', 'completed', '2020-04-03', 'Repair', '2020-04-15', '2020-05-20', 'Yearly', 'Low', 'Battery failure, fixed by replacing battery', '15000'),
(12, 5, 'fix helium low level', 'completed', '2020-02-05', 'Repair', '2020-02-22', '2020-07-01', 'Yearly', 'Low', 'Low helium level, fixed by helium filling', '50'),
(13, 11, 'Inspection, PM', 'Completed', '2019-01-20', 'PM', '2019-02-20', '2019-02-19', 'Monthly', 'High', 'Checked air filters, modes of ventilation, alarms, cleaning filters', ''),
(14, 11, 'Inspection, PM', 'Completed', '2019-12-20', 'PM', '2019-01-05', '2019-02-19', 'Monthly', 'High', 'Checked air filters, modes of ventilation, alarms, cleaning filters', ''),
(15, 1, 'Inspection, PM', 'Completed', '2020-02-22', 'PM', '2020-03-01', '2020-03-01', 'Monthly', 'Low', 'Check power, battery, alarms, tubes, cleaning and calibration', ''),
(16, 1, 'Inspection, PM', 'Completed', '2020-03-20', 'PM', '2020-04-01', '2020-04-01', 'Monthly', 'Low', 'Check power, battery, alarms, tubes, cleaning and calibration', ''),
(17, 15, 'Inspection, PM', 'Completed', '2019-12-06', 'PM', '2020-01-06', '2020-01-06', 'Monthly', 'High', 'Check connectors, electrodes, fuse, lubricate paper drive, replace battery', ''),
(18, 13, 'Inspection, PM', 'Completed', '2020-03-20', 'PM', '2020-04-11', '2020-04-11', 'Weekly', 'High', 'Checked and cleaned sensors, steam lines, replaced filter, verified temperature', ''),
(19, 12, 'fix alarm failure', 'Not Started', '2020-05-20', 'Repair', '2020-06-15', '2019-09-08', 'Yearly', 'Low', 'Alarm failure', ''),
(20, 10, 'fix alarm', 'Completed', '2020-01-02', 'Repair', '2020-01-07', '2020-01-21', 'Monthly', 'High', 'Temperature sensor not working, fixed by replacing sensor', '100'),
(21, 10, 'Inspection, PM', 'Completed', '2020-03-01', 'PM', '2020-03-22', '2020-03-21', 'Monthly', 'High', 'Checked battery, mixer, alarms, connectors, calibration', ''),
(22, 10, 'Inspection, PM', 'Completed', '2020-05-01', 'PM', '2020-05-22', '2020-05-21', 'Monthly', 'High', 'Checked battery, mixer, alarms, connectors, lubricated motors', ''),
(23, 9, 'Inspection, PM', 'Completed', '2018-09-01', 'PM', '2018-10-02', '2018-10-01', 'Yearly', 'High', 'Checked motors, tubes, switches, alarms, pressure, replaced tube', ''),
(24, 9, 'Inspection, PM', 'Completed', '2019-09-01', 'PM', '2019-10-02', '2019-10-01', 'Yearly', 'High', 'Checked motors, tubes, switches, alarms, pressure, replaced battery', ''),
(25, 2, 'Inspection, PM', 'Completed', '2019-09-30', 'PM', '2019-10-08', '2019-10-08', 'Yearly', 'Low', 'Checked matress, actuators, motors', ''),
(26, 2, 'Inspection, PM', 'Completed', '2018-09-28', 'PM', '2018-10-08', '2018-10-08', 'Yearly', 'Low', 'Checked matress, actuators, motors', ''),
(27, 19, 'Inspection, PM', 'Completed', '2018-09-20', 'PM', '2018-10-02', '2018-10-02', 'Yearly', 'Low', 'Checked wires, battery, SpO2, alarms, cleaned connectors', ''),
(28, 19, 'Inspection, PM', 'Completed', '2019-09-20', 'PM', '2019-10-02', '2019-10-02', 'Yearly', 'Low', 'Checked wires, battery, SpO2, alarms, changed battery', ''),
(29, 19, 'fix monitor problem', 'Not Started', '2020-05-05', 'Repair', '2020-05-30', '2020-10-02', 'Yearly', 'Low', 'Monitor problem', ''),
(30, 17, 'Inspection, PM', 'Completed', '2019-02-22', 'PM', '2019-03-02', '2019-03-02', 'Yearly', 'Low', 'Checked wires, battery, SpO2, alarms, cleaned connectors, changed wire connector', ''),
(31, 17, 'Inspection, PM', 'Completed', '2020-02-22', 'PM', '2020-03-02', '2020-03-02', 'Yearly', 'Low', 'Checked wires, battery, SpO2, alarms', ''),
(32, 17, 'Inspection, PM', 'Completed', '2021-02-22', 'PM', '2021-03-02', '2021-03-02', 'Yearly', 'Low', 'Checked wires, battery, SpO2, alarms', ''),
(33, 23, 'Inspection, PM', 'Completed', '2018-07-20', 'PM', '2018-08-19', '2018-08-19', 'Monthly', 'High', 'Checked air filters, modes of ventilation, alarms, cleaned filters, tubes', ''),
(34, 23, 'Inspection, PM', 'Completed', '2019-07-23', 'PM', '2019-08-19', '2019-08-19', 'Monthly', 'High', 'Checked air filters, modes of ventilation, alarms, cleaned filters, tubes', ''),
(35, 20, 'Inspection, PM', 'Completed', '2019-09-30', 'PM', '2019-10-20', '2019-10-20', 'Yearly', 'Low', 'Checked matress, actuators, motors, lubricated motors', ''),
(36, 21, 'Inspection, PM', 'Completed', '2019-10-30', 'PM', '2019-11-15', '2019-11-15', 'Yearly', 'Low', 'Checked matress, actuators, motors, lubricated motors', ''),
(37, 22, 'Inspection, PM', 'Completed', '2018-02-01', 'PM', '2018-02-15', '2018-02-15', 'Yearly', 'Low', 'Checked matress, actuators, motors', ''),
(38, 22, 'Inspection, PM', 'Completed', '2019-02-01', 'PM', '2019-02-15', '2019-02-15', 'Yearly', 'Low', 'Checked matress, actuators, motors, lubricated motors', ''),
(39, 22, 'Inspection, PM', 'Completed', '2020-02-04', 'PM', '2020-02-15', '2020-02-15', 'Yearly', 'Low', 'Checked matress, actuators, motors, lubricated motors', '');

-- --------------------------------------------------------

--
-- Table structure for table `work_order_parts`
--

CREATE TABLE IF NOT EXISTS `work_order_parts` (
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
