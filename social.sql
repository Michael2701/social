-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2019 at 10:43 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `social`
--

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `id` int(11) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `friend_id` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `friends`
--

INSERT INTO `friends` (`id`, `user_id`, `friend_id`, `created_on`) VALUES
(5, 3, 6, '2019-01-25 21:40:00'),
(6, 4, 7, '2019-01-25 21:23:32'),
(108, 2, 4, '2019-01-26 00:22:32'),
(109, 2, 5, '2019-01-26 00:22:33'),
(110, 2, 6, '2019-01-26 00:26:54'),
(111, 2, 1, '2019-01-26 00:26:55'),
(112, 2, 10, '2019-01-26 00:26:57'),
(126, 1, 6, '2019-01-26 09:38:12'),
(127, 1, 7, '2019-01-26 09:38:13'),
(128, 1, 8, '2019-01-26 09:38:13'),
(129, 1, 9, '2019-01-26 09:38:14'),
(130, 1, 10, '2019-01-26 09:38:15');

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Table structure for table `hobbies`
--

CREATE TABLE `hobbies` (
  `id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hobbies`
--

INSERT INTO `hobbies` (`id`, `name`) VALUES
(1, 'Diving'),
(2, 'Skiing'),
(3, 'Cycling'),
(4, 'Knitting'),
(5, 'Crochet'),
(6, 'Swimming'),
(7, 'Reading'),
(8, 'Wrighting'),
(9, 'Jumping'),
(10, 'Jogging');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `login_attempts`
--

INSERT INTO `login_attempts` (`id`, `ip_address`, `login`, `time`) VALUES
(12, '::1', 'michaelsilianov2@gmail.co4', 1548492051),
(13, '::1', 'michaelsilianov2@gmail.co4', 1548492215),
(14, '::1', 'michaelsilianov2@gmail.co4', 1548492219),
(15, '::1', 'michaelsilianov2@gmail.co4', 1548492224),
(16, '::1', 'michaelsilianov2@gmail.co4', 1548492229);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `birthday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `birthday`) VALUES
(1, '127.0.0.1', 'administrator', '$2y$12$ehQDFFQlll2t./6WhvtemO0lXEmeGBO9x2wFbAF7mmZWzXeIz9ItS', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1548494815, 1, 'Michael', 'Silianov', 'ADMIN', '0', '1973-01-27'),
(2, '::1', 'michaelsilianov@gmail.com', '$2y$10$TriFEkvsgwA7MRwYYoraUuyUBAha7790eO3mY3piw.iGCtTkz7twe', 'michaelsilianov@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1548423652, 1548490147, 1, 'Michael', 'Silianov', 'DevSence', '0524859862', '1973-01-27'),
(3, '::1', 'michaelsilianov2@gmail.com', '$2y$10$Yf2/dBCo89E01hlM.qIWFOFWZkEHDtXPdJM/BDMEWWzHD5ratJVFK', 'michaelsilianov2@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1548424847, NULL, 1, 'Vasiliy', 'Abramov', 'DevSence', '0524859862', '1983-01-02'),
(4, '::1', 'michaelsilianov2@gmail.co3', '$2y$10$oDT4czZbnIrK7.zDKJOZueYOSFti7TBNk5l4hDC9q3uJI7VMMQSRW', 'michaelsilianov2@gmail.co3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1548424885, NULL, 1, 'Michael', 'Lampochkin', 'DevSence', '0524859862', '1993-06-13'),
(5, '::1', 'michaelsilianov2@gmail.co4', '$2y$10$GCGHNSalO4lqDpvjupSf5OtfyRIlWqSOD3OL9WQKxYjB/Ll0zE8qi', 'michaelsilianov2@gmail.co4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1548424926, 1548491911, 1, 'Sasha', 'Pupkin', 'DevSence', '0524859862', '2003-10-18'),
(6, '::1', 'michaelsilianov5@gmail.com', '$2y$10$ad6jX7.sC2n/kPj65LwJC.uDUK.345SUMUg8kjCnRgz1eT.kt13GW', 'michaelsilianov5@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1548424998, NULL, 1, 'Boris', 'Rozetkin', 'DevSence', '0524859862', '1998-01-29'),
(7, '::1', 'michaelsilianov7@gmail.com', '$2y$10$xWbehBLlz0rE0F0lhTA8DOpABGP0mPm9AVpEgtQtVs/0USek3niEq', 'michaelsilianov7@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1548425043, NULL, 1, 'qqqqqqqq', 'qqqqqqqqq', 'DevSence', '0524859862', '2000-02-15'),
(8, '::1', 'michaelsilianov6@gmail.com', '$2y$10$JrfXbJinOKQs3SO3ojcItOKgKB9pungJpBiJK2OvxMRRo7FQ3Eu1G', 'michaelsilianov6@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1548425080, NULL, 1, 'ssssssss', 'sssssssss', 'DevSence', '0524859862', '2000-01-26'),
(9, '::1', 'michaelsilianov9@gmail.com', '$2y$10$UVgKaDJvza.ZqFLN0rZ6UeBkF0scMwlpRidDrZaKaHD8ibW8v6YwW', 'michaelsilianov9@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1548425194, NULL, 1, 'cccccccccccc', 'cccccccccc', 'DevSence', '0524859862', '1000-02-01'),
(10, '::1', 'michaelsilianov10@gmail.com', '$2y$10$YmHrdJ7yN713pvCccJl7c.xk5YnZnqbrRvqrCd1EvQwvoOiBFBI2O', 'michaelsilianov10@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1548425225, NULL, 1, 'vvvvvvvvvv', 'vvvvvvvvvvvv', 'DevSence', '0524859862', '1998-01-29');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(4, 3, 2),
(5, 4, 2),
(6, 5, 2),
(7, 6, 2),
(8, 7, 2),
(9, 8, 2),
(10, 9, 2),
(11, 10, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_hobbies`
--

CREATE TABLE `user_hobbies` (
  `id` int(11) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `hobby_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_hobbies`
--

INSERT INTO `user_hobbies` (`id`, `user_id`, `hobby_id`) VALUES
(1, 2, 1),
(2, 2, 4),
(3, 10, 4),
(4, 3, 5),
(5, 3, 3),
(6, 3, 4),
(7, 3, 2),
(8, 3, 6),
(9, 2, 7),
(10, 2, 10),
(11, 2, 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hobbies`
--
ALTER TABLE `hobbies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- Indexes for table `user_hobbies`
--
ALTER TABLE `user_hobbies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `hobby_id` (`hobby_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `friends`
--
ALTER TABLE `friends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hobbies`
--
ALTER TABLE `hobbies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_hobbies`
--
ALTER TABLE `user_hobbies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `friends_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user_hobbies`
--
ALTER TABLE `user_hobbies`
  ADD CONSTRAINT `user_hobbies_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_hobbies_ibfk_2` FOREIGN KEY (`hobby_id`) REFERENCES `hobbies` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
