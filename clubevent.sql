-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2023 at 04:51 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
CREATE DATABASE clubevent;
use clubevent

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clubevent`
--

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL,
  `organizer` int(11) NOT NULL,
  `date_event` datetime NOT NULL,
  `nbplaces` int(11) NOT NULL,
  `event_name` varchar(50) NOT NULL,
  `club_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`event_id`, `organizer`, `date_event`, `nbplaces`, `event_name`, `club_name`) VALUES
(13, 29, '1970-01-01 01:00:00', 0, 'aze', 'azerty'),
(14, 29, '2023-06-01 09:50:00', 9, 'aze', 'azerty');

-- --------------------------------------------------------

--
-- Table structure for table `reserved_events`
--

CREATE TABLE `reserved_events` (
  `id_event_reserved` int(11) NOT NULL,
  `id_user_reserverd` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reserved_events`
--

INSERT INTO `reserved_events` (`id_event_reserved`, `id_user_reserverd`) VALUES
(13, 26),
(14, 29);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `email` varchar(120) NOT NULL,
  `username` varchar(120) NOT NULL,
  `password` varchar(120) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(30) NOT NULL,
  `active` int(11) NOT NULL,
  `club_name` varchar(120) DEFAULT NULL,
  `changed` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`email`, `username`, `password`, `user_id`, `role`, `active`, `club_name`, `changed`) VALUES
('admin@admin.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, 'admin', 1, '', NULL),
('jelloulmx@gmail.com', 'jelloulmx@gmail.com', '882baf28143fb700b388a87ef561a6e5', 26, 'Student', 1, NULL, 0),
('jelloulmxa@gmail.com', 'jelloulmxa@gmail.com', 'cbf88626b7e08818c3f807714c6e45eb', 27, 'Student', 1, NULL, NULL),
('jelloulmxaa@gmail.com', 'jelloulmxaa@gmail.com', 'fa3ba3713db8d06ff147f186ca1b7e5d', 28, 'Student', 1, NULL, 0),
('jelloulmxwx@gmail.com', 'jelloulmxwx@gmail.com', 'f516302283774732c74669ae59fa1256', 29, 'ClubPresident', 1, 'azerty', 0),
('adminsq@admin.com', 'adminsq@admin.com', '706dea3c9c0cdba060786ac14f2bd74f', 30, 'Student', 1, NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `fk_org` (`organizer`);

--
-- Indexes for table `reserved_events`
--
ALTER TABLE `reserved_events`
  ADD PRIMARY KEY (`id_event_reserved`,`id_user_reserverd`),
  ADD KEY `fk_user` (`id_user_reserverd`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `fk_org` FOREIGN KEY (`organizer`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reserved_events`
--
ALTER TABLE `reserved_events`
  ADD CONSTRAINT `fk_event` FOREIGN KEY (`id_event_reserved`) REFERENCES `events` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`id_user_reserverd`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
