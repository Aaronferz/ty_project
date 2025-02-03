-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2025 at 06:36 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school_info`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `studentID` int(11) NOT NULL,
  `studentName` varchar(100) NOT NULL,
  `department` varchar(50) NOT NULL,
  `year` enum('FY','SY','TY','Final') NOT NULL,
  `division` varchar(10) NOT NULL,
  `daysPresent` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`studentID`, `studentName`, `department`, `year`, `division`, `daysPresent`) VALUES
(100000001, 'Rajesh Sharma', 'CS', 'TY', 'A', 150),
(100000002, 'Sneha Kapoor', 'MECH', 'TY', 'B', 145),
(100000003, 'Arjun Verma', 'CIVIL', 'TY', 'A', 140),
(100000004, 'Aisha Khan', 'CS', 'TY', 'B', 155),
(100000005, 'Vikram Patil', 'MECH', 'TY', 'A', 148);

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `noticeID` int(11) NOT NULL,
  `teacherName` varchar(100) NOT NULL,
  `noticeText` text NOT NULL,
  `endDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notices`
--

INSERT INTO `notices` (`noticeID`, `teacherName`, `noticeText`, `endDate`) VALUES
(1, 'Anjali Mehta', 'Parent-Teacher Meeting', '2025-02-10'),
(2, 'Ravi Kumar', 'Science Project Submission', '2025-02-15'),
(3, 'Priya Singh', 'Sports Day Announcement', '2025-02-20'),
(4, 'Amit Joshi', 'School Trip Information', '2025-02-25'),
(5, 'Neha Patel', 'Art Exhibition Invitation', '2025-03-01');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `rollNo` int(11) NOT NULL,
  `studentName` varchar(100) DEFAULT NULL,
  `fatherName` varchar(100) DEFAULT NULL,
  `motherName` varchar(100) DEFAULT NULL,
  `studentsMail` varchar(100) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`rollNo`, `studentName`, `fatherName`, `motherName`, `studentsMail`, `mobile`, `addr`, `DOB`, `gender`, `password`) VALUES
(123, 'student', 'xyz', 'abc', 'student@gmail.com', '1234567891', 'mumbai', '2000-01-01', 'T', '123'),
(100000001, 'Rajesh Sharma', 'Manoj Sharma', 'Sita Sharma', 'rajesh.sharma@example.com', '9876543210', '123 Main St, Mumbai', '2005-05-21', 'Male', 'raj@123'),
(100000002, 'Sneha Kapoor', 'Rakesh Kapoor', 'Neha Kapoor', 'sneha.kapoor@example.com', '8765432109', '456 Market Rd, Mumbai', '2006-03-14', 'Female', 'sneh@456'),
(100000003, 'Arjun Verma', 'Karan Verma', 'Priya Verma', 'arjun.verma@example.com', '7654321098', '789 Park Ave, Mumbai', '2004-12-01', 'Male', 'arj@789'),
(100000004, 'Aisha Khan', 'Imran Khan', 'Saira Khan', 'aisha.khan@example.com', '6543210987', '101 Hill St, Mumbai', '2005-09-17', 'Female', 'aish@654'),
(100000005, 'Vikram Patil', 'Anil Patil', 'Maya Patil', 'vikram.patil@example.com', '5432109876', '202 River Rd, Mumbai', '2006-07-29', 'Male', 'vik@321');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `teacherID` int(11) NOT NULL,
  `teacherName` varchar(100) DEFAULT NULL,
  `teacherMail` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`teacherID`, `teacherName`, `teacherMail`, `password`) VALUES
(1, 'Anjali Mehta', 'anjali.mehta@example.com', 'p@ssw0rd123'),
(2, 'Ravi Kumar', 'ravi.kumar@example.com', 'secureP@ss'),
(3, 'Priya Singh', 'priya.singh@example.com', 'priy@S1ngh'),
(4, 'Amit Joshi', 'amit.joshi@example.com', 'Am!tJ0sh1'),
(5, 'Neha Patel', 'neha.patel@example.com', 'neh@P@t3l'),
(6, 'admin', 'admin@gmail.com', 'admin@123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`studentID`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`noticeID`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`rollNo`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacherID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `noticeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
