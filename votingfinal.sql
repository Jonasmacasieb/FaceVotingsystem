-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2024 at 01:55 AM
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
-- Database: `votingfinal`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `category` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `category`) VALUES
(6, 'President'),
(11, 'Vice President - Internal Affairs'),
(12, 'Vice President - External Affairs'),
(13, 'Executive Secretary'),
(14, 'Associate Secretary'),
(15, 'Executive Treasurer'),
(16, 'Associate Treasurer'),
(17, 'Auditors'),
(18, 'Business Managers'),
(19, 'Public Relation - Internal Affairs'),
(20, 'Public Relation - External Affairs'),
(21, 'Representative from every Year'),
(22, 'Cabinet Members');

-- --------------------------------------------------------

--
-- Table structure for table `login_logs`
--

CREATE TABLE `login_logs` (
  `id` int(11) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `user_id` varchar(15) NOT NULL,
  `login_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `login_logs`
--

INSERT INTO `login_logs` (`id`, `user_type`, `user_id`, `login_time`) VALUES
(1, 'Students', '0053250235', '2024-02-28 01:17:34'),
(2, 'Students', '0053250235', '2024-02-28 01:21:30');

-- --------------------------------------------------------

--
-- Table structure for table `party_list`
--

CREATE TABLE `party_list` (
  `id` int(11) NOT NULL,
  `partylist` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `party_list`
--

INSERT INTO `party_list` (`id`, `partylist`) VALUES
(4, 'jonas'),
(5, 'joansdw');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `department` varchar(100) NOT NULL,
  `course` varchar(50) NOT NULL,
  `section` varchar(50) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1+admin , 2 = users',
  `has_voted` tinyint(1) DEFAULT 0,
  `picture_path` text NOT NULL,
  `online_status` enum('online','offline') NOT NULL DEFAULT 'offline'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `department`, `course`, `section`, `type`, `has_voted`, `picture_path`, `online_status`) VALUES
(1, 'Administrator', '01-2359-235', '21232f297a57a5a743894a0e4a801fc3', '', '', '', 1, 0, 'image/3.png', 'offline'),
(115, 'jonas', '0053250235', '', 'BSIT', 'IT', '4-1', 2, 0, 'image/istockphoto-461164967-612x612.jpg', 'online'),
(116, 'sample2', '20-2352-352', '', 'BSCRIM', 'Criminology', '4-1', 2, 0, '', 'offline'),
(117, 'sample3', '01-0000-000', '', 'BSCRIM', 'Criminology', '4-2', 2, 0, '', 'offline');

-- --------------------------------------------------------

--
-- Table structure for table `votes`
--

CREATE TABLE `votes` (
  `id` int(255) NOT NULL,
  `voting_id` int(255) NOT NULL,
  `category_id` int(255) NOT NULL,
  `voting_opt_id` int(255) NOT NULL,
  `user_id` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `votes`
--

INSERT INTO `votes` (`id`, `voting_id`, `category_id`, `voting_opt_id`, `user_id`) VALUES
(84, 16, 6, 76, 92),
(85, 17, 6, 78, 94),
(86, 17, 12, 79, 94),
(87, 17, 6, 78, 95),
(88, 17, 12, 79, 95),
(89, 18, 6, 81, 96),
(90, 18, 11, 82, 96),
(91, 18, 6, 80, 97),
(92, 18, 11, 83, 97),
(93, 17, 6, 78, 102),
(94, 17, 12, 79, 102),
(95, 17, 6, 78, 99),
(96, 17, 12, 79, 99),
(97, 24, 6, 94, 104),
(98, 24, 6, 94, 104),
(99, 24, 6, 94, 105),
(100, 24, 6, 94, 105),
(101, 24, 6, 95, 106),
(102, 24, 6, 95, 0),
(103, 24, 11, 96, 0),
(104, 24, 6, 94, 111),
(105, 24, 11, 96, 111),
(106, 25, 6, 97, 112),
(107, 25, 11, 98, 112),
(108, 25, 6, 97, 108),
(109, 25, 11, 98, 108);

-- --------------------------------------------------------

--
-- Table structure for table `voting_cat_settings`
--

CREATE TABLE `voting_cat_settings` (
  `id` int(30) NOT NULL,
  `voting_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `max_selection` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voting_cat_settings`
--

INSERT INTO `voting_cat_settings` (`id`, `voting_id`, `category_id`, `max_selection`) VALUES
(9, 16, 6, 2),
(10, 17, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `voting_list`
--

CREATE TABLE `voting_list` (
  `id` int(30) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `time_duration` time NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voting_list`
--

INSERT INTO `voting_list` (`id`, `title`, `description`, `time_duration`, `is_default`) VALUES
(16, 'Homeroom for CSS', 'for css', '24:00:00', 0),
(24, 'ccs', 'ccs', '08:00:00', 1),
(25, 'sample', 'sa', '08:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `voting_logs`
--

CREATE TABLE `voting_logs` (
  `id` int(11) NOT NULL,
  `voter_id` int(11) DEFAULT NULL,
  `candidate_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `voting_opt`
--

CREATE TABLE `voting_opt` (
  `id` int(30) NOT NULL,
  `voting_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `image_path` text NOT NULL,
  `opt_txt` text NOT NULL,
  `motto` varchar(255) NOT NULL,
  `partylist_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voting_opt`
--

INSERT INTO `voting_opt` (`id`, `voting_id`, `category_id`, `image_path`, `opt_txt`, `motto`, `partylist_id`) VALUES
(75, 16, 6, '1702115640_istockphoto-841971598-612x612.jpg', 'Albertw', 'dwadaw', 0),
(76, 16, 6, '1702115700_f49012a2e79bc927a18361b16968b5c0.jpg', 'MARX  RANZELLE V. DY ', 'dawdawdwa', 0),
(77, 16, 6, '1702115700_istockphoto-670418084-612x612.jpg', 'dwadwa', 'r3araw', 0),
(78, 17, 6, '1702260480_istockphoto-461164967-612x612.jpg', 'Albert', 'Good game ', 0),
(79, 17, 12, '1702260480_istockphoto-841971598-612x612.jpg', 'harold', 'time is gold', 0),
(80, 18, 6, '1702264380_istockphoto-670418084-612x612.jpg', 'Albert', 'time is gold', 0),
(81, 18, 6, '1702264380_istockphoto-614139584-612x612.jpg', 'joas', 'time is gold', 0),
(82, 18, 11, '1702264380_istockphoto-1224612530-612x612.jpg', 'joash', 'time is expensive', 0),
(83, 18, 11, '1702264440_istockphoto-866474934-612x612.jpg', 'MARX  RANZELLE V. DY ', 'Good game ', 0),
(84, 21, 4, '', 'dwa', '', 0),
(85, 0, 0, '', '', '', 0),
(86, 0, 0, '', '', '', 0),
(87, 0, 0, '1704342720_11.PNG', '', '', 0),
(88, 0, 0, '', '', '', 0),
(89, 0, 0, '1704343320_11.PNG', '', '', 4),
(90, 0, 0, '1704343500_1.PNG', '', '', 4),
(91, 0, 0, '1704343920_24.PNG', '', '', 4),
(92, 0, 0, '1704346260_1.PNG', '', '', 4),
(94, 24, 6, '', 'Albert', '', 4),
(95, 24, 6, '', 'Albertw', '', 4),
(96, 24, 11, '', 'ii', '', 4),
(97, 25, 6, '', 'harold', '', 4),
(98, 25, 11, '', 'Albert', '', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_logs`
--
ALTER TABLE `login_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `party_list`
--
ALTER TABLE `party_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voting_cat_settings`
--
ALTER TABLE `voting_cat_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voting_list`
--
ALTER TABLE `voting_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voting_logs`
--
ALTER TABLE `voting_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voting_opt`
--
ALTER TABLE `voting_opt`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `login_logs`
--
ALTER TABLE `login_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `party_list`
--
ALTER TABLE `party_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `voting_cat_settings`
--
ALTER TABLE `voting_cat_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `voting_list`
--
ALTER TABLE `voting_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `voting_logs`
--
ALTER TABLE `voting_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `voting_opt`
--
ALTER TABLE `voting_opt`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
