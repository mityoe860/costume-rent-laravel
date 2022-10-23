-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20221022.e89ebe179c
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2022 at 09:51 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cosplay_rent`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `created_at`, `updated_at`, `deleted_at`) VALUES
(9, 'Anime', 'anime', '2022-09-29 02:41:24', '2022-09-29 03:06:47', NULL),
(10, 'Game', 'game', '2022-09-29 03:13:44', '2022-09-29 03:13:44', NULL),
(11, 'rumah', 'rumah', '2022-09-29 03:15:58', '2022-09-29 03:21:24', '2022-09-29 03:21:24'),
(12, 'asdasd', 'asdasd', '2022-09-29 03:17:10', '2022-09-29 03:21:28', '2022-09-29 03:21:28'),
(13, 'asdasdasd', 'asdasdasd', '2022-09-29 03:19:08', '2022-09-29 03:19:18', '2022-09-29 03:19:18'),
(14, 'Manga', 'manga', '2022-09-30 01:40:56', '2022-09-30 01:40:56', NULL),
(15, 'Cartoon', 'cartoon', '2022-10-10 02:32:21', '2022-10-10 02:32:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cosplays`
--

CREATE TABLE `cosplays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cosplay_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'in stock',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cosplays`
--

INSERT INTO `cosplays` (`id`, `cosplay_code`, `title`, `cover`, `slug`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '001', 'Hu Tao', 'Hu Tao-1665376840.png', 'hu-tao', 'in stock', NULL, '2022-10-23 00:32:12', NULL),
(2, '002', 'Yoimiya', 'Yoimiya-1665376889.jpg', 'yoimiya', 'in stock', '2022-09-30 01:35:29', '2022-10-23 00:32:38', NULL),
(3, '003', 'Naruto', NULL, 'naruto', 'in stock', '2022-09-30 01:41:17', '2022-10-21 22:36:38', NULL),
(4, '004', 'Sasuke', 'Sasuke-1665394324.jpg', 'sasuke', 'in stock', '2022-09-30 01:48:06', '2022-10-10 02:32:04', NULL),
(7, '007', 'Luffy', 'Luffy-1664532528.jpg', 'luffy', 'in stock', '2022-09-30 02:22:17', '2022-10-21 22:39:27', '2022-10-21 22:39:27'),
(8, '008', 'Luffy', 'Luffy-1665394109.jpg', 'luffy-2', 'in stock', '2022-10-10 02:28:29', '2022-10-21 22:39:30', '2022-10-21 22:39:30'),
(9, '006', 'Chisato', 'Chisato-1666417075.jpg', 'chisato', 'in stock', '2022-10-21 22:37:55', '2022-10-22 01:32:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cosplay_category`
--

CREATE TABLE `cosplay_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `cosplay_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cosplay_category`
--

INSERT INTO `cosplay_category` (`id`, `cosplay_id`, `category_id`, `created_at`, `updated_at`) VALUES
(3, 7, 14, NULL, NULL),
(4, 1, 10, NULL, NULL),
(5, 2, 10, NULL, NULL),
(6, 3, 9, NULL, NULL),
(7, 3, 14, NULL, NULL),
(8, 4, 9, NULL, NULL),
(9, 4, 14, NULL, NULL),
(10, 8, 9, NULL, NULL),
(11, 8, 10, NULL, NULL),
(12, 9, 9, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_09_26_044602_create_roles_table', 1),
(6, '2022_09_26_045901_add_role_id_column_to_users_table', 1),
(7, '2022_09_26_050803_create_categories_table', 1),
(8, '2022_09_26_050904_create_cosplays_table', 1),
(9, '2022_09_26_051134_create_cosplay_category_table', 1),
(10, '2022_09_26_052343_create_rent_logs_table', 2),
(11, '2022_09_29_085447_add_slug_column_to_categories_table', 3),
(12, '2022_09_29_090236_change_slug_column_nullable_in_categories_table', 4),
(13, '2022_09_29_092711_add_soft_delete_column_to_categories_table', 5),
(14, '2022_09_30_075809_add_slug_column_to_cosplays_table', 6),
(15, '2022_09_30_102253_add_soft_delete_to_cosplays_table', 7),
(16, '2022_10_05_035111_add_slug_to_users_table', 8),
(17, '2022_10_05_042909_add_softdelete_to_users_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rent_logs`
--

CREATE TABLE `rent_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `cosplay_id` bigint(20) UNSIGNED NOT NULL,
  `rent_date` date NOT NULL,
  `return_date` date NOT NULL,
  `actual_return_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rent_logs`
--

INSERT INTO `rent_logs` (`id`, `user_id`, `cosplay_id`, `rent_date`, `return_date`, `actual_return_date`, `created_at`, `updated_at`) VALUES
(1, 3, 1, '2022-10-22', '2022-10-25', '2022-10-23', '2022-10-21 22:28:30', '2022-10-21 22:28:30'),
(2, 3, 2, '2022-10-22', '2022-10-25', '2022-10-26', '2022-10-21 22:36:34', '2022-10-21 22:36:34'),
(3, 3, 3, '2022-10-22', '2022-10-25', '2022-10-23', '2022-10-21 22:36:38', '2022-10-23 00:25:28'),
(4, 13, 9, '2022-10-22', '2022-10-25', '2022-10-23', '2022-10-22 01:32:23', '2022-10-23 00:27:54'),
(5, 3, 1, '2022-10-23', '2022-10-26', '2022-10-23', '2022-10-23 00:32:05', '2022-10-23 00:32:12'),
(6, 3, 2, '2022-10-23', '2022-10-26', '2022-10-23', '2022-10-23 00:32:24', '2022-10-23 00:32:38');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, NULL),
(2, 'client', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `slug`, `password`, `phone`, `address`, `status`, `created_at`, `updated_at`, `deleted_at`, `role_id`) VALUES
(1, 'admin', 'admin', '$2y$10$xcVXxEb0PWa0a3i28NSP8uFWeiqvhfsNMxhv.GISEhINZjwKmfTze', NULL, 'palembang', 'active', NULL, NULL, NULL, 1),
(2, 'mityo', 'mityo', '$2y$10$/ezzi6VpM.w2myWBX3SfOOB9H370UuXHJ7shjMCoRt8zPbH0GoXaK', NULL, 'asa', 'inactive', NULL, NULL, NULL, 1),
(3, 'Mirza', 'mirza', '$2y$10$a5af/8FUb/Q.9jazMtermO8SUGljRzHRSzR9/0anE8IbyofLpVrDW', '081532950972', 'asd', 'active', NULL, '2022-10-22 03:36:49', NULL, 2),
(13, 'febi', 'febi', '$2y$10$v5f9Rb7iNB30VrZyAo5NausseSXJAHRoM6xmn5iyTG4gZ3mnVjWjC', '081532950972', 'palembang', 'active', '2022-09-26 03:39:45', '2022-10-04 21:49:30', NULL, 2),
(14, 'yoimiya', 'yoimiya', '$2y$10$JOvelXwoPFc3aBrdbF5VC.SeqyYYVtS0Uj001NHUimOFxV.YEZW0K', '23423', 'adsasd', 'active', '2022-10-04 20:56:06', '2022-10-09 22:30:35', NULL, 2),
(15, 'chika', 'chika', '$2y$10$av6wh.1BC5roZYzTVmRsaeVXuf.28mfAbWpGo25/wfB9034CT5T5.', '0812321312', 'jakarta', 'active', '2022-10-10 02:34:32', '2022-10-10 02:42:18', NULL, 2),
(16, 'yuri', 'yuri', '$2y$10$PJ1PEriTbVpiWW4hx7qdf.2sRKyg10sSiCldjLLmlDs6uJXUADs.K', '90849023', 'qwwerwe', 'inactive', '2022-10-10 02:38:45', '2022-10-10 02:38:45', NULL, 2),
(17, 'andika', 'andika', '$2y$10$9X6eTir9Vbbcykt4WPlRyulvqD/BnCR3euGiUAe1S7la4d5FVwLDW', '0-3984-2034', '12423', 'inactive', '2022-10-10 02:41:49', '2022-10-10 02:41:49', NULL, 2),
(18, 'chisato', 'chisato', '$2y$10$uF/9Izq.T/UwggCY0qK4ouBq8gQ7zeGFBGzwsbK967c/qWBsafakm', '081532950972', 'asdas', 'active', '2022-10-22 00:53:11', '2022-10-22 01:42:06', NULL, 2),
(19, 'tasya', 'tasya', '$2y$10$cflHyIWVPbTH52g.CfobQO9Y0Qt4jx0tCy3/qjuDI3ojc37PszIdC', '0812818181456', 'jaka', 'active', '2022-10-22 03:39:08', '2022-10-22 03:42:39', NULL, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cosplays`
--
ALTER TABLE `cosplays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cosplay_category`
--
ALTER TABLE `cosplay_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cosplay_category_cosplay_id_foreign` (`cosplay_id`),
  ADD KEY `cosplay_category_category_id_foreign` (`category_id`);

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
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `rent_logs`
--
ALTER TABLE `rent_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rent_logs_user_id_foreign` (`user_id`),
  ADD KEY `rent_logs_cosplay_id_foreign` (`cosplay_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `cosplays`
--
ALTER TABLE `cosplays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cosplay_category`
--
ALTER TABLE `cosplay_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rent_logs`
--
ALTER TABLE `rent_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cosplay_category`
--
ALTER TABLE `cosplay_category`
  ADD CONSTRAINT `cosplay_category_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `cosplay_category_cosplay_id_foreign` FOREIGN KEY (`cosplay_id`) REFERENCES `cosplays` (`id`);

--
-- Constraints for table `rent_logs`
--
ALTER TABLE `rent_logs`
  ADD CONSTRAINT `rent_logs_cosplay_id_foreign` FOREIGN KEY (`cosplay_id`) REFERENCES `cosplays` (`id`),
  ADD CONSTRAINT `rent_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
