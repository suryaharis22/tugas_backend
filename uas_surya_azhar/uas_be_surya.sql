-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2024 at 10:32 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uas_be_surya`
--

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `status` enum('sembuh','meninggal','positif') NOT NULL,
  `in_date_at` datetime NOT NULL,
  `out_date_at` datetime NOT NULL,
  `timestamp` time NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `name`, `phone`, `address`, `status`, `in_date_at`, `out_date_at`, `timestamp`, `createdAt`, `updatedAt`) VALUES
(1, 'Surya Haris', '085179765959', 'Malang', 'sembuh', '2024-01-16 08:43:10', '2024-01-18 00:00:00', '14:43:00', '2024-01-16 08:43:10', '2024-01-16 08:10:04'),
(2, 'Surya Azhar', '081285645858', 'Depok', 'positif', '2024-01-16 00:00:00', '2024-01-17 00:00:00', '12:00:00', '2024-01-16 08:06:50', '2024-01-16 08:06:50'),
(4, 'Tes Validasi', '0815213142424', 'Jakarta', 'meninggal', '2022-01-16 00:00:00', '2025-01-17 00:00:00', '23:00:00', '2024-01-16 08:32:46', '2024-01-16 08:32:46'),
(5, 'Tes Validasi dan notif', '2323', 'jogja', 'positif', '2022-01-16 00:00:00', '2025-01-17 00:00:00', '23:00:00', '2024-01-16 08:34:34', '2024-01-16 08:34:34');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'suryaharis22', 'suryaharis22@gmail.com', '$2b$10$f.3SDZnEAr5kiiS.3NaQV.mLtJcrSDupzVXizZCOfwMb92Hhc8TXi', '2024-01-17 08:52:48', '2024-01-17 08:52:48'),
(2, 'Tes', 'tes1@gmail.com', '$2b$10$.iIwV6ko.pvE9hlGH9AukOKJ3R3qXiFl20pechXW4CBQ8mAl4bj4O', '2024-01-17 09:06:05', '2024-01-17 09:06:05'),
(3, 'Tes2', 'tes2@gmail.com', '$2b$10$5b8fnwTwsYP2nFeXXt7RC.1XOrN9WTfypAbTwoq1/J3467svsI/VS', '2024-01-17 09:09:23', '2024-01-17 09:09:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
