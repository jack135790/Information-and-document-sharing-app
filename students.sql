-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2019 at 03:54 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `students`
--

-- --------------------------------------------------------

--
-- Table structure for table `assign`
--

CREATE TABLE `assign` (
  `assigned` date NOT NULL,
  `submission` date NOT NULL,
  `subject` varchar(10) COLLATE utf8_bin NOT NULL,
  `no.` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `assign`
--

INSERT INTO `assign` (`assigned`, `submission`, `subject`, `no.`) VALUES
('2019-01-05', '2019-01-30', 'AJ', 1),
('2019-01-10', '2019-01-30', 'WT', 2);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(5) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `venue` varchar(25) COLLATE utf8_bin NOT NULL,
  `event_name` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `date`, `time`, `venue`, `event_name`) VALUES
(1, '2019-06-01', '09:00:00', 'Workshop', 'workshop on html'),
(4, '2019-05-02', '10:00:00', 'LAb 7-8', 'workshop on python'),
(5, '2019-04-01', '09:00:00', 'Workshop', 'workshop on webdevelopment');

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE `profile` (
  `UserId` varchar(15) NOT NULL,
  `Fname` text NOT NULL,
  `Lname` text NOT NULL,
  `RegNo` int(5) NOT NULL,
  `Class` varchar(2) NOT NULL,
  `Division` int(1) NOT NULL,
  `RollNo` int(2) NOT NULL,
  `MobNo` bigint(10) NOT NULL,
  `Addr` varchar(50) NOT NULL,
  `Pass` varchar(32) NOT NULL DEFAULT 'jecky',
  `S1` int(2) NOT NULL DEFAULT '0',
  `S1t` int(2) NOT NULL DEFAULT '0',
  `S2` int(2) NOT NULL DEFAULT '0',
  `S2t` int(2) NOT NULL DEFAULT '0',
  `S3` int(2) NOT NULL DEFAULT '0',
  `S3t` int(2) NOT NULL DEFAULT '0',
  `S4` int(2) NOT NULL DEFAULT '0',
  `S4t` int(2) NOT NULL DEFAULT '0',
  `S5` int(2) DEFAULT '0',
  `S5t` int(2) NOT NULL DEFAULT '0',
  `Attended` int(2) AS (S1+S2+S3+S4+S5) VIRTUAL,
  `Total` int(2) AS (S1t+S2t+S3t+S4t+S5t) VIRTUAL,
  `Percent` decimal(4,2) AS ((S1+S2+S3+S4+S5)*100/(S1t+S2t+S3t+S4t+S5t)) VIRTUAL,
  `Notifications` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`UserId`, `Fname`, `Lname`, `RegNo`, `Class`, `Division`, `RollNo`, `MobNo`, `Addr`, `Pass`, `S1`, `S1t`, `S2`, `S2t`, `S3`, `S3t`, `S4`, `S4t`, `S5`, `S5t`, `Notifications`) VALUES
('Admin', 'Admin', 'Admin', 0, '0', 0, 0, 8787821544, '0', 'root', 0, 27, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
('160840107051', 'Jecky', 'Rana', 1, 'TY', 1, 51, 8264424021, 'Navsari', 'jecky123', 1, 27, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
('160840107007', 'Vimarsh', 'Chauhan', 2, 'TY', 1, 7, 9870000394, 'Navsari', 'voti123', 1, 27, 0, 4, 0, 0, 0, 0, 5, 0, 'submi'),
('160840107043', 'Sanket', 'Patel', 3, 'TY', 1, 43, 9870000397, 'Navsari', 'vito123', 0, 27, 0, 0, 0, 0, 0, 0, 0, 0, 'hello'),
('160840107023', 'Kalpesh', 'Jangra', 4, 'TY', 1, 23, 9870000793, 'Navsari', 'sank123', 0, 27, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
('160840107021', 'Jay', 'Patel', 5, 'TY', 1, 21, 9870000390, 'Navsari', 'kalp123', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 'syb'),
('160840107037', 'monil', 'Patel', 6, 'TY', 1, 37, 98700030, 'Navsari', 'jay12', 0, 27, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
('160840107029', 'BK', 'Patel', 7, 'TY', 1, 29, 98700003900, 'Navsari', 'bkit', 0, 27, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
('160840107031', 'Darsh', 'Patel', 8, 'TY', 1, 31, 987000031, 'Navsari', 'darsh', 0, 27, 0, 0, 0, 0, 0, 0, 0, 0, NULL),
('160840107052', 'kevin', 'rana', 9, 'TY', 1, 52, 4848584848, 'Navsari', 'jecky', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

CREATE TABLE `timetable` (
  `SrNo` int(1) NOT NULL,
  `Time` varchar(15) NOT NULL,
  `Monday` varchar(15) NOT NULL,
  `Tuesday` varchar(15) NOT NULL,
  `Wednesday` varchar(15) NOT NULL,
  `Thrusday` varchar(15) NOT NULL,
  `Friday` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`SrNo`, `Time`, `Monday`, `Tuesday`, `Wednesday`, `Thrusday`, `Friday`) VALUES
(1, '10:00 - 10:55', 'SE', 'WT', 'TOC', 'AJ', 'AJ'),
(2, '11:00 - 11:55', 'WT', 'DE', 'WT', 'DOTNET', 'TOC'),
(3, '11:55 - 12:50', 'TOC', 'SE', 'DOTNET', 'WT', 'SE'),
(4, '01:20 - 02:15', 'AJ', 'AJ', 'SE', 'SE', 'WT'),
(5, '02:15 - 03:10', 'DOTNET', 'TOC', 'AJ', 'DE', 'CG'),
(6, '03:10 - 04:05', 'DOTNET', 'WT', 'WT', 'DE', 'AJ'),
(7, '04:05 - 05:00', 'DOTNET', 'WT', 'WT', 'DE', 'AJ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
