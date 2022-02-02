-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jun 23, 2021 at 05:41 PM
-- Server version: 8.0.25
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hoteldb`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `NFC_ID` int NOT NULL,
  `first_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dob` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`NFC_ID`, `first_name`, `last_name`, `dob`) VALUES
(1, 'Dimitrios', 'Michaelidis', '1976-05-12'),
(2, 'Nikolas', 'Anasteas', '1975-06-10'),
(3, 'Kyriakos', 'Katsaroglou', '1976-08-04'),
(4, 'Haris', 'Chronou', '1977-11-15'),
(5, 'Prokopis', 'Kallatos', '1978-07-23'),
(6, 'Maria', 'Ioannou', '1994-07-25'),
(7, 'Iraklis', 'Perrou', '1992-01-22'),
(8, 'Giorgos', 'Soukas', '1992-04-21'),
(9, 'Natalia', 'Raptelli', '1995-07-25'),
(10, 'Emilios', 'Kourou', '1985-02-21'),
(11, 'Vasiliki', 'Tassalli', '1999-09-11'),
(16, 'Leonidas', 'Angelellis', '1981-03-17');

-- --------------------------------------------------------

--
-- Table structure for table `client_email`
--

CREATE TABLE `client_email` (
  `NFC_ID` int NOT NULL,
  `email` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'not given'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `client_email`
--

INSERT INTO `client_email` (`NFC_ID`, `email`) VALUES
(2, 'nanast@gmail.com'),
(3, 'kkglou@hotmail.com'),
(4, 'harischronou@gmail.com'),
(5, 'pkallatos@yahoo.com'),
(6, 'natrapteli@hotmail.com'),
(11, 'vtassalli@hotmail.com'),
(16, 'langel@gmail.com'),
(4, 'harischronou@yahoo.com'),
(8, 'gsouk@gmail.com'),
(8, 'giors@yahoot.com'),
(1, 'dimmih@gmail.com'),
(7, 'irakmih@hotmail.com'),
(9, 'natna@hotmail.com'),
(10, 'emil@hotmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `client_identification`
--

CREATE TABLE `client_identification` (
  `NFC_ID` int NOT NULL,
  `id_no` varchar(9) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_issuingauthority` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_identification`
--

INSERT INTO `client_identification` (`NFC_ID`, `id_no`, `id_type`, `id_issuingauthority`) VALUES
(7, 'AB 113251', 'ID', 'HELLENIC POLICE'),
(1, 'AD 239285', 'ID ', 'HELLENIC POLICE'),
(4, 'AS 489573', 'ID', 'HELLENIC POLICE'),
(5, 'ER 352628', 'ID', 'HELLENIC POLICE'),
(10, 'EW 332123', 'ID', 'HELLENIC POLICE'),
(2, 'FS 489285', 'ID ', 'HELLENIC POLICE'),
(6, 'FW 423743', 'ID', 'HELLENIC POLICE'),
(16, 'GR 555444', 'ID', 'HELLENIC POLICE'),
(3, 'GT 866577', 'ID', 'HELLENIC POLICE'),
(9, 'HT 323743', 'ID', 'HELLENIC POLICE'),
(11, 'TT 039704', 'ID', 'HELLENIC POLICE'),
(8, 'TY 533251', 'ID', 'HELLENIC POLICE');

-- --------------------------------------------------------

--
-- Stand-in structure for view `client_info_view`
-- (See below for the actual view)
--
CREATE TABLE `client_info_view` (
`NFC_ID` int
,`first_name` varchar(20)
,`last_name` varchar(20)
,`id_no` varchar(9)
,`id_type` varchar(20)
,`id_issuingauthority` varchar(20)
,`phones` text
,`emails` text
);

-- --------------------------------------------------------

--
-- Table structure for table `client_phones`
--

CREATE TABLE `client_phones` (
  `NFC_ID` int NOT NULL,
  `phone_no` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `client_phones`
--

INSERT INTO `client_phones` (`NFC_ID`, `phone_no`) VALUES
(1, '+6924458142'),
(2, '+6922458111'),
(3, '+6627537025'),
(4, '+4292413736'),
(5, '+9495742571'),
(6, '+2417328360'),
(6, '+2537328421'),
(7, '+4427222421'),
(8, '+4247322421'),
(9, '+9814575078'),
(10, '+3214575078'),
(11, '+4884324212'),
(11, '+4887328360'),
(16, '+6922333444');

-- --------------------------------------------------------

--
-- Table structure for table `client_subscriptions`
--

CREATE TABLE `client_subscriptions` (
  `NFC_ID` int NOT NULL,
  `service_id` int NOT NULL,
  `sub_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_subscriptions`
--

INSERT INTO `client_subscriptions` (`NFC_ID`, `service_id`, `sub_datetime`) VALUES
(2, 4, '2021-06-15 07:32:46'),
(3, 5, '2021-06-20 08:00:45'),
(3, 6, '2021-06-20 08:00:45'),
(4, 4, '2021-07-29 00:00:00'),
(4, 5, '2021-05-12 16:23:33'),
(4, 6, '2021-06-17 06:16:35'),
(5, 4, '2021-07-12 00:00:00'),
(5, 5, '2021-06-30 00:00:00'),
(6, 6, '2021-06-11 09:22:42'),
(9, 5, '2021-06-17 20:18:12'),
(9, 6, '2021-06-28 14:08:59'),
(11, 6, '2021-06-11 14:19:45'),
(16, 5, '2021-06-12 08:33:43');

-- --------------------------------------------------------

--
-- Table structure for table `has_access`
--

CREATE TABLE `has_access` (
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime NOT NULL,
  `NFC_ID` int NOT NULL,
  `venue_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `has_access`
--

INSERT INTO `has_access` (`start_datetime`, `end_datetime`, `NFC_ID`, `venue_id`) VALUES
('2021-06-01 10:18:57', '2021-06-30 23:59:59', 2, 2),
('2021-06-01 10:18:57', '2021-06-30 23:59:59', 2, 3),
('2021-06-01 10:18:57', '2021-06-30 23:59:59', 2, 7),
('2021-06-01 10:18:57', '2021-06-30 23:59:59', 2, 11),
('2021-06-01 10:18:57', '2021-06-30 23:59:59', 2, 21),
('2021-06-01 10:18:57', '2021-06-30 23:59:59', 2, 22),
('2021-06-01 10:18:57', '2021-06-30 23:59:59', 2, 23),
('2021-06-01 10:18:57', '2021-06-30 23:59:59', 2, 24),
('2021-06-01 10:18:57', '2021-06-30 23:59:59', 2, 25),
('2021-06-01 10:18:57', '2021-06-30 23:59:59', 2, 26),
('2021-06-01 10:18:57', '2021-06-30 23:59:59', 2, 35),
('2021-06-01 10:18:57', '2021-06-30 23:59:59', 3, 7),
('2021-06-01 10:18:57', '2021-06-30 23:59:59', 3, 11),
('2021-06-01 10:18:57', '2021-06-30 23:59:59', 3, 21),
('2021-06-01 10:18:57', '2021-06-30 23:59:59', 3, 22),
('2021-06-01 10:18:57', '2021-06-30 23:59:59', 3, 25),
('2021-06-01 10:18:57', '2021-06-30 23:59:59', 3, 26),
('2021-06-01 10:18:57', '2021-06-30 23:59:59', 3, 28),
('2021-06-01 10:18:57', '2021-06-30 23:59:59', 3, 29),
('2021-06-01 10:18:57', '2021-06-30 23:59:59', 3, 30),
('2021-06-01 10:18:57', '2021-06-30 23:59:59', 3, 31),
('2021-06-01 10:18:57', '2021-06-30 23:59:59', 3, 32),
('2021-06-01 10:18:57', '2021-06-30 23:59:59', 3, 33),
('2021-06-01 10:18:57', '2021-06-30 23:59:59', 3, 34),
('2021-06-01 10:18:57', '2021-06-30 23:59:59', 3, 35),
('2021-06-01 10:18:57', '2021-06-30 16:18:57', 6, 7),
('2021-06-01 10:18:57', '2021-06-30 16:18:57', 6, 11),
('2021-06-01 10:18:57', '2021-06-30 16:18:57', 6, 21),
('2021-06-01 10:18:57', '2021-06-30 23:59:59', 6, 22),
('2021-06-01 10:18:57', '2021-06-30 23:59:59', 6, 25),
('2021-06-01 10:18:57', '2021-06-30 16:18:57', 6, 26),
('2021-06-01 10:18:57', '2021-06-30 16:18:57', 6, 35),
('2021-06-01 10:18:57', '2021-06-30 16:18:57', 8, 7),
('2021-06-01 10:18:57', '2021-06-30 16:18:57', 8, 11),
('2021-06-01 10:18:57', '2021-06-30 16:18:57', 8, 21),
('2021-06-01 10:18:57', '2021-06-30 16:18:57', 8, 26),
('2021-06-01 10:18:57', '2021-06-30 16:18:57', 8, 35),
('2021-06-01 09:29:18', '2021-06-30 23:59:59', 11, 7),
('2021-06-01 09:29:18', '2021-06-30 23:59:59', 11, 11),
('2021-06-01 09:29:18', '2021-06-30 23:59:59', 11, 21),
('2021-06-01 10:18:57', '2021-06-30 23:59:59', 11, 22),
('2021-06-01 10:18:57', '2021-06-30 23:59:59', 11, 25),
('2021-06-01 09:29:18', '2021-06-30 23:59:59', 11, 26),
('2021-06-01 09:29:18', '2021-06-30 23:59:59', 11, 35);

-- --------------------------------------------------------

--
-- Table structure for table `non_sub_services`
--

CREATE TABLE `non_sub_services` (
  `service_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `non_sub_services`
--

INSERT INTO `non_sub_services` (`service_id`) VALUES
(1),
(2),
(3);

-- --------------------------------------------------------

--
-- Table structure for table `receive_services`
--

CREATE TABLE `receive_services` (
  `NFC_ID` int NOT NULL,
  `service_id` int DEFAULT NULL,
  `charge_desc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `charge_amount` float NOT NULL,
  `charge_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `receive_services`
--

INSERT INTO `receive_services` (`NFC_ID`, `service_id`, `charge_desc`, `charge_amount`, `charge_datetime`) VALUES
(3, 5, 'Sauna', 55.1, '2021-06-22 06:25:35'),
(4, 4, 'Gym', 40, '2021-06-16 09:42:51'),
(4, 5, 'Sauna', 24.54, '2021-06-24 08:35:53'),
(4, 6, 'Conference room services', 24.56, '2021-06-28 07:29:47'),
(4, 4, 'Gym', 12, '2021-06-06 07:40:49'),
(4, 6, 'Description', 24.44, '2021-06-23 15:32:51'),
(6, 6, 'charges for conference', 15.4, '2021-06-29 09:24:42'),
(6, 6, 'charges for conference', 25.1, '2021-06-16 15:45:10'),
(6, 6, 'charges for conference', 42.2, '2021-06-16 15:45:10'),
(3, 6, 'charges for conference', 10.6, '2021-06-16 11:27:50'),
(3, 6, 'charges for conference', 24.1, '2021-06-29 10:26:42');

-- --------------------------------------------------------

--
-- Stand-in structure for view `sales_per_service_view`
-- (See below for the actual view)
--
CREATE TABLE `sales_per_service_view` (
`NFC_ID` int
,`service_id` int
,`charge_desc` varchar(50)
,`charge_amount` float
,`charge_datetime` datetime
);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int NOT NULL,
  `service_desc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `service_desc`) VALUES
(1, 'Serving drinks at the bar'),
(2, 'Serving food/drinks at the restaurant'),
(3, 'Barber services'),
(4, 'Gym services'),
(5, 'Sauna services'),
(6, 'Conference room services');

-- --------------------------------------------------------

--
-- Table structure for table `sub_services`
--

CREATE TABLE `sub_services` (
  `service_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_services`
--

INSERT INTO `sub_services` (`service_id`) VALUES
(4),
(5),
(6);

-- --------------------------------------------------------

--
-- Table structure for table `venues`
--

CREATE TABLE `venues` (
  `no_beds` int DEFAULT NULL,
  `venue_id` int NOT NULL,
  `service_id` int DEFAULT NULL,
  `venue_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `venue_desc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `venue_floor` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `venues`
--

INSERT INTO `venues` (`no_beds`, `venue_id`, `service_id`, `venue_name`, `venue_desc`, `venue_floor`) VALUES
(NULL, 1, 1, 'Beer Garden', 'Bar', 1),
(NULL, 2, 1, 'Owl Bar', 'Bar', 1),
(NULL, 3, 1, 'A Rum Thing', 'Bar', 1),
(NULL, 4, 1, 'Le Gin Palace', 'Bar', 1),
(NULL, 5, 1, 'Fizz Bar', 'Bar', 1),
(NULL, 6, 1, 'Irish Eyes Pub', 'Bar', 1),
(NULL, 7, 2, 'Pine & Dine', 'Restaurant', 1),
(NULL, 8, 2, 'A Salt & Battery', 'Restaurant', 1),
(NULL, 9, 2, 'Basic Kneads Pizza', 'Restaurant', 1),
(NULL, 10, 2, 'Dinner in the Sky', 'Restaurant', 1),
(NULL, 11, 6, 'CR1', 'Conference Room', 1),
(NULL, 12, 6, 'CR2', 'Conference Room', 1),
(NULL, 13, 6, 'CR3', 'Conference Room', 1),
(NULL, 14, 6, 'CR4', 'Conference Room', 1),
(NULL, 15, 6, 'CR5', 'Conference Room', 1),
(NULL, 16, 6, 'CR6', 'Conference Room', 1),
(NULL, 17, 6, 'CR7', 'Conference Room', 1),
(NULL, 18, 6, 'CR8', 'Conference Room', 1),
(NULL, 19, 6, 'CR9', 'Conference Room', 1),
(NULL, 20, 6, 'CR10', 'Conference Room', 1),
(NULL, 21, 4, 'Gym Hero', 'Gym', 1),
(NULL, 22, 4, 'Kardio Work', 'Gym', 1),
(NULL, 23, 4, 'Guardian Gym', 'Gym', 1),
(NULL, 24, 4, 'The Fitness Pack', 'Gym', 1),
(NULL, 25, 5, 'Sauna 1', 'Sauna', 1),
(NULL, 26, 5, 'Sauna 2', 'Sauna', 1),
(NULL, 27, 5, 'Sauna 3', 'Sauna', 1),
(NULL, 28, 5, 'Sauna 4', 'Sauna', 1),
(NULL, 29, 5, 'Sauna 5', 'Sauna', 1),
(NULL, 30, 5, 'Sauna 6', 'Sauna', 1),
(NULL, 31, 5, 'Sauna 7', 'Sauna', 1),
(NULL, 32, 5, 'Sauna 8', 'Sauna', 1),
(NULL, 33, 5, 'Sauna 9', 'Sauna', 1),
(NULL, 34, 5, 'Sauna 10', 'Sauna', 1),
(NULL, 35, 3, 'Barber & Soul', 'Barber Salon', 1),
(2, 36, NULL, 'Room 1', 'Room', 2),
(NULL, 37, NULL, 'East corridor', 'Corridor', 2),
(NULL, 38, NULL, 'Room 2', 'Room', 2),
(NULL, 39, NULL, 'West corridor', 'Corridor', 2),
(NULL, 40, NULL, 'North corridor', 'Corridor', 2),
(NULL, 41, NULL, 'South corridor', 'Corridor', 2),
(NULL, 42, NULL, 'Elevator 1', 'Elevator', NULL),
(NULL, 43, NULL, 'Elevator 2', 'Elevator', NULL),
(NULL, 44, NULL, 'Elevator 3', 'Elevator', NULL),
(NULL, 45, NULL, 'Elevator 4', 'Elevator', NULL),
(NULL, 46, NULL, 'Elevator 5', 'Elevator', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `visits`
--

CREATE TABLE `visits` (
  `NFC_ID` int NOT NULL,
  `venue_id` int NOT NULL,
  `entry_datetime` datetime NOT NULL,
  `exit_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `visits`
--

INSERT INTO `visits` (`NFC_ID`, `venue_id`, `entry_datetime`, `exit_datetime`) VALUES
(2, 21, '2021-06-16 06:22:14', '2021-06-16 07:22:14'),
(8, 26, '2021-06-18 06:22:13', '2021-06-18 07:22:15'),
(2, 21, '2021-06-18 06:22:14', '2021-06-18 07:22:14'),
(6, 21, '2021-06-18 07:23:14', '2021-06-18 09:22:14'),
(2, 3, '2021-06-18 12:22:14', '2021-06-18 14:22:14'),
(2, 35, '2021-06-18 16:24:00', '2021-06-18 17:24:05'),
(3, 35, '2021-06-19 11:24:52', '2021-06-19 13:24:52'),
(6, 26, '2021-06-19 14:24:52', '2021-06-19 16:24:52'),
(6, 26, '2021-06-19 14:24:53', '2021-06-19 16:24:52'),
(11, 26, '2021-06-20 04:26:57', '2021-06-20 05:26:57'),
(3, 21, '2021-06-11 16:41:50', '2021-06-11 17:41:50'),
(3, 26, '2021-06-14 11:24:50', '2021-06-23 12:55:10'),
(3, 35, '2021-06-27 10:22:42', '2021-06-27 11:24:22'),
(3, 21, '2021-06-22 14:41:50', '2021-06-22 16:22:40'),
(6, 21, '2021-06-11 16:21:50', '2021-06-11 17:41:50'),
(6, 21, '2021-06-22 14:41:50', '2021-06-22 15:41:52'),
(6, 26, '2021-06-14 12:44:10', '2021-06-23 14:42:20'),
(6, 35, '2021-06-27 09:22:42', '2021-06-27 11:22:42'),
(11, 21, '2021-06-11 13:22:50', '2021-06-23 15:11:50'),
(11, 21, '2021-06-22 16:41:50', '2021-06-14 17:41:20'),
(11, 26, '2021-06-14 11:44:20', '2021-06-14 14:44:20'),
(11, 35, '2021-06-27 12:21:11', '2021-06-27 14:22:42'),
(3, 7, '2021-06-13 16:41:50', '2021-06-13 17:41:50'),
(3, 11, '2021-06-16 11:24:50', '2021-06-16 12:55:10'),
(3, 11, '2021-06-29 10:22:42', '2021-06-29 11:24:22'),
(3, 7, '2021-06-24 14:41:50', '2021-06-24 16:22:40'),
(6, 7, '2021-06-13 16:21:50', '2021-06-13 17:41:50'),
(6, 7, '2021-06-24 14:41:50', '2021-06-24 15:41:52'),
(6, 11, '2021-06-16 12:44:10', '2021-06-16 14:42:20'),
(6, 11, '2021-06-29 09:22:42', '2021-06-29 11:22:42'),
(11, 7, '2021-06-13 13:22:50', '2021-06-14 15:11:50'),
(11, 7, '2021-06-24 16:41:50', '2021-06-24 17:41:20'),
(11, 11, '2021-06-16 11:44:20', '2021-06-16 14:44:20'),
(11, 11, '2021-06-29 12:21:11', '2021-06-29 14:22:42'),
(3, 22, '2021-06-13 15:41:50', '2021-06-13 16:41:50'),
(3, 25, '2021-06-16 10:24:50', '2021-06-16 11:55:10'),
(3, 25, '2021-06-29 09:22:42', '2021-06-29 10:24:22'),
(3, 22, '2021-06-24 13:41:50', '2021-06-24 15:22:40'),
(6, 22, '2021-06-13 11:21:50', '2021-06-13 14:41:50'),
(6, 22, '2021-06-24 12:41:50', '2021-06-24 13:41:52'),
(6, 11, '2021-06-16 15:44:10', '2021-06-16 17:42:20'),
(6, 25, '2021-06-29 11:22:42', '2021-06-29 14:22:42'),
(11, 22, '2021-06-13 16:22:50', '2021-06-14 17:11:50'),
(11, 22, '2021-06-24 17:41:50', '2021-06-24 18:41:20'),
(11, 25, '2021-06-14 11:44:20', '2021-06-16 15:44:20'),
(11, 25, '2021-06-29 10:21:11', '2021-06-29 10:52:42');

-- --------------------------------------------------------

--
-- Structure for view `client_info_view`
--
DROP TABLE IF EXISTS `client_info_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `client_info_view`  AS SELECT `clients`.`NFC_ID` AS `NFC_ID`, `clients`.`first_name` AS `first_name`, `clients`.`last_name` AS `last_name`, `client_identification`.`id_no` AS `id_no`, `client_identification`.`id_type` AS `id_type`, `client_identification`.`id_issuingauthority` AS `id_issuingauthority`, group_concat(distinct `client_phones`.`phone_no` separator ',') AS `phones`, group_concat(distinct `client_email`.`email` separator ',') AS `emails` FROM (((`clients` join `client_email`) join `client_phones`) join `client_identification`) WHERE ((`clients`.`NFC_ID` = `client_email`.`NFC_ID`) AND (`clients`.`NFC_ID` = `client_phones`.`NFC_ID`) AND (`clients`.`NFC_ID` = `client_identification`.`NFC_ID`)) GROUP BY `clients`.`NFC_ID`, `client_identification`.`id_no` ;

-- --------------------------------------------------------

--
-- Structure for view `sales_per_service_view`
--
DROP TABLE IF EXISTS `sales_per_service_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `sales_per_service_view`  AS SELECT `receive_services`.`NFC_ID` AS `NFC_ID`, `receive_services`.`service_id` AS `service_id`, `receive_services`.`charge_desc` AS `charge_desc`, `receive_services`.`charge_amount` AS `charge_amount`, `receive_services`.`charge_datetime` AS `charge_datetime` FROM (`services` join `receive_services` on((`receive_services`.`service_id` = `services`.`service_id`))) ORDER BY `services`.`service_id` ASC ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`NFC_ID`),
  ADD UNIQUE KEY `first_name` (`first_name`,`last_name`),
  ADD KEY `last_name` (`last_name`),
  ADD KEY `dob` (`dob`);

--
-- Indexes for table `client_email`
--
ALTER TABLE `client_email`
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `email_constraint` (`NFC_ID`);

--
-- Indexes for table `client_identification`
--
ALTER TABLE `client_identification`
  ADD UNIQUE KEY `id_no` (`id_no`),
  ADD KEY `id_constraint` (`NFC_ID`);

--
-- Indexes for table `client_phones`
--
ALTER TABLE `client_phones`
  ADD UNIQUE KEY `phone_no` (`phone_no`),
  ADD KEY `phone_constraint` (`NFC_ID`);

--
-- Indexes for table `client_subscriptions`
--
ALTER TABLE `client_subscriptions`
  ADD UNIQUE KEY `NFC_ID_2` (`NFC_ID`,`service_id`),
  ADD KEY `test` (`service_id`);

--
-- Indexes for table `has_access`
--
ALTER TABLE `has_access`
  ADD UNIQUE KEY `NFC_ID` (`NFC_ID`,`venue_id`),
  ADD KEY `venue_access_constraint` (`venue_id`);

--
-- Indexes for table `non_sub_services`
--
ALTER TABLE `non_sub_services`
  ADD UNIQUE KEY `service_id` (`service_id`),
  ADD KEY `non_sub_constraint` (`service_id`);

--
-- Indexes for table `receive_services`
--
ALTER TABLE `receive_services`
  ADD KEY `nfc_charge_constraint` (`NFC_ID`),
  ADD KEY `service_charge_constraint` (`service_id`),
  ADD KEY `service_charge_constraint2` (`service_id`,`NFC_ID`),
  ADD KEY `charge_amount` (`charge_amount`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `sub_services`
--
ALTER TABLE `sub_services`
  ADD UNIQUE KEY `service_id` (`service_id`),
  ADD KEY `sub_service_constraint` (`service_id`);

--
-- Indexes for table `venues`
--
ALTER TABLE `venues`
  ADD PRIMARY KEY (`venue_id`),
  ADD KEY `venue_service_constraint` (`service_id`);

--
-- Indexes for table `visits`
--
ALTER TABLE `visits`
  ADD KEY `nfc_visits_constraint` (`NFC_ID`),
  ADD KEY `venue_visits_constraint` (`venue_id`),
  ADD KEY `entry_datetime` (`entry_datetime`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `NFC_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `venues`
--
ALTER TABLE `venues`
  MODIFY `venue_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client_email`
--
ALTER TABLE `client_email`
  ADD CONSTRAINT `email_constraint` FOREIGN KEY (`NFC_ID`) REFERENCES `clients` (`NFC_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `client_identification`
--
ALTER TABLE `client_identification`
  ADD CONSTRAINT `id_constraint` FOREIGN KEY (`NFC_ID`) REFERENCES `clients` (`NFC_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `client_phones`
--
ALTER TABLE `client_phones`
  ADD CONSTRAINT `phone_constraint` FOREIGN KEY (`NFC_ID`) REFERENCES `clients` (`NFC_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `client_subscriptions`
--
ALTER TABLE `client_subscriptions`
  ADD CONSTRAINT `sub_client_constraint` FOREIGN KEY (`NFC_ID`) REFERENCES `clients` (`NFC_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `test` FOREIGN KEY (`service_id`) REFERENCES `sub_services` (`service_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `has_access`
--
ALTER TABLE `has_access`
  ADD CONSTRAINT `client_access_constraint` FOREIGN KEY (`NFC_ID`) REFERENCES `clients` (`NFC_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `venue_access_constraint` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`venue_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `non_sub_services`
--
ALTER TABLE `non_sub_services`
  ADD CONSTRAINT `non_sub_constraint` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `receive_services`
--
ALTER TABLE `receive_services`
  ADD CONSTRAINT `nfc_charge_constraint` FOREIGN KEY (`NFC_ID`) REFERENCES `clients` (`NFC_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `service_charge_constraint2` FOREIGN KEY (`service_id`,`NFC_ID`) REFERENCES `client_subscriptions` (`service_id`, `NFC_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_services`
--
ALTER TABLE `sub_services`
  ADD CONSTRAINT `sub_service_constraint` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `venues`
--
ALTER TABLE `venues`
  ADD CONSTRAINT `venue_service_constraint` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `visits`
--
ALTER TABLE `visits`
  ADD CONSTRAINT `nfc_id_constraint` FOREIGN KEY (`NFC_ID`) REFERENCES `has_access` (`NFC_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `venue_visits_constraint` FOREIGN KEY (`venue_id`) REFERENCES `has_access` (`venue_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
