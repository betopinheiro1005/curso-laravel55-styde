-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 24, 2019 at 01:00 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel55-styde`
--

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
(3, '2019_07_14_010036_create_professions_table', 1),
(4, '2019_07_14_014456_add_profession_id_to_users', 1),
(5, '2019_07_16_174553_create_skills_table', 1);

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
-- Table structure for table `professions`
--

CREATE TABLE `professions` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `professions`
--

INSERT INTO `professions` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Desenvolvedor back-end', '2019-07-22 05:59:35', '2019-07-22 05:59:35'),
(2, 'Desenvolvedor front-end', '2019-07-22 05:59:36', '2019-07-22 05:59:36'),
(3, 'Web designer', '2019-07-22 05:59:36', '2019-07-22 05:59:36'),
(4, 'Est in temporibus.', '2019-07-22 05:59:36', '2019-07-22 05:59:36'),
(5, 'Ea ea omnis.', '2019-07-22 05:59:36', '2019-07-22 05:59:36'),
(6, 'Soluta quo eos.', '2019-07-22 05:59:36', '2019-07-22 05:59:36'),
(7, 'Architecto molestias sapiente.', '2019-07-22 05:59:36', '2019-07-22 05:59:36'),
(8, 'Voluptas dolor beatae.', '2019-07-22 05:59:36', '2019-07-22 05:59:36'),
(9, 'Architecto ab tempora.', '2019-07-22 05:59:36', '2019-07-22 05:59:36'),
(10, 'Tempore quas voluptatum.', '2019-07-22 05:59:36', '2019-07-22 05:59:36'),
(11, 'Odit rerum placeat.', '2019-07-22 05:59:36', '2019-07-22 05:59:36'),
(12, 'Ut delectus aliquid.', '2019-07-22 05:59:36', '2019-07-22 05:59:36'),
(13, 'Similique magnam qui.', '2019-07-22 05:59:36', '2019-07-22 05:59:36'),
(14, 'Cumque et repellendus.', '2019-07-22 05:59:37', '2019-07-22 05:59:37'),
(15, 'Et nemo est.', '2019-07-22 05:59:37', '2019-07-22 05:59:37'),
(16, 'Et labore quisquam.', '2019-07-22 05:59:37', '2019-07-22 05:59:37'),
(17, 'Est corporis dolores.', '2019-07-22 05:59:37', '2019-07-22 05:59:37'),
(18, 'Ut expedita placeat.', '2019-07-22 05:59:37', '2019-07-22 05:59:37'),
(19, 'Enim velit illum.', '2019-07-22 05:59:37', '2019-07-22 05:59:37'),
(20, 'Veritatis laboriosam sed.', '2019-07-22 05:59:37', '2019-07-22 05:59:37');

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profession_id` int(10) UNSIGNED DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `profession_id`, `is_admin`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Duilio Palacios', 'duilio@styde.net', '$2y$10$wyUZh1OWmmhh7/SfLM7C0e3oOHZilBnDwdhbhNiMuWyri.p7E/Fd.', 1, 1, 'RDQ80lditd', '2019-07-22 05:59:37', '2019-07-22 05:59:37'),
(2, 'Charlene Purdy PhD', 'pascale90@example.net', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', 1, 0, 'kZDoHD9XOM', '2019-07-22 05:59:37', '2019-07-22 05:59:37'),
(3, 'Bradford Predovic', 'pwitting@example.com', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'fyqt1CXrlx', '2019-07-22 05:59:37', '2019-07-22 05:59:37'),
(4, 'Ms. Jazmin Kutch', 'streich.vince@example.org', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'sQo6YB184D', '2019-07-22 05:59:37', '2019-07-22 05:59:37'),
(5, 'Dr. Valentine Lowe', 'jany12@example.com', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'nkTBw6RByj', '2019-07-22 05:59:37', '2019-07-22 05:59:37'),
(6, 'Dr. Stanford Zulauf DVM', 'jaylon83@example.net', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'vLz9NVDNts', '2019-07-22 05:59:37', '2019-07-22 05:59:37'),
(7, 'Nichole Balistreri', 'nicholas55@example.org', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'fM6c34D10F', '2019-07-22 05:59:37', '2019-07-22 05:59:37'),
(8, 'Vernice Ryan', 'ron76@example.com', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'tgLMWyVD74', '2019-07-22 05:59:37', '2019-07-22 05:59:37'),
(9, 'Alysa Schowalter', 'bogan.edwina@example.com', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'kWYVNDkhU6', '2019-07-22 05:59:37', '2019-07-22 05:59:37'),
(10, 'Gavin Sanford', 'diego.yost@example.net', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'NU1ynMTyQA', '2019-07-22 05:59:38', '2019-07-22 05:59:38'),
(11, 'Eldred Williamson IV', 'heathcote.jordane@example.com', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'DaoY0WlwyL', '2019-07-22 05:59:38', '2019-07-22 05:59:38'),
(12, 'Jodie Bernhard', 'alexanne23@example.com', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'dTro3ONrRA', '2019-07-22 05:59:38', '2019-07-22 05:59:38'),
(13, 'Leda Christiansen DDS', 'jailyn99@example.org', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'nfhQBw3kpq', '2019-07-22 05:59:38', '2019-07-22 05:59:38'),
(14, 'Miss Shawna Dicki', 'rosa13@example.org', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, '3rmiII3Jpe', '2019-07-22 05:59:38', '2019-07-22 05:59:38'),
(15, 'Miss Arielle O\'Keefe', 'ecremin@example.org', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'od4k47ek1h', '2019-07-22 05:59:38', '2019-07-22 05:59:38'),
(16, 'Jo Abshire', 'hhartmann@example.net', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'qhhAvQ70DX', '2019-07-22 05:59:38', '2019-07-22 05:59:38'),
(17, 'Lambert Bode', 'streich.modesto@example.com', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, '11RCP6jwv3', '2019-07-22 05:59:38', '2019-07-22 05:59:38'),
(18, 'Miss Virginia Collins', 'von.nelle@example.com', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, '4v83woV7F0', '2019-07-22 05:59:38', '2019-07-22 05:59:38'),
(19, 'Vella Hyatt', 'malika60@example.org', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'OpEqxUbusM', '2019-07-22 05:59:38', '2019-07-22 05:59:38'),
(20, 'Mr. Janick Kunze IV', 'gleichner.warren@example.org', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'i2w9IV5Tot', '2019-07-22 05:59:38', '2019-07-22 05:59:38'),
(21, 'Abigayle Nicolas IV', 'spinka.bonnie@example.com', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'PlSqV5KXUi', '2019-07-22 05:59:38', '2019-07-22 05:59:38'),
(22, 'Ms. Dannie Skiles', 'ryan.brant@example.net', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'eYuhRzru62', '2019-07-22 05:59:38', '2019-07-22 05:59:38'),
(23, 'Salma Feil', 'jschultz@example.com', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'H7kbVmk9iS', '2019-07-22 05:59:38', '2019-07-22 05:59:38'),
(24, 'Lily Runolfsson', 'treichert@example.com', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'tDKhAwiYAQ', '2019-07-22 05:59:38', '2019-07-22 05:59:38'),
(25, 'Saul Legros', 'windler.karina@example.org', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'P4cF4JD7y5', '2019-07-22 05:59:38', '2019-07-22 05:59:38'),
(26, 'Jerrod McCullough', 'qblick@example.org', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'o2kz2fuOuz', '2019-07-22 05:59:38', '2019-07-22 05:59:38'),
(27, 'Clemmie Kuhlman', 'kuhic.lenore@example.org', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'UkdWbu2sp1', '2019-07-22 05:59:38', '2019-07-22 05:59:38'),
(28, 'Mrs. Linnie Bashirian PhD', 'devante.schimmel@example.com', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, '9eBJyk5KWm', '2019-07-22 05:59:38', '2019-07-22 05:59:38'),
(29, 'Javon Maggio III', 'linnea.williamson@example.org', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'hShigl0GNg', '2019-07-22 05:59:38', '2019-07-22 05:59:38'),
(30, 'Christophe Weber', 'medhurst.marjolaine@example.org', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'CeEHZHeVM5', '2019-07-22 05:59:38', '2019-07-22 05:59:38'),
(31, 'Wilma Legros', 'obeier@example.com', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, '48mkYlLnzY', '2019-07-22 05:59:38', '2019-07-22 05:59:38'),
(32, 'Raheem Murphy I', 'melyssa26@example.com', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'H6qYoZjsSL', '2019-07-22 05:59:38', '2019-07-22 05:59:38'),
(33, 'Ms. Bridgette Boyer PhD', 'jakayla92@example.com', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'ph3yAcVOXF', '2019-07-22 05:59:38', '2019-07-22 05:59:38'),
(34, 'Jacinto Rowe', 'mayer.marcelo@example.net', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'FpJOghoGgp', '2019-07-22 05:59:38', '2019-07-22 05:59:38'),
(35, 'Alphonso Veum', 'xkessler@example.org', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'f5zdIcNfBk', '2019-07-22 05:59:38', '2019-07-22 05:59:38'),
(36, 'Coty Pouros', 'bjakubowski@example.com', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'IZwwikiues', '2019-07-22 05:59:39', '2019-07-22 05:59:39'),
(37, 'May Zieme', 'franecki.britney@example.com', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, '6UZxA8Asoo', '2019-07-22 05:59:39', '2019-07-22 05:59:39'),
(38, 'Oran Weimann', 'gpagac@example.net', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'rVYSJeLan4', '2019-07-22 05:59:39', '2019-07-22 05:59:39'),
(39, 'Kamryn Fadel', 'rupert.corwin@example.org', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, '1BhQBBVJcH', '2019-07-22 05:59:39', '2019-07-22 05:59:39'),
(40, 'Ms. Lina Kuhn III', 'jaylan79@example.org', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'ILLENmxHfO', '2019-07-22 05:59:39', '2019-07-22 05:59:39'),
(41, 'Ward Rohan', 'oharris@example.net', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'ZiYquNEvon', '2019-07-22 05:59:39', '2019-07-22 05:59:39'),
(42, 'Daphnee Berge', 'roselyn.mueller@example.org', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'vjeMqRPwKa', '2019-07-22 05:59:39', '2019-07-22 05:59:39'),
(43, 'Rahul Zieme', 'zstreich@example.com', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, '7ULrGFnYM3', '2019-07-22 05:59:39', '2019-07-22 05:59:39'),
(44, 'Judah Ernser', 'clebsack@example.org', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'Qn3tvcl9zw', '2019-07-22 05:59:39', '2019-07-22 05:59:39'),
(45, 'Dr. Ellis Rowe III', 'tgaylord@example.com', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'EWCQWQLITY', '2019-07-22 05:59:39', '2019-07-22 05:59:39'),
(46, 'Mrs. Mina Muller Sr.', 'angelita.goldner@example.org', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'y4wHDVEL7G', '2019-07-22 05:59:39', '2019-07-22 05:59:39'),
(47, 'Zena Thiel', 'kenyatta.cremin@example.com', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'TaOZRDLDHD', '2019-07-22 05:59:39', '2019-07-22 05:59:39'),
(48, 'Dwight Jast', 'ystokes@example.com', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'JvfBbdABEd', '2019-07-22 05:59:39', '2019-07-22 05:59:39'),
(49, 'Nelda Ondricka', 'darrion.hane@example.net', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'FT8p0OK0co', '2019-07-22 05:59:39', '2019-07-22 05:59:39'),
(50, 'Wayne Towne', 'hailee.grimes@example.com', '$2y$10$ctu8xc/CM9ij9p9KPWV4LuDip04mBgvUrAnQa83spmOCGSRTS09n2', NULL, 0, 'WmPX0Cj4GN', '2019-07-22 05:59:39', '2019-07-22 05:59:39');

--
-- Indexes for dumped tables
--

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
-- Indexes for table `professions`
--
ALTER TABLE `professions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `professions_title_unique` (`title`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_profession_id_foreign` (`profession_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `professions`
--
ALTER TABLE `professions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_profession_id_foreign` FOREIGN KEY (`profession_id`) REFERENCES `professions` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
