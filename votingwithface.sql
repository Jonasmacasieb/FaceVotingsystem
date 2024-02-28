-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2024 at 07:24 AM
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
-- Database: `votingwithface`
--

-- --------------------------------------------------------

--
-- Table structure for table `accs_hist`
--

CREATE TABLE `accs_hist` (
  `accs_id` int(11) NOT NULL,
  `accs_date` date NOT NULL,
  `accs_prsn` varchar(3) NOT NULL,
  `accs_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
-- Table structure for table `img_dataset`
--

CREATE TABLE `img_dataset` (
  `img_id` int(11) NOT NULL,
  `img_person` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
-- Table structure for table `prs_mstr`
--

CREATE TABLE `prs_mstr` (
  `prs_nbr` varchar(3) NOT NULL,
  `prs_name` varchar(50) NOT NULL,
  `prs_skill` varchar(30) NOT NULL,
  `prs_active` varchar(1) NOT NULL DEFAULT 'Y',
  `prs_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
  `type` tinyint(1) NOT NULL DEFAULT 3 COMMENT '1+admin , 2 = users, 3 = staff',
  `has_voted` tinyint(1) DEFAULT 0,
  `picture_path` text NOT NULL,
  `online_status` enum('online','offline') NOT NULL DEFAULT 'offline',
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `department`, `course`, `section`, `type`, `has_voted`, `picture_path`, `online_status`, `date`) VALUES
(1, 'Administrator', '01-2359-235', '21232f297a57a5a743894a0e4a801fc3', '', '', '', 1, 0, 'image/3.png', 'online', NULL),
(165, 'Albert cayabyab', '20-0180-985', '', 'BSIT', 'IT', '4-1', 2, 0, '', 'online', '2024-02-22 07:09:09'),
(166, 'Aldwin Lester Solis', '20-0551-153', '', 'BSIT', 'IT', '4-1', 2, 0, '', 'offline', NULL);

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
(109, 25, 11, 98, 108),
(110, 26, 6, 99, 116),
(111, 26, 11, 102, 116),
(112, 26, 6, 100, 115),
(113, 26, 11, 101, 115),
(114, 26, 6, 99, 117),
(115, 26, 11, 102, 117),
(116, 27, 6, 103, 117),
(117, 27, 11, 107, 117),
(118, 27, 6, 105, 108),
(119, 27, 11, 106, 108),
(120, 16, 6, 76, 106),
(121, 16, 6, 76, 106),
(122, 16, 6, 77, 117),
(123, 26, 6, 99, 115),
(124, 26, 11, 101, 115),
(125, 26, 6, 99, 124),
(126, 26, 11, 102, 124),
(127, 26, 6, 99, 119),
(128, 26, 11, 102, 119),
(129, 26, 6, 100, 118),
(130, 26, 11, 101, 118),
(131, 28, 6, 110, 115),
(132, 28, 11, 111, 115),
(133, 28, 6, 109, 119),
(134, 28, 11, 112, 119),
(135, 28, 6, 109, 106),
(136, 28, 11, 111, 106),
(137, 28, 6, 109, 112),
(138, 28, 11, 111, 112),
(139, 28, 6, 109, 113),
(140, 28, 6, 109, 114),
(141, 28, 11, 111, 114),
(142, 28, 6, 109, 107),
(143, 28, 11, 111, 107),
(144, 28, 6, 109, 108),
(145, 28, 11, 112, 108);

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
(10, 17, 6, 2),
(11, 27, 11, 2);

-- --------------------------------------------------------

--
-- Table structure for table `voting_list`
--

CREATE TABLE `voting_list` (
  `id` int(30) NOT NULL,
  `title` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `time_duration` time NOT NULL,
  `votedate` date DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voting_list`
--

INSERT INTO `voting_list` (`id`, `title`, `description`, `time_duration`, `votedate`, `is_default`) VALUES
(16, 'Homeroom for CSS', 'for css', '24:00:00', NULL, 0),
(26, 'new', 'new', '08:00:00', NULL, 0),
(28, 'with img', 'd', '08:00:00', NULL, 1),
(30, 'jonas', 'jonas', '08:00:00', '2024-02-21', 0);

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
(98, 25, 11, '', 'Albert', '', 4),
(99, 26, 6, '', 'harold', '', 4),
(100, 26, 6, '', 'Albert', '', 5),
(101, 26, 11, '', 'MARX  RANZELLE V. DY ', '', 4),
(102, 26, 11, '', 'joas', '', 5),
(103, 27, 6, '', 'harold', '', 4),
(105, 27, 6, '', 'Albert', '', 5),
(106, 27, 11, '', 'joas', '', 4),
(107, 27, 11, '', 'MARX  RANZELLE V. DY ', '', 5),
(108, 27, 11, '', 'r2', '', 5),
(109, 28, 6, '1708220760_10363530_10152823736304179_6985184285259385965_n.jpg', 'harold', '', 4),
(110, 28, 6, '1708220760_10615529_10152823736319179_5245462818405751638_n.jpg', 'Albert', '', 4),
(111, 28, 11, '1708220760_Aero_SlateWin_by_StudioTwentyEight.jpg', 'joas', '', 4),
(112, 28, 11, '1708220820_DBZ_OP_Naruto__Melee_by_Risachantag.jpg', 'MARX  RANZELLE V. DY ', '', 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accs_hist`
--
ALTER TABLE `accs_hist`
  ADD PRIMARY KEY (`accs_id`),
  ADD KEY `accs_date` (`accs_date`);

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `img_dataset`
--
ALTER TABLE `img_dataset`
  ADD PRIMARY KEY (`img_id`);

--
-- Indexes for table `party_list`
--
ALTER TABLE `party_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prs_mstr`
--
ALTER TABLE `prs_mstr`
  ADD PRIMARY KEY (`prs_nbr`);

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
-- AUTO_INCREMENT for table `accs_hist`
--
ALTER TABLE `accs_hist`
  MODIFY `accs_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `party_list`
--
ALTER TABLE `party_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `voting_cat_settings`
--
ALTER TABLE `voting_cat_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `voting_list`
--
ALTER TABLE `voting_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `voting_logs`
--
ALTER TABLE `voting_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `voting_opt`
--
ALTER TABLE `voting_opt`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
