-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2023 at 09:06 AM
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
-- Database: `surya_uts3`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(16, '2014_10_12_000000_create_users_table', 1),
(17, '2014_10_12_100000_create_password_resets_table', 1),
(18, '2019_08_19_000000_create_failed_jobs_table', 1),
(19, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(20, '2023_11_19_143720_create_patients_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `status` enum('positive','negative','meninggal') NOT NULL,
  `tanggal_masuk` date NOT NULL,
  `tanggal_keluar` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `name`, `address`, `status`, `tanggal_masuk`, `tanggal_keluar`, `created_at`, `updated_at`) VALUES
(1, 'Surya', 'Updated Address', 'positive', '2023-01-01', '2023-11-20', '2023-11-19 08:38:35', '2023-11-19 10:47:18'),
(3, 'Bintang', 'Updated Address', 'positive', '2023-11-11', '2023-11-11', '2023-11-19 12:35:10', '2023-11-19 12:41:30'),
(4, 'Patient 1', 'Address 1', 'positive', '2023-01-01', NULL, '2023-11-19 13:06:13', '2023-11-19 13:06:13'),
(5, 'Patient 2', 'Address 2', 'negative', '2023-01-02', NULL, '2023-11-19 13:06:13', '2023-11-19 13:06:13'),
(6, 'Patient 1', 'Address 1', 'positive', '2023-01-01', NULL, '2023-11-19 13:10:16', '2023-11-19 13:10:16'),
(7, 'Patient 2', 'Address 2', 'negative', '2023-01-02', NULL, '2023-11-19 13:10:16', '2023-11-19 13:10:16'),
(8, 'John Doe', '123 Main St', 'positive', '2023-01-01', NULL, '2023-11-19 13:11:12', '2023-11-19 13:11:12'),
(9, 'Jane Smith', '456 Oak St', 'negative', '2023-01-02', NULL, '2023-11-19 13:11:12', '2023-11-19 13:11:12'),
(10, 'Alice Johnson', '789 Pine St', 'meninggal', '2023-01-03', NULL, '2023-11-19 13:11:12', '2023-11-19 13:11:12'),
(11, 'Bob Williams', '101 Elm St', 'positive', '2023-01-04', NULL, '2023-11-19 13:11:12', '2023-11-19 13:11:12'),
(12, 'Charlie Brown', '202 Birch St', 'negative', '2023-01-05', NULL, '2023-11-19 13:11:12', '2023-11-19 13:11:12'),
(13, 'David Lee', '303 Maple St', 'meninggal', '2023-01-06', NULL, '2023-11-19 13:11:12', '2023-11-19 13:11:12'),
(14, 'Eva Davis', '404 Cedar St', 'positive', '2023-01-07', NULL, '2023-11-19 13:11:12', '2023-11-19 13:11:12'),
(15, 'Frank White', '505 Walnut St', 'negative', '2023-01-08', NULL, '2023-11-19 13:11:12', '2023-11-19 13:11:12'),
(16, 'Grace Miller', '606 Pine St', 'meninggal', '2023-01-09', NULL, '2023-11-19 13:11:12', '2023-11-19 13:11:12'),
(17, 'Henry Moore', '707 Oak St', 'positive', '2023-01-10', NULL, '2023-11-19 13:11:12', '2023-11-19 13:11:12'),
(18, 'Ivy Harris', '808 Birch St', 'negative', '2023-01-11', NULL, '2023-11-19 13:11:12', '2023-11-19 13:11:12'),
(19, 'Jack Robinson', '909 Elm St', 'meninggal', '2023-01-12', NULL, '2023-11-19 13:11:12', '2023-11-19 13:11:12'),
(20, 'Kelly Taylor', '1010 Cedar St', 'positive', '2023-01-13', NULL, '2023-11-19 13:11:12', '2023-11-19 13:11:12'),
(21, 'Liam Clark', '1111 Walnut St', 'negative', '2023-01-14', NULL, '2023-11-19 13:11:12', '2023-11-19 13:11:12'),
(22, 'Mia Turner', '1212 Pine St', 'meninggal', '2023-01-15', NULL, '2023-11-19 13:11:12', '2023-11-19 13:11:12'),
(23, 'Noah Scott', '1313 Oak St', 'positive', '2023-01-16', NULL, '2023-11-19 13:11:12', '2023-11-19 13:11:12'),
(24, 'Olivia King', '1414 Birch St', 'negative', '2023-01-17', NULL, '2023-11-19 13:11:12', '2023-11-19 13:11:12'),
(25, 'Peter Garcia', '1515 Elm St', 'meninggal', '2023-01-18', NULL, '2023-11-19 13:11:12', '2023-11-19 13:11:12'),
(26, 'Quinn Davis', '1616 Cedar St', 'positive', '2023-01-19', NULL, '2023-11-19 13:11:12', '2023-11-19 13:11:12'),
(27, 'Rose White', '1717 Walnut St', 'negative', '2023-01-20', NULL, '2023-11-19 13:11:12', '2023-11-19 13:11:12'),
(28, 'Samuel Taylor', '1818 Pine St', 'meninggal', '2023-01-21', NULL, '2023-11-19 13:11:12', '2023-11-19 13:11:12'),
(29, 'Tina Clark', '1919 Oak St', 'positive', '2023-01-22', NULL, '2023-11-19 13:11:12', '2023-11-19 13:11:12'),
(30, 'Ulysses Turner', '2020 Birch St', 'negative', '2023-01-23', NULL, '2023-11-19 13:11:12', '2023-11-19 13:11:12'),
(31, 'Victoria King', '2121 Elm St', 'meninggal', '2023-01-24', NULL, '2023-11-19 13:11:12', '2023-11-19 13:11:12'),
(32, 'William Garcia', '2222 Cedar St', 'positive', '2023-01-25', NULL, '2023-11-19 13:11:12', '2023-11-19 13:11:12'),
(33, 'Xavier Davis', '2323 Walnut St', 'negative', '2023-01-26', NULL, '2023-11-19 13:11:12', '2023-11-19 13:11:12'),
(34, 'Yasmine White', '2424 Pine St', 'meninggal', '2023-01-27', NULL, '2023-11-19 13:11:12', '2023-11-19 13:11:12'),
(35, 'Zachary Taylor', '2525 Oak St', 'positive', '2023-01-28', NULL, '2023-11-19 13:11:12', '2023-11-19 13:11:12'),
(36, 'Emma Smith', '2626 Birch St', 'negative', '2023-01-29', NULL, '2023-11-19 13:11:12', '2023-11-19 13:11:12'),
(37, 'Daniel Brown', '2727 Elm St', 'meninggal', '2023-01-30', NULL, '2023-11-19 13:11:12', '2023-11-19 13:11:12'),
(38, 'John Doe', '123 Main St', 'positive', '2023-01-01', NULL, '2023-11-19 20:00:57', '2023-11-19 20:00:57'),
(39, 'Jane Smith', '456 Oak St', 'negative', '2023-01-02', NULL, '2023-11-19 20:00:57', '2023-11-19 20:00:57'),
(40, 'Alice Johnson', '789 Pine St', 'meninggal', '2023-01-03', NULL, '2023-11-19 20:00:57', '2023-11-19 20:00:57'),
(41, 'Bob Williams', '101 Elm St', 'positive', '2023-01-04', NULL, '2023-11-19 20:00:57', '2023-11-19 20:00:57'),
(42, 'Charlie Brown', '202 Birch St', 'negative', '2023-01-05', NULL, '2023-11-19 20:00:57', '2023-11-19 20:00:57'),
(43, 'David Lee', '303 Maple St', 'meninggal', '2023-01-06', NULL, '2023-11-19 20:00:57', '2023-11-19 20:00:57'),
(44, 'Eva Davis', '404 Cedar St', 'positive', '2023-01-07', NULL, '2023-11-19 20:00:57', '2023-11-19 20:00:57'),
(45, 'Frank White', '505 Walnut St', 'negative', '2023-01-08', NULL, '2023-11-19 20:00:57', '2023-11-19 20:00:57'),
(46, 'Grace Miller', '606 Pine St', 'meninggal', '2023-01-09', NULL, '2023-11-19 20:00:57', '2023-11-19 20:00:57'),
(47, 'Henry Moore', '707 Oak St', 'positive', '2023-01-10', NULL, '2023-11-19 20:00:57', '2023-11-19 20:00:57'),
(48, 'Ivy Harris', '808 Birch St', 'negative', '2023-01-11', NULL, '2023-11-19 20:00:57', '2023-11-19 20:00:57'),
(49, 'Jack Robinson', '909 Elm St', 'meninggal', '2023-01-12', NULL, '2023-11-19 20:00:57', '2023-11-19 20:00:57'),
(50, 'Kelly Taylor', '1010 Cedar St', 'positive', '2023-01-13', NULL, '2023-11-19 20:00:57', '2023-11-19 20:00:57'),
(51, 'Liam Clark', '1111 Walnut St', 'negative', '2023-01-14', NULL, '2023-11-19 20:00:57', '2023-11-19 20:00:57'),
(52, 'Mia Turner', '1212 Pine St', 'meninggal', '2023-01-15', NULL, '2023-11-19 20:00:57', '2023-11-19 20:00:57'),
(53, 'Noah Scott', '1313 Oak St', 'positive', '2023-01-16', NULL, '2023-11-19 20:00:57', '2023-11-19 20:00:57'),
(54, 'Olivia King', '1414 Birch St', 'negative', '2023-01-17', NULL, '2023-11-19 20:00:57', '2023-11-19 20:00:57'),
(55, 'Peter Garcia', '1515 Elm St', 'meninggal', '2023-01-18', NULL, '2023-11-19 20:00:57', '2023-11-19 20:00:57'),
(56, 'Quinn Davis', '1616 Cedar St', 'positive', '2023-01-19', NULL, '2023-11-19 20:00:57', '2023-11-19 20:00:57'),
(57, 'Rose White', '1717 Walnut St', 'negative', '2023-01-20', NULL, '2023-11-19 20:00:57', '2023-11-19 20:00:57'),
(58, 'Samuel Taylor', '1818 Pine St', 'meninggal', '2023-01-21', NULL, '2023-11-19 20:00:57', '2023-11-19 20:00:57'),
(59, 'Tina Clark', '1919 Oak St', 'positive', '2023-01-22', NULL, '2023-11-19 20:00:57', '2023-11-19 20:00:57'),
(60, 'Ulysses Turner', '2020 Birch St', 'negative', '2023-01-23', NULL, '2023-11-19 20:00:57', '2023-11-19 20:00:57'),
(61, 'Victoria King', '2121 Elm St', 'meninggal', '2023-01-24', NULL, '2023-11-19 20:00:57', '2023-11-19 20:00:57'),
(62, 'William Garcia', '2222 Cedar St', 'positive', '2023-01-25', NULL, '2023-11-19 20:00:57', '2023-11-19 20:00:57'),
(63, 'Xavier Davis', '2323 Walnut St', 'negative', '2023-01-26', NULL, '2023-11-19 20:00:57', '2023-11-19 20:00:57'),
(64, 'Yasmine White', '2424 Pine St', 'meninggal', '2023-01-27', NULL, '2023-11-19 20:00:57', '2023-11-19 20:00:57'),
(65, 'Zachary Taylor', '2525 Oak St', 'positive', '2023-01-28', NULL, '2023-11-19 20:00:57', '2023-11-19 20:00:57'),
(66, 'Emma Smith', '2626 Birch St', 'negative', '2023-01-29', NULL, '2023-11-19 20:00:57', '2023-11-19 20:00:57'),
(67, 'Daniel Brown', '2727 Elm St', 'meninggal', '2023-01-30', NULL, '2023-11-19 20:00:57', '2023-11-19 20:00:57');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'AuthToken', '561cf29bf36d29a5bac295a8cb8ec277c1e08577ed718d37fd08486a147cc635', '[\"*\"]', NULL, NULL, '2023-11-19 19:46:50', '2023-11-19 19:46:50'),
(2, 'App\\Models\\User', 2, 'auth_token', '9cf481bc73faaa24e55d54af859ef4e20b97dbfba7c2f13bb6e79859bd00cf55', '[\"*\"]', '2023-11-19 20:10:50', NULL, '2023-11-19 20:00:02', '2023-11-19 20:10:50'),
(3, 'App\\Models\\User', 2, 'auth_token', '0e3bf6a555021c08201026de750b02170b0eded8db9fca42523f26d255fd3926', '[\"*\"]', NULL, NULL, '2023-11-19 20:26:48', '2023-11-19 20:26:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'surya', 'surya@gmail.com', NULL, '$2y$10$C7yWjQiyFX2cPXLM4iTMO.wjvUzTxiP9OvwhrmtnQYzmhMpSUasKe', NULL, '2023-11-19 19:46:50', '2023-11-19 19:46:50');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
