-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 06, 2021 at 05:38 PM
-- Server version: 5.7.34
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `limburgp_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_type_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(11) NOT NULL,
  `is_closed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `business_id`, `name`, `account_number`, `account_type_id`, `note`, `created_by`, `is_closed`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Mercantile Bank Limited', '130611133161881', 1, NULL, 1, 0, NULL, '2021-05-08 14:18:41', '2021-05-11 12:39:34'),
(2, 1, 'Patty Cash', '130611133161882', 1, NULL, 1, 0, NULL, '2021-05-08 17:43:18', '2021-05-11 12:39:53'),
(3, 1, 'Md. Shafikul Islam', '003', 2, NULL, 1, 0, NULL, '2021-05-11 06:07:34', '2021-05-11 12:39:02'),
(4, 1, 'Md. Shohidul Islam', '002', 2, NULL, 1, 0, NULL, '2021-05-11 06:08:00', '2021-05-11 12:39:13'),
(5, 1, 'Md. Manwar Hossain', '005', 2, NULL, 1, 0, NULL, '2021-05-11 06:08:30', '2021-05-11 12:38:41'),
(6, 1, 'Md. Idries Ali', '007', 2, NULL, 1, 1, NULL, '2021-05-11 06:09:20', '2021-06-22 11:21:01'),
(7, 1, 'Md. Rashed Mia', '008', 2, NULL, 1, 0, NULL, '2021-05-11 06:09:46', '2021-05-23 11:13:43'),
(8, 1, 'Md. Firoz Ahmad', '004', 3, NULL, 1, 0, NULL, '2021-06-22 11:17:18', '2021-06-22 11:17:18'),
(9, 1, 'Md. Sabur Uddin', '006', 3, NULL, 1, 0, NULL, '2021-06-22 11:18:11', '2021-06-22 11:19:42'),
(10, 1, 'Md. Zahangir Alom', '009', 3, NULL, 1, 0, NULL, '2021-06-22 11:19:20', '2021-06-22 11:19:50');

-- --------------------------------------------------------

--
-- Table structure for table `account_transactions`
--

CREATE TABLE `account_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_type` enum('opening_balance','fund_transfer','deposit') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(22,4) NOT NULL,
  `reff_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `operation_date` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `transaction_payment_id` int(11) DEFAULT NULL,
  `transfer_transaction_id` int(11) DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_transactions`
--

INSERT INTO `account_transactions` (`id`, `account_id`, `type`, `sub_type`, `amount`, `reff_no`, `operation_date`, `created_by`, `transaction_id`, `transaction_payment_id`, `transfer_transaction_id`, `note`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 2, 'credit', NULL, 44000.0000, NULL, '2021-05-10 10:24:00', 1, 15, 1, NULL, NULL, NULL, '2021-05-11 04:28:15', '2021-05-11 04:28:15'),
(2, 2, 'credit', NULL, 4000.0000, NULL, '2021-05-10 10:32:00', 1, 16, 2, NULL, NULL, '2021-05-11 04:40:36', '2021-05-11 04:35:09', '2021-05-11 04:40:36'),
(3, 2, 'debit', NULL, 500.0000, NULL, '2021-05-10 10:37:00', 1, 17, 3, NULL, NULL, NULL, '2021-05-11 04:39:58', '2021-05-11 04:39:58'),
(4, 2, 'debit', NULL, 4000.0000, NULL, '2021-05-11 10:40:00', 1, 18, 4, NULL, NULL, NULL, '2021-05-11 04:43:00', '2021-05-11 04:46:12'),
(5, 1, 'credit', 'deposit', 2040000.0000, NULL, '2021-05-09 12:00:00', 1, NULL, NULL, NULL, '2*TCG2020V16K genset partial payment', NULL, '2021-05-11 04:52:17', '2021-05-11 04:52:17'),
(6, 1, 'debit', NULL, 18500.0000, NULL, '2021-05-11 10:53:00', 1, 19, 5, NULL, NULL, NULL, '2021-05-11 05:06:01', '2021-05-11 05:06:01'),
(7, 2, 'debit', NULL, 25000.0000, NULL, '2021-05-11 11:14:00', 1, 21, 6, NULL, NULL, NULL, '2021-05-11 05:29:48', '2021-05-11 05:29:48'),
(8, 2, 'credit', 'deposit', 54007.0000, NULL, '2021-05-10 11:30:00', 1, NULL, NULL, NULL, 'Opening Balance 10-05-2021', NULL, '2021-05-11 05:31:26', '2021-05-11 05:31:26'),
(9, 2, 'credit', NULL, 32300.0000, NULL, '2021-05-11 11:50:00', 1, 22, 7, NULL, NULL, NULL, '2021-05-11 05:51:57', '2021-05-11 05:51:57'),
(10, 1, 'credit', 'deposit', 31582.0000, NULL, '2021-05-10 11:30:00', 1, NULL, NULL, NULL, 'Opening balance on 10-05-2021', NULL, '2021-05-11 05:55:41', '2021-05-11 05:55:41'),
(11, 2, 'debit', 'fund_transfer', 3272.0000, NULL, '2021-05-10 12:10:00', 1, NULL, NULL, 12, 'Cash paid in Advanced TK 3272 after collect MAH spinning genset Trouble shooting payment.', NULL, '2021-05-11 06:12:31', '2021-05-11 06:12:31'),
(12, 4, 'credit', 'fund_transfer', 3272.0000, NULL, '2021-05-10 12:10:00', 1, NULL, NULL, 11, 'Cash paid in Advanced TK 3272 after collect MAH spinning genset Trouble shooting payment.', NULL, '2021-05-11 06:12:31', '2021-05-11 06:12:31'),
(13, 2, 'debit', 'fund_transfer', 1800.0000, NULL, '2021-05-09 12:00:00', 1, NULL, NULL, 14, 'Cas paid in advance after collect MAH spinning genset trouble shooting payment.', NULL, '2021-05-11 06:15:48', '2021-05-11 06:15:48'),
(14, 3, 'credit', 'fund_transfer', 1800.0000, NULL, '2021-05-09 12:00:00', 1, NULL, NULL, 13, 'Cas paid in advance after collect MAH spinning genset trouble shooting payment.', NULL, '2021-05-11 06:15:48', '2021-05-11 06:15:48'),
(15, 2, 'debit', 'fund_transfer', 10000.0000, NULL, '2021-05-11 12:16:00', 1, NULL, NULL, 16, 'Advanced payed', NULL, '2021-05-11 06:18:14', '2021-05-11 06:18:14'),
(16, 5, 'credit', 'fund_transfer', 10000.0000, NULL, '2021-05-11 12:16:00', 1, NULL, NULL, 15, 'Advanced payed', NULL, '2021-05-11 06:18:14', '2021-05-11 06:18:14'),
(17, 2, 'debit', 'fund_transfer', 2000.0000, NULL, '2021-05-11 10:19:00', 1, NULL, NULL, 18, 'Advance paid for car gas bill purpose', NULL, '2021-05-11 06:20:45', '2021-05-11 06:20:45'),
(18, 7, 'credit', 'fund_transfer', 2000.0000, NULL, '2021-05-11 10:19:00', 1, NULL, NULL, 17, 'Advance paid for car gas bill purpose', NULL, '2021-05-11 06:20:45', '2021-05-11 06:20:45'),
(19, 2, 'debit', 'fund_transfer', 2000.0000, NULL, '2021-05-11 10:21:00', 1, NULL, NULL, 20, 'Advance payment for car gas bill purpose', NULL, '2021-05-11 06:22:08', '2021-05-11 06:22:08'),
(20, 6, 'credit', 'fund_transfer', 2000.0000, NULL, '2021-05-11 10:21:00', 1, NULL, NULL, 19, 'Advance payment for car gas bill purpose', NULL, '2021-05-11 06:22:08', '2021-05-11 06:22:08'),
(21, 2, 'debit', NULL, 5000.0000, NULL, '2021-05-10 12:23:00', 1, 23, 8, NULL, NULL, NULL, '2021-05-11 06:27:34', '2021-05-11 06:27:34'),
(22, 2, 'debit', NULL, 1928.0000, NULL, '2021-05-10 12:29:00', 1, 24, 9, NULL, NULL, NULL, '2021-05-11 06:31:20', '2021-05-11 06:31:20'),
(23, 2, 'debit', NULL, 100.0000, NULL, '2021-05-11 12:32:00', 1, 25, 10, NULL, NULL, NULL, '2021-05-11 06:35:34', '2021-05-11 07:32:41'),
(24, 2, 'debit', NULL, 18000.0000, NULL, '2021-05-11 12:35:00', 1, 26, 11, NULL, NULL, NULL, '2021-05-11 06:40:11', '2021-05-11 06:40:11'),
(25, 2, 'debit', NULL, 21000.0000, NULL, '2021-05-11 12:49:00', 1, NULL, 12, NULL, NULL, NULL, '2021-05-11 06:52:30', '2021-05-11 06:52:30'),
(26, 2, 'credit', 'deposit', 5000.0000, NULL, '2021-05-11 13:19:00', 1, NULL, NULL, NULL, 'Cash adjusted to opening balance 10-05-2021. sum 54007', NULL, '2021-05-11 07:22:01', '2021-05-11 07:22:01'),
(27, 2, 'debit', NULL, 630.0000, NULL, '2021-05-11 13:37:00', 1, 28, 14, NULL, NULL, NULL, '2021-05-11 07:39:24', '2021-05-11 07:39:24'),
(28, 2, 'credit', NULL, 100000.0000, NULL, '2021-05-11 12:33:00', 1, NULL, 15, NULL, NULL, NULL, '2021-05-11 08:34:49', '2021-05-11 08:34:49'),
(29, 2, 'debit', NULL, 2600.0000, NULL, '2021-05-11 15:06:00', 1, 32, 17, NULL, NULL, NULL, '2021-05-11 09:09:04', '2021-05-11 09:16:38'),
(30, 2, 'credit', NULL, 34300.0000, NULL, '2021-05-12 11:34:00', 1, 35, 19, NULL, NULL, NULL, '2021-05-12 05:37:50', '2021-05-12 05:37:50'),
(31, 2, 'debit', NULL, 10000.0000, NULL, '2021-05-12 13:15:00', 1, 36, 20, NULL, NULL, NULL, '2021-05-12 07:21:20', '2021-05-12 07:24:17'),
(32, 2, 'debit', NULL, 5000.0000, NULL, '2021-05-13 18:21:00', 1, 38, 21, NULL, NULL, NULL, '2021-05-13 12:25:59', '2021-05-13 12:25:59'),
(33, 2, 'debit', NULL, 2355.0000, NULL, '2021-05-23 13:05:00', 5, 42, 22, NULL, NULL, NULL, '2021-05-23 07:15:13', '2021-05-23 07:15:13'),
(34, 2, 'debit', NULL, 2250.0000, NULL, '2021-05-23 13:19:00', 5, 43, 23, NULL, NULL, NULL, '2021-05-23 07:24:33', '2021-05-23 07:24:33'),
(35, 2, 'debit', NULL, 3150.0000, NULL, '2021-05-23 15:51:00', 5, 44, 24, NULL, NULL, NULL, '2021-05-23 09:56:53', '2021-05-23 09:56:53'),
(36, 2, 'debit', 'fund_transfer', 2000.0000, NULL, '2021-05-18 17:14:00', 5, NULL, NULL, 37, 'Cash Paid in advance Tk. 2000/- For Car Gas Purpose', NULL, '2021-05-23 11:14:43', '2021-05-23 11:14:43'),
(37, 7, 'credit', 'fund_transfer', 2000.0000, NULL, '2021-05-18 17:14:00', 5, NULL, NULL, 36, 'Cash Paid in advance Tk. 2000/- For Car Gas Purpose', NULL, '2021-05-23 11:14:43', '2021-05-23 11:14:43'),
(38, 2, 'credit', 'deposit', 1.0000, NULL, '2021-05-24 12:00:00', 1, NULL, NULL, 39, 'test purpose', '2021-05-24 05:00:39', '2021-05-24 04:58:47', '2021-05-24 05:00:39'),
(39, 3, 'debit', 'deposit', 1.0000, NULL, '2021-05-24 12:00:00', 1, NULL, NULL, 38, 'test purpose', '2021-05-24 05:00:39', '2021-05-24 04:58:47', '2021-05-24 05:00:39'),
(40, 2, 'credit', NULL, 1764.0000, NULL, '2021-05-27 18:34:00', 1, 48, 26, NULL, NULL, NULL, '2021-05-27 12:35:33', '2021-05-27 12:35:33'),
(41, 1, 'debit', NULL, 150000.0000, NULL, '2021-06-10 17:06:00', 5, NULL, 27, NULL, NULL, NULL, '2021-06-10 11:07:50', '2021-06-10 11:07:50'),
(42, 2, 'debit', 'fund_transfer', 51000.0000, NULL, '2021-06-10 17:14:00', 5, NULL, NULL, 43, 'Prechamber Spark Plug 3 Pcs Purchases Purpose withdraw from MBL A/c', '2021-06-10 12:14:49', '2021-06-10 12:14:22', '2021-06-10 12:14:49'),
(43, 1, 'credit', 'fund_transfer', 51000.0000, NULL, '2021-06-10 17:14:00', 5, NULL, NULL, 42, 'Prechamber Spark Plug 3 Pcs Purchases Purpose withdraw from MBL A/c', '2021-06-10 12:14:49', '2021-06-10 12:14:22', '2021-06-10 12:14:49'),
(44, 2, 'credit', 'deposit', 51000.0000, NULL, '2021-06-10 17:14:00', 5, NULL, NULL, 45, 'Prechamber Spark Plug 3 Pcs Purchases purpose withdraw from MBL', NULL, '2021-06-10 12:15:40', '2021-06-10 12:15:40'),
(45, 1, 'debit', 'deposit', 51000.0000, NULL, '2021-06-10 17:14:00', 5, NULL, NULL, 44, 'Prechamber Spark Plug 3 Pcs Purchases purpose withdraw from MBL', NULL, '2021-06-10 12:15:40', '2021-06-10 12:15:40'),
(46, 2, 'debit', NULL, 51000.0000, NULL, '2021-06-10 18:15:00', 5, 57, 29, NULL, NULL, NULL, '2021-06-10 12:16:24', '2021-06-10 12:16:24'),
(47, 1, 'debit', NULL, 29580.0000, NULL, '2021-05-19 12:03:00', 5, NULL, 32, NULL, NULL, NULL, '2021-06-21 06:08:00', '2021-06-21 06:08:00'),
(48, 1, 'debit', NULL, 100000.0000, NULL, '2021-06-10 12:23:00', 5, 77, 34, NULL, NULL, NULL, '2021-06-21 06:25:35', '2021-06-21 06:25:35'),
(49, 2, 'debit', 'fund_transfer', 5000.0000, NULL, '2021-06-22 16:19:00', 1, NULL, NULL, 50, 'FGHGIIOGORPGFHGU EIGROGPR', '2021-06-22 10:27:59', '2021-06-22 10:19:48', '2021-06-22 10:27:59'),
(50, 4, 'credit', 'fund_transfer', 5000.0000, NULL, '2021-06-22 16:19:00', 1, NULL, NULL, 49, 'FGHGIIOGORPGFHGU EIGROGPR', '2021-06-22 10:27:59', '2021-06-22 10:19:48', '2021-06-22 10:27:59'),
(51, 4, 'debit', NULL, 5000.0000, NULL, '2021-06-22 16:24:00', 1, 102, 35, NULL, NULL, '2021-06-22 10:28:48', '2021-06-22 10:25:06', '2021-06-22 10:28:48'),
(52, 1, 'credit', NULL, 35849.0000, NULL, '2021-06-22 19:39:00', 5, 108, 36, NULL, NULL, NULL, '2021-06-22 13:41:51', '2021-06-22 13:41:51'),
(53, 1, 'credit', NULL, 457250.5800, NULL, '2021-06-22 20:44:00', 5, NULL, 37, NULL, NULL, '2021-06-23 02:39:12', '2021-06-22 14:46:35', '2021-06-23 02:39:12'),
(54, 1, 'credit', NULL, 464151.0000, NULL, '2021-06-22 08:40:00', 5, NULL, 48, NULL, NULL, '2021-06-23 03:57:29', '2021-06-23 02:43:02', '2021-06-23 03:57:29'),
(55, 2, 'debit', NULL, 10000.0000, NULL, '2021-06-23 10:03:00', 1, 113, 59, NULL, NULL, '2021-06-23 13:02:39', '2021-06-23 04:08:02', '2021-06-23 13:02:39'),
(56, 2, 'credit', NULL, 6900.0000, NULL, '2021-06-23 11:00:00', 9, 115, 60, NULL, NULL, '2021-06-23 05:20:21', '2021-06-23 05:09:35', '2021-06-23 05:20:21'),
(57, 2, 'credit', NULL, 172200.0000, NULL, '2021-06-24 19:02:00', 5, NULL, 62, NULL, NULL, NULL, '2021-06-24 13:05:54', '2021-06-24 13:05:54'),
(58, 1, 'credit', NULL, 150000.0000, NULL, '2021-06-30 17:11:00', 5, NULL, 65, NULL, NULL, '2021-07-01 11:24:53', '2021-07-01 11:15:13', '2021-07-01 11:24:53'),
(59, 1, 'credit', NULL, 150000.0000, NULL, '2021-06-30 17:25:00', 5, 158, 70, NULL, NULL, NULL, '2021-07-01 11:26:04', '2021-07-01 11:26:04'),
(60, 1, 'debit', NULL, 49250.0000, NULL, '2021-03-18 11:57:00', 5, 166, 72, NULL, NULL, NULL, '2021-07-03 06:00:55', '2021-07-03 06:00:55'),
(61, 2, 'debit', NULL, 21000.0000, NULL, '2021-05-11 12:30:00', 5, 167, 73, NULL, NULL, NULL, '2021-07-03 06:32:27', '2021-07-03 06:32:27'),
(62, 1, 'debit', NULL, 100000.0000, NULL, '2021-06-27 12:57:00', 5, 39, 74, NULL, NULL, NULL, '2021-07-03 07:09:31', '2021-07-03 07:09:31'),
(63, 2, 'debit', NULL, 23200.0000, NULL, '2021-05-27 15:10:00', 5, 172, 75, NULL, NULL, NULL, '2021-07-03 09:11:44', '2021-07-03 09:11:44'),
(64, 1, 'debit', NULL, 16000.0000, NULL, '2021-06-27 18:03:00', 5, 76, 79, NULL, NULL, NULL, '2021-07-04 12:04:33', '2021-07-04 12:04:33'),
(65, 1, 'debit', NULL, 28000.0000, NULL, '2021-06-27 18:04:00', 5, 78, 80, NULL, NULL, NULL, '2021-07-04 12:05:11', '2021-07-04 12:05:11'),
(66, 2, 'debit', NULL, 1610.0000, NULL, '2021-07-04 18:32:00', 1, 104, 81, NULL, NULL, NULL, '2021-07-04 12:33:25', '2021-07-04 12:33:25'),
(67, 1, 'credit', NULL, 150360.0000, NULL, '2021-07-06 16:56:00', 5, 41, 83, NULL, NULL, NULL, '2021-07-06 11:00:00', '2021-07-06 11:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `account_types`
--

CREATE TABLE `account_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_account_type_id` int(11) DEFAULT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `account_types`
--

INSERT INTO `account_types` (`id`, `name`, `parent_account_type_id`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'CURRENT ACCOUNT', NULL, 1, '2021-05-11 12:35:32', '2021-05-11 12:35:32'),
(2, 'LOAN / ADVANCE', 2, 1, '2021-05-11 12:37:08', '2021-06-22 10:04:08'),
(3, 'LOAN / ADVANCE', NULL, 1, '2021-06-22 11:15:36', '2021-06-22 11:15:36');

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` int(11) DEFAULT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` int(11) DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(1, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-04-10 09:06:22', '2021-04-10 09:06:22'),
(2, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-04-10 09:11:04', '2021-04-10 09:11:04'),
(3, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-04-10 09:11:18', '2021-04-10 09:11:18'),
(4, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-04-10 09:15:09', '2021-04-10 09:15:09'),
(5, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-04-10 09:16:48', '2021-04-10 09:16:48'),
(6, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-04-10 09:27:42', '2021-04-10 09:27:42'),
(7, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-04-10 09:28:05', '2021-04-10 09:28:05'),
(8, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-08 10:47:19', '2021-05-08 10:47:19'),
(9, 'default', 'edited', 1, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-08 11:18:48', '2021-05-08 11:18:48'),
(10, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-08 10:59:44', '2021-05-08 10:59:44'),
(11, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-08 11:00:51', '2021-05-08 11:00:51'),
(12, 'default', 'added', 1, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":50}}', '2021-05-08 11:31:28', '2021-05-08 11:31:28'),
(13, 'default', 'added', 2, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":50}}', '2021-05-08 11:31:52', '2021-05-08 11:31:52'),
(14, 'default', 'added', 3, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":50}}', '2021-05-08 11:41:56', '2021-05-08 11:41:56'),
(15, 'default', 'added', 4, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":50}}', '2021-05-08 11:43:33', '2021-05-08 11:43:33'),
(16, 'default', 'added', 5, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":50}}', '2021-05-08 11:47:02', '2021-05-08 11:47:02'),
(17, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-08 11:23:11', '2021-05-08 11:23:11'),
(18, 'default', 'added', 6, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":50}}', '2021-05-08 11:53:43', '2021-05-08 11:53:43'),
(19, 'default', 'added', 7, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":50}}', '2021-05-08 11:57:34', '2021-05-08 11:57:34'),
(20, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-08 11:31:39', '2021-05-08 11:31:39'),
(21, 'default', 'added', 2, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-08 12:15:44', '2021-05-08 12:15:44'),
(22, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-08 12:04:21', '2021-05-08 12:04:21'),
(23, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-08 12:21:15', '2021-05-08 12:21:15'),
(24, 'default', 'edited', 1, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-08 13:23:16', '2021-05-08 13:23:16'),
(25, 'default', 'edited', 2, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-08 13:23:50', '2021-05-08 13:23:50'),
(26, 'default', 'added', 10, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":76000}}', '2021-05-08 13:50:45', '2021-05-08 13:50:45'),
(27, 'default', 'edited', 6, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"proforma\",\"final_total\":\"50.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"50.0000\"}}', '2021-05-08 13:57:40', '2021-05-08 13:57:40'),
(28, 'default', 'edited', 5, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"proforma\",\"final_total\":\"50.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"50.0000\"}}', '2021-05-08 13:57:57', '2021-05-08 13:57:57'),
(29, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-08 13:59:27', '2021-05-08 13:59:27'),
(30, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-08 14:00:34', '2021-05-08 14:00:34'),
(31, 'default', 'added', 2, 'App\\User', 1, 'App\\User', '[]', '2021-05-08 14:33:11', '2021-05-08 14:33:11'),
(32, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-08 14:03:23', '2021-05-08 14:03:23'),
(33, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-08 14:06:46', '2021-05-08 14:06:46'),
(34, 'default', 'edited', 2, 'App\\User', 1, 'App\\User', '[]', '2021-05-08 14:37:22', '2021-05-08 14:37:22'),
(35, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-08 14:07:44', '2021-05-08 14:07:44'),
(36, 'default', 'login', 2, 'App\\User', 2, 'App\\User', '[]', '2021-05-08 14:08:00', '2021-05-08 14:08:00'),
(37, 'default', 'logout', 2, 'App\\User', 2, 'App\\User', '[]', '2021-05-08 14:10:34', '2021-05-08 14:10:34'),
(38, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-08 14:41:27', '2021-05-08 14:41:27'),
(39, 'default', 'added', 11, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":38000}}', '2021-05-08 15:15:43', '2021-05-08 15:15:43'),
(40, 'default', 'added', 12, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":42000}}', '2021-05-08 15:37:53', '2021-05-08 15:37:53'),
(41, 'default', 'edited', 1, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-08 16:13:51', '2021-05-08 16:13:51'),
(42, 'default', 'edited', 12, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":252000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"42000.0000\"}}', '2021-05-08 16:14:27', '2021-05-08 16:14:27'),
(43, 'default', 'payment_edited', 12, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"252000.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"252000.0000\"}}', '2021-05-08 16:55:39', '2021-05-08 16:55:39'),
(44, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-08 17:16:49', '2021-05-08 17:16:49'),
(45, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-09 03:13:44', '2021-05-09 03:13:44'),
(46, 'default', 'added', 3, 'App\\User', 1, 'App\\User', '[]', '2021-05-09 03:49:12', '2021-05-09 03:49:12'),
(47, 'default', 'added', 3, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-09 04:02:06', '2021-05-09 04:02:06'),
(48, 'default', 'added', 13, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"ordered\",\"payment_status\":\"due\",\"final_total\":45540}}', '2021-05-09 04:12:37', '2021-05-09 04:12:37'),
(49, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-09 03:55:29', '2021-05-09 03:55:29'),
(50, 'default', 'login', 2, 'App\\User', 2, 'App\\User', '[]', '2021-05-09 03:57:32', '2021-05-09 03:57:32'),
(51, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-09 14:42:14', '2021-05-09 14:42:14'),
(52, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-10 08:06:39', '2021-05-10 08:06:39'),
(53, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-10 08:16:17', '2021-05-10 08:16:17'),
(54, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-11 02:33:53', '2021-05-11 02:33:53'),
(55, 'default', 'added', 4, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-11 04:02:38', '2021-05-11 04:02:38'),
(56, 'default', 'added', 15, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":44000}}', '2021-05-11 04:28:15', '2021-05-11 04:28:15'),
(57, 'default', 'added', 16, 'App\\Transaction', 1, 'App\\User', '[]', '2021-05-11 04:35:09', '2021-05-11 04:35:09'),
(58, 'default', 'added', 17, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"payment_status\":\"due\"}}', '2021-05-11 04:39:58', '2021-05-11 04:39:58'),
(59, 'default', 'added', 18, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"payment_status\":\"due\"}}', '2021-05-11 04:43:00', '2021-05-11 04:43:00'),
(60, 'default', 'payment_edited', 18, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"payment_status\":\"paid\"},\"old\":{\"payment_status\":\"paid\"}}', '2021-05-11 04:46:12', '2021-05-11 04:46:12'),
(61, 'default', 'added', 5, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-11 04:59:54', '2021-05-11 04:59:54'),
(62, 'default', 'added', 19, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":18500}}', '2021-05-11 05:06:01', '2021-05-11 05:06:01'),
(63, 'default', 'added', 6, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-11 05:22:18', '2021-05-11 05:22:18'),
(64, 'default', 'added', 21, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":25000.00999999999839928932487964630126953125}}', '2021-05-11 05:29:48', '2021-05-11 05:29:48'),
(65, 'default', 'added', 7, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-11 05:46:40', '2021-05-11 05:46:40'),
(66, 'default', 'added', 22, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"packed\",\"payment_status\":\"paid\",\"final_total\":32300}}', '2021-05-11 05:51:57', '2021-05-11 05:51:57'),
(67, 'default', 'added', 23, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"payment_status\":\"due\"}}', '2021-05-11 06:27:34', '2021-05-11 06:27:34'),
(68, 'default', 'added', 24, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"payment_status\":\"due\"}}', '2021-05-11 06:31:20', '2021-05-11 06:31:20'),
(69, 'default', 'added', 25, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"payment_status\":\"due\"}}', '2021-05-11 06:35:34', '2021-05-11 06:35:34'),
(70, 'default', 'added', 26, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"payment_status\":\"due\"}}', '2021-05-11 06:40:11', '2021-05-11 06:40:11'),
(71, 'default', 'added', 8, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-11 06:48:56', '2021-05-11 06:48:56'),
(72, 'default', 'payment_edited', 27, 'App\\Transaction', 1, 'App\\User', '[]', '2021-05-11 06:52:30', '2021-05-11 06:52:30'),
(73, 'default', 'login', 3, 'App\\User', 3, 'App\\User', '[]', '2021-05-11 06:33:39', '2021-05-11 06:33:39'),
(74, 'default', 'payment_edited', 25, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"payment_status\":\"partial\"},\"old\":{\"payment_status\":\"paid\"}}', '2021-05-11 07:32:40', '2021-05-11 07:32:40'),
(75, 'default', 'edited', 25, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"payment_status\":\"partial\"}}', '2021-05-11 07:33:17', '2021-05-11 07:33:17'),
(76, 'default', 'added', 4, 'App\\User', 1, 'App\\User', '[]', '2021-05-11 07:37:15', '2021-05-11 07:37:15'),
(77, 'default', 'added', 28, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"payment_status\":\"due\"}}', '2021-05-11 07:39:24', '2021-05-11 07:39:24'),
(78, 'default', 'added', 9, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-11 08:08:08', '2021-05-11 08:08:08'),
(79, 'default', 'added', 10, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-11 08:32:53', '2021-05-11 08:32:53'),
(80, 'default', 'payment_edited', 30, 'App\\Transaction', 1, 'App\\User', '[]', '2021-05-11 08:34:49', '2021-05-11 08:34:49'),
(81, 'default', 'edited', 10, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-11 08:47:20', '2021-05-11 08:47:20'),
(82, 'default', 'added', 31, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":4000}}', '2021-05-11 08:56:07', '2021-05-11 08:56:07'),
(83, 'default', 'added', 32, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"payment_status\":\"due\"}}', '2021-05-11 09:09:04', '2021-05-11 09:09:04'),
(84, 'default', 'edited', 32, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"payment_status\":\"paid\"}}', '2021-05-11 09:14:31', '2021-05-11 09:14:31'),
(85, 'default', 'payment_edited', 32, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"payment_status\":\"paid\"},\"old\":{\"payment_status\":\"paid\"}}', '2021-05-11 09:16:38', '2021-05-11 09:16:38'),
(86, 'default', 'added', 11, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-11 09:31:13', '2021-05-11 09:31:13'),
(87, 'default', 'added', 34, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":16000}}', '2021-05-11 09:34:48', '2021-05-11 09:34:48'),
(88, 'default', 'payment_edited', 34, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"16000.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"16000.0000\"}}', '2021-05-11 09:35:12', '2021-05-11 09:35:12'),
(89, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-11 09:12:13', '2021-05-11 09:12:13'),
(90, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-11 11:26:08', '2021-05-11 11:26:08'),
(91, 'default', 'edited', 4, 'App\\User', 1, 'App\\User', '[]', '2021-05-11 12:04:19', '2021-05-11 12:04:19'),
(92, 'default', 'added', 5, 'App\\User', 1, 'App\\User', '[]', '2021-05-11 12:06:35', '2021-05-11 12:06:35'),
(93, 'default', 'added', 6, 'App\\User', 1, 'App\\User', '[]', '2021-05-11 12:08:24', '2021-05-11 12:08:24'),
(94, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-11 12:22:20', '2021-05-11 12:22:20'),
(95, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-11 15:44:09', '2021-05-11 15:44:09'),
(96, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-12 03:04:44', '2021-05-12 03:04:44'),
(97, 'default', 'added', 12, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-12 05:00:13', '2021-05-12 05:00:13'),
(98, 'default', 'added', 35, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":35000}}', '2021-05-12 05:30:09', '2021-05-12 05:30:09'),
(99, 'default', 'payment_edited', 35, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"partial\",\"final_total\":\"35000.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"35000.0000\"}}', '2021-05-12 05:37:50', '2021-05-12 05:37:50'),
(100, 'default', 'edited', 35, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":34300},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"partial\",\"final_total\":\"35000.0000\"}}', '2021-05-12 05:42:34', '2021-05-12 05:42:34'),
(101, 'default', 'edited', 10, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-12 05:45:58', '2021-05-12 05:45:58'),
(102, 'default', 'edited', 9, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-12 05:48:03', '2021-05-12 05:48:03'),
(103, 'default', 'edited', 10, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-12 05:49:28', '2021-05-12 05:49:28'),
(104, 'default', 'edited', 9, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-12 05:52:17', '2021-05-12 05:52:17'),
(105, 'default', 'edited', 1, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-12 06:02:27', '2021-05-12 06:02:27'),
(106, 'default', 'edited', 7, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-12 06:03:18', '2021-05-12 06:03:18'),
(107, 'default', 'added', 36, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"payment_status\":\"due\"}}', '2021-05-12 07:21:20', '2021-05-12 07:21:20'),
(108, 'default', 'payment_edited', 36, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"payment_status\":\"paid\"},\"old\":{\"payment_status\":\"paid\"}}', '2021-05-12 07:24:17', '2021-05-12 07:24:17'),
(109, 'default', 'edited', 18, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"payment_status\":\"paid\"}}', '2021-05-12 07:30:17', '2021-05-12 07:30:17'),
(110, 'default', 'edited', 18, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"payment_status\":\"paid\"}}', '2021-05-12 07:30:55', '2021-05-12 07:30:55'),
(111, 'default', 'edited', 34, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":16000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"16000.0000\"}}', '2021-05-12 07:35:20', '2021-05-12 07:35:20'),
(112, 'default', 'edited', 34, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":16000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"16000.0000\"}}', '2021-05-12 07:38:44', '2021-05-12 07:38:44'),
(113, 'default', 'edited', 34, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":16000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"16000.0000\"}}', '2021-05-12 08:43:45', '2021-05-12 08:43:45'),
(114, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-12 08:16:16', '2021-05-12 08:16:16'),
(115, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-12 11:23:25', '2021-05-12 11:23:25'),
(116, 'default', 'added', 37, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":23100}}', '2021-05-12 11:56:17', '2021-05-12 11:56:17'),
(117, 'default', 'edited', 37, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"proforma\",\"final_total\":\"23100.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"23100.0000\"}}', '2021-05-12 12:28:30', '2021-05-12 12:28:30'),
(118, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-12 12:01:16', '2021-05-12 12:01:16'),
(119, 'default', 'login', 2, 'App\\User', 2, 'App\\User', '[]', '2021-05-12 12:01:28', '2021-05-12 12:01:28'),
(120, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-12 15:35:03', '2021-05-12 15:35:03'),
(121, 'default', 'edited', 3, 'App\\User', 1, 'App\\User', '[]', '2021-05-12 16:11:40', '2021-05-12 16:11:40'),
(122, 'default', 'added', 7, 'App\\User', 1, 'App\\User', '[]', '2021-05-12 16:13:52', '2021-05-12 16:13:52'),
(123, 'default', 'edited', 11, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-12 16:18:17', '2021-05-12 16:18:17'),
(124, 'default', 'edited', 11, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-12 16:27:09', '2021-05-12 16:27:09'),
(125, 'default', 'shipping_edited', 34, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"16000.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"16000.0000\"}}', '2021-05-12 16:30:26', '2021-05-12 16:30:26'),
(126, 'default', 'shipping_edited', 22, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"32300.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"packed\",\"payment_status\":\"paid\",\"final_total\":\"32300.0000\"}}', '2021-05-12 16:44:17', '2021-05-12 16:44:17'),
(127, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-12 16:58:46', '2021-05-12 16:58:46'),
(128, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-12 21:33:34', '2021-05-12 21:33:34'),
(129, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-13 11:51:25', '2021-05-13 11:51:25'),
(130, 'default', 'added', 38, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"payment_status\":\"due\"}}', '2021-05-13 12:25:59', '2021-05-13 12:25:59'),
(131, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-13 12:51:44', '2021-05-13 12:51:44'),
(132, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-13 13:26:30', '2021-05-13 13:26:30'),
(133, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-13 13:26:33', '2021-05-13 13:26:33'),
(134, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-13 13:26:55', '2021-05-13 13:26:55'),
(135, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-05-17 16:38:54', '2021-05-17 16:38:54'),
(136, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-18 01:18:15', '2021-05-18 01:18:15'),
(137, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-18 01:20:34', '2021-05-18 01:20:34'),
(138, 'default', 'login', 2, 'App\\User', 2, 'App\\User', '[]', '2021-05-18 01:20:50', '2021-05-18 01:20:50'),
(139, 'default', 'logout', 2, 'App\\User', 2, 'App\\User', '[]', '2021-05-18 01:24:43', '2021-05-18 01:24:43'),
(140, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-05-18 02:39:49', '2021-05-18 02:39:49'),
(141, 'default', 'login', 2, 'App\\User', 2, 'App\\User', '[]', '2021-05-18 04:32:12', '2021-05-18 04:32:12'),
(142, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-18 06:31:53', '2021-05-18 06:31:53'),
(143, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-20 15:15:36', '2021-05-20 15:15:36'),
(144, 'default', 'added', 39, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"ordered\",\"payment_status\":\"due\",\"final_total\":170000}}', '2021-05-20 15:50:52', '2021-05-20 15:50:52'),
(145, 'default', 'edited', 39, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"ordered\",\"payment_status\":\"due\",\"final_total\":350000},\"old\":{\"type\":\"purchase\",\"status\":\"ordered\",\"payment_status\":\"due\",\"final_total\":\"170000.0000\"}}', '2021-05-20 15:57:02', '2021-05-20 15:57:02'),
(146, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-20 15:32:31', '2021-05-20 15:32:31'),
(147, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-22 16:41:30', '2021-05-22 16:41:30'),
(148, 'default', 'added', 13, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-22 17:23:48', '2021-05-22 17:23:48'),
(149, 'default', 'added', 40, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"ordered\",\"payment_status\":\"due\",\"final_total\":111221.5}}', '2021-05-22 17:39:26', '2021-05-22 17:39:26'),
(150, 'default', 'edited', 39, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":350000},\"old\":{\"type\":\"purchase\",\"status\":\"ordered\",\"payment_status\":\"due\",\"final_total\":\"350000.0000\"}}', '2021-05-22 17:41:49', '2021-05-22 17:41:49'),
(151, 'default', 'added', 14, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-22 17:46:15', '2021-05-22 17:46:15'),
(152, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-22 17:17:29', '2021-05-22 17:17:29'),
(153, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-23 02:34:21', '2021-05-23 02:34:21'),
(154, 'default', 'added', 15, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-23 05:02:39', '2021-05-23 05:02:39'),
(155, 'default', 'added', 41, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":148680}}', '2021-05-23 05:09:26', '2021-05-23 05:09:26'),
(156, 'default', 'edited', 15, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-23 05:59:50', '2021-05-23 05:59:50'),
(157, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-05-23 06:22:31', '2021-05-23 06:22:31'),
(158, 'default', 'edited', 5, 'App\\User', 1, 'App\\User', '[]', '2021-05-23 06:58:30', '2021-05-23 06:58:30'),
(159, 'default', 'added', 42, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"payment_status\":\"due\"}}', '2021-05-23 07:15:13', '2021-05-23 07:15:13'),
(160, 'default', 'added', 43, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"payment_status\":\"due\"}}', '2021-05-23 07:24:33', '2021-05-23 07:24:33'),
(161, 'default', 'edited', 40, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"ordered\",\"payment_status\":\"due\",\"final_total\":733110},\"old\":{\"type\":\"purchase\",\"status\":\"ordered\",\"payment_status\":\"due\",\"final_total\":\"111221.5000\"}}', '2021-05-23 09:24:19', '2021-05-23 09:24:19'),
(162, 'default', 'added', 44, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"payment_status\":\"due\"}}', '2021-05-23 09:56:53', '2021-05-23 09:56:53'),
(163, 'default', 'edited', 44, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"payment_status\":\"paid\"}}', '2021-05-23 10:02:25', '2021-05-23 10:02:25'),
(164, 'default', 'edited', 40, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"ordered\",\"payment_status\":\"due\",\"final_total\":944625},\"old\":{\"type\":\"purchase\",\"status\":\"ordered\",\"payment_status\":\"due\",\"final_total\":\"733110.0000\"}}', '2021-05-23 10:37:07', '2021-05-23 10:37:07'),
(165, 'default', 'added', 45, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"payment_status\":\"due\"}}', '2021-05-23 10:59:03', '2021-05-23 10:59:03'),
(166, 'default', 'edited', 44, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"payment_status\":\"paid\"}}', '2021-05-23 10:59:39', '2021-05-23 10:59:39'),
(167, 'default', 'added', 46, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"payment_status\":\"due\"}}', '2021-05-23 11:01:36', '2021-05-23 11:01:36'),
(168, 'default', 'edited', 44, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"payment_status\":\"paid\"}}', '2021-05-23 11:03:37', '2021-05-23 11:03:37'),
(169, 'default', 'added', 8, 'App\\User', 1, 'App\\User', '[]', '2021-05-23 11:11:22', '2021-05-23 11:11:22'),
(170, 'default', 'edited', 40, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"ordered\",\"payment_status\":\"due\",\"final_total\":953567},\"old\":{\"type\":\"purchase\",\"status\":\"ordered\",\"payment_status\":\"due\",\"final_total\":\"944625.0000\"}}', '2021-05-23 11:46:32', '2021-05-23 11:46:32'),
(171, 'default', 'edited', 40, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"ordered\",\"payment_status\":\"due\",\"final_total\":953567},\"old\":{\"type\":\"purchase\",\"status\":\"ordered\",\"payment_status\":\"due\",\"final_total\":\"953567.0000\"}}', '2021-05-23 11:47:43', '2021-05-23 11:47:43'),
(172, 'default', 'logout', 5, 'App\\User', 5, 'App\\User', '[]', '2021-05-23 11:35:26', '2021-05-23 11:35:26'),
(173, 'default', 'email_notification_sent', 34, 'App\\Transaction', 1, 'App\\User', '[]', '2021-05-23 12:16:15', '2021-05-23 12:16:15'),
(174, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-05-24 03:51:33', '2021-05-24 03:51:33'),
(175, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-24 04:19:38', '2021-05-24 04:19:38'),
(176, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-24 04:33:38', '2021-05-24 04:33:38'),
(177, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-05-25 02:32:44', '2021-05-25 02:32:44'),
(178, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-25 06:59:43', '2021-05-25 06:59:43'),
(179, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-25 07:00:01', '2021-05-25 07:00:01'),
(180, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-27 02:22:18', '2021-05-27 02:22:18'),
(181, 'default', 'added', 9, 'App\\User', 1, 'App\\User', '[]', '2021-05-27 03:00:16', '2021-05-27 03:00:16'),
(182, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-27 02:30:50', '2021-05-27 02:30:50'),
(183, 'default', 'login', 9, 'App\\User', 9, 'App\\User', '[]', '2021-05-27 02:31:08', '2021-05-27 02:31:08'),
(184, 'default', 'edited', 41, 'App\\Transaction', 9, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":148680},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"148680.0000\"}}', '2021-05-27 03:04:56', '2021-05-27 03:04:56'),
(185, 'default', 'logout', 9, 'App\\User', 9, 'App\\User', '[]', '2021-05-27 02:37:45', '2021-05-27 02:37:45'),
(186, 'default', 'login', 9, 'App\\User', 9, 'App\\User', '[]', '2021-05-27 02:42:36', '2021-05-27 02:42:36'),
(187, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-27 03:21:44', '2021-05-27 03:21:44'),
(188, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-27 03:21:44', '2021-05-27 03:21:44'),
(189, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-27 03:22:05', '2021-05-27 03:22:05'),
(190, 'default', 'added', 16, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-27 06:43:06', '2021-05-27 06:43:06'),
(191, 'default', 'added', 17, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-27 06:43:06', '2021-05-27 06:43:06'),
(192, 'default', 'added', 46, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":648375}}', '2021-05-27 06:54:12', '2021-05-27 06:54:12'),
(193, 'default', 'added', 18, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-27 08:50:48', '2021-05-27 08:50:48'),
(194, 'default', 'edited', 18, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-27 08:53:52', '2021-05-27 08:53:52'),
(195, 'default', 'added', 48, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":1764}}', '2021-05-27 08:56:13', '2021-05-27 08:56:13'),
(196, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-05-27 12:01:08', '2021-05-27 12:01:08'),
(197, 'default', 'payment_edited', 48, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1764.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"1764.0000\"}}', '2021-05-27 12:35:33', '2021-05-27 12:35:33'),
(198, 'default', 'added', 19, 'App\\Contact', 1, 'App\\User', '[]', '2021-05-27 13:11:25', '2021-05-27 13:11:25'),
(199, 'default', 'added', 50, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":26250}}', '2021-05-27 13:20:51', '2021-05-27 13:20:51'),
(200, 'default', 'edited', 48, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":1764},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1764.0000\"}}', '2021-05-27 13:21:48', '2021-05-27 13:21:48'),
(201, 'default', 'edited', 46, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":648375},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"648375.0000\"}}', '2021-05-27 13:22:22', '2021-05-27 13:22:22'),
(202, 'default', 'login', 9, 'App\\User', 9, 'App\\User', '[]', '2021-06-06 15:28:25', '2021-06-06 15:28:25'),
(203, 'default', 'login', 2, 'App\\User', 2, 'App\\User', '[]', '2021-06-10 02:57:58', '2021-06-10 02:57:58'),
(204, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-06-10 06:55:41', '2021-06-10 06:55:41'),
(205, 'default', 'edited', 14, 'App\\Contact', 1, 'App\\User', '[]', '2021-06-10 07:33:29', '2021-06-10 07:33:29'),
(206, 'default', 'added', 51, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":378000}}', '2021-06-10 07:47:42', '2021-06-10 07:47:42'),
(207, 'default', 'edited', 14, 'App\\Contact', 1, 'App\\User', '[]', '2021-06-10 08:36:40', '2021-06-10 08:36:40'),
(208, 'default', 'edited', 1, 'App\\Contact', 1, 'App\\User', '[]', '2021-06-10 09:16:38', '2021-06-10 09:16:38'),
(209, 'default', 'edited', 1, 'App\\Contact', 1, 'App\\User', '[]', '2021-06-10 09:17:58', '2021-06-10 09:17:58'),
(210, 'default', 'edited', 1, 'App\\Contact', 1, 'App\\User', '[]', '2021-06-10 09:18:09', '2021-06-10 09:18:09'),
(211, 'default', 'added', 53, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":11500}}', '2021-06-10 09:23:28', '2021-06-10 09:23:28'),
(212, 'default', 'edited', 51, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":331800},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"378000.0000\"}}', '2021-06-10 09:53:13', '2021-06-10 09:53:13'),
(213, 'default', 'added', 54, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":89250}}', '2021-06-10 10:32:26', '2021-06-10 10:32:26'),
(214, 'default', 'edited', 54, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":89250},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"89250.0000\"}}', '2021-06-10 10:34:10', '2021-06-10 10:34:10'),
(215, 'default', 'edited', 54, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":89250},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":\"89250.0000\"}}', '2021-06-10 10:41:08', '2021-06-10 10:41:08'),
(216, 'default', 'login', 3, 'App\\User', 3, 'App\\User', '[]', '2021-06-10 10:21:36', '2021-06-10 10:21:36'),
(217, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-06-10 10:27:50', '2021-06-10 10:27:50'),
(218, 'default', 'payment_edited', 39, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"partial\",\"final_total\":\"350000.0000\"},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":\"350000.0000\"}}', '2021-06-10 11:07:50', '2021-06-10 11:07:50'),
(219, 'default', 'added', 55, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":7000}}', '2021-06-10 11:17:20', '2021-06-10 11:17:20'),
(220, 'default', 'added', 20, 'App\\Contact', 5, 'App\\User', '[]', '2021-06-10 11:29:10', '2021-06-10 11:29:10'),
(221, 'default', 'added', 56, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":9975}}', '2021-06-10 11:36:03', '2021-06-10 11:36:03'),
(222, 'default', 'edited', 53, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":11500},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"11500.0000\"}}', '2021-06-10 11:37:17', '2021-06-10 11:37:17'),
(223, 'default', 'edited', 50, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":26250},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"26250.0000\"}}', '2021-06-10 11:37:54', '2021-06-10 11:37:54'),
(224, 'default', 'edited', 41, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":148680},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"148680.0000\"}}', '2021-06-10 11:38:43', '2021-06-10 11:38:43'),
(225, 'default', 'edited', 53, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":11500},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"11500.0000\"}}', '2021-06-10 11:40:07', '2021-06-10 11:40:07'),
(226, 'default', 'edited', 53, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":11500},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"11500.0000\"}}', '2021-06-10 11:40:50', '2021-06-10 11:40:50'),
(227, 'default', 'edited', 53, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":11500},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"11500.0000\"}}', '2021-06-10 11:56:27', '2021-06-10 11:56:27'),
(228, 'default', 'edited', 53, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":11500},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"11500.0000\"}}', '2021-06-10 11:56:52', '2021-06-10 11:56:52'),
(229, 'default', 'added', 21, 'App\\Contact', 5, 'App\\User', '[]', '2021-06-10 12:10:38', '2021-06-10 12:10:38'),
(230, 'default', 'added', 57, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":51000}}', '2021-06-10 12:12:19', '2021-06-10 12:12:19'),
(231, 'default', 'payment_edited', 57, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"51000.0000\"},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":\"51000.0000\"}}', '2021-06-10 12:16:24', '2021-06-10 12:16:24'),
(232, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-06-11 01:53:13', '2021-06-11 01:53:13'),
(233, 'default', 'edited', 2, 'App\\Contact', 1, 'App\\User', '[]', '2021-06-11 02:31:39', '2021-06-11 02:31:39'),
(234, 'default', 'added', 22, 'App\\Contact', 1, 'App\\User', '[]', '2021-06-11 02:37:17', '2021-06-11 02:37:17'),
(235, 'default', 'added', 58, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"ordered\",\"payment_status\":\"due\",\"final_total\":20000}}', '2021-06-11 02:42:04', '2021-06-11 02:42:04'),
(236, 'default', 'added', 59, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":26250}}', '2021-06-11 02:45:40', '2021-06-11 02:45:40'),
(237, 'default', 'login', 2, 'App\\User', 2, 'App\\User', '[]', '2021-06-12 06:14:47', '2021-06-12 06:14:47'),
(238, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-06-12 06:18:42', '2021-06-12 06:18:42'),
(239, 'default', 'added', 60, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":6300}}', '2021-06-12 06:52:18', '2021-06-12 06:52:18'),
(240, 'default', 'payment_edited', 60, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"6300.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"6300.0000\"}}', '2021-06-12 06:54:14', '2021-06-12 06:54:14'),
(241, 'default', 'added', 61, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":6300}}', '2021-06-12 07:01:29', '2021-06-12 07:01:29'),
(242, 'default', 'added', 23, 'App\\Contact', 2, 'App\\User', '[]', '2021-06-12 07:03:06', '2021-06-12 07:03:06'),
(243, 'default', 'edited', 61, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":6300},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"6300.0000\"}}', '2021-06-12 07:04:46', '2021-06-12 07:04:46'),
(244, 'default', 'edited', 61, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":6300},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"6300.0000\"}}', '2021-06-12 07:10:33', '2021-06-12 07:10:33'),
(245, 'default', 'payment_edited', 61, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"6300.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"6300.0000\"}}', '2021-06-12 07:12:24', '2021-06-12 07:12:24'),
(246, 'default', 'edited', 61, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":6900},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"6300.0000\"}}', '2021-06-12 07:14:43', '2021-06-12 07:14:43'),
(247, 'default', 'edited', 61, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":6900},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"6900.0000\"}}', '2021-06-12 07:15:47', '2021-06-12 07:15:47'),
(248, 'default', 'edited', 61, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":6900},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"6900.0000\"}}', '2021-06-12 07:19:04', '2021-06-12 07:19:04'),
(249, 'default', 'edited', 61, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":6900},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"6900.0000\"}}', '2021-06-12 07:20:30', '2021-06-12 07:20:30'),
(250, 'default', 'added', 62, 'App\\Transaction', 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":264600}}', '2021-06-12 07:20:39', '2021-06-12 07:20:39'),
(251, 'default', 'edited', 62, 'App\\Transaction', 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":291900},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"264600.0000\"}}', '2021-06-12 07:23:45', '2021-06-12 07:23:45'),
(252, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-06-13 03:01:53', '2021-06-13 03:01:53'),
(253, 'default', 'edited', 1, 'App\\Contact', 1, 'App\\User', '[]', '2021-06-13 04:23:32', '2021-06-13 04:23:32'),
(254, 'default', 'edited', 54, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":76440},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":\"89250.0000\"}}', '2021-06-13 05:46:15', '2021-06-13 05:46:15'),
(255, 'default', 'login', 2, 'App\\User', 2, 'App\\User', '[]', '2021-06-13 06:03:26', '2021-06-13 06:03:26'),
(256, 'default', 'added', 24, 'App\\Contact', 2, 'App\\User', '[]', '2021-06-13 06:44:37', '2021-06-13 06:44:37'),
(257, 'default', 'added', 25, 'App\\Contact', 2, 'App\\User', '[]', '2021-06-13 06:49:22', '2021-06-13 06:49:22'),
(258, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-06-16 10:21:38', '2021-06-16 10:21:38'),
(259, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-06-17 03:45:02', '2021-06-17 03:45:02'),
(260, 'default', 'added', 64, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":5750}}', '2021-06-17 04:30:37', '2021-06-17 04:30:37'),
(261, 'default', 'edited', 64, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":5750},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"5750.0000\"}}', '2021-06-17 04:32:44', '2021-06-17 04:32:44'),
(262, 'default', 'payment_edited', 64, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"5750.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"5750.0000\"}}', '2021-06-17 04:39:36', '2021-06-17 04:39:36'),
(263, 'default', 'added', 65, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":5750}}', '2021-06-17 04:45:11', '2021-06-17 04:45:11'),
(264, 'default', 'payment_edited', 65, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"5750.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"5750.0000\"}}', '2021-06-17 04:46:39', '2021-06-17 04:46:39'),
(265, 'default', 'edited', 65, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":5750},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"5750.0000\"}}', '2021-06-17 04:49:51', '2021-06-17 04:49:51'),
(266, 'default', 'edited', 65, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":5750},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"5750.0000\"}}', '2021-06-17 05:18:24', '2021-06-17 05:18:24'),
(267, 'default', 'edited', 65, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":5750},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"5750.0000\"}}', '2021-06-17 05:19:34', '2021-06-17 05:19:34'),
(268, 'default', 'edited', 65, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":5750},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"5750.0000\"}}', '2021-06-17 05:19:52', '2021-06-17 05:19:52'),
(269, 'default', 'logout', 5, 'App\\User', 5, 'App\\User', '[]', '2021-06-17 05:18:29', '2021-06-17 05:18:29'),
(270, 'default', 'login', 9, 'App\\User', 9, 'App\\User', '[]', '2021-06-17 11:19:12', '2021-06-17 11:19:12'),
(271, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-06-19 04:21:13', '2021-06-19 04:21:13'),
(272, 'default', 'edited', 65, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":5000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"5750.0000\"}}', '2021-06-19 04:52:28', '2021-06-19 04:52:28'),
(273, 'default', 'login', 3, 'App\\User', 3, 'App\\User', '[]', '2021-06-20 02:54:30', '2021-06-20 02:54:30'),
(274, 'default', 'logout', 3, 'App\\User', 3, 'App\\User', '[]', '2021-06-20 04:16:08', '2021-06-20 04:16:08'),
(275, 'default', 'login', 6, 'App\\User', 6, 'App\\User', '[]', '2021-06-20 04:16:55', '2021-06-20 04:16:55'),
(276, 'default', 'logout', 6, 'App\\User', 6, 'App\\User', '[]', '2021-06-20 04:19:29', '2021-06-20 04:19:29'),
(277, 'default', 'login', 3, 'App\\User', 3, 'App\\User', '[]', '2021-06-20 04:20:04', '2021-06-20 04:20:04');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(278, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-06-20 05:59:12', '2021-06-20 05:59:12'),
(279, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-06-20 05:59:47', '2021-06-20 05:59:47'),
(280, 'default', 'login', 2, 'App\\User', 2, 'App\\User', '[]', '2021-06-20 06:00:08', '2021-06-20 06:00:08'),
(281, 'default', 'edited', 9, 'App\\User', 1, 'App\\User', '[]', '2021-06-20 06:34:50', '2021-06-20 06:34:50'),
(282, 'default', 'added', 26, 'App\\Contact', 1, 'App\\User', '[]', '2021-06-20 07:15:02', '2021-06-20 07:15:02'),
(283, 'default', 'added', 67, 'App\\Transaction', 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":50000}}', '2021-06-20 09:08:40', '2021-06-20 09:08:40'),
(284, 'default', 'added', 68, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":66035.75}}', '2021-06-20 09:55:22', '2021-06-20 09:55:22'),
(285, 'default', 'edited', 68, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":66035.75},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"66035.7500\"}}', '2021-06-20 09:57:13', '2021-06-20 09:57:13'),
(286, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-06-20 09:38:29', '2021-06-20 09:38:29'),
(287, 'default', 'edited', 68, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":66035.75},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":\"66035.7500\"}}', '2021-06-20 10:21:19', '2021-06-20 10:21:19'),
(288, 'default', 'edited', 68, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":66035.75},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":\"66035.7500\"}}', '2021-06-20 10:31:04', '2021-06-20 10:31:04'),
(289, 'default', 'edited', 68, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":66035.75},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":\"66035.7500\"}}', '2021-06-20 10:32:38', '2021-06-20 10:32:38'),
(290, 'default', 'edited', 68, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":66035.75},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":\"66035.7500\"}}', '2021-06-20 10:34:04', '2021-06-20 10:34:04'),
(291, 'default', 'edited', 68, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":66035.75},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":\"66035.7500\"}}', '2021-06-20 10:37:16', '2021-06-20 10:37:16'),
(292, 'default', 'edited', 61, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":6900},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"6900.0000\"}}', '2021-06-20 10:38:14', '2021-06-20 10:38:14'),
(293, 'default', 'edited', 65, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":5000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"5000.0000\"}}', '2021-06-20 10:39:31', '2021-06-20 10:39:31'),
(294, 'default', 'edited', 68, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":66035.75},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":\"66035.7500\"}}', '2021-06-20 10:45:17', '2021-06-20 10:45:17'),
(295, 'default', 'edited', 68, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":66035.75},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":\"66035.7500\"}}', '2021-06-20 10:45:44', '2021-06-20 10:45:44'),
(296, 'default', 'edited', 68, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":72519.5},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":\"66035.7500\"}}', '2021-06-20 10:50:34', '2021-06-20 10:50:34'),
(297, 'default', 'edited', 26, 'App\\Contact', 1, 'App\\User', '[]', '2021-06-20 11:03:31', '2021-06-20 11:03:31'),
(298, 'default', 'edited', 26, 'App\\Contact', 1, 'App\\User', '[]', '2021-06-20 11:07:07', '2021-06-20 11:07:07'),
(299, 'default', 'edited', 68, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":72519.5},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":\"72519.5000\"}}', '2021-06-20 11:12:02', '2021-06-20 11:12:02'),
(300, 'default', 'edited', 68, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":72519.5},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":\"72519.5000\"}}', '2021-06-20 11:13:08', '2021-06-20 11:13:08'),
(301, 'default', 'edited', 44, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"payment_status\":\"paid\"}}', '2021-06-20 12:25:55', '2021-06-20 12:25:55'),
(302, 'default', 'added', 69, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"payment_status\":\"due\"}}', '2021-06-20 12:34:24', '2021-06-20 12:34:24'),
(303, 'default', 'edited', 69, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"payment_status\":\"due\"}}', '2021-06-20 12:36:13', '2021-06-20 12:36:13'),
(304, 'default', 'added', 70, 'App\\Transaction', 9, 'App\\User', '{\"attributes\":{\"payment_status\":\"due\"}}', '2021-06-20 12:42:54', '2021-06-20 12:42:54'),
(305, 'default', 'payment_edited', 70, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"payment_status\":\"due\"},\"old\":{\"payment_status\":\"partial\"}}', '2021-06-20 12:43:44', '2021-06-20 12:43:44'),
(306, 'default', 'login', 6, 'App\\User', 6, 'App\\User', '[]', '2021-06-20 12:22:37', '2021-06-20 12:22:37'),
(307, 'default', 'login', 2, 'App\\User', 2, 'App\\User', '[]', '2021-06-21 03:11:16', '2021-06-21 03:11:16'),
(308, 'default', 'added', 72, 'App\\Transaction', 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":787500}}', '2021-06-21 03:52:02', '2021-06-21 03:52:02'),
(309, 'default', 'added', 73, 'App\\Transaction', 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":787500}}', '2021-06-21 04:09:28', '2021-06-21 04:09:28'),
(310, 'default', 'edited', 73, 'App\\Transaction', 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":750000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"787500.0000\"}}', '2021-06-21 04:10:13', '2021-06-21 04:10:13'),
(311, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-06-21 03:41:31', '2021-06-21 03:41:31'),
(312, 'default', 'added', 74, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":7500}}', '2021-06-21 04:29:28', '2021-06-21 04:29:28'),
(313, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-06-21 04:15:57', '2021-06-21 04:15:57'),
(314, 'default', 'edited', 18, 'App\\Contact', 1, 'App\\User', '[]', '2021-06-21 04:46:47', '2021-06-21 04:46:47'),
(315, 'default', 'edited', 74, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":7500},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"7500.0000\"}}', '2021-06-21 04:50:50', '2021-06-21 04:50:50'),
(316, 'default', 'edited', 18, 'App\\Contact', 1, 'App\\User', '[]', '2021-06-21 04:52:51', '2021-06-21 04:52:51'),
(317, 'default', 'edited', 65, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":5000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"5000.0000\"}}', '2021-06-21 04:53:04', '2021-06-21 04:53:04'),
(318, 'default', 'added', 27, 'App\\Contact', 5, 'App\\User', '[]', '2021-06-21 05:11:10', '2021-06-21 05:11:10'),
(319, 'default', 'added', 28, 'App\\Contact', 1, 'App\\User', '[]', '2021-06-21 05:13:53', '2021-06-21 05:13:53'),
(320, 'default', 'edited', 27, 'App\\Contact', 1, 'App\\User', '[]', '2021-06-21 05:44:47', '2021-06-21 05:44:47'),
(321, 'default', 'added', 76, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":16000}}', '2021-06-21 05:52:58', '2021-06-21 05:52:58'),
(322, 'default', 'added', 77, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":170000}}', '2021-06-21 05:56:27', '2021-06-21 05:56:27'),
(323, 'default', 'edited', 13, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"ordered\",\"payment_status\":\"due\",\"final_total\":47580},\"old\":{\"type\":\"purchase\",\"status\":\"ordered\",\"payment_status\":\"due\",\"final_total\":\"45540.0000\"}}', '2021-06-21 06:00:38', '2021-06-21 06:00:38'),
(324, 'default', 'payment_edited', 13, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"ordered\",\"payment_status\":\"partial\",\"final_total\":\"47580.0000\"},\"old\":{\"type\":\"purchase\",\"status\":\"ordered\",\"payment_status\":\"due\",\"final_total\":\"47580.0000\"}}', '2021-06-21 06:08:00', '2021-06-21 06:08:00'),
(325, 'default', 'added', 78, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":28000}}', '2021-06-21 06:21:48', '2021-06-21 06:21:48'),
(326, 'default', 'payment_edited', 77, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"partial\",\"final_total\":\"170000.0000\"},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":\"170000.0000\"}}', '2021-06-21 06:25:35', '2021-06-21 06:25:35'),
(327, 'default', 'edited', 77, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"partial\",\"final_total\":170000},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"partial\",\"final_total\":\"170000.0000\"}}', '2021-06-21 06:26:57', '2021-06-21 06:26:57'),
(328, 'default', 'edited', 27, 'App\\Contact', 5, 'App\\User', '[]', '2021-06-21 06:32:43', '2021-06-21 06:32:43'),
(329, 'default', 'added', 79, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":378000}}', '2021-06-21 06:39:40', '2021-06-21 06:39:40'),
(330, 'default', 'logout', 5, 'App\\User', 5, 'App\\User', '[]', '2021-06-21 13:14:37', '2021-06-21 13:14:37'),
(331, 'default', 'login', 6, 'App\\User', 6, 'App\\User', '[]', '2021-06-21 16:03:45', '2021-06-21 16:03:45'),
(332, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-06-22 02:16:19', '2021-06-22 02:16:19'),
(333, 'default', 'added', 29, 'App\\Contact', 5, 'App\\User', '[]', '2021-06-22 02:57:19', '2021-06-22 02:57:19'),
(334, 'default', 'added', 80, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":4000}}', '2021-06-22 03:03:29', '2021-06-22 03:03:29'),
(335, 'default', 'added', 81, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":4000}}', '2021-06-22 03:15:53', '2021-06-22 03:15:53'),
(336, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-06-22 02:51:16', '2021-06-22 02:51:16'),
(337, 'default', 'edited', 29, 'App\\Contact', 1, 'App\\User', '[]', '2021-06-22 03:21:58', '2021-06-22 03:21:58'),
(338, 'default', 'login', 2, 'App\\User', 2, 'App\\User', '[]', '2021-06-22 02:53:14', '2021-06-22 02:53:14'),
(339, 'default', 'edited', 29, 'App\\Contact', 1, 'App\\User', '[]', '2021-06-22 03:24:58', '2021-06-22 03:24:58'),
(340, 'default', 'edited', 80, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":4000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"4000.0000\"}}', '2021-06-22 03:26:07', '2021-06-22 03:26:07'),
(341, 'default', 'edited', 81, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":4000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"4000.0000\"}}', '2021-06-22 03:26:42', '2021-06-22 03:26:42'),
(342, 'default', 'edited', 81, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":4000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"4000.0000\"}}', '2021-06-22 03:27:54', '2021-06-22 03:27:54'),
(343, 'default', 'added', 83, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":4000}}', '2021-06-22 03:29:54', '2021-06-22 03:29:54'),
(344, 'default', 'edited', 83, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":4000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"4000.0000\"}}', '2021-06-22 03:31:32', '2021-06-22 03:31:32'),
(345, 'default', 'edited', 80, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":4000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"4000.0000\"}}', '2021-06-22 03:32:10', '2021-06-22 03:32:10'),
(346, 'default', 'added', 84, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":4000}}', '2021-06-22 03:34:40', '2021-06-22 03:34:40'),
(347, 'default', 'login', 6, 'App\\User', 6, 'App\\User', '[]', '2021-06-22 03:07:08', '2021-06-22 03:07:08'),
(348, 'default', 'added', 85, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":4000}}', '2021-06-22 03:37:18', '2021-06-22 03:37:18'),
(349, 'default', 'added', 86, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":4000}}', '2021-06-22 03:39:49', '2021-06-22 03:39:49'),
(350, 'default', 'added', 87, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":4000}}', '2021-06-22 03:42:43', '2021-06-22 03:42:43'),
(351, 'default', 'added', 88, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":4000}}', '2021-06-22 03:44:08', '2021-06-22 03:44:08'),
(352, 'default', 'added', 30, 'App\\Contact', 6, 'App\\User', '[]', '2021-06-22 03:54:56', '2021-06-22 03:54:56'),
(353, 'default', 'added', 89, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":6300}}', '2021-06-22 04:01:54', '2021-06-22 04:01:54'),
(354, 'default', 'added', 90, 'App\\Transaction', 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":147600}}', '2021-06-22 04:14:56', '2021-06-22 04:14:56'),
(355, 'default', 'edited', 90, 'App\\Transaction', 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":147600},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"147600.0000\"}}', '2021-06-22 04:15:21', '2021-06-22 04:15:21'),
(356, 'default', 'edited', 53, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":11500},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"11500.0000\"}}', '2021-06-22 04:26:09', '2021-06-22 04:26:09'),
(357, 'default', 'added', 91, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":9000}}', '2021-06-22 04:28:35', '2021-06-22 04:28:35'),
(358, 'default', 'edited', 91, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":6000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"9000.0000\"}}', '2021-06-22 04:31:43', '2021-06-22 04:31:43'),
(359, 'default', 'edited', 24, 'App\\Contact', 1, 'App\\User', '[]', '2021-06-22 04:36:38', '2021-06-22 04:36:38'),
(360, 'default', 'added', 92, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":0}}', '2021-06-22 04:37:13', '2021-06-22 04:37:13'),
(361, 'default', 'edited', 30, 'App\\Contact', 1, 'App\\User', '[]', '2021-06-22 04:41:20', '2021-06-22 04:41:20'),
(362, 'default', 'edited', 30, 'App\\Contact', 1, 'App\\User', '[]', '2021-06-22 04:41:38', '2021-06-22 04:41:38'),
(363, 'default', 'edited', 30, 'App\\Contact', 1, 'App\\User', '[]', '2021-06-22 04:42:13', '2021-06-22 04:42:13'),
(364, 'default', 'edited', 25, 'App\\Contact', 1, 'App\\User', '[]', '2021-06-22 04:44:02', '2021-06-22 04:44:02'),
(365, 'default', 'edited', 25, 'App\\Contact', 1, 'App\\User', '[]', '2021-06-22 04:45:03', '2021-06-22 04:45:03'),
(366, 'default', 'edited', 25, 'App\\Contact', 1, 'App\\User', '[]', '2021-06-22 04:45:17', '2021-06-22 04:45:17'),
(367, 'default', 'added', 93, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":0.419999999999999984456877655247808434069156646728515625}}', '2021-06-22 04:51:52', '2021-06-22 04:51:52'),
(368, 'default', 'edited', 88, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":4000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"4000.0000\"}}', '2021-06-22 04:59:26', '2021-06-22 04:59:26'),
(369, 'default', 'edited', 88, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":4000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"4000.0000\"}}', '2021-06-22 04:59:52', '2021-06-22 04:59:52'),
(370, 'default', 'edited', 61, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":6900},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"6900.0000\"}}', '2021-06-22 07:59:27', '2021-06-22 07:59:27'),
(371, 'default', 'edited', 91, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":6000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"6000.0000\"}}', '2021-06-22 08:00:25', '2021-06-22 08:00:25'),
(372, 'default', 'edited', 93, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":0.419999999999999984456877655247808434069156646728515625},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"0.4200\"}}', '2021-06-22 08:40:27', '2021-06-22 08:40:27'),
(373, 'default', 'edited', 61, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":6900},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"6900.0000\"}}', '2021-06-22 08:42:07', '2021-06-22 08:42:07'),
(374, 'default', 'edited', 88, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":4000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"4000.0000\"}}', '2021-06-22 08:50:18', '2021-06-22 08:50:18'),
(375, 'default', 'edited', 87, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":4000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"4000.0000\"}}', '2021-06-22 08:50:38', '2021-06-22 08:50:38'),
(376, 'default', 'edited', 86, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":4000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"4000.0000\"}}', '2021-06-22 08:51:12', '2021-06-22 08:51:12'),
(377, 'default', 'edited', 61, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":6900},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"6900.0000\"}}', '2021-06-22 08:52:28', '2021-06-22 08:52:28'),
(378, 'default', 'added', 94, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":23000}}', '2021-06-22 08:58:12', '2021-06-22 08:58:12'),
(379, 'default', 'added', 95, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":23000}}', '2021-06-22 09:02:08', '2021-06-22 09:02:08'),
(380, 'default', 'added', 96, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":11500}}', '2021-06-22 09:05:54', '2021-06-22 09:05:54'),
(381, 'default', 'edited', 96, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":11500},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"11500.0000\"}}', '2021-06-22 09:06:37', '2021-06-22 09:06:37'),
(382, 'default', 'edited', 94, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":23000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"23000.0000\"}}', '2021-06-22 09:07:03', '2021-06-22 09:07:03'),
(383, 'default', 'edited', 95, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":23000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"23000.0000\"}}', '2021-06-22 09:07:23', '2021-06-22 09:07:23'),
(384, 'default', 'added', 97, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":6900}}', '2021-06-22 09:11:08', '2021-06-22 09:11:08'),
(385, 'default', 'added', 98, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":6900}}', '2021-06-22 09:14:03', '2021-06-22 09:14:03'),
(386, 'default', 'added', 99, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":6900}}', '2021-06-22 09:16:53', '2021-06-22 09:16:53'),
(387, 'default', 'added', 100, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":17250}}', '2021-06-22 09:19:56', '2021-06-22 09:19:56'),
(388, 'default', 'added', 101, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":159600}}', '2021-06-22 09:31:30', '2021-06-22 09:31:30'),
(389, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-06-22 09:22:08', '2021-06-22 09:22:08'),
(390, 'default', 'added', 102, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"payment_status\":\"due\"}}', '2021-06-22 10:23:02', '2021-06-22 10:23:02'),
(391, 'default', 'payment_edited', 102, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"payment_status\":\"paid\"},\"old\":{\"payment_status\":\"due\"}}', '2021-06-22 10:25:06', '2021-06-22 10:25:06'),
(392, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-06-22 11:26:13', '2021-06-22 11:26:13'),
(393, 'default', 'logout', 5, 'App\\User', 5, 'App\\User', '[]', '2021-06-22 11:26:57', '2021-06-22 11:26:57'),
(394, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-06-22 11:27:13', '2021-06-22 11:27:13'),
(395, 'default', 'added', 104, 'App\\Transaction', 9, 'App\\User', '{\"attributes\":{\"payment_status\":\"due\"}}', '2021-06-22 11:59:19', '2021-06-22 11:59:19'),
(396, 'default', 'edited', 101, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":159600},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"159600.0000\"}}', '2021-06-22 12:00:04', '2021-06-22 12:00:04'),
(397, 'default', 'edited', 104, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"payment_status\":\"due\"}}', '2021-06-22 12:15:27', '2021-06-22 12:15:27'),
(398, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-06-22 11:46:29', '2021-06-22 11:46:29'),
(399, 'default', 'added', 31, 'App\\Contact', 5, 'App\\User', '[]', '2021-06-22 12:16:43', '2021-06-22 12:16:43'),
(400, 'default', 'added', 105, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":40950}}', '2021-06-22 12:19:16', '2021-06-22 12:19:16'),
(401, 'default', 'edited', 53, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":11500},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"11500.0000\"}}', '2021-06-22 12:26:44', '2021-06-22 12:26:44'),
(402, 'default', 'edited', 53, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":11500},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"11500.0000\"}}', '2021-06-22 12:27:46', '2021-06-22 12:27:46'),
(403, 'default', 'added', 32, 'App\\Contact', 5, 'App\\User', '[]', '2021-06-22 13:06:46', '2021-06-22 13:06:46'),
(404, 'default', 'added', 106, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":103320}}', '2021-06-22 13:09:17', '2021-06-22 13:09:17'),
(405, 'default', 'added', 107, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":103320}}', '2021-06-22 13:35:22', '2021-06-22 13:35:22'),
(406, 'default', 'added', 108, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":103320}}', '2021-06-22 13:39:00', '2021-06-22 13:39:00'),
(407, 'default', 'payment_edited', 108, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"103320.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"103320.0000\"}}', '2021-06-22 13:41:51', '2021-06-22 13:41:51'),
(408, 'default', 'edited', 106, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":103320},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"103320.0000\"}}', '2021-06-22 13:48:37', '2021-06-22 13:48:37'),
(409, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-06-22 14:12:13', '2021-06-22 14:12:13'),
(410, 'default', 'payment_edited', 93, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"0.4200\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"0.4200\"}}', '2021-06-22 14:46:35', '2021-06-22 14:46:35'),
(411, 'default', 'payment_edited', 61, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"6900.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"6900.0000\"}}', '2021-06-22 14:46:35', '2021-06-22 14:46:35'),
(412, 'default', 'payment_edited', 94, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"23000.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"23000.0000\"}}', '2021-06-22 14:46:35', '2021-06-22 14:46:35'),
(413, 'default', 'payment_edited', 95, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"23000.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"23000.0000\"}}', '2021-06-22 14:46:35', '2021-06-22 14:46:35'),
(414, 'default', 'payment_edited', 96, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"11500.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"11500.0000\"}}', '2021-06-22 14:46:35', '2021-06-22 14:46:35'),
(415, 'default', 'payment_edited', 97, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"6900.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"6900.0000\"}}', '2021-06-22 14:46:35', '2021-06-22 14:46:35'),
(416, 'default', 'payment_edited', 98, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"6900.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"6900.0000\"}}', '2021-06-22 14:46:35', '2021-06-22 14:46:35'),
(417, 'default', 'payment_edited', 99, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"6900.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"6900.0000\"}}', '2021-06-22 14:46:35', '2021-06-22 14:46:35'),
(418, 'default', 'payment_edited', 100, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"17250.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"17250.0000\"}}', '2021-06-22 14:46:35', '2021-06-22 14:46:35'),
(419, 'default', 'payment_edited', 63, 'App\\Transaction', 5, 'App\\User', '[]', '2021-06-22 14:46:35', '2021-06-22 14:46:35'),
(420, 'default', 'payment_edited', 93, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"0.4200\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"0.4200\"}}', '2021-06-22 14:52:37', '2021-06-22 14:52:37'),
(421, 'default', 'payment_edited', 61, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"6900.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"6900.0000\"}}', '2021-06-22 14:52:54', '2021-06-22 14:52:54'),
(422, 'default', 'added', 109, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":11500}}', '2021-06-22 15:15:48', '2021-06-22 15:15:48'),
(423, 'default', 'added', 110, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":127200}}', '2021-06-22 15:39:47', '2021-06-22 15:39:47'),
(424, 'default', 'edited', 67, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":0.1000000000000000055511151231257827021181583404541015625},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"50000.0000\"}}', '2021-06-22 15:43:15', '2021-06-22 15:43:15'),
(425, 'default', 'edited', 73, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":0.1000000000000000055511151231257827021181583404541015625},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"750000.0000\"}}', '2021-06-22 15:44:05', '2021-06-22 15:44:05'),
(426, 'default', 'added', 111, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":127200}}', '2021-06-22 15:48:17', '2021-06-22 15:48:17'),
(427, 'default', 'added', 112, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":45000}}', '2021-06-22 15:53:53', '2021-06-22 15:53:53'),
(428, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-06-23 01:02:48', '2021-06-23 01:02:48'),
(429, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-06-23 02:01:06', '2021-06-23 02:01:06'),
(430, 'default', 'payment_edited', 94, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"23000.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"23000.0000\"}}', '2021-06-23 02:39:12', '2021-06-23 02:39:12'),
(431, 'default', 'payment_edited', 95, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"23000.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"23000.0000\"}}', '2021-06-23 02:39:12', '2021-06-23 02:39:12'),
(432, 'default', 'payment_edited', 96, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"11500.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"11500.0000\"}}', '2021-06-23 02:39:12', '2021-06-23 02:39:12'),
(433, 'default', 'payment_edited', 97, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"6900.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"6900.0000\"}}', '2021-06-23 02:39:12', '2021-06-23 02:39:12'),
(434, 'default', 'payment_edited', 98, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"6900.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"6900.0000\"}}', '2021-06-23 02:39:12', '2021-06-23 02:39:12'),
(435, 'default', 'payment_edited', 99, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"6900.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"6900.0000\"}}', '2021-06-23 02:39:12', '2021-06-23 02:39:12'),
(436, 'default', 'payment_edited', 100, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"17250.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"17250.0000\"}}', '2021-06-23 02:39:12', '2021-06-23 02:39:12'),
(437, 'default', 'payment_edited', 63, 'App\\Transaction', 5, 'App\\User', '[]', '2021-06-23 02:39:12', '2021-06-23 02:39:12'),
(438, 'default', 'payment_edited', 93, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"0.4200\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"0.4200\"}}', '2021-06-23 02:43:02', '2021-06-23 02:43:02'),
(439, 'default', 'payment_edited', 61, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"6900.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"6900.0000\"}}', '2021-06-23 02:43:02', '2021-06-23 02:43:02'),
(440, 'default', 'payment_edited', 94, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"23000.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"23000.0000\"}}', '2021-06-23 02:43:02', '2021-06-23 02:43:02'),
(441, 'default', 'payment_edited', 95, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"23000.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"23000.0000\"}}', '2021-06-23 02:43:02', '2021-06-23 02:43:02'),
(442, 'default', 'payment_edited', 96, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"11500.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"11500.0000\"}}', '2021-06-23 02:43:02', '2021-06-23 02:43:02'),
(443, 'default', 'payment_edited', 97, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"6900.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"6900.0000\"}}', '2021-06-23 02:43:02', '2021-06-23 02:43:02'),
(444, 'default', 'payment_edited', 98, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"6900.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"6900.0000\"}}', '2021-06-23 02:43:02', '2021-06-23 02:43:02'),
(445, 'default', 'payment_edited', 99, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"6900.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"6900.0000\"}}', '2021-06-23 02:43:02', '2021-06-23 02:43:02'),
(446, 'default', 'payment_edited', 100, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"17250.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"17250.0000\"}}', '2021-06-23 02:43:02', '2021-06-23 02:43:02'),
(447, 'default', 'payment_edited', 63, 'App\\Transaction', 5, 'App\\User', '[]', '2021-06-23 02:43:02', '2021-06-23 02:43:02'),
(448, 'default', 'edited', 109, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":11500},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"11500.0000\"}}', '2021-06-23 02:47:40', '2021-06-23 02:47:40'),
(449, 'default', 'edited', 101, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":159600},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"159600.0000\"}}', '2021-06-23 02:52:00', '2021-06-23 02:52:00'),
(450, 'default', 'login', 6, 'App\\User', 6, 'App\\User', '[]', '2021-06-23 02:22:09', '2021-06-23 02:22:09'),
(451, 'default', 'edited', 109, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":11500},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"11500.0000\"}}', '2021-06-23 02:53:30', '2021-06-23 02:53:30'),
(452, 'default', 'edited', 101, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":159600},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"159600.0000\"}}', '2021-06-23 02:56:47', '2021-06-23 02:56:47'),
(453, 'default', 'login', 9, 'App\\User', 9, 'App\\User', '[]', '2021-06-23 02:36:09', '2021-06-23 02:36:09'),
(454, 'default', 'added', 33, 'App\\Contact', 6, 'App\\User', '[]', '2021-06-23 03:29:11', '2021-06-23 03:29:11'),
(455, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-06-23 03:11:25', '2021-06-23 03:11:25'),
(456, 'default', 'payment_edited', 93, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"0.4200\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"0.4200\"}}', '2021-06-23 03:57:29', '2021-06-23 03:57:29'),
(457, 'default', 'payment_edited', 61, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"6900.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"6900.0000\"}}', '2021-06-23 03:57:29', '2021-06-23 03:57:29'),
(458, 'default', 'payment_edited', 94, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"23000.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"23000.0000\"}}', '2021-06-23 03:57:29', '2021-06-23 03:57:29'),
(459, 'default', 'payment_edited', 95, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"23000.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"23000.0000\"}}', '2021-06-23 03:57:29', '2021-06-23 03:57:29'),
(460, 'default', 'payment_edited', 96, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"11500.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"11500.0000\"}}', '2021-06-23 03:57:29', '2021-06-23 03:57:29'),
(461, 'default', 'payment_edited', 97, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"6900.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"6900.0000\"}}', '2021-06-23 03:57:29', '2021-06-23 03:57:29'),
(462, 'default', 'payment_edited', 98, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"6900.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"6900.0000\"}}', '2021-06-23 03:57:29', '2021-06-23 03:57:29'),
(463, 'default', 'payment_edited', 99, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"6900.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"6900.0000\"}}', '2021-06-23 03:57:29', '2021-06-23 03:57:29');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(464, 'default', 'payment_edited', 100, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"17250.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"17250.0000\"}}', '2021-06-23 03:57:29', '2021-06-23 03:57:29'),
(465, 'default', 'payment_edited', 63, 'App\\Transaction', 1, 'App\\User', '[]', '2021-06-23 03:57:29', '2021-06-23 03:57:29'),
(466, 'default', 'edited', 1, 'App\\Contact', 1, 'App\\User', '[]', '2021-06-23 03:59:06', '2021-06-23 03:59:06'),
(467, 'default', 'added', 34, 'App\\Contact', 1, 'App\\User', '[]', '2021-06-23 04:05:50', '2021-06-23 04:05:50'),
(468, 'default', 'added', 113, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"ordered\",\"payment_status\":\"due\",\"final_total\":17000}}', '2021-06-23 04:08:02', '2021-06-23 04:08:02'),
(469, 'default', 'payment_edited', 113, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"ordered\",\"payment_status\":\"partial\",\"final_total\":\"17000.0000\"},\"old\":{\"type\":\"purchase\",\"status\":\"ordered\",\"payment_status\":\"partial\",\"final_total\":\"17000.0000\"}}', '2021-06-23 04:15:45', '2021-06-23 04:15:45'),
(470, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-06-23 04:05:52', '2021-06-23 04:05:52'),
(471, 'default', 'added', 114, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":6300}}', '2021-06-23 04:49:27', '2021-06-23 04:49:27'),
(472, 'default', 'added', 115, 'App\\Transaction', 9, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":6900}}', '2021-06-23 05:09:35', '2021-06-23 05:09:35'),
(473, 'default', 'edited', 115, 'App\\Transaction', 9, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":6900},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"6900.0000\"}}', '2021-06-23 05:13:44', '2021-06-23 05:13:44'),
(474, 'default', 'edited', 115, 'App\\Transaction', 9, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":6900},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"6900.0000\"}}', '2021-06-23 05:17:40', '2021-06-23 05:17:40'),
(475, 'default', 'added', 35, 'App\\Contact', 1, 'App\\User', '[]', '2021-06-23 07:20:21', '2021-06-23 07:20:21'),
(476, 'default', 'added', 116, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"packed\",\"payment_status\":\"due\",\"final_total\":8700}}', '2021-06-23 07:35:38', '2021-06-23 07:35:38'),
(477, 'default', 'login', 3, 'App\\User', 3, 'App\\User', '[]', '2021-06-23 08:11:29', '2021-06-23 08:11:29'),
(478, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-06-23 08:33:16', '2021-06-23 08:33:16'),
(479, 'default', 'payment_edited', 113, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"ordered\",\"payment_status\":\"partial\",\"final_total\":\"17000.0000\"},\"old\":{\"type\":\"purchase\",\"status\":\"ordered\",\"payment_status\":\"partial\",\"final_total\":\"17000.0000\"}}', '2021-06-23 09:39:52', '2021-06-23 09:39:52'),
(480, 'default', 'login', 6, 'App\\User', 6, 'App\\User', '[]', '2021-06-23 10:20:59', '2021-06-23 10:20:59'),
(481, 'default', 'added', 36, 'App\\Contact', 6, 'App\\User', '[]', '2021-06-23 10:54:18', '2021-06-23 10:54:18'),
(482, 'default', 'added', 37, 'App\\Contact', 6, 'App\\User', '[]', '2021-06-23 11:11:26', '2021-06-23 11:11:26'),
(483, 'default', 'added', 118, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":55597.5}}', '2021-06-23 11:25:58', '2021-06-23 11:25:58'),
(484, 'default', 'added', 119, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":71662.5}}', '2021-06-23 11:32:21', '2021-06-23 11:32:21'),
(485, 'default', 'added', 120, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":9922.5}}', '2021-06-23 11:37:26', '2021-06-23 11:37:26'),
(486, 'default', 'added', 121, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":4200}}', '2021-06-23 11:42:26', '2021-06-23 11:42:26'),
(487, 'default', 'edited', 121, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":2940},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"4200.0000\"}}', '2021-06-23 11:48:52', '2021-06-23 11:48:52'),
(488, 'default', 'edited', 121, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":2940},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":\"2940.0000\"}}', '2021-06-23 11:51:08', '2021-06-23 11:51:08'),
(489, 'default', 'edited', 121, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":2940},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":\"2940.0000\"}}', '2021-06-23 11:54:09', '2021-06-23 11:54:09'),
(490, 'default', 'edited', 121, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":2940},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":\"2940.0000\"}}', '2021-06-23 11:56:44', '2021-06-23 11:56:44'),
(491, 'default', 'login', 9, 'App\\User', 9, 'App\\User', '[]', '2021-06-23 11:53:08', '2021-06-23 11:53:08'),
(492, 'default', 'edited', 116, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"packed\",\"payment_status\":\"due\",\"final_total\":8700},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"packed\",\"payment_status\":\"due\",\"final_total\":\"8700.0000\"}}', '2021-06-23 12:32:03', '2021-06-23 12:32:03'),
(493, 'default', 'added', 122, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"ordered\",\"payment_status\":\"due\",\"final_total\":17000}}', '2021-06-23 12:59:46', '2021-06-23 12:59:46'),
(494, 'default', 'payment_edited', 113, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"ordered\",\"payment_status\":\"due\",\"final_total\":\"17000.0000\"},\"old\":{\"type\":\"purchase\",\"status\":\"ordered\",\"payment_status\":\"partial\",\"final_total\":\"17000.0000\"}}', '2021-06-23 13:02:39', '2021-06-23 13:02:39'),
(495, 'default', 'edited', 113, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"ordered\",\"payment_status\":\"due\",\"final_total\":0},\"old\":{\"type\":\"purchase\",\"status\":\"ordered\",\"payment_status\":\"due\",\"final_total\":\"17000.0000\"}}', '2021-06-23 13:03:51', '2021-06-23 13:03:51'),
(496, 'default', 'login', 6, 'App\\User', 6, 'App\\User', '[]', '2021-06-23 15:40:25', '2021-06-23 15:40:25'),
(497, 'default', 'added', 123, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":23625}}', '2021-06-23 16:20:15', '2021-06-23 16:20:15'),
(498, 'default', 'edited', 123, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":23625},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"23625.0000\"}}', '2021-06-23 16:22:10', '2021-06-23 16:22:10'),
(499, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-06-24 12:32:07', '2021-06-24 12:32:07'),
(500, 'default', 'payment_edited', 111, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"127200.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"127200.0000\"}}', '2021-06-24 13:05:54', '2021-06-24 13:05:54'),
(501, 'default', 'payment_edited', 112, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"45000.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"45000.0000\"}}', '2021-06-24 13:05:54', '2021-06-24 13:05:54'),
(502, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-06-24 15:19:51', '2021-06-24 15:19:51'),
(503, 'default', 'edited', 73, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":550000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"0.1000\"}}', '2021-06-24 16:21:43', '2021-06-24 16:21:43'),
(504, 'default', 'edited', 73, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":540000},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":\"550000.0000\"}}', '2021-06-24 16:25:58', '2021-06-24 16:25:58'),
(505, 'default', 'edited', 2, 'App\\Contact', 1, 'App\\User', '[]', '2021-06-24 17:04:45', '2021-06-24 17:04:45'),
(506, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-06-25 08:46:31', '2021-06-25 08:46:31'),
(507, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-06-25 08:51:28', '2021-06-25 08:51:28'),
(508, 'default', 'added', 131, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":450000}}', '2021-06-25 09:46:35', '2021-06-25 09:46:35'),
(509, 'default', 'added', 132, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":115500}}', '2021-06-25 09:57:28', '2021-06-25 09:57:28'),
(510, 'default', 'edited', 131, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":450000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"450000.0000\"}}', '2021-06-25 10:07:35', '2021-06-25 10:07:35'),
(511, 'default', 'edited', 74, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":7500},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"7500.0000\"}}', '2021-06-25 10:09:49', '2021-06-25 10:09:49'),
(512, 'default', 'edited', 74, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":7500},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"7500.0000\"}}', '2021-06-25 10:12:51', '2021-06-25 10:12:51'),
(513, 'default', 'edited', 112, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":45000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"45000.0000\"}}', '2021-06-25 10:14:18', '2021-06-25 10:14:18'),
(514, 'default', 'edited', 67, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"packed\",\"payment_status\":\"due\",\"final_total\":0.1000000000000000055511151231257827021181583404541015625},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"0.1000\"}}', '2021-06-25 10:14:50', '2021-06-25 10:14:50'),
(515, 'default', 'edited', 132, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"shipped\",\"payment_status\":\"due\",\"final_total\":115500},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"115500.0000\"}}', '2021-06-25 10:17:09', '2021-06-25 10:17:09'),
(516, 'default', 'edited', 116, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"ordered\",\"payment_status\":\"due\",\"final_total\":8700},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"packed\",\"payment_status\":\"due\",\"final_total\":\"8700.0000\"}}', '2021-06-25 10:28:58', '2021-06-25 10:28:58'),
(517, 'default', 'edited', 116, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":8700},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"ordered\",\"payment_status\":\"due\",\"final_total\":\"8700.0000\"}}', '2021-06-25 10:29:21', '2021-06-25 10:29:21'),
(518, 'default', 'logout', 5, 'App\\User', 5, 'App\\User', '[]', '2021-06-25 10:04:10', '2021-06-25 10:04:10'),
(519, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-06-25 10:04:26', '2021-06-25 10:04:26'),
(520, 'default', 'edited', 111, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":127200},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"127200.0000\"}}', '2021-06-25 10:39:16', '2021-06-25 10:39:16'),
(521, 'default', 'shipping_edited', 108, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"partial\",\"final_total\":\"103320.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"partial\",\"final_total\":\"103320.0000\"}}', '2021-06-25 10:39:22', '2021-06-25 10:39:22'),
(522, 'default', 'shipping_edited', 109, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"11500.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"11500.0000\"}}', '2021-06-25 10:39:51', '2021-06-25 10:39:51'),
(523, 'default', 'shipping_edited', 90, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"147600.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"147600.0000\"}}', '2021-06-25 10:42:46', '2021-06-25 10:42:46'),
(524, 'default', 'shipping_edited', 106, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"103320.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"103320.0000\"}}', '2021-06-25 10:43:56', '2021-06-25 10:43:56'),
(525, 'default', 'logout', 5, 'App\\User', 5, 'App\\User', '[]', '2021-06-25 10:17:37', '2021-06-25 10:17:37'),
(526, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-06-26 02:40:17', '2021-06-26 02:40:17'),
(527, 'default', 'edited', 73, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":540000},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":\"540000.0000\"}}', '2021-06-26 03:26:12', '2021-06-26 03:26:12'),
(528, 'default', 'edited', 73, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":540000},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":\"540000.0000\"}}', '2021-06-26 03:32:47', '2021-06-26 03:32:47'),
(529, 'default', 'edited', 73, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"shipped\",\"payment_status\":\"due\",\"final_total\":530000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"540000.0000\"}}', '2021-06-26 03:39:11', '2021-06-26 03:39:11'),
(530, 'default', 'login', 2, 'App\\User', 2, 'App\\User', '[]', '2021-06-26 03:10:51', '2021-06-26 03:10:51'),
(531, 'default', 'edited', 73, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"shipped\",\"payment_status\":\"due\",\"final_total\":530000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"shipped\",\"payment_status\":\"due\",\"final_total\":\"530000.0000\"}}', '2021-06-26 03:54:14', '2021-06-26 03:54:14'),
(532, 'default', 'edited', 73, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"shipped\",\"payment_status\":\"due\",\"final_total\":530000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"shipped\",\"payment_status\":\"due\",\"final_total\":\"530000.0000\"}}', '2021-06-26 03:54:31', '2021-06-26 03:54:31'),
(533, 'default', 'edited', 132, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":115500},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"shipped\",\"payment_status\":\"due\",\"final_total\":\"115500.0000\"}}', '2021-06-26 03:57:31', '2021-06-26 03:57:31'),
(534, 'default', 'edited', 73, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"shipped\",\"payment_status\":\"due\",\"final_total\":530000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"shipped\",\"payment_status\":\"due\",\"final_total\":\"530000.0000\"}}', '2021-06-26 04:00:02', '2021-06-26 04:00:02'),
(535, 'default', 'edited', 73, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"shipped\",\"payment_status\":\"due\",\"final_total\":530000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"shipped\",\"payment_status\":\"due\",\"final_total\":\"530000.0000\"}}', '2021-06-26 04:10:07', '2021-06-26 04:10:07'),
(536, 'default', 'login', 6, 'App\\User', 6, 'App\\User', '[]', '2021-06-26 04:01:41', '2021-06-26 04:01:41'),
(537, 'default', 'added', 38, 'App\\Contact', 6, 'App\\User', '[]', '2021-06-26 05:09:07', '2021-06-26 05:09:07'),
(538, 'default', 'added', 133, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":117200}}', '2021-06-26 05:13:27', '2021-06-26 05:13:27'),
(539, 'default', 'added', 134, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":110700}}', '2021-06-26 05:38:52', '2021-06-26 05:38:52'),
(540, 'default', 'added', 135, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":110700}}', '2021-06-26 05:51:54', '2021-06-26 05:51:54'),
(541, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-06-26 09:37:06', '2021-06-26 09:37:06'),
(542, 'default', 'added', 136, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":54600}}', '2021-06-26 11:44:06', '2021-06-26 11:44:06'),
(543, 'default', 'edited', 136, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":54600},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"54600.0000\"}}', '2021-06-26 11:45:36', '2021-06-26 11:45:36'),
(544, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-06-26 13:11:09', '2021-06-26 13:11:09'),
(545, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-06-26 14:55:21', '2021-06-26 14:55:21'),
(546, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-06-27 02:45:13', '2021-06-27 02:45:13'),
(547, 'default', 'login', 6, 'App\\User', 6, 'App\\User', '[]', '2021-06-27 04:07:04', '2021-06-27 04:07:04'),
(548, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-06-27 04:57:02', '2021-06-27 04:57:02'),
(549, 'default', 'edited', 23, 'App\\Contact', 1, 'App\\User', '[]', '2021-06-27 05:29:02', '2021-06-27 05:29:02'),
(550, 'default', 'added', 39, 'App\\Contact', 1, 'App\\User', '[]', '2021-06-27 05:32:12', '2021-06-27 05:32:12'),
(551, 'default', 'edited', 39, 'App\\Contact', 1, 'App\\User', '[]', '2021-06-27 05:33:30', '2021-06-27 05:33:30'),
(552, 'default', 'added', 138, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":2291940}}', '2021-06-27 05:59:54', '2021-06-27 05:59:54'),
(553, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-06-27 05:38:14', '2021-06-27 05:38:14'),
(554, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-06-27 05:40:27', '2021-06-27 05:40:27'),
(555, 'default', 'added', 139, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":2301390}}', '2021-06-27 06:28:51', '2021-06-27 06:28:51'),
(556, 'default', 'added', 140, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":110.25}}', '2021-06-27 09:04:37', '2021-06-27 09:04:37'),
(557, 'default', 'added', 141, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":504000}}', '2021-06-27 09:25:40', '2021-06-27 09:25:40'),
(558, 'default', 'added', 142, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":50400}}', '2021-06-27 09:30:31', '2021-06-27 09:30:31'),
(559, 'default', 'added', 143, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":613200}}', '2021-06-27 09:39:04', '2021-06-27 09:39:04'),
(560, 'default', 'added', 40, 'App\\Contact', 5, 'App\\User', '[]', '2021-06-27 10:24:41', '2021-06-27 10:24:41'),
(561, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-06-27 10:02:22', '2021-06-27 10:02:22'),
(562, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-06-27 13:21:14', '2021-06-27 13:21:14'),
(563, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-06-27 13:38:57', '2021-06-27 13:38:57'),
(564, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-06-27 13:43:32', '2021-06-27 13:43:32'),
(565, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-06-27 13:44:45', '2021-06-27 13:44:45'),
(566, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-06-27 16:06:09', '2021-06-27 16:06:09'),
(567, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-06-27 16:06:31', '2021-06-27 16:06:31'),
(568, 'default', 'login', 6, 'App\\User', 6, 'App\\User', '[]', '2021-06-28 02:43:44', '2021-06-28 02:43:44'),
(569, 'default', 'login', 9, 'App\\User', 9, 'App\\User', '[]', '2021-06-28 02:46:34', '2021-06-28 02:46:34'),
(570, 'default', 'login', 9, 'App\\User', 9, 'App\\User', '[]', '2021-06-28 02:59:23', '2021-06-28 02:59:23'),
(571, 'default', 'login', 9, 'App\\User', 9, 'App\\User', '[]', '2021-06-28 03:08:27', '2021-06-28 03:08:27'),
(572, 'default', 'added', 144, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":264215.7000000000116415321826934814453125}}', '2021-06-28 03:48:19', '2021-06-28 03:48:19'),
(573, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-06-28 03:31:42', '2021-06-28 03:31:42'),
(574, 'default', 'edited', 144, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":264215.7000000000116415321826934814453125},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"264215.7000\"}}', '2021-06-28 04:02:06', '2021-06-28 04:02:06'),
(575, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-06-28 03:34:28', '2021-06-28 03:34:28'),
(576, 'default', 'payment_edited', 144, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"264215.7000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"264215.7000\"}}', '2021-06-28 04:05:22', '2021-06-28 04:05:22'),
(577, 'default', 'edited', 9, 'App\\User', 1, 'App\\User', '[]', '2021-06-28 04:11:13', '2021-06-28 04:11:13'),
(578, 'default', 'edited', 65, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":5000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"5000.0000\"}}', '2021-06-28 04:17:30', '2021-06-28 04:17:30'),
(579, 'default', 'edited', 74, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":7500},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"7500.0000\"}}', '2021-06-28 04:19:24', '2021-06-28 04:19:24'),
(580, 'default', 'edited', 74, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":7500},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"7500.0000\"}}', '2021-06-28 04:20:34', '2021-06-28 04:20:34'),
(581, 'default', 'logout', 5, 'App\\User', 5, 'App\\User', '[]', '2021-06-28 05:09:37', '2021-06-28 05:09:37'),
(582, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-06-28 05:14:33', '2021-06-28 05:14:33'),
(583, 'default', 'login', 9, 'App\\User', 9, 'App\\User', '[]', '2021-06-28 05:55:45', '2021-06-28 05:55:45'),
(584, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-06-28 07:15:54', '2021-06-28 07:15:54'),
(585, 'default', 'added', 145, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":48000}}', '2021-06-28 11:19:40', '2021-06-28 11:19:40'),
(586, 'default', 'added', 146, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":48000}}', '2021-06-28 11:21:24', '2021-06-28 11:21:24'),
(587, 'default', 'edited', 91, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"cancelled\",\"payment_status\":\"due\",\"final_total\":6000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"6000.0000\"}}', '2021-06-28 11:29:39', '2021-06-28 11:29:39'),
(588, 'default', 'edited', 86, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"cancelled\",\"payment_status\":\"due\",\"final_total\":4000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"4000.0000\"}}', '2021-06-28 11:30:21', '2021-06-28 11:30:21'),
(589, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-06-29 02:35:02', '2021-06-29 02:35:02'),
(590, 'default', 'login', 6, 'App\\User', 6, 'App\\User', '[]', '2021-06-29 02:38:53', '2021-06-29 02:38:53'),
(591, 'default', 'added', 147, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":110700}}', '2021-06-29 03:24:54', '2021-06-29 03:24:54'),
(592, 'default', 'added', 148, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":110700}}', '2021-06-29 03:32:29', '2021-06-29 03:32:29'),
(593, 'default', 'added', 41, 'App\\Contact', 5, 'App\\User', '[]', '2021-06-29 11:43:15', '2021-06-29 11:43:15'),
(594, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-06-30 02:06:38', '2021-06-30 02:06:38'),
(595, 'default', 'login', 2, 'App\\User', 2, 'App\\User', '[]', '2021-06-30 03:34:22', '2021-06-30 03:34:22'),
(596, 'default', 'added', 149, 'App\\Transaction', 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":90000}}', '2021-06-30 04:10:57', '2021-06-30 04:10:57'),
(597, 'default', 'login', 6, 'App\\User', 6, 'App\\User', '[]', '2021-06-30 04:55:30', '2021-06-30 04:55:30'),
(598, 'default', 'added', 42, 'App\\Contact', 2, 'App\\User', '[]', '2021-06-30 06:29:52', '2021-06-30 06:29:52'),
(599, 'default', 'added', 150, 'App\\Transaction', 2, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":34680}}', '2021-06-30 06:36:07', '2021-06-30 06:36:07'),
(600, 'default', 'login', 6, 'App\\User', 6, 'App\\User', '[]', '2021-06-30 12:05:25', '2021-06-30 12:05:25'),
(601, 'default', 'added', 43, 'App\\Contact', 6, 'App\\User', '[]', '2021-06-30 12:40:15', '2021-06-30 12:40:15'),
(602, 'default', 'added', 151, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":46000}}', '2021-06-30 12:42:31', '2021-06-30 12:42:31'),
(603, 'default', 'added', 44, 'App\\Contact', 6, 'App\\User', '[]', '2021-06-30 13:58:31', '2021-06-30 13:58:31'),
(604, 'default', 'added', 152, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":40005}}', '2021-06-30 14:21:08', '2021-06-30 14:21:08'),
(605, 'default', 'added', 153, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":40005}}', '2021-06-30 14:30:16', '2021-06-30 14:30:16'),
(606, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-07-01 02:33:19', '2021-07-01 02:33:19'),
(607, 'default', 'edited', 151, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":46000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"46000.0000\"}}', '2021-07-01 03:08:49', '2021-07-01 03:08:49'),
(608, 'default', 'login', 9, 'App\\User', 9, 'App\\User', '[]', '2021-07-01 02:57:04', '2021-07-01 02:57:04'),
(609, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-07-01 02:57:31', '2021-07-01 02:57:31'),
(610, 'default', 'edited', 9, 'App\\User', 1, 'App\\User', '[]', '2021-07-01 03:29:40', '2021-07-01 03:29:40'),
(611, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-07-01 02:59:53', '2021-07-01 02:59:53'),
(612, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-07-01 03:01:22', '2021-07-01 03:01:22'),
(613, 'default', 'edited', 9, 'App\\User', 1, 'App\\User', '[]', '2021-07-01 03:32:58', '2021-07-01 03:32:58'),
(614, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-07-01 03:03:13', '2021-07-01 03:03:13'),
(615, 'default', 'login', 9, 'App\\User', 9, 'App\\User', '[]', '2021-07-01 03:03:48', '2021-07-01 03:03:48'),
(616, 'default', 'login', 2, 'App\\User', 2, 'App\\User', '[]', '2021-07-01 03:06:54', '2021-07-01 03:06:54'),
(617, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-07-01 04:33:16', '2021-07-01 04:33:16'),
(618, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-07-01 04:33:20', '2021-07-01 04:33:20'),
(619, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-07-01 04:33:27', '2021-07-01 04:33:27'),
(620, 'default', 'login', 6, 'App\\User', 6, 'App\\User', '[]', '2021-07-01 08:10:22', '2021-07-01 08:10:22'),
(621, 'default', 'added', 154, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":34800}}', '2021-07-01 08:54:10', '2021-07-01 08:54:10'),
(622, 'default', 'added', 45, 'App\\Contact', 5, 'App\\User', '[]', '2021-07-01 09:32:12', '2021-07-01 09:32:12'),
(623, 'default', 'added', 155, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":23000}}', '2021-07-01 09:55:41', '2021-07-01 09:55:41'),
(624, 'default', 'edited', 155, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":23000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"23000.0000\"}}', '2021-07-01 09:57:47', '2021-07-01 09:57:47'),
(625, 'default', 'edited', 155, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":23000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"23000.0000\"}}', '2021-07-01 10:06:31', '2021-07-01 10:06:31'),
(626, 'default', 'edited', 151, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":46000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"46000.0000\"}}', '2021-07-01 10:14:04', '2021-07-01 10:14:04'),
(627, 'default', 'edited', 155, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":23000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"23000.0000\"}}', '2021-07-01 10:15:11', '2021-07-01 10:15:11'),
(628, 'default', 'edited', 155, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":23000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"23000.0000\"}}', '2021-07-01 10:18:04', '2021-07-01 10:18:04'),
(629, 'default', 'edited', 155, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":58000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"23000.0000\"}}', '2021-07-01 10:20:00', '2021-07-01 10:20:00'),
(630, 'default', 'added', 156, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":38000}}', '2021-07-01 10:22:54', '2021-07-01 10:22:54'),
(631, 'default', 'edited', 156, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":38000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"38000.0000\"}}', '2021-07-01 10:23:32', '2021-07-01 10:23:32'),
(632, 'default', 'edited', 156, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":38000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"38000.0000\"}}', '2021-07-01 10:24:32', '2021-07-01 10:24:32'),
(633, 'default', 'added', 157, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":42000}}', '2021-07-01 10:35:36', '2021-07-01 10:35:36'),
(634, 'default', 'edited', 157, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"payment_status\":\"due\",\"final_total\":42000},\"old\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":\"42000.0000\"}}', '2021-07-01 10:36:14', '2021-07-01 10:36:14'),
(635, 'default', 'added', 158, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":400000}}', '2021-07-01 11:01:46', '2021-07-01 11:01:46'),
(636, 'default', 'added', 159, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":21000}}', '2021-07-01 11:01:49', '2021-07-01 11:01:49'),
(637, 'default', 'edited', 159, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":21000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"21000.0000\"}}', '2021-07-01 11:09:14', '2021-07-01 11:09:14'),
(638, 'default', 'payment_edited', 65, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"5000.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"5000.0000\"}}', '2021-07-01 11:15:13', '2021-07-01 11:15:13'),
(639, 'default', 'payment_edited', 74, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"7500.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"7500.0000\"}}', '2021-07-01 11:15:13', '2021-07-01 11:15:13'),
(640, 'default', 'payment_edited', 75, 'App\\Transaction', 5, 'App\\User', '[]', '2021-07-01 11:15:13', '2021-07-01 11:15:13'),
(641, 'default', 'payment_edited', 158, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"partial\",\"final_total\":\"400000.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"400000.0000\"}}', '2021-07-01 11:15:13', '2021-07-01 11:15:13'),
(642, 'default', 'payment_edited', 65, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"5000.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"5000.0000\"}}', '2021-07-01 11:24:53', '2021-07-01 11:24:53'),
(643, 'default', 'payment_edited', 74, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"7500.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"7500.0000\"}}', '2021-07-01 11:24:53', '2021-07-01 11:24:53'),
(644, 'default', 'payment_edited', 75, 'App\\Transaction', 5, 'App\\User', '[]', '2021-07-01 11:24:53', '2021-07-01 11:24:53'),
(645, 'default', 'payment_edited', 158, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"400000.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"partial\",\"final_total\":\"400000.0000\"}}', '2021-07-01 11:24:53', '2021-07-01 11:24:53'),
(646, 'default', 'payment_edited', 158, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"partial\",\"final_total\":\"400000.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"400000.0000\"}}', '2021-07-01 11:26:04', '2021-07-01 11:26:04'),
(647, 'default', 'added', 160, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":21000}}', '2021-07-01 11:34:57', '2021-07-01 11:34:57'),
(648, 'default', 'added', 161, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":21000}}', '2021-07-01 11:37:51', '2021-07-01 11:37:51'),
(649, 'default', 'edited', 158, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"partial\",\"final_total\":400000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"partial\",\"final_total\":\"400000.0000\"}}', '2021-07-01 11:59:24', '2021-07-01 11:59:24'),
(650, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-07-03 03:07:07', '2021-07-03 03:07:07'),
(651, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-07-03 03:08:06', '2021-07-03 03:08:06'),
(652, 'default', 'login', 6, 'App\\User', 6, 'App\\User', '[]', '2021-07-03 03:29:33', '2021-07-03 03:29:33'),
(653, 'default', 'edited', 8, 'App\\Contact', 1, 'App\\User', '[]', '2021-07-03 04:15:43', '2021-07-03 04:15:43'),
(654, 'default', 'added', 162, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":159500}}', '2021-07-03 04:18:24', '2021-07-03 04:18:24'),
(655, 'default', 'added', 163, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":210000}}', '2021-07-03 04:18:32', '2021-07-03 04:18:32'),
(656, 'default', 'edited', 144, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":258772.5},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"264215.7000\"}}', '2021-07-03 04:20:15', '2021-07-03 04:20:15'),
(657, 'default', 'edited', 163, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":210000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"210000.0000\"}}', '2021-07-03 04:21:39', '2021-07-03 04:21:39'),
(658, 'default', 'added', 164, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":210000}}', '2021-07-03 04:23:19', '2021-07-03 04:23:19'),
(659, 'default', 'added', 165, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"final_total\":49455}}', '2021-07-03 04:28:36', '2021-07-03 04:28:36'),
(660, 'default', 'edited', 165, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell_return\",\"payment_status\":\"due\",\"final_total\":54600},\"old\":{\"type\":\"sell_return\",\"payment_status\":\"due\",\"final_total\":\"49455.0000\"}}', '2021-07-03 04:31:41', '2021-07-03 04:31:41'),
(661, 'default', 'edited', 55, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":7000},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":\"7000.0000\"}}', '2021-07-03 05:53:44', '2021-07-03 05:53:44'),
(662, 'default', 'added', 166, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":49250}}', '2021-07-03 05:56:54', '2021-07-03 05:56:54'),
(663, 'default', 'payment_edited', 166, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"49250.0000\"},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":\"49250.0000\"}}', '2021-07-03 06:00:55', '2021-07-03 06:00:55'),
(664, 'default', 'added', 167, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":21000}}', '2021-07-03 06:22:36', '2021-07-03 06:22:36'),
(665, 'default', 'added', 168, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":350000}}', '2021-07-03 06:29:10', '2021-07-03 06:29:10'),
(666, 'default', 'payment_edited', 167, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"21000.0000\"},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":\"21000.0000\"}}', '2021-07-03 06:32:27', '2021-07-03 06:32:27'),
(667, 'default', 'added', 169, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":7000}}', '2021-07-03 06:36:45', '2021-07-03 06:36:45'),
(668, 'default', 'added', 170, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":31200}}', '2021-07-03 06:48:57', '2021-07-03 06:48:57'),
(669, 'default', 'payment_edited', 39, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"partial\",\"final_total\":\"350000.0000\"},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"partial\",\"final_total\":\"350000.0000\"}}', '2021-07-03 07:09:31', '2021-07-03 07:09:31'),
(670, 'default', 'added', 171, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"pending\",\"payment_status\":\"due\",\"final_total\":0}}', '2021-07-03 07:14:51', '2021-07-03 07:14:51'),
(671, 'default', 'edited', 168, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"pending\",\"payment_status\":\"due\",\"final_total\":350000},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":\"350000.0000\"}}', '2021-07-03 08:51:07', '2021-07-03 08:51:07'),
(672, 'default', 'added', 46, 'App\\Contact', 5, 'App\\User', '[]', '2021-07-03 09:06:23', '2021-07-03 09:06:23'),
(673, 'default', 'added', 172, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":46200}}', '2021-07-03 09:09:18', '2021-07-03 09:09:18'),
(674, 'default', 'payment_edited', 172, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"partial\",\"final_total\":\"46200.0000\"},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":\"46200.0000\"}}', '2021-07-03 09:11:44', '2021-07-03 09:11:44'),
(675, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-07-04 03:13:01', '2021-07-04 03:13:01'),
(676, 'default', 'edited', 171, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"pending\",\"payment_status\":\"due\",\"final_total\":60000},\"old\":{\"type\":\"purchase\",\"status\":\"pending\",\"payment_status\":\"paid\",\"final_total\":\"0.0000\"}}', '2021-07-04 03:49:15', '2021-07-04 03:49:15'),
(677, 'default', 'login', 2, 'App\\User', 2, 'App\\User', '[]', '2021-07-04 03:19:55', '2021-07-04 03:19:55'),
(678, 'default', 'edited', 3, 'App\\User', 1, 'App\\User', '[]', '2021-07-04 04:16:02', '2021-07-04 04:16:02'),
(679, 'default', 'login', 6, 'App\\User', 6, 'App\\User', '[]', '2021-07-04 04:27:35', '2021-07-04 04:27:35'),
(680, 'default', 'added', 173, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":37275}}', '2021-07-04 05:15:12', '2021-07-04 05:15:12');
INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_id`, `subject_type`, `causer_id`, `causer_type`, `properties`, `created_at`, `updated_at`) VALUES
(681, 'default', 'created', 2, 'App\\DocumentAndNote', 1, 'App\\User', '{\"attributes\":{\"business_id\":1,\"notable_id\":33,\"notable_type\":\"App\\\\Contact\",\"heading\":\"CV\",\"description\":\"<p>jfhrhjghkrjgdnfbrmn<\\/p>\",\"is_private\":0,\"created_by\":1,\"created_at\":\"2021-07-04 11:51:06\",\"updated_at\":\"2021-07-04 11:51:06\"}}', '2021-07-04 05:51:06', '2021-07-04 05:51:06'),
(682, 'default', 'deleted', 2, 'App\\DocumentAndNote', 1, 'App\\User', '{\"attributes\":{\"business_id\":1,\"notable_id\":33,\"notable_type\":\"App\\\\Contact\",\"heading\":\"CV\",\"description\":\"<p>jfhrhjghkrjgdnfbrmn<\\/p>\",\"is_private\":0,\"created_by\":1,\"created_at\":\"2021-07-04 11:51:06\",\"updated_at\":\"2021-07-04 11:51:06\"}}', '2021-07-04 05:51:45', '2021-07-04 05:51:45'),
(683, 'default', 'created', 3, 'App\\DocumentAndNote', 1, 'App\\User', '{\"attributes\":{\"business_id\":1,\"notable_id\":33,\"notable_type\":\"App\\\\Contact\",\"heading\":\"Due Collections Report\",\"description\":null,\"is_private\":0,\"created_by\":1,\"created_at\":\"2021-07-04 11:52:16\",\"updated_at\":\"2021-07-04 11:52:16\"}}', '2021-07-04 05:52:16', '2021-07-04 05:52:16'),
(684, 'default', 'created', 4, 'App\\DocumentAndNote', 2, 'App\\User', '{\"attributes\":{\"business_id\":1,\"notable_id\":33,\"notable_type\":\"App\\\\Contact\",\"heading\":\"Due\",\"description\":\"<p>Taka&nbsp;<\\/p>\",\"is_private\":0,\"created_by\":2,\"created_at\":\"2021-07-04 12:02:55\",\"updated_at\":\"2021-07-04 12:02:55\"}}', '2021-07-04 06:02:55', '2021-07-04 06:02:55'),
(685, 'default', 'deleted', 3, 'App\\DocumentAndNote', 1, 'App\\User', '{\"attributes\":{\"business_id\":1,\"notable_id\":33,\"notable_type\":\"App\\\\Contact\",\"heading\":\"Due Collections Report\",\"description\":null,\"is_private\":1,\"created_by\":1,\"created_at\":\"2021-07-04 11:52:16\",\"updated_at\":\"2021-07-04 12:00:04\"}}', '2021-07-04 06:03:44', '2021-07-04 06:03:44'),
(686, 'default', 'deleted', 4, 'App\\DocumentAndNote', 2, 'App\\User', '{\"attributes\":{\"business_id\":1,\"notable_id\":33,\"notable_type\":\"App\\\\Contact\",\"heading\":\"Due\",\"description\":\"<p>Taka&nbsp;<\\/p>\",\"is_private\":0,\"created_by\":2,\"created_at\":\"2021-07-04 12:02:55\",\"updated_at\":\"2021-07-04 12:02:55\"}}', '2021-07-04 06:04:13', '2021-07-04 06:04:13'),
(687, 'default', 'created', 5, 'App\\DocumentAndNote', 2, 'App\\User', '{\"attributes\":{\"business_id\":1,\"notable_id\":33,\"notable_type\":\"App\\\\Contact\",\"heading\":\"Due Collection\",\"description\":null,\"is_private\":0,\"created_by\":2,\"created_at\":\"2021-07-04 12:04:53\",\"updated_at\":\"2021-07-04 12:04:53\"}}', '2021-07-04 06:04:53', '2021-07-04 06:04:53'),
(688, 'default', 'edited', 42, 'App\\Contact', 1, 'App\\User', '[]', '2021-07-04 06:09:01', '2021-07-04 06:09:01'),
(689, 'default', 'created', 6, 'App\\DocumentAndNote', 2, 'App\\User', '{\"attributes\":{\"business_id\":1,\"notable_id\":18,\"notable_type\":\"App\\\\Contact\",\"heading\":\"Due Collection Report\",\"description\":null,\"is_private\":0,\"created_by\":2,\"created_at\":\"2021-07-04 12:21:14\",\"updated_at\":\"2021-07-04 12:21:14\"}}', '2021-07-04 06:21:14', '2021-07-04 06:21:14'),
(690, 'default', 'added', 47, 'App\\Contact', 2, 'App\\User', '[]', '2021-07-04 06:49:55', '2021-07-04 06:49:55'),
(691, 'default', 'added', 48, 'App\\Contact', 2, 'App\\User', '[]', '2021-07-04 06:55:13', '2021-07-04 06:55:13'),
(692, 'default', 'added', 49, 'App\\Contact', 6, 'App\\User', '[]', '2021-07-04 06:55:19', '2021-07-04 06:55:19'),
(693, 'default', 'added', 50, 'App\\Contact', 2, 'App\\User', '[]', '2021-07-04 07:08:29', '2021-07-04 07:08:29'),
(694, 'default', 'edited', 48, 'App\\Contact', 1, 'App\\User', '[]', '2021-07-04 07:40:30', '2021-07-04 07:40:30'),
(695, 'default', 'added', 174, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":140000}}', '2021-07-04 07:45:42', '2021-07-04 07:45:42'),
(696, 'default', 'edited', 46, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":477750},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"648375.0000\"}}', '2021-07-04 07:51:57', '2021-07-04 07:51:57'),
(697, 'default', 'added', 51, 'App\\Contact', 2, 'App\\User', '[]', '2021-07-04 07:57:48', '2021-07-04 07:57:48'),
(698, 'default', 'edited', 22, 'App\\Contact', 1, 'App\\User', '[]', '2021-07-04 07:59:42', '2021-07-04 07:59:42'),
(699, 'default', 'edited', 51, 'App\\Contact', 1, 'App\\User', '[]', '2021-07-04 08:10:03', '2021-07-04 08:10:03'),
(700, 'default', 'added', 52, 'App\\Contact', 2, 'App\\User', '[]', '2021-07-04 08:16:33', '2021-07-04 08:16:33'),
(701, 'default', 'edited', 38, 'App\\Contact', 1, 'App\\User', '[]', '2021-07-04 08:16:35', '2021-07-04 08:16:35'),
(702, 'default', 'edited', 38, 'App\\Contact', 1, 'App\\User', '[]', '2021-07-04 08:17:42', '2021-07-04 08:17:42'),
(703, 'default', 'added', 53, 'App\\Contact', 1, 'App\\User', '[]', '2021-07-04 08:22:51', '2021-07-04 08:22:51'),
(704, 'default', 'added', 54, 'App\\Contact', 2, 'App\\User', '[]', '2021-07-04 08:23:58', '2021-07-04 08:23:58'),
(705, 'default', 'added', 55, 'App\\Contact', 2, 'App\\User', '[]', '2021-07-04 08:30:21', '2021-07-04 08:30:21'),
(706, 'default', 'added', 56, 'App\\Contact', 1, 'App\\User', '[]', '2021-07-04 08:31:32', '2021-07-04 08:31:32'),
(707, 'default', 'added', 176, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":170000}}', '2021-07-04 08:35:43', '2021-07-04 08:35:43'),
(708, 'default', 'added', 57, 'App\\Contact', 6, 'App\\User', '[]', '2021-07-04 08:45:42', '2021-07-04 08:45:42'),
(709, 'default', 'added', 58, 'App\\Contact', 2, 'App\\User', '[]', '2021-07-04 08:46:11', '2021-07-04 08:46:11'),
(710, 'default', 'added', 177, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":22050}}', '2021-07-04 08:55:29', '2021-07-04 08:55:29'),
(711, 'default', 'added', 59, 'App\\Contact', 2, 'App\\User', '[]', '2021-07-04 08:57:50', '2021-07-04 08:57:50'),
(712, 'default', 'added', 60, 'App\\Contact', 2, 'App\\User', '[]', '2021-07-04 09:03:44', '2021-07-04 09:03:44'),
(713, 'default', 'added', 61, 'App\\Contact', 2, 'App\\User', '[]', '2021-07-04 09:12:58', '2021-07-04 09:12:58'),
(714, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-07-04 08:49:02', '2021-07-04 08:49:02'),
(715, 'default', 'added', 178, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":35500}}', '2021-07-04 09:40:28', '2021-07-04 09:40:28'),
(716, 'default', 'added', 62, 'App\\Contact', 2, 'App\\User', '[]', '2021-07-04 09:55:35', '2021-07-04 09:55:35'),
(717, 'default', 'edited', 178, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":38800},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"35500.0000\"}}', '2021-07-04 09:57:15', '2021-07-04 09:57:15'),
(718, 'default', 'added', 179, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":40740}}', '2021-07-04 10:05:02', '2021-07-04 10:05:02'),
(719, 'default', 'added', 63, 'App\\Contact', 2, 'App\\User', '[]', '2021-07-04 10:06:32', '2021-07-04 10:06:32'),
(720, 'default', 'added', 64, 'App\\Contact', 2, 'App\\User', '[]', '2021-07-04 10:10:49', '2021-07-04 10:10:49'),
(721, 'default', 'added', 65, 'App\\Contact', 2, 'App\\User', '[]', '2021-07-04 10:15:03', '2021-07-04 10:15:03'),
(722, 'default', 'login', 3, 'App\\User', 3, 'App\\User', '[]', '2021-07-04 09:50:41', '2021-07-04 09:50:41'),
(723, 'default', 'edited', 11, 'App\\Contact', 3, 'App\\User', '[]', '2021-07-04 10:23:41', '2021-07-04 10:23:41'),
(724, 'default', 'added', 66, 'App\\Contact', 2, 'App\\User', '[]', '2021-07-04 10:24:51', '2021-07-04 10:24:51'),
(725, 'default', 'created', 7, 'App\\DocumentAndNote', 3, 'App\\User', '{\"attributes\":{\"business_id\":1,\"notable_id\":11,\"notable_type\":\"App\\\\Contact\",\"heading\":\"Opening Balance Leddger\",\"description\":\"<p>1. Due of Limburg Energy = 158,592\\/-<\\/p>\\r\\n<p>2. MWM Recondition Generator = 759540\\/-&nbsp;<\\/p>\",\"is_private\":0,\"created_by\":3,\"created_at\":\"2021-07-04 16:29:06\",\"updated_at\":\"2021-07-04 16:29:06\"}}', '2021-07-04 10:29:06', '2021-07-04 10:29:06'),
(726, 'default', 'added', 182, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":36000}}', '2021-07-04 10:35:36', '2021-07-04 10:35:36'),
(727, 'default', 'payment_edited', 182, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"36000.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"36000.0000\"}}', '2021-07-04 10:37:04', '2021-07-04 10:37:04'),
(728, 'default', 'edited', 91, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":6000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"cancelled\",\"payment_status\":\"due\",\"final_total\":\"6000.0000\"}}', '2021-07-04 10:37:47', '2021-07-04 10:37:47'),
(729, 'default', 'added', 183, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":25000}}', '2021-07-04 10:46:00', '2021-07-04 10:46:00'),
(730, 'default', 'edited', 182, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":36000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"36000.0000\"}}', '2021-07-04 10:53:42', '2021-07-04 10:53:42'),
(731, 'default', 'edited', 154, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":34800},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"34800.0000\"}}', '2021-07-04 10:55:55', '2021-07-04 10:55:55'),
(732, 'default', 'added', 185, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":17000}}', '2021-07-04 11:00:04', '2021-07-04 11:00:04'),
(733, 'default', 'added', 186, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":8500}}', '2021-07-04 11:04:03', '2021-07-04 11:04:03'),
(734, 'default', 'added', 187, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":8500}}', '2021-07-04 11:06:25', '2021-07-04 11:06:25'),
(735, 'default', 'edited', 183, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":25000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"25000.0000\"}}', '2021-07-04 11:07:24', '2021-07-04 11:07:24'),
(736, 'default', 'added', 188, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":14000}}', '2021-07-04 11:08:31', '2021-07-04 11:08:31'),
(737, 'default', 'payment_edited', 187, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"8500.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"8500.0000\"}}', '2021-07-04 11:11:37', '2021-07-04 11:11:37'),
(738, 'default', 'edited', 154, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":34800},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"34800.0000\"}}', '2021-07-04 11:14:58', '2021-07-04 11:14:58'),
(739, 'default', 'added', 189, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":8500}}', '2021-07-04 11:18:15', '2021-07-04 11:18:15'),
(740, 'default', 'added', 190, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":16000}}', '2021-07-04 11:19:54', '2021-07-04 11:19:54'),
(741, 'default', 'added', 192, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":29925}}', '2021-07-04 11:24:08', '2021-07-04 11:24:08'),
(742, 'default', 'added', 193, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":25000}}', '2021-07-04 11:25:55', '2021-07-04 11:25:55'),
(743, 'default', 'edited', 161, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":21000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"21000.0000\"}}', '2021-07-04 11:33:08', '2021-07-04 11:33:08'),
(744, 'default', 'payment_edited', 34, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"16000.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"16000.0000\"}}', '2021-07-04 11:36:17', '2021-07-04 11:36:17'),
(745, 'default', 'added', 194, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"payment_status\":\"due\"}}', '2021-07-04 11:46:30', '2021-07-04 11:46:30'),
(746, 'default', 'payment_edited', 76, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"16000.0000\"},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":\"16000.0000\"}}', '2021-07-04 12:04:33', '2021-07-04 12:04:33'),
(747, 'default', 'payment_edited', 78, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"paid\",\"final_total\":\"28000.0000\"},\"old\":{\"type\":\"purchase\",\"status\":\"received\",\"payment_status\":\"due\",\"final_total\":\"28000.0000\"}}', '2021-07-04 12:05:11', '2021-07-04 12:05:11'),
(748, 'default', 'edited', 161, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":21000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"due\",\"final_total\":\"21000.0000\"}}', '2021-07-04 12:10:50', '2021-07-04 12:10:50'),
(749, 'default', 'payment_edited', 104, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"payment_status\":\"paid\"},\"old\":{\"payment_status\":\"due\"}}', '2021-07-04 12:33:25', '2021-07-04 12:33:25'),
(750, 'default', 'added', 195, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"payment_status\":\"due\"}}', '2021-07-04 12:36:44', '2021-07-04 12:36:44'),
(751, 'default', 'added', 196, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"payment_status\":\"due\"}}', '2021-07-04 12:42:16', '2021-07-04 12:42:16'),
(752, 'default', 'edited', 49, 'App\\Contact', 1, 'App\\User', '[]', '2021-07-04 12:51:09', '2021-07-04 12:51:09'),
(753, 'default', 'edited', 57, 'App\\Contact', 1, 'App\\User', '[]', '2021-07-04 12:55:36', '2021-07-04 12:55:36'),
(754, 'default', 'login', 6, 'App\\User', 6, 'App\\User', '[]', '2021-07-05 03:41:39', '2021-07-05 03:41:39'),
(755, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-07-05 09:52:43', '2021-07-05 09:52:43'),
(756, 'default', 'edited', 50, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":25000},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"26250.0000\"}}', '2021-07-05 10:25:10', '2021-07-05 10:25:10'),
(757, 'default', 'added', 199, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":31006.5}}', '2021-07-05 10:56:03', '2021-07-05 10:56:03'),
(758, 'default', 'added', 200, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":466200}}', '2021-07-05 11:18:26', '2021-07-05 11:18:26'),
(759, 'default', 'added', 201, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":51800}}', '2021-07-05 11:32:10', '2021-07-05 11:32:10'),
(760, 'default', 'added', 203, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":20000}}', '2021-07-05 11:47:44', '2021-07-05 11:47:44'),
(761, 'default', 'added', 204, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":51000}}', '2021-07-05 11:58:29', '2021-07-05 11:58:29'),
(762, 'default', 'added', 206, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":16275}}', '2021-07-05 12:08:47', '2021-07-05 12:08:47'),
(763, 'default', 'added', 207, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":16000}}', '2021-07-05 12:12:46', '2021-07-05 12:12:46'),
(764, 'default', 'added', 209, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":1260000}}', '2021-07-05 12:22:31', '2021-07-05 12:22:31'),
(765, 'default', 'edited', 209, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":126500},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"payment_status\":\"paid\",\"final_total\":\"1260000.0000\"}}', '2021-07-05 12:25:23', '2021-07-05 12:25:23'),
(766, 'default', 'login', 6, 'App\\User', 6, 'App\\User', '[]', '2021-07-05 19:01:30', '2021-07-05 19:01:30'),
(767, 'default', 'login', 6, 'App\\User', 6, 'App\\User', '[]', '2021-07-06 03:01:34', '2021-07-06 03:01:34'),
(768, 'default', 'login', 9, 'App\\User', 9, 'App\\User', '[]', '2021-07-06 03:45:18', '2021-07-06 03:45:18'),
(769, 'default', 'login', 5, 'App\\User', 5, 'App\\User', '[]', '2021-07-06 03:54:12', '2021-07-06 03:54:12'),
(770, 'default', 'login', 6, 'App\\User', 6, 'App\\User', '[]', '2021-07-06 09:09:04', '2021-07-06 09:09:04'),
(771, 'default', 'added', 67, 'App\\Contact', 6, 'App\\User', '[]', '2021-07-06 09:58:00', '2021-07-06 09:58:00'),
(772, 'default', 'added', 210, 'App\\Transaction', 6, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"draft\",\"sub_status\":\"quotation\",\"final_total\":130200}}', '2021-07-06 10:13:18', '2021-07-06 10:13:18'),
(773, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-07-06 10:07:54', '2021-07-06 10:07:54'),
(774, 'default', 'edited', 41, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":150360},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"148680.0000\"}}', '2021-07-06 10:41:08', '2021-07-06 10:41:08'),
(775, 'default', 'edited', 41, 'App\\Transaction', 1, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":150360},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"150360.0000\"}}', '2021-07-06 10:42:28', '2021-07-06 10:42:28'),
(776, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-07-06 10:16:00', '2021-07-06 10:16:00'),
(777, 'default', 'payment_edited', 41, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"paid\",\"final_total\":\"150360.0000\"},\"old\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":\"150360.0000\"}}', '2021-07-06 11:00:00', '2021-07-06 11:00:00'),
(778, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-07-06 10:34:27', '2021-07-06 10:34:27'),
(779, 'default', 'logout', 1, 'App\\User', 1, 'App\\User', '[]', '2021-07-06 10:37:58', '2021-07-06 10:37:58'),
(780, 'default', 'added', 212, 'App\\Transaction', 5, 'App\\User', '{\"attributes\":{\"type\":\"sell\",\"status\":\"final\",\"shipping_status\":\"delivered\",\"payment_status\":\"due\",\"final_total\":30000}}', '2021-07-06 11:09:24', '2021-07-06 11:09:24'),
(781, 'default', 'login', 1, 'App\\User', 1, 'App\\User', '[]', '2021-07-06 11:01:51', '2021-07-06 11:01:51');

-- --------------------------------------------------------

--
-- Table structure for table `barcodes`
--

CREATE TABLE `barcodes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `width` double(22,4) DEFAULT NULL,
  `height` double(22,4) DEFAULT NULL,
  `paper_width` double(22,4) DEFAULT NULL,
  `paper_height` double(22,4) DEFAULT NULL,
  `top_margin` double(22,4) DEFAULT NULL,
  `left_margin` double(22,4) DEFAULT NULL,
  `row_distance` double(22,4) DEFAULT NULL,
  `col_distance` double(22,4) DEFAULT NULL,
  `stickers_in_one_row` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_continuous` tinyint(1) NOT NULL DEFAULT '0',
  `stickers_in_one_sheet` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `barcodes`
--

INSERT INTO `barcodes` (`id`, `name`, `description`, `width`, `height`, `paper_width`, `paper_height`, `top_margin`, `left_margin`, `row_distance`, `col_distance`, `stickers_in_one_row`, `is_default`, `is_continuous`, `stickers_in_one_sheet`, `business_id`, `created_at`, `updated_at`) VALUES
(1, '20 Labels per Sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 4\" x 1\", Labels per sheet: 20', 4.0000, 1.0000, 8.5000, 11.0000, 0.5000, 0.1250, 0.0000, 0.1875, 2, 0, 0, 20, NULL, '2017-12-18 05:13:44', '2017-12-18 05:13:44'),
(2, '30 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2.625\" x 1\", Labels per sheet: 30', 2.6250, 1.0000, 8.5000, 11.0000, 0.5000, 0.1880, 0.0000, 0.1250, 3, 0, 0, 30, NULL, '2017-12-18 05:04:39', '2017-12-18 05:10:40'),
(3, '32 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2\" x 1.25\", Labels per sheet: 32', 2.0000, 1.2500, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 32, NULL, '2017-12-18 04:55:40', '2017-12-18 04:55:40'),
(4, '40 Labels per sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 2\" x 1\", Labels per sheet: 40', 2.0000, 1.0000, 8.5000, 11.0000, 0.5000, 0.2500, 0.0000, 0.0000, 4, 0, 0, 40, NULL, '2017-12-18 04:58:40', '2017-12-18 04:58:40'),
(5, '50 Labels per Sheet', 'Sheet Size: 8.5\" x 11\", Label Size: 1.5\" x 1\", Labels per sheet: 50', 1.5000, 1.0000, 8.5000, 11.0000, 0.5000, 0.5000, 0.0000, 0.0000, 5, 0, 0, 50, NULL, '2017-12-18 04:51:10', '2017-12-18 04:51:10'),
(6, 'Continuous Rolls - 31.75mm x 25.4mm', 'Label Size: 31.75mm x 25.4mm, Gap: 3.18mm', 1.2500, 1.0000, 1.2500, 0.0000, 0.1250, 0.0000, 0.1250, 0.0000, 1, 0, 1, NULL, NULL, '2017-12-18 04:51:10', '2017-12-18 04:51:10');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(10) UNSIGNED NOT NULL,
  `contact_id` int(10) UNSIGNED NOT NULL,
  `waiter_id` int(10) UNSIGNED DEFAULT NULL,
  `table_id` int(10) UNSIGNED DEFAULT NULL,
  `correspondent_id` int(11) DEFAULT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `booking_start` datetime NOT NULL,
  `booking_end` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `booking_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `booking_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `business_id`, `name`, `description`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'MWM', 'GAS Generator', 1, NULL, '2021-05-08 13:29:56', '2021-06-23 07:51:27'),
(2, 1, 'AKSA', 'Diesel Generator', 1, NULL, '2021-05-08 13:38:52', '2021-05-08 13:38:52'),
(3, 1, 'PARKINS', 'DIESEL GENERATOR', 1, NULL, '2021-05-12 04:17:43', '2021-05-12 04:17:43'),
(4, 1, 'CAT', 'GAS Generator', 1, NULL, '2021-05-13 13:19:38', '2021-06-23 07:51:41'),
(5, 1, 'CUMMINS', 'Diesel Generator', 1, NULL, '2021-05-13 13:20:14', '2021-06-23 07:51:54'),
(6, 1, 'VOLVO', NULL, 1, NULL, '2021-05-13 13:20:33', '2021-05-13 13:20:33'),
(7, 1, 'WOODWORD', 'CAT Gas Generator Spare Parts', 1, NULL, '2021-06-21 05:40:05', '2021-06-23 07:52:34');

-- --------------------------------------------------------

--
-- Table structure for table `business`
--

CREATE TABLE `business` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `tax_number_1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_1` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_number_2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label_2` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_sales_tax` int(10) UNSIGNED DEFAULT NULL,
  `default_profit_percent` double(5,2) NOT NULL DEFAULT '0.00',
  `owner_id` int(10) UNSIGNED NOT NULL,
  `time_zone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Asia/Kolkata',
  `fy_start_month` tinyint(4) NOT NULL DEFAULT '1',
  `accounting_method` enum('fifo','lifo','avco') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fifo',
  `default_sales_discount` decimal(5,2) DEFAULT NULL,
  `sell_price_tax` enum('includes','excludes') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'includes',
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `expiry_type` enum('add_expiry','add_manufacturing') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add_expiry',
  `on_product_expiry` enum('keep_selling','stop_selling','auto_delete') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'keep_selling',
  `stop_selling_before` int(11) NOT NULL COMMENT 'Stop selling expied item n days before expiry',
  `enable_tooltip` tinyint(1) NOT NULL DEFAULT '1',
  `purchase_in_diff_currency` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Allow purchase to be in different currency then the business currency',
  `purchase_currency_id` int(10) UNSIGNED DEFAULT NULL,
  `p_exchange_rate` decimal(20,3) NOT NULL DEFAULT '1.000',
  `transaction_edit_days` int(10) UNSIGNED NOT NULL DEFAULT '30',
  `stock_expiry_alert_days` int(10) UNSIGNED NOT NULL DEFAULT '30',
  `keyboard_shortcuts` text COLLATE utf8mb4_unicode_ci,
  `pos_settings` text COLLATE utf8mb4_unicode_ci,
  `weighing_scale_setting` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'used to store the configuration of weighing scale',
  `enable_brand` tinyint(1) NOT NULL DEFAULT '1',
  `enable_category` tinyint(1) NOT NULL DEFAULT '1',
  `enable_sub_category` tinyint(1) NOT NULL DEFAULT '1',
  `enable_price_tax` tinyint(1) NOT NULL DEFAULT '1',
  `enable_purchase_status` tinyint(1) DEFAULT '1',
  `enable_lot_number` tinyint(1) NOT NULL DEFAULT '0',
  `default_unit` int(11) DEFAULT NULL,
  `enable_sub_units` tinyint(1) NOT NULL DEFAULT '0',
  `enable_racks` tinyint(1) NOT NULL DEFAULT '0',
  `enable_row` tinyint(1) NOT NULL DEFAULT '0',
  `enable_position` tinyint(1) NOT NULL DEFAULT '0',
  `enable_editing_product_from_purchase` tinyint(1) NOT NULL DEFAULT '1',
  `sales_cmsn_agnt` enum('logged_in_user','user','cmsn_agnt') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_addition_method` tinyint(1) NOT NULL DEFAULT '1',
  `enable_inline_tax` tinyint(1) NOT NULL DEFAULT '1',
  `currency_symbol_placement` enum('before','after') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'before',
  `enabled_modules` text COLLATE utf8mb4_unicode_ci,
  `date_format` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'm/d/Y',
  `time_format` enum('12','24') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '24',
  `ref_no_prefixes` text COLLATE utf8mb4_unicode_ci,
  `theme_color` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `enable_rp` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `rp_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `amount_for_unit_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_order_total_for_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `max_rp_per_order` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `redeem_amount_per_unit_rp` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_order_total_for_redeem` decimal(22,4) NOT NULL DEFAULT '1.0000' COMMENT 'rp is the short form of reward points',
  `min_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `max_redeem_point` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_period` int(11) DEFAULT NULL COMMENT 'rp is the short form of reward points',
  `rp_expiry_type` enum('month','year') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'year' COMMENT 'rp is the short form of reward points',
  `email_settings` text COLLATE utf8mb4_unicode_ci,
  `sms_settings` text COLLATE utf8mb4_unicode_ci,
  `custom_labels` text COLLATE utf8mb4_unicode_ci,
  `common_settings` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business`
--

INSERT INTO `business` (`id`, `name`, `currency_id`, `start_date`, `tax_number_1`, `tax_label_1`, `tax_number_2`, `tax_label_2`, `default_sales_tax`, `default_profit_percent`, `owner_id`, `time_zone`, `fy_start_month`, `accounting_method`, `default_sales_discount`, `sell_price_tax`, `logo`, `sku_prefix`, `enable_product_expiry`, `expiry_type`, `on_product_expiry`, `stop_selling_before`, `enable_tooltip`, `purchase_in_diff_currency`, `purchase_currency_id`, `p_exchange_rate`, `transaction_edit_days`, `stock_expiry_alert_days`, `keyboard_shortcuts`, `pos_settings`, `weighing_scale_setting`, `enable_brand`, `enable_category`, `enable_sub_category`, `enable_price_tax`, `enable_purchase_status`, `enable_lot_number`, `default_unit`, `enable_sub_units`, `enable_racks`, `enable_row`, `enable_position`, `enable_editing_product_from_purchase`, `sales_cmsn_agnt`, `item_addition_method`, `enable_inline_tax`, `currency_symbol_placement`, `enabled_modules`, `date_format`, `time_format`, `ref_no_prefixes`, `theme_color`, `created_by`, `enable_rp`, `rp_name`, `amount_for_unit_rp`, `min_order_total_for_rp`, `max_rp_per_order`, `redeem_amount_per_unit_rp`, `min_order_total_for_redeem`, `min_redeem_point`, `max_redeem_point`, `rp_expiry_period`, `rp_expiry_type`, `email_settings`, `sms_settings`, `custom_labels`, `common_settings`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'LIMBURG POWER SOLUTIONS LTD', 134, '2021-01-01', NULL, 'Sales VAT', NULL, NULL, 1, 50.00, 1, 'Asia/Dhaka', 1, 'fifo', 0.00, 'includes', '1620800453_Store-softwer-logo.png', 'Part Number', 0, 'add_expiry', 'keep_selling', 0, 1, 0, NULL, 1.000, 180, 30, '{\"pos\":{\"express_checkout\":\"shift+e\",\"pay_n_ckeckout\":\"shift+p\",\"draft\":\"shift+d\",\"cancel\":\"shift+c\",\"recent_product_quantity\":\"f2\",\"weighing_scale\":null,\"edit_discount\":\"shift+i\",\"edit_order_tax\":\"shift+t\",\"add_payment_row\":\"shift+r\",\"finalize_payment\":\"shift+f\",\"add_new_product\":\"f4\"}}', '{\"amount_rounding_method\":null,\"allow_overselling\":\"1\",\"disable_pay_checkout\":0,\"disable_draft\":0,\"disable_express_checkout\":0,\"hide_product_suggestion\":0,\"hide_recent_trans\":0,\"disable_discount\":0,\"disable_order_tax\":0,\"is_pos_subtotal_editable\":0}', '{\"label_prefix\":null,\"product_sku_length\":\"4\",\"qty_length\":\"3\",\"qty_length_decimal\":\"2\"}', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, NULL, 1, 1, 'before', '[\"purchases\",\"add_sale\",\"stock_transfers\",\"stock_adjustment\",\"expenses\",\"account\",\"service_staff\",\"subscription\",\"types_of_service\"]', 'd-m-Y', '12', '{\"purchase\":\"LPSL\\/PO\\/\",\"purchase_return\":\"LPSL\\/PR\\/\",\"stock_transfer\":\"LPSL\\/ST\\/\",\"stock_adjustment\":\"LPSL\\/SA\\/\",\"sell_return\":\"LPSL\\/CR\\/\",\"expense\":\"LPSL\\/EP\\/\",\"contacts\":\"LPSL\\/CO\\/\",\"purchase_payment\":\"LPSL\\/PP\\/\",\"sell_payment\":\"LPSL\\/SP\\/\",\"expense_payment\":\"LPSL\\/EP\\/\",\"business_location\":\"BL\",\"username\":null,\"subscription\":null,\"draft\":null}', 'green-light', NULL, 1, NULL, 1.0000, 1.0000, NULL, 1.0000, 1.0000, NULL, NULL, NULL, 'year', '{\"mail_driver\":\"smtp\",\"mail_host\":\"mail.limburg-power.com\",\"mail_port\":\"587\",\"mail_username\":\"sales@limburg-power.com\",\"mail_password\":\"vz4#nPOfnaQi\",\"mail_encryption\":\"tls\",\"mail_from_address\":\"sales@limburg-power.com\",\"mail_from_name\":\"Limburg Power Solutions Ltd.\"}', '{\"sms_service\":\"other\",\"nexmo_key\":null,\"nexmo_secret\":null,\"nexmo_from\":null,\"twilio_sid\":null,\"twilio_token\":null,\"twilio_from\":null,\"url\":null,\"send_to_param_name\":\"to\",\"msg_param_name\":\"text\",\"request_method\":\"post\",\"header_1\":null,\"header_val_1\":null,\"header_2\":null,\"header_val_2\":null,\"header_3\":null,\"header_val_3\":null,\"param_1\":null,\"param_val_1\":null,\"param_2\":null,\"param_val_2\":null,\"param_3\":null,\"param_val_3\":null,\"param_4\":null,\"param_val_4\":null,\"param_5\":null,\"param_val_5\":null,\"param_6\":null,\"param_val_6\":null,\"param_7\":null,\"param_val_7\":null,\"param_8\":null,\"param_val_8\":null,\"param_9\":null,\"param_val_9\":null,\"param_10\":null,\"param_val_10\":null}', '{\"payments\":{\"custom_pay_1\":null,\"custom_pay_2\":null,\"custom_pay_3\":null,\"custom_pay_4\":null,\"custom_pay_5\":null,\"custom_pay_6\":null,\"custom_pay_7\":null},\"contact\":{\"custom_field_1\":\"Customer Name\",\"custom_field_2\":\"Mobile Number\",\"custom_field_3\":null,\"custom_field_4\":\"Web Adress\",\"custom_field_5\":\"Bank Name & Brunch\",\"custom_field_6\":\"Account Number\",\"custom_field_7\":\"Classification\",\"custom_field_8\":\"Supply of Product\",\"custom_field_9\":\"VAT Number\",\"custom_field_10\":\"Income TAX Number\"},\"product\":{\"custom_field_1\":\"Part Number\",\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"location\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"user\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"purchase\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"sell\":{\"custom_field_1\":\"TROUBLESHOOTING\",\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null},\"shipping\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null,\"custom_field_5\":null},\"types_of_service\":{\"custom_field_1\":null,\"custom_field_2\":null,\"custom_field_3\":null,\"custom_field_4\":null}}', '{\"enable_product_warranty\":\"1\",\"default_credit_limit\":null,\"default_datatable_page_entries\":\"25\"}', 1, '2021-04-10 09:05:48', '2021-07-04 08:35:43');

-- --------------------------------------------------------

--
-- Table structure for table `business_locations`
--

CREATE TABLE `business_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landmark` text COLLATE utf8mb4_unicode_ci,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_scheme_id` int(10) UNSIGNED NOT NULL,
  `invoice_layout_id` int(10) UNSIGNED NOT NULL,
  `sale_invoice_layout_id` int(11) DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `print_receipt_on_invoice` tinyint(1) DEFAULT '1',
  `receipt_printer_type` enum('browser','printer') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'browser',
  `printer_id` int(11) DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured_products` text COLLATE utf8mb4_unicode_ci,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `default_payment_accounts` text COLLATE utf8mb4_unicode_ci,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `business_locations`
--

INSERT INTO `business_locations` (`id`, `business_id`, `location_id`, `name`, `landmark`, `country`, `state`, `city`, `zip_code`, `invoice_scheme_id`, `invoice_layout_id`, `sale_invoice_layout_id`, `selling_price_group_id`, `print_receipt_on_invoice`, `receipt_printer_type`, `printer_id`, `mobile`, `alternate_number`, `email`, `website`, `featured_products`, `is_active`, `default_payment_accounts`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'BL0001', 'Limburg Power Solutions Ltd', 'Nawjat, House: 19, Road: 08, Sector: 10', 'Bangladesh', 'Dhaka', 'Uttara', '1230', 1, 1, 1, NULL, 1, 'browser', NULL, '+8801321135711, +8809639115869', NULL, 'shafikul@limburg-power.com', NULL, NULL, 1, '{\"cash\":{\"is_enabled\":\"1\",\"account\":\"2\"},\"card\":{\"is_enabled\":\"1\",\"account\":\"1\"},\"cheque\":{\"is_enabled\":\"1\",\"account\":\"1\"},\"bank_transfer\":{\"is_enabled\":\"1\",\"account\":\"1\"},\"other\":{\"is_enabled\":\"1\",\"account\":\"1\"},\"custom_pay_1\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_2\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_3\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_4\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_5\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_6\":{\"is_enabled\":\"1\",\"account\":null},\"custom_pay_7\":{\"is_enabled\":\"1\",\"account\":null}}', NULL, NULL, NULL, NULL, NULL, '2021-04-10 09:05:48', '2021-05-12 07:56:28');

-- --------------------------------------------------------

--
-- Table structure for table `cash_registers`
--

CREATE TABLE `cash_registers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('close','open') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `closed_at` datetime DEFAULT NULL,
  `closing_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `total_card_slips` int(11) NOT NULL DEFAULT '0',
  `total_cheques` int(11) NOT NULL DEFAULT '0',
  `closing_note` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cash_registers`
--

INSERT INTO `cash_registers` (`id`, `business_id`, `location_id`, `user_id`, `status`, `closed_at`, `closing_amount`, `total_card_slips`, `total_cheques`, `closing_note`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'open', NULL, 0.0000, 0, 0, NULL, '2021-04-10 09:38:00', '2021-04-10 09:38:49');

-- --------------------------------------------------------

--
-- Table structure for table `cash_register_transactions`
--

CREATE TABLE `cash_register_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `cash_register_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `pay_method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('debit','credit') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_type` enum('initial','sell','transfer','refund') COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `short_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `category_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `business_id`, `short_code`, `parent_id`, `created_by`, `category_type`, `description`, `slug`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'ELECTRONIC', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2021-05-08 14:07:11', '2021-05-12 04:14:59'),
(2, 'ELECTRICAL', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2021-05-08 14:07:41', '2021-05-12 04:15:09'),
(3, 'MECHANICAL', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2021-05-08 14:08:05', '2021-05-12 04:14:35'),
(4, 'CONSUMABLE', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2021-05-12 04:13:40', '2021-05-12 04:15:25'),
(5, 'GASKET', 1, NULL, 3, 1, 'product', NULL, NULL, NULL, '2021-05-12 04:14:08', '2021-05-13 13:16:56'),
(6, 'O-SEAL', 1, NULL, 3, 1, 'product', NULL, NULL, NULL, '2021-05-12 04:14:21', '2021-05-13 13:17:12'),
(7, 'PANEL', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2021-05-12 04:15:36', '2021-05-12 04:15:36'),
(8, 'GENERATOR', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2021-05-12 04:15:54', '2021-05-12 04:15:54'),
(9, 'SOFTWER', 1, NULL, 0, 1, 'product', NULL, NULL, NULL, '2021-05-13 13:11:20', '2021-05-13 13:16:05'),
(10, 'SPARK PLUG', 1, NULL, 4, 1, 'product', NULL, NULL, NULL, '2021-05-13 13:18:06', '2021-05-13 13:18:06'),
(11, 'AIR FILTER', 1, NULL, 4, 1, 'product', NULL, NULL, NULL, '2021-05-13 13:18:41', '2021-05-13 13:18:41'),
(12, 'LUBE OIL FILTER', 1, NULL, 4, 1, 'product', NULL, NULL, NULL, '2021-05-13 13:19:04', '2021-05-13 13:19:04'),
(13, 'SENSOR', 1, NULL, 0, 3, 'product', NULL, NULL, NULL, '2021-06-20 04:11:30', '2021-06-20 04:11:30'),
(14, 'PRESSURE TRANSMITTER', 1, NULL, 13, 3, 'product', NULL, NULL, NULL, '2021-06-20 04:12:20', '2021-06-20 04:12:20'),
(15, 'PT-100', 1, NULL, 13, 3, 'product', NULL, NULL, NULL, '2021-06-20 04:12:47', '2021-06-20 04:12:47'),
(16, 'THERMOCUPLE', 1, NULL, 13, 3, 'product', NULL, NULL, NULL, '2021-06-20 04:13:09', '2021-06-20 04:13:09'),
(17, 'KNOCKING', 1, NULL, 13, 3, 'product', NULL, NULL, NULL, '2021-06-20 04:14:09', '2021-06-20 04:14:09'),
(18, 'MAGNATIC PICKUP', 1, NULL, 13, 3, 'product', NULL, NULL, NULL, '2021-06-20 04:15:00', '2021-06-20 04:15:00'),
(19, 'PLC', 1, NULL, 1, 3, 'product', NULL, NULL, NULL, '2021-06-20 04:16:02', '2021-06-20 04:16:02');

-- --------------------------------------------------------

--
-- Table structure for table `categorizables`
--

CREATE TABLE `categorizables` (
  `category_id` int(11) NOT NULL,
  `categorizable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categorizable_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_business_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `middle_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_line_1` text COLLATE utf8mb4_unicode_ci,
  `address_line_2` text COLLATE utf8mb4_unicode_ci,
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `landline` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_limit` decimal(22,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `balance` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `total_rp` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `total_rp_used` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `total_rp_expired` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field6` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field7` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field8` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field9` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field10` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `business_id`, `type`, `supplier_business_name`, `name`, `prefix`, `first_name`, `middle_name`, `last_name`, `email`, `contact_id`, `contact_status`, `tax_number`, `city`, `state`, `country`, `address_line_1`, `address_line_2`, `zip_code`, `dob`, `mobile`, `landline`, `alternate_number`, `pay_term_number`, `pay_term_type`, `credit_limit`, `created_by`, `balance`, `total_rp`, `total_rp_used`, `total_rp_expired`, `is_default`, `shipping_address`, `position`, `customer_group_id`, `custom_field1`, `custom_field2`, `custom_field3`, `custom_field4`, `custom_field5`, `custom_field6`, `custom_field7`, `custom_field8`, `custom_field9`, `custom_field10`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'customer', 'ZABER & ZUBAIR FABRICS LTD', ' NOMAN GROUP  ', NULL, 'NOMAN GROUP', NULL, NULL, NULL, 'CUS0001', 'active', NULL, 'Motijheel C/A,', 'Dhaka', 'Bangladesh', 'Adamjee Court Main Building', '(5th, 4th,3rd Floor), 115-120', '1000', NULL, '.', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 1, 'Pagar, Tongi I/A, Gazipur, Bangladesh', NULL, 2, 'Mr. Alamin Hossain', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-10 09:05:48', '2021-06-10 09:18:09'),
(2, 1, 'customer', NULL, ' MONTAHA STEEL MILLS LTD.  ', NULL, 'MONTAHA STEEL MILLS LTD.', NULL, NULL, NULL, 'CUS0002', 'active', NULL, 'Dhanmondi R/A', 'Dhaka', 'Bangladesh', 'Sima Blossom, 10th Floor, House 03', 'Road 16(New) 27 (Old), Sheikh Kamal Sarani', NULL, NULL, '01683', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 1002200, 0, 0, 0, 'Nanakhi, Sadipur Union, Sonargaon, Narayangonj', NULL, NULL, 'Mr. Abdul Kaiyum', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-08 12:15:44', '2021-07-03 04:23:19'),
(3, 1, 'supplier', 'Shiyan Kaisite Industry & Trade Co. Ltd.', 'Mr. Leroy  ', 'Mr.', 'Leroy', NULL, NULL, 'leroyqi@aliyun.com', 'SUP0001', 'active', NULL, 'Shiyan', 'Hubei Province', 'Chaina', '1-48 Building 32, No. 118 East of Bailang Road,', 'Economic Development Zone', 'PC-442013', NULL, '8607198037098', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, 'House:06, Road: 19, Sector: 10, Uttara, Dhaka, Bangladesh-1230', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-09 04:02:06', '2021-05-09 04:02:06'),
(4, 1, 'customer', 'MAH SPINNING MILLS LTD', 'AB GROUP  ', 'AB', 'GROUP', NULL, NULL, 'mahspinningmill@yahoo.com', 'CUS0003', 'active', NULL, 'Chawk Bazar', 'Dhaka', 'Bangladesh', '79, Begum Bazar, Abul Hossain Market (4th Floor)', NULL, '1211', NULL, '01725731678', '027315100', NULL, NULL, NULL, NULL, 1, 0.0000, 44000, 0, 0, 0, 'Dautia, Kalampur, Dhamrai, Dhaka-1351', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 04:02:38', '2021-05-11 04:28:15'),
(5, 1, 'supplier', 'BD ENGINEERING', 'Mr. Sakirul Islam Suzan', 'Mr.', 'Sakirul', 'Islam', 'Suzan', 'bdengineerings@gmail.com', 'SUP0002', 'active', NULL, 'Uttara', 'Dhaka', 'Bangladesh', 'House: 32/A, Road: 07, Sector: 03', NULL, '1230', NULL, '01712506181', '0241090504', NULL, NULL, 'months', NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 04:59:54', '2021-05-11 04:59:54'),
(6, 1, 'supplier', 'MIMEX LTD', 'Mr. Mosharof Hossain ', 'Mr.', 'Mosharof', 'Hossain', NULL, NULL, 'SUP0003', 'active', NULL, 'Mohammadpur', 'Dhaka', 'Bangladesh', '15/4, Sher Shah, Suri Road', NULL, '1207', NULL, '01918128707', NULL, '01759779223', NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, 'House: 06, Road: 19, Sector: 10, Uttara, Dhaka, Bangladesh-1230', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 05:22:18', '2021-05-11 05:22:18'),
(7, 1, 'customer', 'BEXIMCO INDUSTRIAL PARK', 'Mr. Faruque Hossain ', 'Mr.', 'Faruque', 'Hossain', NULL, NULL, 'CUS0004', 'active', NULL, 'Dhanmondi', 'Dhaka', 'Bangladesh', 'Bel Tower, 17, Dhanmondi R/A', NULL, '1205', NULL, '01755587927', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 32300, 0, 0, 0, 'Sarabo, Kashimpur, Gazipur', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 05:46:40', '2021-05-12 06:03:18'),
(8, 1, 'supplier', 'MH POWER SOLUTIONS AND TECHNOLOGY', 'Mr. Hasnat Hossain ', 'Mr.', 'Hasnat', 'Hossain', NULL, 'mhpowerbd@gmail.com', 'SUP0004', 'active', NULL, 'Rampura', 'Dhaka', 'Bangladesh', 'House: 04 (1st floor), Road: 01, Block: F, Banasree', NULL, '1219', NULL, '01984540120', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, 'House: 06, Road: 19, Sector: 10, Uttara, Dhaka, Bangladesh-1230', NULL, NULL, NULL, NULL, NULL, 'www.mhpowerbd.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 06:48:56', '2021-07-03 04:15:43'),
(9, 1, 'supplier', 'ECHOTECH POWER LTD', 'Mr. Yeasin Hossain ', 'Mr.', 'Yeasin', 'Hossain', NULL, NULL, 'CO0009', 'active', NULL, 'Mirpur', 'Dhaka', 'Bangladesh', 'Plot-2/2, Avenue-1, Block-B, Section-2', NULL, '1216', NULL, '01758398842', NULL, NULL, NULL, 'months', NULL, 1, 0.0000, 0, 0, 0, 0, 'House: 06, Road: 19, Sector: 10, Uttara, Dhaka, Bangladesh-1230', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 08:08:08', '2021-05-12 05:48:03'),
(10, 1, 'customer', 'ECHOTECH POWER LTD', 'Mr. Yeasin Hossain ', 'Mr.', 'Yeasin', 'Hossain', NULL, NULL, NULL, 'active', NULL, 'Mirpur', 'Dhaka', 'Bangladesh', 'Plot-2/2, Avenue-1, Block-B, Section-2', NULL, '1216', NULL, '01758398842', NULL, NULL, NULL, 'months', NULL, 1, 0.0000, 0, 0, 0, 0, 'House: 06, Road: 19, Sector: 10, Uttara, Dhaka, Bangladesh-1230', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 08:32:53', '2021-05-12 05:49:28'),
(11, 1, 'customer', 'GEN POWER EQUIPMENT LTD', 'Mr. Kamrul Hasan ', 'Mr.', 'Kamrul', 'Hasan', NULL, NULL, 'CO0011', 'active', NULL, 'Mirpur-1', 'Dhaka', 'Bangladesh', 'Suit-214, Floor: 08, Muskta Bangla Shopping Complex', NULL, '1216', NULL, '01716415676', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 288300, 0, 0, 0, 'Suit-214, Floor: 08, Muskta Bangla Shopping Complex, Mirpur-01, Dhaka, Bangladesh-1216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 09:31:13', '2021-07-04 11:19:54'),
(12, 1, 'customer', 'FOUR H DYEING & PRINTING LTD', 'FOUR H GROUP ', 'FOUR', 'H', 'GROUP', NULL, NULL, 'CO0012', 'active', NULL, 'Doublemooring', 'Chittagong', 'Bangladesh', '778, D.T. Road, Ashkarabad,', NULL, NULL, NULL, '01712537943', '0312520062', NULL, NULL, 'months', NULL, 1, 0.0000, 34300, 0, 0, 0, 'Arakan Road, Ward #06, Chapra, Kalarpul, Patiya, Chittagong', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-12 05:00:13', '2021-05-12 05:42:34'),
(13, 1, 'supplier', 'GMC - Global Marine and Industrial Equipment mbH', 'Mr. Frank Weiher ', 'Mr.', 'Frank', 'Weiher', NULL, 'info@gmc-mbh.de', 'LPSL/CO/0013', 'active', 'DE 122654622', '50389', 'Wesseling', 'Germany', 'Vorgebirgsstr. 24', NULL, NULL, NULL, '+491711252204', NULL, NULL, NULL, 'days', NULL, 1, 0.0000, 0, 0, 0, 0, 'House: 06, Road: 19, Sector: 10, Uttara, Dhaka, Bangladesh-1230', NULL, NULL, NULL, NULL, NULL, 'www.gmc-mbh.de', 'Deutsche Bank', '1902774', NULL, 'MWM', NULL, NULL, NULL, '2021-05-22 17:23:48', '2021-05-22 17:23:48'),
(14, 1, 'customer', 'YASMIN SPINNING MILLS LTD', 'NOMAN GROUP  ', 'NOMAN', 'GROUP', NULL, NULL, NULL, 'LPSL/CO/0014', 'active', NULL, 'Motijheel C/A,', 'Dhaka', 'Bangladesh', 'Adamjee Court Main Building', '(5th, 4th,3rd Floor), 115-120', '1000', NULL, '017435687', NULL, NULL, NULL, 'months', NULL, 1, 0.0000, 378000, 0, 0, 0, 'Mawna, Sreepur, Gazipur, Bangladesh', NULL, 2, 'Mr. Alamin Hossain', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-22 17:46:15', '2021-06-21 06:39:40'),
(15, 1, 'customer', NULL, ' NFZ TERI TEXTILE LTD  ', NULL, 'NFZ TERI TEXTILE LTD', NULL, NULL, NULL, 'LPSL/CO/0015', 'active', NULL, 'Boalkhali', 'Chittagong', 'Bangladesh', 'West Gomdondy, Shakpura', NULL, NULL, NULL, '01911798999', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 180360, 0, 0, 0, 'West Gomdondy, Shakpura, Boalkhali, Chittagong, Bangladesh.', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-23 05:02:39', '2021-07-06 11:09:24'),
(16, 1, 'customer', 'SHADAT HOSSAIN', 'Mr. Shadat Hossain ', 'Mr.', 'Shadat', 'Hossain', NULL, NULL, 'LPSL/CO/0016', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01919060921', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 959950, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-27 06:43:06', '2021-07-05 12:12:46'),
(17, 1, 'customer', 'SHADAT HOSSAIN', 'Mr. Shadat Hossain ', 'Mr.', 'Shadat', 'Hossain', NULL, NULL, 'LPSL/CO/0017', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01919060921', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 07:54:01', '2021-05-27 06:43:06', '2021-07-04 07:54:01'),
(18, 1, 'customer', NULL, ' GENERATION NEXT FASHION LTD  ', NULL, 'GENERATION NEXT FASHION LTD', NULL, NULL, NULL, 'LPSL/CO/0018', 'active', NULL, 'DOHS Baridhara', 'Dhaka', 'Bangladesh', 'Building # 348, Road # 05', NULL, NULL, NULL, '01769969117', NULL, NULL, NULL, 'months', NULL, 1, 0.0000, 430264, 0, 0, 0, 'Dhonaid, Earpur, Ashulia, Savar, Dhaka', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-27 08:50:48', '2021-07-04 08:55:16'),
(19, 1, 'customer', 'NEXT ENERGY LTD', 'Mr. Yousub Ali ', 'Mr.', 'Yousub', 'Ali', NULL, NULL, 'LPSL/CO/0019', 'active', NULL, 'South Baridhara ( DIT project)', 'Dhaka', 'Bangladesh', 'House no # 08, Road No # 12', NULL, NULL, NULL, '01', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 50000, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-27 13:11:25', '2021-07-05 10:25:10'),
(20, 1, 'customer', 'SM Knitwear Ltd.', ' SM Group  ', NULL, 'SM Group', NULL, NULL, NULL, 'LPSL/CO/0020', 'active', NULL, 'Gulshan Circle-1', 'Dhaka', 'Bangladesh', 'Head Office: House- SE-04, Raod-137', NULL, NULL, NULL, '028931251', NULL, NULL, NULL, NULL, NULL, 5, 0.0000, 40740, 0, 0, 0, 'Factory: Shirir Chala, Bhabanipur, Gazipur, Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-10 11:29:10', '2021-07-06 11:35:13'),
(21, 1, 'supplier', 'Md. Anwar Hossain', ' Md. Anwar  Hossain', NULL, 'Md. Anwar', NULL, 'Hossain', NULL, 'LPSL/CO/0021', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01739231672', NULL, NULL, NULL, NULL, NULL, 5, 0.0000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-10 12:10:38', '2021-06-10 12:10:38'),
(22, 1, 'supplier', 'TECHNOMAX ENGINEERING', 'Mr. Shadat Hossain ', 'Mr.', 'Shadat', 'Hossain', NULL, NULL, 'LPSL/CO/0022', 'active', NULL, 'Uttara', 'Dhaka', 'Bangladesh', 'House # 34, Road # 1, Sector # 12', NULL, NULL, NULL, '01919060921', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, 'House: 06, Road: 19, Sector: 10, Uttara, Dhaka, Bangladesh-1230', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-11 02:37:16', '2021-07-04 07:59:42'),
(23, 1, 'customer', NULL, ' AA POWER GENERATION CIMPANY LTD  ', NULL, 'AA POWER GENERATION CIMPANY LTD', NULL, NULL, NULL, 'LPSL/CO/0023', 'active', NULL, 'Motijheel', 'Dhaka', 'Bangladesh', '47 C/A', NULL, NULL, NULL, '1454', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, 'BSCIC I/E, Konabari, Gazipur', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-12 07:03:06', '2021-06-27 05:29:02'),
(24, 1, 'customer', NULL, ' LABAID PHARMACEUTICALS LTD  ', NULL, 'LABAID PHARMACEUTICALS LTD', NULL, NULL, NULL, 'LPSL/CO/0024', 'active', NULL, 'GULSHAN - 1', 'Dhaka', 'Bangladesh', 'BAY TOWER (LEVEL-2), HOUSE - 23, GULSHAN AVENUE', NULL, NULL, NULL, '1234', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 147600, 0, 0, 0, '15 Genda, Savar, Dhaka-1340, Bangladesh.', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-13 06:44:37', '2021-06-22 04:36:38'),
(25, 1, 'customer', NULL, ' PLUMMY FASHION LIMITED  ', NULL, 'PLUMMY FASHION LIMITED', NULL, NULL, NULL, 'LPSL/CO/0025', 'active', NULL, 'FATULLAH', 'NARAYANGANJ', 'Bangladesh', 'NORTH NORSHINGPUR', NULL, NULL, NULL, '1454', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 1, 'IMTIAZ AHMED', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-13 06:49:22', '2021-06-22 04:45:17'),
(26, 1, 'customer', 'DIRD COMPOSITE TEXTILE LTD.', ' DIRD GROUP  ', NULL, 'DIRD GROUP', NULL, NULL, 'salman@dirdgroup.org', 'LPSL/CO/0026', 'active', NULL, 'Banani', 'Dhaka', 'Bangladesh', 'Faruk Rupayan Tower, (12th, 13th, 16th floor)', '32, Kamal AtaturkAvenue', NULL, NULL, '029820592', NULL, NULL, NULL, 'months', NULL, 1, 0.0000, 0, 0, 0, 0, 'Razendropur, Gazipur, Bangladesh', NULL, 1, 'Salman Bin Mosaddeque', '01847197824', NULL, NULL, NULL, NULL, NULL, 'MWM & CAT', NULL, NULL, NULL, '2021-06-20 07:15:02', '2021-06-20 11:07:07'),
(27, 1, 'supplier', 'NATIONAL ENGINEERING', ' Md. Abdul Kader  ', NULL, 'Md. Abdul Kader', NULL, NULL, NULL, 'LPSL/CO/0027', 'active', NULL, 'Dhaka', 'Dhaka', 'Bangladesh', 'H-07 (1st Floor); R-09, Nikunja-02, Khilkhet, Dkhaka-1229', NULL, '1229', NULL, '01717570727', NULL, NULL, NULL, NULL, NULL, 5, 0.0000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-21 05:11:10', '2021-06-21 06:32:43'),
(28, 1, 'supplier', 'ORIN FASHION', 'Mr. Alamgir Hossain ', 'Mr.', 'Alamgir', 'Hossain', NULL, NULL, 'LPSL/CO/0028', 'active', NULL, NULL, NULL, NULL, 'Islampur, Dhamrai, Dhaka, Bangladesh.', NULL, NULL, NULL, '01712349611', NULL, NULL, NULL, 'months', NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'MWM & CAT', NULL, NULL, NULL, '2021-06-21 05:13:53', '2021-06-21 05:13:53'),
(29, 1, 'customer', NULL, ' FARIHA FASHION LTD.  ', NULL, 'FARIHA FASHION LTD.', NULL, NULL, NULL, 'LPSL/CO/0029', 'active', NULL, NULL, NULL, NULL, 'Fatullah, Narayanganj', NULL, NULL, NULL, '01758086347', NULL, NULL, NULL, 'months', NULL, 5, 0.0000, 12000, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-22 02:57:19', '2021-06-22 03:44:08'),
(30, 1, 'customer', 'LIMBURG ENERGY BANGLADESH LTD', 'Mr. Ismail Hossain  ', 'Mr.', 'Ismail Hossain', NULL, NULL, 'ismail@limburg-energy.com', NULL, 'active', NULL, 'UTTARA', 'DHAKA', 'BANGLADESH', 'H-07,R-19,sector-10', NULL, NULL, NULL, '01718457024', NULL, NULL, NULL, NULL, NULL, 6, 0.0000, 42000, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-22 03:54:56', '2021-07-04 10:35:36'),
(31, 1, 'customer', 'NOMAN WEAVING MILLS LTD.', ' NOMAN GROUP  ', NULL, 'NOMAN GROUP', NULL, NULL, NULL, 'LPSL/CO/0031', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01709-844050', NULL, NULL, NULL, 'months', NULL, 5, 0.0000, 40950, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-22 12:16:43', '2021-06-22 13:36:30'),
(32, 1, 'customer', 'NOMAN TERRY TOWEL MILLS LTD.', ' NOMAN GROUP  ', NULL, 'NOMAN GROUP', NULL, NULL, NULL, 'LPSL/CO/0032', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '01709-844050', NULL, NULL, NULL, 'months', NULL, 5, 0.0000, 322140, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-22 13:06:46', '2021-07-03 04:31:41'),
(33, 1, 'customer', 'MSA TEXTILE', ' MSA Group  ', NULL, 'MSA Group', NULL, NULL, NULL, 'MSA GROUP', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1234', NULL, NULL, NULL, NULL, NULL, 6, 0.0000, 0, 0, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-23 03:29:11', '2021-06-23 03:29:11'),
(34, 1, 'supplier', NULL, 'Mr Anwar Hossain ', 'Mr', 'Anwar', 'Hossain', NULL, NULL, 'LPSL/CO/0034', 'active', NULL, 'Madhopdi', 'Norshindi', 'Bangladesh', 'Zanith Fabrics Factory', NULL, NULL, NULL, '01739231672', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-23 04:05:50', '2021-06-23 04:05:50'),
(35, 1, 'customer', 'TECHNOMAX ENGINEERING', 'Mr. Shadat Hossain ', 'Mr.', 'Shadat', 'Hossain', NULL, NULL, 'LPSL/CO/0035', 'active', NULL, 'Uttara', 'Dhaka', 'Bangladesh', 'House # 34, Road # 1, Sector # 12', NULL, NULL, NULL, '01919060921', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 506700, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-23 07:20:21', '2021-06-28 11:21:24'),
(36, 1, 'customer', 's.suhi industrial park', ' s.suhi  ', NULL, 's.suhi', NULL, NULL, NULL, 'LPSL/CO/0036', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1234', NULL, NULL, NULL, NULL, NULL, 6, 0.0000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-23 10:54:18', '2021-06-23 10:54:18'),
(37, 1, 'customer', 'HAMS GROUP', ' HAMS  ', NULL, 'HAMS', NULL, NULL, 'mahtab.uddin@hams.com.bd', 'LPSL/CO/0037', 'active', NULL, 'Niketon,Gulshan-1', 'DHAKA', 'BANGLADESH', 'H-072,R-03,Block-B', NULL, NULL, NULL, '01730304334', NULL, NULL, NULL, 'months', NULL, 6, 0.0000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-23 11:11:26', '2021-06-23 11:11:26'),
(38, 1, 'customer', 'NAZ BANGLADESH LTD', ' NZ GROUP  ', NULL, 'NZ GROUP', NULL, NULL, NULL, 'LPSL/CO/38', 'active', NULL, 'DOHS,Baridhara', 'DHAKA', 'BANGLADESH', 'Ananya shopping Complex (4th Floor),lane#13', NULL, NULL, NULL, '01709643005', NULL, NULL, NULL, 'months', NULL, 6, 0.0000, 110700, 0, 0, 0, 'Rajendropur, Sreepur, Gazipur, Bangladesh.', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-26 05:09:07', '2021-07-04 08:17:42'),
(39, 1, 'customer', NULL, ' AA KNIT SPIN LIMITED  ', NULL, 'AA KNIT SPIN LIMITED', NULL, NULL, 'roni_saifur@yahoo.com', 'LPSL/CO/0039', 'active', NULL, 'Motijheel C/A,', 'Dhaka', 'Bangladesh', '47 C/A', NULL, NULL, NULL, '1000', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, 'Nagarhawla, Sreepur, Gazipur, Bangladesh.', NULL, 1, 'Mr. Saifur Rahman', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-27 05:32:12', '2021-06-27 05:33:30'),
(40, 1, 'customer', 'DAEYU BANGLADESH LTD.', ' UNION GROUP  ', NULL, 'UNION GROUP', NULL, NULL, NULL, 'LPSL/CO/0040', 'active', NULL, 'Dhaka', 'Dhaka', 'Bangladesh', '1006-123, DEPZ-Extension Area, Savar, Dhaka.', NULL, NULL, NULL, '01708496348', NULL, NULL, NULL, 'months', NULL, 5, 0.0000, 258772, 0, 0, 0, '1006-123, DEPZ-Extension Area, Savar, Dhaka.', NULL, NULL, 'Mr. Saiful', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-27 10:24:41', '2021-07-03 04:20:15'),
(41, 1, 'customer', NULL, ' NOMAN SPINNING MILLS LTD.  ', NULL, 'NOMAN SPINNING MILLS LTD.', NULL, NULL, NULL, 'LPSL/CO/0041', 'active', NULL, 'Dhaka', 'Dhaka', 'Bangladesh', NULL, NULL, NULL, NULL, '01717570727', NULL, NULL, NULL, 'months', NULL, 5, 0.0000, 0, 0, 0, 0, 'Mawna, Sreepur, Gazipur', NULL, NULL, 'Mr. Alamin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-29 11:43:15', '2021-06-29 11:43:15'),
(42, 1, 'customer', NULL, ' BASE TEXTILES LTD.  ', NULL, 'BASE TEXTILES LTD.', NULL, NULL, NULL, 'LPSL/CO/0042', 'active', NULL, 'Kalur Ghat', 'Chattagram', 'Bangladesh', 'Kalur Ghat', NULL, NULL, NULL, '1234', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 34680, 0, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-30 06:29:52', '2021-07-04 06:09:01'),
(43, 1, 'customer', 'ECOTECH ENERGY', ' ECOTECH  ', NULL, 'ECOTECH', NULL, NULL, NULL, 'LPSL/CO/0043', 'active', NULL, 'UTTARA', 'DHAKA', 'BANGLADESH', 'H#58,R#19,Sector#11', NULL, NULL, NULL, '1234', NULL, NULL, NULL, NULL, NULL, 6, 0.0000, 84000, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-30 12:40:15', '2021-07-01 10:22:54'),
(44, 1, 'customer', 'HP CHEMICAL', ' Union Group  ', NULL, 'Union Group', NULL, NULL, NULL, 'LPSL/CO/0044', 'active', NULL, 'Gulshan Avenue', 'DHAKA', 'BANGLADESH', 'Union center ,68/1 Gulshan Avenue,Dhaka-1212', NULL, NULL, NULL, '1234', NULL, NULL, NULL, 'months', NULL, 6, 0.0000, 0, 0, 0, 0, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-30 13:58:31', '2021-06-30 13:58:31'),
(45, 1, 'customer', 'HAKKANI PAPER & BORD MILLS (P) LTD.', ' HAKKANI GROUP  ', NULL, 'HAKKANI GROUP', NULL, NULL, NULL, 'LPSL/CO/0045', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '02-43151464', NULL, NULL, NULL, 'months', NULL, 5, 0.0000, 0, 0, 0, 0, 'Corporate Office: 1093/1178.D.T, Sharipara, Pahartoli, Chattogram-4202, Bangladesh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-01 09:32:12', '2021-07-01 09:32:12'),
(46, 1, 'supplier', 'HIMALAYA POWER INT. LTD.', ' Asim Mondal  ', NULL, 'Asim Mondal', NULL, NULL, NULL, 'LPSL/CO/0046', 'active', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1229', NULL, NULL, NULL, NULL, NULL, 5, 0.0000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-03 09:06:23', '2021-07-03 09:06:23'),
(47, 1, 'customer', NULL, ' SS STEEL MILLS LTD  ', NULL, 'SS STEEL MILLS LTD', NULL, NULL, NULL, 'LPSL/CO/0047', 'active', NULL, 'North Badda', 'Dhaka', 'Bangladesh', 'The Peal Trade Center (11th Floor), Cha # 90/3, Pragati Saroni', NULL, NULL, NULL, '1234', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, 'Plot # 4, Block # B, Tongi Industrial Area, Tongi, Gazipur', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 06:49:55', '2021-07-04 06:49:55'),
(48, 1, 'customer', NULL, ' GEN POWER EQUEPMENTS LTD  ', NULL, 'GEN POWER EQUEPMENTS LTD', NULL, NULL, NULL, 'LPSL/CO/0048', 'active', NULL, 'Mirpur', 'Dhaka', 'Bangladesh', 'Muktobangla Shopping Complex (Level - 8)', NULL, NULL, NULL, '01716415676', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 07:41:22', '2021-07-04 06:55:13', '2021-07-04 07:41:22'),
(49, 1, 'customer', NULL, ' SB LABORATORISE ( AYURVEDIC) LTD  ', NULL, 'SB LABORATORISE ( AYURVEDIC) LTD', NULL, NULL, NULL, 'LPSL/CO/0049', 'active', NULL, 'Boalia', 'Rajshahi', 'BANGLADESH', '296,Raninagar', NULL, NULL, NULL, '1234', NULL, NULL, NULL, 'months', NULL, 6, 0.0000, 0, 0, 0, 0, '296,Raninagar, Boalia, Rajshahi, BANGLADESH', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 06:55:19', '2021-07-04 12:51:08'),
(50, 1, 'customer', NULL, ' ENVOY TEXTILE LTD.  ', NULL, 'ENVOY TEXTILE LTD.', NULL, NULL, NULL, 'LPSL/CO/0050', 'active', NULL, 'West Panthapath', 'Dhaka', 'Bangladesh', 'Envoy Tower, 18/E', NULL, NULL, NULL, '1234', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, 'Jamirdia, Valuka, Maymansing.', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 07:08:29', '2021-07-04 07:08:29'),
(51, 1, 'customer', NULL, ' MONNO POWER GENERATION AND DISTRIBUTION LTD  ', NULL, 'MONNO POWER GENERATION AND DISTRIBUTION LTD', NULL, NULL, NULL, 'LPSL/CO/0051', 'active', NULL, 'Wari', 'Dhaka', 'Bangladesh', NULL, NULL, NULL, NULL, '1230', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, 'Islampur Bazar, Dhamrai, Dhaka, Bangladesh', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 07:57:48', '2021-07-04 08:10:03'),
(52, 1, 'customer', NULL, ' AA YARN MILLS LTD.  ', NULL, 'AA YARN MILLS LTD.', NULL, NULL, NULL, 'LPSL/CO/0052', 'active', NULL, 'Motijheel', 'Dhaka', 'Bangladesh', '47 C/A', NULL, NULL, NULL, '1000', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, 'Nagar Hawla, Sreepur, Gazipur', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 08:16:33', '2021-07-04 08:16:33'),
(53, 1, 'customer', 'CA KNITWEAR LTD', ' NZ GROUP  ', NULL, 'NZ GROUP', NULL, NULL, NULL, 'LPSL/CO/0053', 'active', NULL, 'DOHS,Baridhara', 'Dhaka', 'BANGLADESH', 'Ananya shopping Complex (4th Floor),lane#13', NULL, NULL, NULL, '1230', NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 0, 0, 0, 0, 'Vabanipur, Sreepur, Gazipur, Bangladesh.', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 08:22:51', '2021-07-04 08:22:51'),
(54, 1, 'customer', NULL, ' OSHIN SPINNING MILLS LTD  ', NULL, 'OSHIN SPINNING MILLS LTD', NULL, NULL, NULL, 'LPSL/CO/0054', 'active', NULL, 'Uttara', 'Dhaka', 'Bangladesh', 'Blessing SS Glory Plot#12,(4th floor) Sonargaon Janapath Road, Sector#11', NULL, NULL, NULL, '1230', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, 'Abdar, Joinabazar, Sreepur, Gazipur.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 08:23:58', '2021-07-04 08:23:58'),
(55, 1, 'customer', NULL, ' ECOTECH POWER LTD.  ', NULL, 'ECOTECH POWER LTD.', NULL, NULL, NULL, 'LPSL/CO/0055', 'active', NULL, 'Mirpur', 'Dhaka', 'Bangladesh', 'Plot-2/2, Avenue-1, Block-B, Section-2', NULL, NULL, NULL, '1216', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 08:30:21', '2021-07-04 08:30:21'),
(56, 1, 'supplier', 'REVERIE POWER AND AUTOMATION ENGINEERING LTD', 'Mr. Zakir Hossain ', 'Mr.', 'Zakir', 'Hossain', NULL, 'zakir.hossain@reverie-bd.com', 'LPSL/CO/0056', 'active', NULL, 'Tejgon', 'Dhaka', 'Bangladesh', '5th and 7th Floor, Evergreen Plaza', '260/B', '1208', NULL, '01844057649', NULL, NULL, NULL, 'months', NULL, 1, 0.0000, 0, 0, 0, 0, 'House: 06, Road: 19, Sector: 10, Uttara, Dhaka, Bangladesh-1230', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 08:31:32', '2021-07-04 08:31:32'),
(57, 1, 'customer', 'INTERNATIONAL TRADING SERVICES LTD (WASH UNIT)', ' STANDARD GROUP  ', NULL, 'STANDARD GROUP', NULL, NULL, NULL, 'LPSL/CO/0057', 'active', NULL, 'Tejgaon', 'DHAKA', 'BANGLADESH', '401/B,Tejgaon Industrial Area', NULL, NULL, NULL, '1208', NULL, NULL, NULL, 'months', NULL, 6, 0.0000, 0, 0, 0, 0, 'Jarun,konabari (Ground & 1st Floor),Gazipur sadar,Gazipur', NULL, 2, 'MR.Saifur Rahman', '01708496348', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 08:45:42', '2021-07-04 12:55:36'),
(58, 1, 'customer', 'CHORKA TEXTILE LTD.', ' PRAN-RFL  ', NULL, 'PRAN-RFL', NULL, NULL, NULL, 'LPSL/CO/0058', 'active', NULL, 'Middle Badda', 'Dhaka', 'Bangladesh', 'PRAN-RFL Center 105', NULL, NULL, NULL, '1212', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, 'Kazir Chor, Danga, Palash, Narsingdi, Bangladesh', NULL, 1, 'Mr. Motaleb', '+8801704130567', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 08:46:11', '2021-07-04 08:46:11'),
(59, 1, 'customer', 'RAHMAT KNIT-DYEING & FINISHING LTD.', ' RAHMAT GROUP  ', NULL, 'RAHMAT GROUP', NULL, NULL, NULL, 'LPSL/CO/0059', 'active', NULL, 'Gulshan 2', 'Dhaka', 'Bangladesh', 'Road 51, House 8', NULL, NULL, NULL, '1212', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, 'Mouchak, Kaliakoir, Gazipur', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 08:57:50', '2021-07-04 08:57:50'),
(60, 1, 'customer', NULL, ' MH POWER SOLUTION & TECHNOLOGY  ', NULL, 'MH POWER SOLUTION & TECHNOLOGY', NULL, NULL, NULL, 'LPSL/CO/0060', 'active', NULL, 'Rampura', 'Dhaka', 'Bangladesh', 'House# 04, Road# 01, Block# F, Banasri', NULL, NULL, NULL, '1219', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, NULL, 'Mr. Hasnat', '+8801984540120', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 09:03:44', '2021-07-04 09:03:44'),
(61, 1, 'customer', 'SQUARE TEXCOM LTD.', ' SQUARE  ', NULL, 'SQUARE', NULL, NULL, NULL, 'LPSL/CO/0061', 'active', NULL, 'Uttara', 'Dhaka', 'Bangladesh', 'Mascot Plaza (10th-12th Floor), Plot - 107/A, Sector - 7', NULL, NULL, NULL, '1230', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 146500, 0, 0, 0, 'Kathali, Bhaluka, Mymensingh, Bangladesh', NULL, NULL, 'Mr. Ashique', '+8801973238816', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 09:12:58', '2021-07-05 12:25:23'),
(62, 1, 'customer', 'ZARBA TEXTILE MILLS LTD.', ' NOMAN GROUP  ', NULL, 'NOMAN GROUP', NULL, NULL, NULL, 'LPSL/CO/0062', 'active', NULL, 'Motijheel', 'Dhaka', 'Bangladesh', 'Adamjee Court Main Building(5th Floor) 115-120,Motijheel C/A', NULL, NULL, NULL, '1000', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, 'North Mawna, Gazipur 1740', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 09:55:35', '2021-07-04 09:55:35'),
(63, 1, 'customer', NULL, ' AL AKSA STEEL MILLS LTD.  ', NULL, 'AL AKSA STEEL MILLS LTD.', NULL, NULL, NULL, 'LPSL/CO/0063', 'active', NULL, 'Bangshal', 'Dhaka', 'Bangladesh', 'Northsouth Road, Sahidsayed Nazrul Islam Sarani', NULL, NULL, NULL, '1100', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 10:06:32', '2021-07-04 10:06:32'),
(64, 1, 'customer', 'SQUARE TEXTILES LTD.', ' SQUARE  ', NULL, 'SQUARE', NULL, NULL, NULL, 'LPSL/CO/0064', 'active', NULL, 'Uttara', 'Dhaka', 'Bangladesh', 'Mascot Plaza (10th-12th Floor), Plot - 107/A, Sector - 7', NULL, NULL, NULL, '1230', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, 'H # 140, B # B, Sreepur-Kashimpur Road, Sardagonj, Kashimpur, Gazipur', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 10:10:49', '2021-07-04 10:10:49'),
(65, 1, 'customer', 'SQUARE FASHION YARNS LTD.', ' SQUARE  ', NULL, 'SQUARE', NULL, NULL, NULL, 'LPSL/CO/0065', 'active', NULL, 'Uttara', 'Dhaka', 'Bangladesh', 'Mascot Plaza (10th-12th Floor), Plot - 107/A, Sector - 7', NULL, NULL, NULL, '1230', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, 'Vangnahati, Sreepur, Gazipur, Bangladesh.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 10:15:03', '2021-07-04 10:15:03'),
(66, 1, 'customer', 'DONG BANG DYEING LIMITED', ' DONG BANG GROUP  ', NULL, 'DONG BANG GROUP', NULL, NULL, NULL, 'LPSL/CO/0066', 'active', NULL, 'Uttara', 'Dhaka', 'Bangladesh', 'Mika Cornerstone, (Level - 3), House # 16-17, Road # 12, Sector # 6', NULL, NULL, NULL, '1230', NULL, NULL, NULL, NULL, NULL, 2, 0.0000, 0, 0, 0, 0, 'Ulushara, Baraipara, Kaliakoir, Gazipur, Bangladesh', NULL, NULL, 'Mr. Mahmud Shah', '+8801787695018', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 10:24:51', '2021-07-04 10:24:51'),
(67, 1, 'customer', 'NAVAL STORES DEPOT CHATTOGRAM', ' NAVAL  ', NULL, 'NAVAL', NULL, NULL, NULL, 'LPSL/CO/0067', 'active', NULL, NULL, 'Chattogram', 'BANGLADESH', NULL, NULL, NULL, NULL, '1234', NULL, NULL, NULL, NULL, NULL, 6, 0.0000, 0, 0, 0, 0, 'Naval Stores Depot Chattogram', NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-06 09:58:00', '2021-07-06 09:58:00');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `thousand_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `decimal_separator` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `country`, `currency`, `code`, `symbol`, `thousand_separator`, `decimal_separator`, `created_at`, `updated_at`) VALUES
(1, 'Albania', 'Leke', 'ALL', 'Lek', ',', '.', NULL, NULL),
(2, 'America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(3, 'Afghanistan', 'Afghanis', 'AF', '؋', ',', '.', NULL, NULL),
(4, 'Argentina', 'Pesos', 'ARS', '$', ',', '.', NULL, NULL),
(5, 'Aruba', 'Guilders', 'AWG', 'ƒ', ',', '.', NULL, NULL),
(6, 'Australia', 'Dollars', 'AUD', '$', ',', '.', NULL, NULL),
(7, 'Azerbaijan', 'New Manats', 'AZ', 'ман', ',', '.', NULL, NULL),
(8, 'Bahamas', 'Dollars', 'BSD', '$', ',', '.', NULL, NULL),
(9, 'Barbados', 'Dollars', 'BBD', '$', ',', '.', NULL, NULL),
(10, 'Belarus', 'Rubles', 'BYR', 'p.', ',', '.', NULL, NULL),
(11, 'Belgium', 'Euro', 'EUR', '€', ',', '.', NULL, NULL),
(12, 'Beliz', 'Dollars', 'BZD', 'BZ$', ',', '.', NULL, NULL),
(13, 'Bermuda', 'Dollars', 'BMD', '$', ',', '.', NULL, NULL),
(14, 'Bolivia', 'Bolivianos', 'BOB', '$b', ',', '.', NULL, NULL),
(15, 'Bosnia and Herzegovina', 'Convertible Marka', 'BAM', 'KM', ',', '.', NULL, NULL),
(16, 'Botswana', 'Pula\'s', 'BWP', 'P', ',', '.', NULL, NULL),
(17, 'Bulgaria', 'Leva', 'BG', 'лв', ',', '.', NULL, NULL),
(18, 'Brazil', 'Reais', 'BRL', 'R$', ',', '.', NULL, NULL),
(19, 'Britain [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(20, 'Brunei Darussalam', 'Dollars', 'BND', '$', ',', '.', NULL, NULL),
(21, 'Cambodia', 'Riels', 'KHR', '៛', ',', '.', NULL, NULL),
(22, 'Canada', 'Dollars', 'CAD', '$', ',', '.', NULL, NULL),
(23, 'Cayman Islands', 'Dollars', 'KYD', '$', ',', '.', NULL, NULL),
(24, 'Chile', 'Pesos', 'CLP', '$', ',', '.', NULL, NULL),
(25, 'China', 'Yuan Renminbi', 'CNY', '¥', ',', '.', NULL, NULL),
(26, 'Colombia', 'Pesos', 'COP', '$', ',', '.', NULL, NULL),
(27, 'Costa Rica', 'Colón', 'CRC', '₡', ',', '.', NULL, NULL),
(28, 'Croatia', 'Kuna', 'HRK', 'kn', ',', '.', NULL, NULL),
(29, 'Cuba', 'Pesos', 'CUP', '₱', ',', '.', NULL, NULL),
(30, 'Cyprus', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(31, 'Czech Republic', 'Koruny', 'CZK', 'Kč', ',', '.', NULL, NULL),
(32, 'Denmark', 'Kroner', 'DKK', 'kr', ',', '.', NULL, NULL),
(33, 'Dominican Republic', 'Pesos', 'DOP ', 'RD$', ',', '.', NULL, NULL),
(34, 'East Caribbean', 'Dollars', 'XCD', '$', ',', '.', NULL, NULL),
(35, 'Egypt', 'Pounds', 'EGP', '£', ',', '.', NULL, NULL),
(36, 'El Salvador', 'Colones', 'SVC', '$', ',', '.', NULL, NULL),
(37, 'England [United Kingdom]', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(38, 'Euro', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(39, 'Falkland Islands', 'Pounds', 'FKP', '£', ',', '.', NULL, NULL),
(40, 'Fiji', 'Dollars', 'FJD', '$', ',', '.', NULL, NULL),
(41, 'France', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(42, 'Ghana', 'Cedis', 'GHS', '¢', ',', '.', NULL, NULL),
(43, 'Gibraltar', 'Pounds', 'GIP', '£', ',', '.', NULL, NULL),
(44, 'Greece', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(45, 'Guatemala', 'Quetzales', 'GTQ', 'Q', ',', '.', NULL, NULL),
(46, 'Guernsey', 'Pounds', 'GGP', '£', ',', '.', NULL, NULL),
(47, 'Guyana', 'Dollars', 'GYD', '$', ',', '.', NULL, NULL),
(48, 'Holland [Netherlands]', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(49, 'Honduras', 'Lempiras', 'HNL', 'L', ',', '.', NULL, NULL),
(50, 'Hong Kong', 'Dollars', 'HKD', '$', ',', '.', NULL, NULL),
(51, 'Hungary', 'Forint', 'HUF', 'Ft', ',', '.', NULL, NULL),
(52, 'Iceland', 'Kronur', 'ISK', 'kr', ',', '.', NULL, NULL),
(53, 'India', 'Rupees', 'INR', '₹', ',', '.', NULL, NULL),
(54, 'Indonesia', 'Rupiahs', 'IDR', 'Rp', ',', '.', NULL, NULL),
(55, 'Iran', 'Rials', 'IRR', '﷼', ',', '.', NULL, NULL),
(56, 'Ireland', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(57, 'Isle of Man', 'Pounds', 'IMP', '£', ',', '.', NULL, NULL),
(58, 'Israel', 'New Shekels', 'ILS', '₪', ',', '.', NULL, NULL),
(59, 'Italy', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(60, 'Jamaica', 'Dollars', 'JMD', 'J$', ',', '.', NULL, NULL),
(61, 'Japan', 'Yen', 'JPY', '¥', ',', '.', NULL, NULL),
(62, 'Jersey', 'Pounds', 'JEP', '£', ',', '.', NULL, NULL),
(63, 'Kazakhstan', 'Tenge', 'KZT', 'лв', ',', '.', NULL, NULL),
(64, 'Korea [North]', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(65, 'Korea [South]', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(66, 'Kyrgyzstan', 'Soms', 'KGS', 'лв', ',', '.', NULL, NULL),
(67, 'Laos', 'Kips', 'LAK', '₭', ',', '.', NULL, NULL),
(68, 'Latvia', 'Lati', 'LVL', 'Ls', ',', '.', NULL, NULL),
(69, 'Lebanon', 'Pounds', 'LBP', '£', ',', '.', NULL, NULL),
(70, 'Liberia', 'Dollars', 'LRD', '$', ',', '.', NULL, NULL),
(71, 'Liechtenstein', 'Switzerland Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(72, 'Lithuania', 'Litai', 'LTL', 'Lt', ',', '.', NULL, NULL),
(73, 'Luxembourg', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(74, 'Macedonia', 'Denars', 'MKD', 'ден', ',', '.', NULL, NULL),
(75, 'Malaysia', 'Ringgits', 'MYR', 'RM', ',', '.', NULL, NULL),
(76, 'Malta', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(77, 'Mauritius', 'Rupees', 'MUR', '₨', ',', '.', NULL, NULL),
(78, 'Mexico', 'Pesos', 'MXN', '$', ',', '.', NULL, NULL),
(79, 'Mongolia', 'Tugriks', 'MNT', '₮', ',', '.', NULL, NULL),
(80, 'Mozambique', 'Meticais', 'MZ', 'MT', ',', '.', NULL, NULL),
(81, 'Namibia', 'Dollars', 'NAD', '$', ',', '.', NULL, NULL),
(82, 'Nepal', 'Rupees', 'NPR', '₨', ',', '.', NULL, NULL),
(83, 'Netherlands Antilles', 'Guilders', 'ANG', 'ƒ', ',', '.', NULL, NULL),
(84, 'Netherlands', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(85, 'New Zealand', 'Dollars', 'NZD', '$', ',', '.', NULL, NULL),
(86, 'Nicaragua', 'Cordobas', 'NIO', 'C$', ',', '.', NULL, NULL),
(87, 'Nigeria', 'Nairas', 'NGN', '₦', ',', '.', NULL, NULL),
(88, 'North Korea', 'Won', 'KPW', '₩', ',', '.', NULL, NULL),
(89, 'Norway', 'Krone', 'NOK', 'kr', ',', '.', NULL, NULL),
(90, 'Oman', 'Rials', 'OMR', '﷼', ',', '.', NULL, NULL),
(91, 'Pakistan', 'Rupees', 'PKR', '₨', ',', '.', NULL, NULL),
(92, 'Panama', 'Balboa', 'PAB', 'B/.', ',', '.', NULL, NULL),
(93, 'Paraguay', 'Guarani', 'PYG', 'Gs', ',', '.', NULL, NULL),
(94, 'Peru', 'Nuevos Soles', 'PE', 'S/.', ',', '.', NULL, NULL),
(95, 'Philippines', 'Pesos', 'PHP', 'Php', ',', '.', NULL, NULL),
(96, 'Poland', 'Zlotych', 'PL', 'zł', ',', '.', NULL, NULL),
(97, 'Qatar', 'Rials', 'QAR', '﷼', ',', '.', NULL, NULL),
(98, 'Romania', 'New Lei', 'RO', 'lei', ',', '.', NULL, NULL),
(99, 'Russia', 'Rubles', 'RUB', 'руб', ',', '.', NULL, NULL),
(100, 'Saint Helena', 'Pounds', 'SHP', '£', ',', '.', NULL, NULL),
(101, 'Saudi Arabia', 'Riyals', 'SAR', '﷼', ',', '.', NULL, NULL),
(102, 'Serbia', 'Dinars', 'RSD', 'Дин.', ',', '.', NULL, NULL),
(103, 'Seychelles', 'Rupees', 'SCR', '₨', ',', '.', NULL, NULL),
(104, 'Singapore', 'Dollars', 'SGD', '$', ',', '.', NULL, NULL),
(105, 'Slovenia', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(106, 'Solomon Islands', 'Dollars', 'SBD', '$', ',', '.', NULL, NULL),
(107, 'Somalia', 'Shillings', 'SOS', 'S', ',', '.', NULL, NULL),
(108, 'South Africa', 'Rand', 'ZAR', 'R', ',', '.', NULL, NULL),
(109, 'South Korea', 'Won', 'KRW', '₩', ',', '.', NULL, NULL),
(110, 'Spain', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(111, 'Sri Lanka', 'Rupees', 'LKR', '₨', ',', '.', NULL, NULL),
(112, 'Sweden', 'Kronor', 'SEK', 'kr', ',', '.', NULL, NULL),
(113, 'Switzerland', 'Francs', 'CHF', 'CHF', ',', '.', NULL, NULL),
(114, 'Suriname', 'Dollars', 'SRD', '$', ',', '.', NULL, NULL),
(115, 'Syria', 'Pounds', 'SYP', '£', ',', '.', NULL, NULL),
(116, 'Taiwan', 'New Dollars', 'TWD', 'NT$', ',', '.', NULL, NULL),
(117, 'Thailand', 'Baht', 'THB', '฿', ',', '.', NULL, NULL),
(118, 'Trinidad and Tobago', 'Dollars', 'TTD', 'TT$', ',', '.', NULL, NULL),
(119, 'Turkey', 'Lira', 'TRY', 'TL', ',', '.', NULL, NULL),
(120, 'Turkey', 'Liras', 'TRL', '£', ',', '.', NULL, NULL),
(121, 'Tuvalu', 'Dollars', 'TVD', '$', ',', '.', NULL, NULL),
(122, 'Ukraine', 'Hryvnia', 'UAH', '₴', ',', '.', NULL, NULL),
(123, 'United Kingdom', 'Pounds', 'GBP', '£', ',', '.', NULL, NULL),
(124, 'United States of America', 'Dollars', 'USD', '$', ',', '.', NULL, NULL),
(125, 'Uruguay', 'Pesos', 'UYU', '$U', ',', '.', NULL, NULL),
(126, 'Uzbekistan', 'Sums', 'UZS', 'лв', ',', '.', NULL, NULL),
(127, 'Vatican City', 'Euro', 'EUR', '€', '.', ',', NULL, NULL),
(128, 'Venezuela', 'Bolivares Fuertes', 'VEF', 'Bs', ',', '.', NULL, NULL),
(129, 'Vietnam', 'Dong', 'VND', '₫', ',', '.', NULL, NULL),
(130, 'Yemen', 'Rials', 'YER', '﷼', ',', '.', NULL, NULL),
(131, 'Zimbabwe', 'Zimbabwe Dollars', 'ZWD', 'Z$', ',', '.', NULL, NULL),
(132, 'Iraq', 'Iraqi dinar', 'IQD', 'د.ع', ',', '.', NULL, NULL),
(133, 'Kenya', 'Kenyan shilling', 'KES', 'KSh', ',', '.', NULL, NULL),
(134, 'Bangladesh', 'Taka', 'BDT', '৳', ',', '.', NULL, NULL),
(135, 'Algerie', 'Algerian dinar', 'DZD', 'د.ج', ' ', '.', NULL, NULL),
(136, 'United Arab Emirates', 'United Arab Emirates dirham', 'AED', 'د.إ', ',', '.', NULL, NULL),
(137, 'Uganda', 'Uganda shillings', 'UGX', 'USh', ',', '.', NULL, NULL),
(138, 'Tanzania', 'Tanzanian shilling', 'TZS', 'TSh', ',', '.', NULL, NULL),
(139, 'Angola', 'Kwanza', 'AOA', 'Kz', ',', '.', NULL, NULL),
(140, 'Kuwait', 'Kuwaiti dinar', 'KWD', 'KD', ',', '.', NULL, NULL),
(141, 'Bahrain', 'Bahraini dinar', 'BHD', 'BD', ',', '.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(5,2) NOT NULL,
  `price_calculation_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'percentage',
  `selling_price_group_id` int(11) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `business_id`, `name`, `amount`, `price_calculation_type`, `selling_price_group_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Md. Sabur Uddin', 0.00, 'selling_price_group', 1, 1, '2021-05-08 13:27:35', '2021-05-12 05:59:18'),
(2, 1, 'Md. Manwar Hossain', 0.00, 'selling_price_group', 1, 1, '2021-05-12 05:59:36', '2021-05-12 05:59:36'),
(3, 1, 'Md. Mahadi Hasan', 0.00, 'selling_price_group', 1, 1, '2021-06-10 09:00:48', '2021-06-10 09:00:48');

-- --------------------------------------------------------

--
-- Table structure for table `dashboard_configurations`
--

CREATE TABLE `dashboard_configurations` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `created_by` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuration` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `starts_at` datetime DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `applicable_in_spg` tinyint(1) DEFAULT '0',
  `applicable_in_cg` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_variations`
--

CREATE TABLE `discount_variations` (
  `discount_id` int(11) NOT NULL,
  `variation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_and_notes`
--

CREATE TABLE `document_and_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `notable_id` int(11) NOT NULL,
  `notable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `heading` text COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_private` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_and_notes`
--

INSERT INTO `document_and_notes` (`id`, `business_id`, `notable_id`, `notable_type`, `heading`, `description`, `is_private`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 'App\\User', 'CV', NULL, 1, 2, '2021-05-12 12:34:31', '2021-05-12 12:34:31'),
(5, 1, 33, 'App\\Contact', 'Due Collection', NULL, 0, 2, '2021-07-04 06:04:53', '2021-07-04 06:04:53'),
(6, 1, 18, 'App\\Contact', 'Due Collection Report', NULL, 0, 2, '2021-07-04 06:21:14', '2021-07-04 06:21:14'),
(7, 1, 11, 'App\\Contact', 'Opening Balance Leddger', '<p>1. Due of Limburg Energy = 158,592/-</p>\r\n<p>2. MWM Recondition Generator = 759540/-&nbsp;</p>', 0, 3, '2021-07-04 10:29:06', '2021-07-04 10:29:06');

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `name`, `business_id`, `code`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'FUEL COST DHAKA METRO GA-26-7264', 1, NULL, NULL, '2021-05-08 17:44:45', '2021-05-11 12:18:29'),
(2, 'Advance', 1, NULL, '2021-05-23 11:22:36', '2021-05-08 17:45:02', '2021-05-23 11:22:36'),
(3, 'Technical Assistant', 1, NULL, NULL, '2021-05-11 04:31:33', '2021-05-11 04:31:33'),
(4, 'Bonus', 1, NULL, NULL, '2021-05-11 04:32:00', '2021-05-11 04:32:00'),
(5, 'Miscellaneous', 1, NULL, NULL, '2021-05-11 06:23:41', '2021-05-11 06:23:41'),
(6, 'FUEL COST', 1, NULL, NULL, '2021-05-11 06:28:58', '2021-05-11 12:17:51'),
(7, 'CAR MAINTENANCE DHAKA METRO GA 26-7264', 1, NULL, NULL, '2021-05-11 09:06:45', '2021-05-11 12:27:47'),
(8, 'INTERNET BILL', 1, NULL, NULL, '2021-05-11 12:12:20', '2021-05-11 12:12:20'),
(9, 'LOAN INSTALLMENT', 1, NULL, NULL, '2021-05-11 12:12:48', '2021-05-11 12:12:48'),
(10, 'FOOD & LUNCH', 1, NULL, NULL, '2021-05-11 12:13:17', '2021-05-11 12:13:17'),
(11, 'SUPPLIES & STATIONARY', 1, NULL, NULL, '2021-05-11 12:13:49', '2021-05-11 12:13:49'),
(12, 'OFFICE ENTERTAINMENT', 1, NULL, NULL, '2021-05-11 12:14:23', '2021-05-11 12:14:23'),
(13, 'OFFICE RENT', 1, NULL, NULL, '2021-05-11 12:14:56', '2021-05-11 12:14:56'),
(14, 'PHONE BILL', 1, NULL, NULL, '2021-05-11 12:15:24', '2021-05-11 12:15:24'),
(15, 'CURIER, CARRYING & DELIVERY', 1, NULL, NULL, '2021-05-11 12:16:12', '2021-05-11 12:16:12'),
(16, 'FUEL COST DHAKA METRO GA-17-8223', 1, NULL, NULL, '2021-05-11 12:17:30', '2021-05-11 12:17:30'),
(17, 'SALARY', 1, NULL, NULL, '2021-05-11 12:19:13', '2021-05-11 12:19:13'),
(18, 'HOLIDAY ALLAWANCE', 1, NULL, NULL, '2021-05-11 12:19:40', '2021-05-11 12:19:40'),
(19, 'NIGHT DUTY', 1, NULL, NULL, '2021-05-11 12:20:12', '2021-05-11 12:20:12'),
(20, 'SERVICE & LABOR COST', 1, NULL, NULL, '2021-05-11 12:20:58', '2021-05-11 12:20:58'),
(21, 'LOCAL PURCHASE', 1, NULL, NULL, '2021-05-11 12:21:37', '2021-05-11 12:21:37'),
(22, 'HOTEL RENT & SPECIAL TRIP', 1, NULL, NULL, '2021-05-11 12:22:39', '2021-05-11 12:22:39'),
(23, 'CAR MAINTENANCE DHAKA METRO GA 17-8223', 1, NULL, NULL, '2021-05-11 12:28:28', '2021-05-11 12:28:28'),
(24, 'SERVICE TOOLS PURCHASES', 1, NULL, NULL, '2021-05-23 10:01:37', '2021-05-23 10:01:37'),
(25, 'INDIVIDUAL TRAVELING EXPENSE BILL', 1, NULL, NULL, '2021-06-20 13:01:20', '2021-06-20 13:01:20');

-- --------------------------------------------------------

--
-- Table structure for table `group_sub_taxes`
--

CREATE TABLE `group_sub_taxes` (
  `group_tax_id` int(10) UNSIGNED NOT NULL,
  `tax_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_layouts`
--

CREATE TABLE `invoice_layouts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header_text` text COLLATE utf8mb4_unicode_ci,
  `invoice_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_no_prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_heading_line5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_not_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_heading_paid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quotation_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `round_off_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_due_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_client_id` tinyint(1) NOT NULL DEFAULT '0',
  `client_id_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `client_tax_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_time_format` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_time` tinyint(1) NOT NULL DEFAULT '1',
  `show_brand` tinyint(1) NOT NULL DEFAULT '0',
  `show_sku` tinyint(1) NOT NULL DEFAULT '1',
  `show_cat_code` tinyint(1) NOT NULL DEFAULT '1',
  `show_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `show_lot` tinyint(1) NOT NULL DEFAULT '0',
  `show_image` tinyint(1) NOT NULL DEFAULT '0',
  `show_sale_description` tinyint(1) NOT NULL DEFAULT '0',
  `sales_person_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_sales_person` tinyint(1) NOT NULL DEFAULT '0',
  `table_product_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_qty_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_unit_price_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_subtotal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cat_code_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_logo` tinyint(1) NOT NULL DEFAULT '0',
  `show_business_name` tinyint(1) NOT NULL DEFAULT '0',
  `show_location_name` tinyint(1) NOT NULL DEFAULT '1',
  `show_landmark` tinyint(1) NOT NULL DEFAULT '1',
  `show_city` tinyint(1) NOT NULL DEFAULT '1',
  `show_state` tinyint(1) NOT NULL DEFAULT '1',
  `show_zip_code` tinyint(1) NOT NULL DEFAULT '1',
  `show_country` tinyint(1) NOT NULL DEFAULT '1',
  `show_mobile_number` tinyint(1) NOT NULL DEFAULT '1',
  `show_alternate_number` tinyint(1) NOT NULL DEFAULT '0',
  `show_email` tinyint(1) NOT NULL DEFAULT '0',
  `show_tax_1` tinyint(1) NOT NULL DEFAULT '1',
  `show_tax_2` tinyint(1) NOT NULL DEFAULT '0',
  `show_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `show_payments` tinyint(1) NOT NULL DEFAULT '0',
  `show_customer` tinyint(1) NOT NULL DEFAULT '0',
  `customer_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `show_reward_point` tinyint(1) NOT NULL DEFAULT '0',
  `highlight_color` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `footer_text` text COLLATE utf8mb4_unicode_ci,
  `module_info` text COLLATE utf8mb4_unicode_ci,
  `common_settings` text COLLATE utf8mb4_unicode_ci,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `business_id` int(10) UNSIGNED NOT NULL,
  `design` varchar(190) COLLATE utf8mb4_unicode_ci DEFAULT 'classic',
  `cn_heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'cn = credit note',
  `cn_no_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cn_amount_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_tax_headings` text COLLATE utf8mb4_unicode_ci,
  `show_previous_bal` tinyint(1) NOT NULL DEFAULT '0',
  `prev_bal_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `change_return_label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `contact_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `location_custom_fields` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_layouts`
--

INSERT INTO `invoice_layouts` (`id`, `name`, `header_text`, `invoice_no_prefix`, `quotation_no_prefix`, `invoice_heading`, `sub_heading_line1`, `sub_heading_line2`, `sub_heading_line3`, `sub_heading_line4`, `sub_heading_line5`, `invoice_heading_not_paid`, `invoice_heading_paid`, `quotation_heading`, `sub_total_label`, `discount_label`, `tax_label`, `total_label`, `round_off_label`, `total_due_label`, `paid_label`, `show_client_id`, `client_id_label`, `client_tax_label`, `date_label`, `date_time_format`, `show_time`, `show_brand`, `show_sku`, `show_cat_code`, `show_expiry`, `show_lot`, `show_image`, `show_sale_description`, `sales_person_label`, `show_sales_person`, `table_product_label`, `table_qty_label`, `table_unit_price_label`, `table_subtotal_label`, `cat_code_label`, `logo`, `show_logo`, `show_business_name`, `show_location_name`, `show_landmark`, `show_city`, `show_state`, `show_zip_code`, `show_country`, `show_mobile_number`, `show_alternate_number`, `show_email`, `show_tax_1`, `show_tax_2`, `show_barcode`, `show_payments`, `show_customer`, `customer_label`, `show_reward_point`, `highlight_color`, `footer_text`, `module_info`, `common_settings`, `is_default`, `business_id`, `design`, `cn_heading`, `cn_no_label`, `cn_amount_label`, `table_tax_headings`, `show_previous_bal`, `prev_bal_label`, `change_return_label`, `product_custom_fields`, `contact_custom_fields`, `location_custom_fields`, `created_at`, `updated_at`) VALUES
(1, 'Invoice', NULL, 'Invoice No: LPSL/INV/', 'Quotation No: LPSL/Q/', 'INVOICE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'QUOTATION', 'Subtotal:', 'Discount:', 'VAT / TAX:', 'Grand Total:', NULL, 'Total Due:', 'Total Paid:', 0, 'Customer ID:', NULL, 'Date:', NULL, 1, 0, 0, 1, 0, 1, 0, 1, 'P.B:', 0, 'Description:', 'Quantity:', 'Unit Price:', 'Subtotal:', 'Part Number:', '1620802641_Header.jpg', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 'Customer:', 1, '#000000', '<pre style=\"text-align: left;\"><em><code>This documents was generated automaticaly by softwer and is valid without signture. </code></em><br /><em><code>Bank Detials:<br /></code></em><em><code>Limburg Power Solutions Ltd||A/C: 130611133161881||Gareeb-E-Newaz Branch||Mercantile Bank Ltd.<br />                                     <strong><span style=\"text-decoration: underline;\">BIN:003642949-0202</span></strong></code></em></pre>', '{\"types_of_service\":{\"types_of_service_label\":\"Service:\",\"show_types_of_service\":\"1\",\"show_tos_custom_fields\":\"1\"},\"service_staff\":{\"service_staff_label\":null}}', '{\"due_date_label\":\"Due Date:\",\"show_due_date\":\"1\",\"total_quantity_label\":\"Total Quantity:\",\"show_warranty_name\":\"1\",\"show_warranty_exp_date\":\"1\",\"show_warranty_description\":\"1\",\"num_to_word_format\":\"indian\"}', 1, 1, 'classic', 'Heading:', 'Reference Number:', 'Total Amount:', '[\"fffff\",null,null,null]', 0, 'Total Due (All sales):', 'Change Return:', '[\"product_custom_field1\"]', NULL, NULL, '2021-04-10 09:05:48', '2021-07-01 11:07:01'),
(2, 'Quotation', NULL, 'LPSL/SP/2021/', 'LPSL/Q/2021/', 'INVOICE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'QUOTATION', 'Subtotal', 'Discount', 'Tax', 'Total', 'Round Off', 'Due', 'Total paid', 1, 'Customer ID:', NULL, 'Date:', NULL, 1, 1, 1, 1, 0, 1, 0, 1, 'Prepared by:', 1, 'Product', 'Quantity', 'Unit Price', 'Subtotal', 'HSN', '1620737248_Header.jpg', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 'Customer:', 0, '#000000', NULL, '{\"types_of_service\":{\"types_of_service_label\":\"Service\",\"show_types_of_service\":\"1\",\"show_tos_custom_fields\":\"1\"},\"tables\":{\"table_label\":null},\"service_staff\":{\"service_staff_label\":null}}', '{\"due_date_label\":\"Due Date:\",\"show_due_date\":\"1\",\"total_quantity_label\":\"Total Quantity\",\"show_warranty_name\":\"1\",\"show_warranty_exp_date\":\"1\",\"show_warranty_description\":\"1\",\"show_total_in_words\":\"1\",\"num_to_word_format\":\"international\"}', 0, 1, 'classic', 'Credit Note', 'Reference No', 'Credit Amount', NULL, 1, 'Total Due', 'Change Return', NULL, NULL, NULL, '2021-05-08 11:23:29', '2021-05-12 06:57:21');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_schemes`
--

CREATE TABLE `invoice_schemes` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheme_type` enum('blank','year') COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_number` int(11) DEFAULT NULL,
  `invoice_count` int(11) NOT NULL DEFAULT '0',
  `total_digits` int(11) DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_schemes`
--

INSERT INTO `invoice_schemes` (`id`, `business_id`, `name`, `scheme_type`, `prefix`, `start_number`, `invoice_count`, `total_digits`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 'Invoice', 'year', '', 1, 20, 6, 1, '2021-04-10 09:05:48', '2021-07-04 07:45:42'),
(2, 1, 'Quotation', 'year', NULL, 1, 0, 6, 0, '2021-05-08 15:13:04', '2021-05-08 15:13:04');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `file_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `uploaded_by` int(11) DEFAULT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_media_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `business_id`, `file_name`, `description`, `uploaded_by`, `model_type`, `model_media_type`, `model_id`, `created_at`, `updated_at`) VALUES
(1, 1, '1620478437_369312146_CamScanner 01-05-2021 13.34_1.jpg', NULL, 1, 'App\\User', NULL, 1, '2021-05-08 12:53:57', '2021-05-08 12:53:57'),
(2, 1, '1620481477_1123128032_ALP 30.5.pdf', NULL, 1, 'App\\Product', NULL, 1, '2021-05-08 13:44:37', '2021-05-08 13:44:37'),
(3, 1, '1620822861_1178986209_Quotation - Trial.pdf', NULL, 2, 'App\\DocumentAndNote', NULL, 1, '2021-05-12 12:34:31', '2021-05-12 12:34:31'),
(5, 1, '1624193430_2085793594_20210529_112242.jpg', NULL, 9, 'App\\User', NULL, 9, '2021-06-20 12:50:30', '2021-06-20 12:50:30'),
(7, 1, '1625394431_1198895304_Kamrul Lasure.JPG', NULL, 3, 'App\\DocumentAndNote', NULL, 7, '2021-07-04 10:29:06', '2021-07-04 10:29:06'),
(8, 1, '1625397215_816892799_MWMTVG620V12K.pdf', NULL, 1, 'App\\DocumentAndNote', NULL, 7, '2021-07-04 11:13:37', '2021-07-04 11:13:37');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2017_07_05_071953_create_currencies_table', 1),
(9, '2017_07_05_073658_create_business_table', 1),
(10, '2017_07_22_075923_add_business_id_users_table', 1),
(11, '2017_07_23_113209_create_brands_table', 1),
(12, '2017_07_26_083429_create_permission_tables', 1),
(13, '2017_07_26_110000_create_tax_rates_table', 1),
(14, '2017_07_26_122313_create_units_table', 1),
(15, '2017_07_27_075706_create_contacts_table', 1),
(16, '2017_08_04_071038_create_categories_table', 1),
(17, '2017_08_08_115903_create_products_table', 1),
(18, '2017_08_09_061616_create_variation_templates_table', 1),
(19, '2017_08_09_061638_create_variation_value_templates_table', 1),
(20, '2017_08_10_061146_create_product_variations_table', 1),
(21, '2017_08_10_061216_create_variations_table', 1),
(22, '2017_08_19_054827_create_transactions_table', 1),
(23, '2017_08_31_073533_create_purchase_lines_table', 1),
(24, '2017_10_15_064638_create_transaction_payments_table', 1),
(25, '2017_10_31_065621_add_default_sales_tax_to_business_table', 1),
(26, '2017_11_20_051930_create_table_group_sub_taxes', 1),
(27, '2017_11_20_063603_create_transaction_sell_lines', 1),
(28, '2017_11_21_064540_create_barcodes_table', 1),
(29, '2017_11_23_181237_create_invoice_schemes_table', 1),
(30, '2017_12_25_122822_create_business_locations_table', 1),
(31, '2017_12_25_160253_add_location_id_to_transactions_table', 1),
(32, '2017_12_25_163227_create_variation_location_details_table', 1),
(33, '2018_01_04_115627_create_sessions_table', 1),
(34, '2018_01_05_112817_create_invoice_layouts_table', 1),
(35, '2018_01_06_112303_add_invoice_scheme_id_and_invoice_layout_id_to_business_locations', 1),
(36, '2018_01_08_104124_create_expense_categories_table', 1),
(37, '2018_01_08_123327_modify_transactions_table_for_expenses', 1),
(38, '2018_01_09_111005_modify_payment_status_in_transactions_table', 1),
(39, '2018_01_09_111109_add_paid_on_column_to_transaction_payments_table', 1),
(40, '2018_01_25_172439_add_printer_related_fields_to_business_locations_table', 1),
(41, '2018_01_27_184322_create_printers_table', 1),
(42, '2018_01_30_181442_create_cash_registers_table', 1),
(43, '2018_01_31_125836_create_cash_register_transactions_table', 1),
(44, '2018_02_07_173326_modify_business_table', 1),
(45, '2018_02_08_105425_add_enable_product_expiry_column_to_business_table', 1),
(46, '2018_02_08_111027_add_expiry_period_and_expiry_period_type_columns_to_products_table', 1),
(47, '2018_02_08_131118_add_mfg_date_and_exp_date_purchase_lines_table', 1),
(48, '2018_02_08_155348_add_exchange_rate_to_transactions_table', 1),
(49, '2018_02_09_124945_modify_transaction_payments_table_for_contact_payments', 1),
(50, '2018_02_12_113640_create_transaction_sell_lines_purchase_lines_table', 1),
(51, '2018_02_12_114605_add_quantity_sold_in_purchase_lines_table', 1),
(52, '2018_02_13_183323_alter_decimal_fields_size', 1),
(53, '2018_02_14_161928_add_transaction_edit_days_to_business_table', 1),
(54, '2018_02_15_161032_add_document_column_to_transactions_table', 1),
(55, '2018_02_17_124709_add_more_options_to_invoice_layouts', 1),
(56, '2018_02_19_111517_add_keyboard_shortcut_column_to_business_table', 1),
(57, '2018_02_19_121537_stock_adjustment_move_to_transaction_table', 1),
(58, '2018_02_20_165505_add_is_direct_sale_column_to_transactions_table', 1),
(59, '2018_02_21_105329_create_system_table', 1),
(60, '2018_02_23_100549_version_1_2', 1),
(61, '2018_02_23_125648_add_enable_editing_sp_from_purchase_column_to_business_table', 1),
(62, '2018_02_26_103612_add_sales_commission_agent_column_to_business_table', 1),
(63, '2018_02_26_130519_modify_users_table_for_sales_cmmsn_agnt', 1),
(64, '2018_02_26_134500_add_commission_agent_to_transactions_table', 1),
(65, '2018_02_27_121422_add_item_addition_method_to_business_table', 1),
(66, '2018_02_27_170232_modify_transactions_table_for_stock_transfer', 1),
(67, '2018_03_05_153510_add_enable_inline_tax_column_to_business_table', 1),
(68, '2018_03_06_210206_modify_product_barcode_types', 1),
(69, '2018_03_13_181541_add_expiry_type_to_business_table', 1),
(70, '2018_03_16_113446_product_expiry_setting_for_business', 1),
(71, '2018_03_19_113601_add_business_settings_options', 1),
(72, '2018_03_26_125334_add_pos_settings_to_business_table', 1),
(73, '2018_03_26_165350_create_customer_groups_table', 1),
(74, '2018_03_27_122720_customer_group_related_changes_in_tables', 1),
(75, '2018_03_29_110138_change_tax_field_to_nullable_in_business_table', 1),
(76, '2018_03_29_115502_add_changes_for_sr_number_in_products_and_sale_lines_table', 1),
(77, '2018_03_29_134340_add_inline_discount_fields_in_purchase_lines', 1),
(78, '2018_03_31_140921_update_transactions_table_exchange_rate', 1),
(79, '2018_04_03_103037_add_contact_id_to_contacts_table', 1),
(80, '2018_04_03_122709_add_changes_to_invoice_layouts_table', 1),
(81, '2018_04_09_135320_change_exchage_rate_size_in_business_table', 1),
(82, '2018_04_17_123122_add_lot_number_to_business', 1),
(83, '2018_04_17_160845_add_product_racks_table', 1),
(84, '2018_04_20_182015_create_res_tables_table', 1),
(85, '2018_04_24_105246_restaurant_fields_in_transaction_table', 1),
(86, '2018_04_24_114149_add_enabled_modules_business_table', 1),
(87, '2018_04_24_133704_add_modules_fields_in_invoice_layout_table', 1),
(88, '2018_04_27_132653_quotation_related_change', 1),
(89, '2018_05_02_104439_add_date_format_and_time_format_to_business', 1),
(90, '2018_05_02_111939_add_sell_return_to_transaction_payments', 1),
(91, '2018_05_14_114027_add_rows_positions_for_products', 1),
(92, '2018_05_14_125223_add_weight_to_products_table', 1),
(93, '2018_05_14_164754_add_opening_stock_permission', 1),
(94, '2018_05_15_134729_add_design_to_invoice_layouts', 1),
(95, '2018_05_16_183307_add_tax_fields_invoice_layout', 1),
(96, '2018_05_18_191956_add_sell_return_to_transaction_table', 1),
(97, '2018_05_21_131349_add_custom_fileds_to_contacts_table', 1),
(98, '2018_05_21_131607_invoice_layout_fields_for_sell_return', 1),
(99, '2018_05_21_131949_add_custom_fileds_and_website_to_business_locations_table', 1),
(100, '2018_05_22_123527_create_reference_counts_table', 1),
(101, '2018_05_22_154540_add_ref_no_prefixes_column_to_business_table', 1),
(102, '2018_05_24_132620_add_ref_no_column_to_transaction_payments_table', 1),
(103, '2018_05_24_161026_add_location_id_column_to_business_location_table', 1),
(104, '2018_05_25_180603_create_modifiers_related_table', 1),
(105, '2018_05_29_121714_add_purchase_line_id_to_stock_adjustment_line_table', 1),
(106, '2018_05_31_114645_add_res_order_status_column_to_transactions_table', 1),
(107, '2018_06_05_103530_rename_purchase_line_id_in_stock_adjustment_lines_table', 1),
(108, '2018_06_05_111905_modify_products_table_for_modifiers', 1),
(109, '2018_06_06_110524_add_parent_sell_line_id_column_to_transaction_sell_lines_table', 1),
(110, '2018_06_07_152443_add_is_service_staff_to_roles_table', 1),
(111, '2018_06_07_182258_add_image_field_to_products_table', 1),
(112, '2018_06_13_133705_create_bookings_table', 1),
(113, '2018_06_15_173636_add_email_column_to_contacts_table', 1),
(114, '2018_06_27_182835_add_superadmin_related_fields_business', 1),
(115, '2018_07_10_101913_add_custom_fields_to_products_table', 1),
(116, '2018_07_17_103434_add_sales_person_name_label_to_invoice_layouts_table', 1),
(117, '2018_07_17_163920_add_theme_skin_color_column_to_business_table', 1),
(118, '2018_07_24_160319_add_lot_no_line_id_to_transaction_sell_lines_table', 1),
(119, '2018_07_25_110004_add_show_expiry_and_show_lot_colums_to_invoice_layouts_table', 1),
(120, '2018_07_25_172004_add_discount_columns_to_transaction_sell_lines_table', 1),
(121, '2018_07_26_124720_change_design_column_type_in_invoice_layouts_table', 1),
(122, '2018_07_26_170424_add_unit_price_before_discount_column_to_transaction_sell_line_table', 1),
(123, '2018_07_28_103614_add_credit_limit_column_to_contacts_table', 1),
(124, '2018_08_08_110755_add_new_payment_methods_to_transaction_payments_table', 1),
(125, '2018_08_08_122225_modify_cash_register_transactions_table_for_new_payment_methods', 1),
(126, '2018_08_14_104036_add_opening_balance_type_to_transactions_table', 1),
(127, '2018_09_04_155900_create_accounts_table', 1),
(128, '2018_09_06_114438_create_selling_price_groups_table', 1),
(129, '2018_09_06_154057_create_variation_group_prices_table', 1),
(130, '2018_09_07_102413_add_permission_to_access_default_selling_price', 1),
(131, '2018_09_07_134858_add_selling_price_group_id_to_transactions_table', 1),
(132, '2018_09_10_112448_update_product_type_to_single_if_null_in_products_table', 1),
(133, '2018_09_10_152703_create_account_transactions_table', 1),
(134, '2018_09_10_173656_add_account_id_column_to_transaction_payments_table', 1),
(135, '2018_09_19_123914_create_notification_templates_table', 1),
(136, '2018_09_22_110504_add_sms_and_email_settings_columns_to_business_table', 1),
(137, '2018_09_24_134942_add_lot_no_line_id_to_stock_adjustment_lines_table', 1),
(138, '2018_09_26_105557_add_transaction_payments_for_existing_expenses', 1),
(139, '2018_09_27_111609_modify_transactions_table_for_purchase_return', 1),
(140, '2018_09_27_131154_add_quantity_returned_column_to_purchase_lines_table', 1),
(141, '2018_10_02_131401_add_return_quantity_column_to_transaction_sell_lines_table', 1),
(142, '2018_10_03_104918_add_qty_returned_column_to_transaction_sell_lines_purchase_lines_table', 1),
(143, '2018_10_03_185947_add_default_notification_templates_to_database', 1),
(144, '2018_10_09_153105_add_business_id_to_transaction_payments_table', 1),
(145, '2018_10_16_135229_create_permission_for_sells_and_purchase', 1),
(146, '2018_10_22_114441_add_columns_for_variable_product_modifications', 1),
(147, '2018_10_22_134428_modify_variable_product_data', 1),
(148, '2018_10_30_181558_add_table_tax_headings_to_invoice_layout', 1),
(149, '2018_10_31_122619_add_pay_terms_field_transactions_table', 1),
(150, '2018_10_31_161328_add_new_permissions_for_pos_screen', 1),
(151, '2018_10_31_174752_add_access_selected_contacts_only_to_users_table', 1),
(152, '2018_10_31_175627_add_user_contact_access', 1),
(153, '2018_10_31_180559_add_auto_send_sms_column_to_notification_templates_table', 1),
(154, '2018_11_02_171949_change_card_type_column_to_varchar_in_transaction_payments_table', 1),
(155, '2018_11_08_105621_add_role_permissions', 1),
(156, '2018_11_26_114135_add_is_suspend_column_to_transactions_table', 1),
(157, '2018_11_28_104410_modify_units_table_for_multi_unit', 1),
(158, '2018_11_28_170952_add_sub_unit_id_to_purchase_lines_and_sell_lines', 1),
(159, '2018_11_29_115918_add_primary_key_in_system_table', 1),
(160, '2018_12_03_185546_add_product_description_column_to_products_table', 1),
(161, '2018_12_06_114937_modify_system_table_and_users_table', 1),
(162, '2018_12_13_160007_add_custom_fields_display_options_to_invoice_layouts_table', 1),
(163, '2018_12_14_103307_modify_system_table', 1),
(164, '2018_12_18_133837_add_prev_balance_due_columns_to_invoice_layouts_table', 1),
(165, '2018_12_18_170656_add_invoice_token_column_to_transaction_table', 1),
(166, '2018_12_20_133639_add_date_time_format_column_to_invoice_layouts_table', 1),
(167, '2018_12_21_120659_add_recurring_invoice_fields_to_transactions_table', 1),
(168, '2018_12_24_154933_create_notifications_table', 1),
(169, '2019_01_08_112015_add_document_column_to_transaction_payments_table', 1),
(170, '2019_01_10_124645_add_account_permission', 1),
(171, '2019_01_16_125825_add_subscription_no_column_to_transactions_table', 1),
(172, '2019_01_28_111647_add_order_addresses_column_to_transactions_table', 1),
(173, '2019_02_13_173821_add_is_inactive_column_to_products_table', 1),
(174, '2019_02_19_103118_create_discounts_table', 1),
(175, '2019_02_21_120324_add_discount_id_column_to_transaction_sell_lines_table', 1),
(176, '2019_02_21_134324_add_permission_for_discount', 1),
(177, '2019_03_04_170832_add_service_staff_columns_to_transaction_sell_lines_table', 1),
(178, '2019_03_09_102425_add_sub_type_column_to_transactions_table', 1),
(179, '2019_03_09_124457_add_indexing_transaction_sell_lines_purchase_lines_table', 1),
(180, '2019_03_12_120336_create_activity_log_table', 1),
(181, '2019_03_15_132925_create_media_table', 1),
(182, '2019_05_08_130339_add_indexing_to_parent_id_in_transaction_payments_table', 1),
(183, '2019_05_10_132311_add_missing_column_indexing', 1),
(184, '2019_05_14_091812_add_show_image_column_to_invoice_layouts_table', 1),
(185, '2019_05_25_104922_add_view_purchase_price_permission', 1),
(186, '2019_06_17_103515_add_profile_informations_columns_to_users_table', 1),
(187, '2019_06_18_135524_add_permission_to_view_own_sales_only', 1),
(188, '2019_06_19_112058_add_database_changes_for_reward_points', 1),
(189, '2019_06_28_133732_change_type_column_to_string_in_transactions_table', 1),
(190, '2019_07_13_111420_add_is_created_from_api_column_to_transactions_table', 1),
(191, '2019_07_15_165136_add_fields_for_combo_product', 1),
(192, '2019_07_19_103446_add_mfg_quantity_used_column_to_purchase_lines_table', 1),
(193, '2019_07_22_152649_add_not_for_selling_in_product_table', 1),
(194, '2019_07_29_185351_add_show_reward_point_column_to_invoice_layouts_table', 1),
(195, '2019_08_08_162302_add_sub_units_related_fields', 1),
(196, '2019_08_26_133419_update_price_fields_decimal_point', 1),
(197, '2019_09_02_160054_remove_location_permissions_from_roles', 1),
(198, '2019_09_03_185259_add_permission_for_pos_screen', 1),
(199, '2019_09_04_163141_add_location_id_to_cash_registers_table', 1),
(200, '2019_09_04_184008_create_types_of_services_table', 1),
(201, '2019_09_06_131445_add_types_of_service_fields_to_transactions_table', 1),
(202, '2019_09_09_134810_add_default_selling_price_group_id_column_to_business_locations_table', 1),
(203, '2019_09_12_105616_create_product_locations_table', 1),
(204, '2019_09_17_122522_add_custom_labels_column_to_business_table', 1),
(205, '2019_09_18_164319_add_shipping_fields_to_transactions_table', 1),
(206, '2019_09_19_170927_close_all_active_registers', 1),
(207, '2019_09_23_161906_add_media_description_cloumn_to_media_table', 1),
(208, '2019_10_18_155633_create_account_types_table', 1),
(209, '2019_10_22_163335_add_common_settings_column_to_business_table', 1),
(210, '2019_10_29_132521_add_update_purchase_status_permission', 1),
(211, '2019_11_09_110522_add_indexing_to_lot_number', 1),
(212, '2019_11_19_170824_add_is_active_column_to_business_locations_table', 1),
(213, '2019_11_21_162913_change_quantity_field_types_to_decimal', 1),
(214, '2019_11_25_160340_modify_categories_table_for_polymerphic_relationship', 1),
(215, '2019_12_02_105025_create_warranties_table', 1),
(216, '2019_12_03_180342_add_common_settings_field_to_invoice_layouts_table', 1),
(217, '2019_12_05_183955_add_more_fields_to_users_table', 1),
(218, '2019_12_06_174904_add_change_return_label_column_to_invoice_layouts_table', 1),
(219, '2019_12_11_121307_add_draft_and_quotation_list_permissions', 1),
(220, '2019_12_12_180126_copy_expense_total_to_total_before_tax', 1),
(221, '2019_12_19_181412_make_alert_quantity_field_nullable_on_products_table', 1),
(222, '2019_12_25_173413_create_dashboard_configurations_table', 1),
(223, '2020_01_08_133506_create_document_and_notes_table', 1),
(224, '2020_01_09_113252_add_cc_bcc_column_to_notification_templates_table', 1),
(225, '2020_01_16_174818_add_round_off_amount_field_to_transactions_table', 1),
(226, '2020_01_28_162345_add_weighing_scale_settings_in_business_settings_table', 1),
(227, '2020_02_18_172447_add_import_fields_to_transactions_table', 1),
(228, '2020_03_13_135844_add_is_active_column_to_selling_price_groups_table', 1),
(229, '2020_03_16_115449_add_contact_status_field_to_contacts_table', 1),
(230, '2020_03_26_124736_add_allow_login_column_in_users_table', 1),
(231, '2020_04_13_154150_add_feature_products_column_to_business_loactions', 1),
(232, '2020_04_15_151802_add_user_type_to_users_table', 1),
(233, '2020_04_22_153905_add_subscription_repeat_on_column_to_transactions_table', 1),
(234, '2020_04_28_111436_add_shipping_address_to_contacts_table', 1),
(235, '2020_06_01_094654_add_max_sale_discount_column_to_users_table', 1),
(236, '2020_06_12_162245_modify_contacts_table', 1),
(237, '2020_06_22_103104_change_recur_interval_default_to_one', 1),
(238, '2020_07_09_174621_add_balance_field_to_contacts_table', 1),
(239, '2020_07_23_104933_change_status_column_to_varchar_in_transaction_table', 1),
(240, '2020_09_07_171059_change_completed_stock_transfer_status_to_final', 1),
(241, '2020_09_21_123224_modify_booking_status_column_in_bookings_table', 1),
(242, '2020_09_22_121639_create_discount_variations_table', 1),
(243, '2020_10_05_121550_modify_business_location_table_for_invoice_layout', 1),
(244, '2020_10_16_175726_set_status_as_received_for_opening_stock', 1),
(245, '2020_10_23_170823_add_for_group_tax_column_to_tax_rates_table', 1),
(246, '2020_11_04_130940_add_more_custom_fields_to_contacts_table', 1),
(247, '2020_11_10_152841_add_cash_register_permissions', 1),
(248, '2020_11_17_164041_modify_type_column_to_varchar_in_contacts_table', 1),
(249, '2020_12_18_181447_add_shipping_custom_fields_to_transactions_table', 1),
(250, '2020_12_22_164303_add_sub_status_column_to_transactions_table', 1),
(251, '2020_12_24_153050_add_custom_fields_to_transactions_table', 1),
(252, '2020_12_28_105403_add_whatsapp_text_column_to_notification_templates_table', 1),
(253, '2020_12_29_165925_add_model_document_type_to_media_table', 1),
(254, '2021_02_08_175632_add_contact_number_fields_to_users_table', 1),
(255, '2021_02_11_172217_add_indexing_for_multiple_columns', 1),
(256, '2021_02_23_122043_add_more_columns_to_customer_groups_table', 1),
(257, '2021_02_24_175551_add_print_invoice_permission_to_all_roles', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(82, 'App\\User', 2),
(80, 'App\\User', 3),
(80, 'App\\User', 4),
(80, 'App\\User', 5),
(80, 'App\\User', 6),
(80, 'App\\User', 7),
(80, 'App\\User', 8),
(80, 'App\\User', 9);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` int(10) UNSIGNED NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\User', 1),
(3, 'App\\User', 2),
(1, 'App\\User', 3),
(4, 'App\\User', 4),
(5, 'App\\User', 5),
(3, 'App\\User', 6),
(6, 'App\\User', 7),
(4, 'App\\User', 8),
(3, 'App\\User', 9);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(11) NOT NULL,
  `template_for` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci,
  `sms_body` text COLLATE utf8mb4_unicode_ci,
  `whatsapp_text` text COLLATE utf8mb4_unicode_ci,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bcc` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_send` tinyint(1) NOT NULL DEFAULT '0',
  `auto_send_sms` tinyint(1) NOT NULL DEFAULT '0',
  `auto_send_wa_notif` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `business_id`, `template_for`, `email_body`, `sms_body`, `whatsapp_text`, `subject`, `cc`, `bcc`, `auto_send`, `auto_send_sms`, `auto_send_wa_notif`, `created_at`, `updated_at`) VALUES
(1, 1, 'new_sale', '<p>Dear {contact_name},</p>\n\n                    <p>Your invoice number is {invoice_number}<br />\n                    Total amount: {total_amount}<br />\n                    Paid amount: {received_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2021-04-10 09:05:48', '2021-04-10 09:05:48'),
(2, 1, 'payment_received', '<p>Dear {contact_name},</p>\n\n                <p>We have received a payment of {received_amount}</p>\n\n                <p>{business_logo}</p>', 'Dear {contact_name}, We have received a payment of {received_amount}. {business_name}', NULL, 'Payment Received, from {business_name}', NULL, NULL, 0, 0, 0, '2021-04-10 09:05:48', '2021-04-10 09:05:48'),
(3, 1, 'payment_reminder', '<p>Dear {contact_name},</p>\n\n                    <p>This is to remind you that you have pending payment of {due_amount}. Kindly pay it as soon as possible.</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, You have pending payment of {due_amount}. Kindly pay it as soon as possible. {business_name}', NULL, 'Payment Reminder, from {business_name}', NULL, NULL, 0, 0, 0, '2021-04-10 09:05:48', '2021-04-10 09:05:48'),
(4, 1, 'new_booking', '<p>Dear {contact_name},</p>\n\n                    <p>Your booking is confirmed</p>\n\n                    <p>Date: {start_time} to {end_time}</p>\n\n                    <p>Table: {table}</p>\n\n                    <p>Location: {location}</p>\n\n                    <p>{business_logo}</p>', 'Dear {contact_name}, Your booking is confirmed. Date: {start_time} to {end_time}, Table: {table}, Location: {location}', NULL, 'Booking Confirmed - {business_name}', NULL, NULL, 0, 0, 0, '2021-04-10 09:05:48', '2021-04-10 09:05:48'),
(5, 1, 'new_order', '<p>Dear {contact_name},</p>\n\n                    <p>We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'Dear {contact_name}, We have a new order with reference number {order_ref_number}. Kindly process the products as soon as possible. {business_name}', NULL, 'New Order, from {business_name}', NULL, NULL, 0, 0, 0, '2021-04-10 09:05:48', '2021-04-10 09:05:48'),
(6, 1, 'payment_paid', '<p>Dear {contact_name},</p>\n\n                    <p>We have paid amount {paid_amount} again invoice number {order_ref_number}.<br />\n                    Kindly note it down.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have paid amount {paid_amount} again invoice number {order_ref_number}.\n                    Kindly note it down. {business_name}', NULL, 'Payment Paid, from {business_name}', NULL, NULL, 0, 0, 0, '2021-04-10 09:05:48', '2021-04-10 09:05:48'),
(7, 1, 'items_received', '<p>Dear {contact_name},</p>\n\n                    <p>We have received all items from invoice reference number {order_ref_number}. Thank you for processing it.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'We have received all items from invoice reference number {order_ref_number}. Thank you for processing it. {business_name}', NULL, 'Items received, from {business_name}', NULL, NULL, 0, 0, 0, '2021-04-10 09:05:48', '2021-04-10 09:05:48'),
(8, 1, 'items_pending', '<p>Dear {contact_name},<br />\n                    This is to remind you that we have not yet received some items from invoice reference number {order_ref_number}. Please process it as soon as possible.</p>\n\n                    <p>{business_name}<br />\n                    {business_logo}</p>', 'This is to remind you that we have not yet received some items from invoice reference number {order_ref_number} . Please process it as soon as possible.{business_name}', NULL, 'Items Pending, from {business_name}', NULL, NULL, 0, 0, 0, '2021-04-10 09:05:48', '2021-04-10 09:05:48'),
(9, 1, 'new_quotation', '<p>Dear {contact_name},</p>\n\n                    <p>Your quotation number is {invoice_number}<br />\n                    Total amount: {total_amount}</p>\n\n                    <p>Thank you for shopping with us.</p>\n\n                    <p>{business_logo}</p>\n\n                    <p>&nbsp;</p>', 'Dear {contact_name}, Thank you for shopping with us. {business_name}', NULL, 'Thank you from {business_name}', NULL, NULL, 0, 0, 0, '2021-04-10 09:05:48', '2021-04-10 09:05:48');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('shafikul@limburg-power.com', '$2y$10$dgRHk8jIai.iLSrkoukQoeoZQDulM20WLGx/lMp.2liRf3xt9i4T2', '2021-05-08 14:04:33'),
('sabur@limburg-power.com', '$2y$10$hk3W8ySps0vSwt.cIyBwp.NBElgeJvM/lbO5jM9gixEOFOqqclnU.', '2021-05-08 14:04:48'),
('mahadi@limburg-power.com', '$2y$10$K7Ol6nfg.lDZu4ddMRRcDOomRJE6Pmxqg.HaVYF0lTG3xMOoX9XUy', '2021-07-04 15:31:00');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'profit_loss_report.view', 'web', '2021-04-10 09:02:50', NULL),
(2, 'direct_sell.access', 'web', '2021-04-10 09:02:50', NULL),
(3, 'product.opening_stock', 'web', '2021-04-10 09:02:50', '2021-04-10 09:02:50'),
(4, 'crud_all_bookings', 'web', '2021-04-10 09:02:50', '2021-04-10 09:02:50'),
(5, 'crud_own_bookings', 'web', '2021-04-10 09:02:50', '2021-04-10 09:02:50'),
(6, 'access_default_selling_price', 'web', '2021-04-10 09:02:51', '2021-04-10 09:02:51'),
(7, 'purchase.payments', 'web', '2021-04-10 09:02:51', '2021-04-10 09:02:51'),
(8, 'sell.payments', 'web', '2021-04-10 09:02:51', '2021-04-10 09:02:51'),
(9, 'edit_product_price_from_sale_screen', 'web', '2021-04-10 09:02:51', '2021-04-10 09:02:51'),
(10, 'edit_product_discount_from_sale_screen', 'web', '2021-04-10 09:02:51', '2021-04-10 09:02:51'),
(11, 'roles.view', 'web', '2021-04-10 09:02:51', '2021-04-10 09:02:51'),
(12, 'roles.create', 'web', '2021-04-10 09:02:51', '2021-04-10 09:02:51'),
(13, 'roles.update', 'web', '2021-04-10 09:02:51', '2021-04-10 09:02:51'),
(14, 'roles.delete', 'web', '2021-04-10 09:02:51', '2021-04-10 09:02:51'),
(15, 'account.access', 'web', '2021-04-10 09:02:51', '2021-04-10 09:02:51'),
(16, 'discount.access', 'web', '2021-04-10 09:02:51', '2021-04-10 09:02:51'),
(17, 'view_purchase_price', 'web', '2021-04-10 09:02:51', '2021-04-10 09:02:51'),
(18, 'view_own_sell_only', 'web', '2021-04-10 09:02:51', '2021-04-10 09:02:51'),
(19, 'edit_product_discount_from_pos_screen', 'web', '2021-04-10 09:02:51', '2021-04-10 09:02:51'),
(20, 'edit_product_price_from_pos_screen', 'web', '2021-04-10 09:02:51', '2021-04-10 09:02:51'),
(21, 'access_shipping', 'web', '2021-04-10 09:02:52', '2021-04-10 09:02:52'),
(22, 'purchase.update_status', 'web', '2021-04-10 09:02:52', '2021-04-10 09:02:52'),
(23, 'list_drafts', 'web', '2021-04-10 09:02:52', '2021-04-10 09:02:52'),
(24, 'list_quotations', 'web', '2021-04-10 09:02:52', '2021-04-10 09:02:52'),
(25, 'view_cash_register', 'web', '2021-04-10 09:02:53', '2021-04-10 09:02:53'),
(26, 'close_cash_register', 'web', '2021-04-10 09:02:53', '2021-04-10 09:02:53'),
(27, 'print_invoice', 'web', '2021-04-10 09:02:53', '2021-04-10 09:02:53'),
(28, 'user.view', 'web', '2021-04-10 09:02:53', NULL),
(29, 'user.create', 'web', '2021-04-10 09:02:53', NULL),
(30, 'user.update', 'web', '2021-04-10 09:02:53', NULL),
(31, 'user.delete', 'web', '2021-04-10 09:02:53', NULL),
(32, 'supplier.view', 'web', '2021-04-10 09:02:53', NULL),
(33, 'supplier.create', 'web', '2021-04-10 09:02:53', NULL),
(34, 'supplier.update', 'web', '2021-04-10 09:02:53', NULL),
(35, 'supplier.delete', 'web', '2021-04-10 09:02:53', NULL),
(36, 'customer.view', 'web', '2021-04-10 09:02:53', NULL),
(37, 'customer.create', 'web', '2021-04-10 09:02:53', NULL),
(38, 'customer.update', 'web', '2021-04-10 09:02:53', NULL),
(39, 'customer.delete', 'web', '2021-04-10 09:02:53', NULL),
(40, 'product.view', 'web', '2021-04-10 09:02:53', NULL),
(41, 'product.create', 'web', '2021-04-10 09:02:53', NULL),
(42, 'product.update', 'web', '2021-04-10 09:02:53', NULL),
(43, 'product.delete', 'web', '2021-04-10 09:02:53', NULL),
(44, 'purchase.view', 'web', '2021-04-10 09:02:53', NULL),
(45, 'purchase.create', 'web', '2021-04-10 09:02:53', NULL),
(46, 'purchase.update', 'web', '2021-04-10 09:02:53', NULL),
(47, 'purchase.delete', 'web', '2021-04-10 09:02:53', NULL),
(48, 'sell.view', 'web', '2021-04-10 09:02:53', NULL),
(49, 'sell.create', 'web', '2021-04-10 09:02:53', NULL),
(50, 'sell.update', 'web', '2021-04-10 09:02:53', NULL),
(51, 'sell.delete', 'web', '2021-04-10 09:02:53', NULL),
(52, 'purchase_n_sell_report.view', 'web', '2021-04-10 09:02:53', NULL),
(53, 'contacts_report.view', 'web', '2021-04-10 09:02:53', NULL),
(54, 'stock_report.view', 'web', '2021-04-10 09:02:53', NULL),
(55, 'tax_report.view', 'web', '2021-04-10 09:02:53', NULL),
(56, 'trending_product_report.view', 'web', '2021-04-10 09:02:53', NULL),
(57, 'register_report.view', 'web', '2021-04-10 09:02:53', NULL),
(58, 'sales_representative.view', 'web', '2021-04-10 09:02:53', NULL),
(59, 'expense_report.view', 'web', '2021-04-10 09:02:53', NULL),
(60, 'business_settings.access', 'web', '2021-04-10 09:02:53', NULL),
(61, 'barcode_settings.access', 'web', '2021-04-10 09:02:53', NULL),
(62, 'invoice_settings.access', 'web', '2021-04-10 09:02:53', NULL),
(63, 'brand.view', 'web', '2021-04-10 09:02:53', NULL),
(64, 'brand.create', 'web', '2021-04-10 09:02:53', NULL),
(65, 'brand.update', 'web', '2021-04-10 09:02:53', NULL),
(66, 'brand.delete', 'web', '2021-04-10 09:02:53', NULL),
(67, 'tax_rate.view', 'web', '2021-04-10 09:02:53', NULL),
(68, 'tax_rate.create', 'web', '2021-04-10 09:02:53', NULL),
(69, 'tax_rate.update', 'web', '2021-04-10 09:02:53', NULL),
(70, 'tax_rate.delete', 'web', '2021-04-10 09:02:53', NULL),
(71, 'unit.view', 'web', '2021-04-10 09:02:53', NULL),
(72, 'unit.create', 'web', '2021-04-10 09:02:53', NULL),
(73, 'unit.update', 'web', '2021-04-10 09:02:53', NULL),
(74, 'unit.delete', 'web', '2021-04-10 09:02:53', NULL),
(75, 'category.view', 'web', '2021-04-10 09:02:53', NULL),
(76, 'category.create', 'web', '2021-04-10 09:02:53', NULL),
(77, 'category.update', 'web', '2021-04-10 09:02:53', NULL),
(78, 'category.delete', 'web', '2021-04-10 09:02:53', NULL),
(79, 'expense.access', 'web', '2021-04-10 09:02:53', NULL),
(80, 'access_all_locations', 'web', '2021-04-10 09:02:53', NULL),
(81, 'dashboard.data', 'web', '2021-04-10 09:02:53', NULL),
(82, 'location.1', 'web', '2021-04-10 09:05:48', '2021-04-10 09:05:48'),
(83, 'customer.view_own', 'web', '2021-05-08 13:00:21', '2021-05-08 13:00:21'),
(84, 'view_own_purchase', 'web', '2021-05-08 13:00:21', '2021-05-08 13:00:21'),
(85, 'direct_sell.delete', 'web', '2021-05-08 13:00:21', '2021-05-08 13:00:21'),
(86, 'view_commission_agent_sell', 'web', '2021-05-08 13:00:21', '2021-05-08 13:00:21'),
(87, 'access_sell_return', 'web', '2021-05-08 13:00:21', '2021-05-08 13:00:21'),
(88, 'edit_invoice_number', 'web', '2021-05-08 13:00:21', '2021-05-08 13:00:21'),
(89, 'access_own_shipping', 'web', '2021-05-08 13:00:21', '2021-05-08 13:00:21'),
(90, 'access_commission_agent_shipping', 'web', '2021-05-08 13:00:21', '2021-05-08 13:00:21'),
(91, 'selling_price_group.1', 'web', '2021-05-08 14:10:15', '2021-05-08 14:10:15'),
(92, 'supplier.view_own', 'web', '2021-05-12 05:56:14', '2021-05-12 05:56:14'),
(93, 'view_product_stock_value', 'web', '2021-05-12 05:56:14', '2021-05-12 05:56:14'),
(94, 'access_types_of_service', 'web', '2021-05-12 16:08:58', '2021-05-12 16:08:58'),
(95, 'view_own_expense', 'web', '2021-05-12 16:08:58', '2021-05-12 16:08:58'),
(96, 'access_printers', 'web', '2021-05-12 16:08:58', '2021-05-12 16:08:58');

-- --------------------------------------------------------

--
-- Table structure for table `printers`
--

CREATE TABLE `printers` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection_type` enum('network','windows','linux') COLLATE utf8mb4_unicode_ci NOT NULL,
  `capability_profile` enum('default','simple','SP2000','TEP-200M','P822D') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `char_per_line` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `port` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `type` enum('single','variable','modifier','combo') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit_id` int(11) UNSIGNED DEFAULT NULL,
  `sub_unit_ids` text COLLATE utf8mb4_unicode_ci,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `sub_category_id` int(10) UNSIGNED DEFAULT NULL,
  `tax` int(10) UNSIGNED DEFAULT NULL,
  `tax_type` enum('inclusive','exclusive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `enable_stock` tinyint(1) NOT NULL DEFAULT '0',
  `alert_quantity` decimal(22,4) DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `barcode_type` enum('C39','C128','EAN13','EAN8','UPCA','UPCE') COLLATE utf8mb4_unicode_ci DEFAULT 'C128',
  `expiry_period` decimal(4,2) DEFAULT NULL,
  `expiry_period_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_sr_no` tinyint(1) NOT NULL DEFAULT '0',
  `weight` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_custom_field4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED NOT NULL,
  `warranty_id` int(11) DEFAULT NULL,
  `is_inactive` tinyint(1) NOT NULL DEFAULT '0',
  `not_for_selling` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `business_id`, `type`, `unit_id`, `sub_unit_ids`, `brand_id`, `category_id`, `sub_category_id`, `tax`, `tax_type`, `enable_stock`, `alert_quantity`, `sku`, `barcode_type`, `expiry_period`, `expiry_period_type`, `enable_sr_no`, `weight`, `product_custom_field1`, `product_custom_field2`, `product_custom_field3`, `product_custom_field4`, `image`, `product_description`, `created_by`, `warranty_id`, `is_inactive`, `not_for_selling`, `created_at`, `updated_at`) VALUES
(1, 'Diesel Generator', 1, 'single', 1, NULL, 2, NULL, NULL, NULL, 'exclusive', 1, NULL, '0001', 'C128', NULL, NULL, 1, '350 KG', NULL, NULL, NULL, NULL, NULL, '<p>General Characteristics<br />Model Name ALP 30.5<br />Frequency (Hz) 50<br />Fuel Type Diesel<br />Engine Made and Model LISTER PETTER LPWX4A27LPWX427 (3000)<br />Alternator Made and Model PM142F<br />Control Panel Model DSE 6120<br />Canopy AK 20<br />ENGINE SPECIFICATIONS<br />Engine LISTER PETTER<br />Engine Model LPWX4A27LPWX427 (3000)<br />Number of Cylinder (L) 4 cylinders - in line<br />Bore (mm.) 86<br />Stroke (mm.) 80<br />Aspiration Naturally Aspirated<br />Compression Ratio 18.5:1<br />RPM (d/dk) 3000<br />Block Heater QTY 1</p>', 1, 1, 0, 0, '2021-05-08 11:31:19', '2021-05-08 13:44:37'),
(2, '12453572 Pre-Chamber Spark Plug', 1, 'single', 1, NULL, 1, 4, 10, NULL, 'exclusive', 1, 10.0000, '((((', 'C128', NULL, NULL, 1, '0.56KG', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, '2021-05-08 13:36:53', '2021-06-21 05:14:46'),
(3, '12216896 AIR FILTER ELEMENT', 1, 'single', 1, '[\"1\"]', 1, NULL, NULL, NULL, 'exclusive', 1, 10.0000, '12216896', 'C128', NULL, NULL, 1, '6.55 KG', '12219925', NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-05-09 04:09:46', '2021-05-11 03:05:37'),
(4, '12322054 TECHO GENERATOR', 1, 'single', 1, '[\"1\"]', 1, 1, NULL, NULL, 'inclusive', 1, 1.0000, '12322054', 'C128', NULL, NULL, 1, '0.17kg', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, '2021-05-11 05:04:32', '2021-05-11 05:13:58'),
(5, 'FP 205 GASKET', 1, 'single', 1, '[\"1\"]', 1, 3, NULL, NULL, 'exclusive', 1, NULL, 'FP 205', 'C128', NULL, NULL, 1, '0.2kg', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, '2021-05-11 05:26:45', '2021-05-11 05:26:45'),
(6, '12272453 SPIN ON FILTER', 1, 'single', 1, '[\"1\"]', 1, NULL, NULL, NULL, 'exclusive', 1, 5.0000, '12272453', 'C128', NULL, NULL, 0, '1KG', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-05-11 08:55:35', '2021-05-11 08:55:35'),
(7, '12128936 LUBE OIL FILTER', 1, 'single', 1, '[\"1\"]', 1, 4, NULL, NULL, 'exclusive', 1, 50.0000, '12128936', 'C128', NULL, NULL, 1, '2.2KG', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-05-11 09:33:12', '2021-05-12 07:08:19'),
(8, 'REPAIR JOBS', 1, 'single', 3, '[\"3\"]', NULL, NULL, NULL, NULL, 'exclusive', 1, NULL, 'Part Number0008', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-05-12 05:20:58', '2021-05-12 05:20:58'),
(11, '4160610 JKT WATER PUMP GP', 1, 'single', 1, '[\"1\"]', 4, 3, NULL, NULL, 'exclusive', 1, NULL, '4160610', 'C128', NULL, NULL, 1, '20kg', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, '2021-05-20 15:50:01', '2021-07-03 05:47:21'),
(12, '1858786 AIR FILTER', 1, 'single', 1, '[\"1\"]', 4, 4, 11, NULL, 'exclusive', 1, NULL, '1858786', 'C128', NULL, NULL, 1, '7KG', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-05-20 15:55:44', '2021-05-20 15:55:44'),
(13, '12211173 SET OF PIST. RINGS', 1, 'single', 1, NULL, 1, 3, NULL, NULL, 'exclusive', 1, NULL, 'Part Number0013', 'C128', NULL, NULL, 1, '0.56KG', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, '2021-05-22 17:27:22', '2021-05-22 17:27:22'),
(14, '01171113 O-SEAL', 1, 'single', 1, '[\"1\"]', 1, 3, 6, NULL, 'exclusive', 1, NULL, '01171113', 'C128', NULL, NULL, 1, '0.008kg', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, '2021-05-22 17:29:36', '2021-05-22 17:29:36'),
(15, '12128846 ROUND SEALING RING', 1, 'single', 1, '[\"1\"]', 1, 3, NULL, NULL, 'exclusive', 1, NULL, '12128846', 'C128', NULL, NULL, 1, '0.024kg', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, '2021-05-22 17:32:27', '2021-05-22 17:32:27'),
(16, '12302087 V-GROOVED PULLEY', 1, 'single', 1, '[\"1\"]', 1, 3, NULL, NULL, 'exclusive', 1, NULL, '12302087', 'C128', NULL, NULL, 1, '1.6kg', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-05-22 17:35:33', '2021-05-22 17:35:33'),
(17, '12302287 PRESS. RELIEF VALVE', 1, 'single', 1, NULL, 1, 3, NULL, NULL, 'exclusive', 1, NULL, '12302287', 'C128', NULL, NULL, 1, '7,7KG', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-05-22 17:38:55', '2021-05-22 17:38:55'),
(18, '12300501 CAMSHAFT', 1, 'single', 1, '[\"1\"]', 1, 3, NULL, NULL, 'exclusive', 1, NULL, '12300501', 'C128', NULL, NULL, 1, '37kg', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, '2021-05-23 09:17:56', '2021-06-13 04:20:51'),
(19, '12137125 SLIPRING', 1, 'single', 1, '[\"1\"]', 1, 3, NULL, NULL, 'exclusive', 1, NULL, '12137125', 'C128', NULL, NULL, 0, '0.48KG', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-05-23 09:41:58', '2021-05-23 09:41:58'),
(20, '12507242 PRESSURE REGULATOR', 1, 'single', 1, NULL, 1, 3, NULL, NULL, 'exclusive', 1, NULL, '12507242', 'C128', NULL, NULL, 0, '2.63KG', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, '2021-05-23 09:44:29', '2021-05-23 09:44:29'),
(21, '200/WS-026 REPAIR KIT', 1, 'single', 1, '[\"1\"]', 1, 3, NULL, NULL, 'exclusive', 1, NULL, '200/WS-026', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-05-23 09:48:13', '2021-05-23 09:48:13'),
(22, '12501531 BUS COUPLER', 1, 'single', 1, '[\"1\"]', 1, 1, NULL, NULL, 'exclusive', 1, NULL, '12501531', 'C128', NULL, NULL, 1, '0.16KG', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-05-23 09:50:57', '2021-05-23 09:50:57'),
(23, '12037138 COMPENSATOR', 1, 'single', 1, '[\"1\"]', 1, NULL, NULL, NULL, 'exclusive', 1, NULL, '12037138', 'C128', NULL, NULL, 1, '6.06KG', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-05-23 09:52:59', '2021-05-23 09:52:59'),
(24, '12403084 SAFETY VALVE', 1, 'single', 1, NULL, 1, 3, NULL, NULL, 'exclusive', 1, NULL, '12403084', 'C128', NULL, NULL, 1, '0.98KG', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-05-23 11:36:38', '2021-05-23 11:36:38'),
(25, '01149127 CHEESE HEAD SCREW', 1, 'single', 1, '[\"1\"]', 1, 3, NULL, NULL, 'exclusive', 1, NULL, '01149127', 'C128', NULL, NULL, 1, '0.68KG', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-05-23 11:41:38', '2021-06-20 04:36:58'),
(26, '01180993 O-SEAL', 1, 'single', 1, NULL, 1, 3, 6, NULL, 'exclusive', 1, 20.0000, '(((((((', 'C128', NULL, NULL, 1, '0.05KG', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-05-27 08:46:19', '2021-05-27 08:46:19'),
(27, '12189925 AIR FILTER', 1, 'single', 1, '[\"1\"]', 1, 4, 11, NULL, 'exclusive', 1, NULL, '12189925', 'C128', NULL, NULL, 1, '7.2KG', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-05-27 13:16:03', '2021-05-27 13:16:03'),
(28, '7E7581 RING PISTON', 1, 'single', 1, '[\"1\"]', 4, 3, NULL, NULL, 'exclusive', 1, NULL, '7E7581', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-06-10 07:36:20', '2021-06-10 07:36:20'),
(29, '8N1234 RING PISTON', 1, 'single', 1, '[\"1\"]', 4, 3, NULL, NULL, 'exclusive', 1, NULL, '8N1234', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-06-10 07:38:14', '2021-06-10 07:38:14'),
(30, '7W2221 RING PISTON', 1, 'single', 1, '[\"1\"]', 4, 3, NULL, NULL, 'exclusive', 1, NULL, '7W2221', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-06-10 07:39:59', '2021-06-10 07:39:59'),
(31, 'SERVICE / TROUBLESHOOTING', 1, 'single', 3, '[\"3\"]', NULL, NULL, NULL, NULL, 'exclusive', 1, NULL, '((((((((((((((', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-06-10 09:09:49', '2021-06-22 10:45:20'),
(32, 'M40FA640 AVR', 1, 'single', 1, '[\"1\"]', 1, 1, NULL, NULL, 'exclusive', 1, NULL, 'M40FA640', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, '2021-06-10 10:19:03', '2021-06-10 10:19:03'),
(33, '9Y-6792 SPARK PLUG WASHER', 1, 'single', 1, NULL, 4, 4, NULL, NULL, 'exclusive', 1, NULL, '((((((((((', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-06-10 11:15:17', '2021-06-10 11:15:17'),
(34, '12323810 THERMOCOUPLE', 1, 'single', 1, '[\"1\"]', 1, 1, NULL, NULL, 'exclusive', 1, NULL, '12323810', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-06-11 02:41:02', '2021-06-11 02:41:02'),
(35, '12323518 TACHO GENERATOR', 1, 'single', 1, '[\"1\"]', 1, 1, NULL, NULL, 'exclusive', 1, NULL, '12323518', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, 0, '2021-06-12 07:17:08', '2021-06-12 07:17:08'),
(36, '12320854 STARTER RELAY', 1, 'single', 1, NULL, 1, 2, NULL, NULL, 'exclusive', 1, NULL, '12320854', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-06-13 04:14:05', '2021-06-13 04:14:05'),
(37, '12300500 CAMSHAFT', 1, 'single', 1, NULL, 1, 3, NULL, NULL, 'exclusive', 1, NULL, '(((((((((', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, '2021-06-13 04:19:15', '2021-06-13 04:19:15'),
(38, '12136975 TAPPET', 1, 'single', 1, '[\"1\"]', 1, 3, NULL, NULL, 'exclusive', 1, 6.0000, '12136975', 'C128', NULL, NULL, 1, '0.250KG', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-06-20 07:51:13', '2021-06-20 07:51:13'),
(39, '12210285 ACTUATOR', 1, 'single', 1, NULL, NULL, 1, NULL, NULL, 'exclusive', 1, NULL, 'ACTUATOR', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, 0, 0, '2021-06-21 03:51:18', '2021-06-21 03:51:18'),
(40, '1R-0726 LUBE OIL FILTER', 1, 'single', 1, NULL, 4, 4, 12, NULL, 'exclusive', 1, NULL, '((((((((((((', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-06-21 05:22:17', '2021-06-21 05:22:17'),
(41, '317-7485 Communication Adapter-3', 1, 'single', 1, NULL, NULL, 1, 19, NULL, 'exclusive', 1, NULL, '(((((((((((((((((((((', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-06-21 05:29:00', '2021-06-21 05:29:00'),
(42, 'ET SOFTWER', 1, 'single', 1, NULL, 4, 1, 19, NULL, 'exclusive', 1, NULL, '(((((((((((((', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-06-21 05:32:34', '2021-06-21 05:32:34'),
(43, '7X-1414 CABLE EXTENSION', 1, 'single', 1, '[\"1\"]', 4, 2, NULL, NULL, 'exclusive', 1, NULL, '((((((((((((((((((((((((((((((((((((((((((', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-06-21 05:35:17', '2021-06-21 05:35:17'),
(44, '317-7485 HAND HELD PROGRAMMER', 1, 'single', 1, '[\"1\"]', 7, 1, 19, NULL, 'exclusive', 1, NULL, '(((((((((((((((((((((((((((((((((((((((((((((', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-06-21 05:41:27', '2021-06-21 05:41:27'),
(45, '12030164 PUSH ROD', 1, 'single', 1, NULL, 1, 3, NULL, NULL, 'exclusive', 1, NULL, '12030164', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, 0, 0, '2021-06-22 04:00:41', '2021-06-23 07:39:35'),
(46, '12301481 O-SEAL', 1, 'single', 1, '[\"1\"]', 1, 3, 6, NULL, 'exclusive', 1, NULL, '12301481', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-06-23 07:30:55', '2021-06-23 07:38:56'),
(47, '12301480 O-SEAL', 1, 'single', 1, '[\"1\"]', 1, 3, 6, NULL, 'exclusive', 1, NULL, '12301480', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-06-23 07:33:00', '2021-06-23 07:38:19'),
(48, 'KSB433 MECHANICAL SEAL', 1, 'single', 1, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, 'Part Number0048', 'C128', NULL, NULL, 0, NULL, 'KSB433', NULL, NULL, NULL, NULL, NULL, 6, NULL, 0, 0, '2021-06-23 16:14:54', '2021-06-23 16:14:54'),
(49, '12453386 LINER', 1, 'single', 1, '[\"1\"]', 1, 3, NULL, NULL, 'exclusive', 1, NULL, '((((((', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-06-25 09:28:27', '2021-06-25 09:28:27'),
(50, '01183301 O-SEAL', 1, 'single', 1, NULL, 1, 3, 6, NULL, 'exclusive', 1, NULL, '((((((((((((((((((((((((((((((((((((((((', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-06-25 09:30:58', '2021-06-25 09:30:58'),
(51, '12420916 BIG END BEARING', 1, 'single', 1, NULL, NULL, 3, NULL, NULL, 'exclusive', 1, NULL, '(((((((((((((((((((((((((((((((((((((', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-06-25 09:35:28', '2021-06-25 09:35:28'),
(52, '12302353 GASKET', 1, 'single', 1, NULL, 1, 3, 5, NULL, 'exclusive', 1, NULL, '((((((((((((((((((((((((', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-06-25 09:37:24', '2021-06-25 09:37:24'),
(53, '12302352 GASKET', 1, 'single', 1, NULL, 1, 3, 5, NULL, 'exclusive', 1, NULL, '(((((((((((((((((((((((((((((((((((((((((((', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-06-25 09:39:28', '2021-06-25 09:39:28'),
(54, '01175851 O-SEAL', 1, 'single', 1, NULL, 1, 3, 6, NULL, 'exclusive', 1, NULL, '(((((', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-06-25 09:43:45', '2021-06-25 09:43:45'),
(55, '12300993 IGNITION MODULE', 1, 'single', 1, NULL, 1, 1, 19, NULL, 'exclusive', 1, NULL, '((((((((((((((((((((((((((((((', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-06-25 09:45:23', '2021-06-25 09:45:23'),
(56, '12299465 SENSOR', 1, 'single', 1, '[\"1\"]', 1, 13, 15, NULL, 'exclusive', 1, NULL, '12299465', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 0, '2021-06-27 05:39:17', '2021-06-27 05:39:17'),
(57, '479-7702 spark plug', 1, 'single', 1, NULL, NULL, 4, NULL, 1, 'exclusive', 1, NULL, 'Part Number0057', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, 0, 0, '2021-06-28 03:21:24', '2021-06-28 03:21:24'),
(58, '1352651 Seal', 1, 'single', 1, NULL, 4, 3, NULL, 1, 'exclusive', 1, NULL, 'Part Number0058', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, 0, 0, '2021-06-28 03:24:44', '2021-06-28 03:24:44'),
(61, 'P181126 Air Filter', 1, 'single', 1, NULL, 4, 4, NULL, NULL, 'exclusive', 1, NULL, 'Part Number0061', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, 0, 0, '2021-06-28 03:38:25', '2021-06-28 03:38:25'),
(63, 'ETL 065-065-160 JACKET WATER PUMP-KSB', 1, 'single', 1, NULL, 1, 3, NULL, NULL, 'exclusive', 1, NULL, 'Part Number0063', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 2, 0, 0, '2021-07-01 08:49:10', '2021-07-01 09:38:52'),
(64, '5697729 CRANKSHAFT SEAL', 1, 'single', 1, NULL, 4, 3, NULL, NULL, 'exclusive', 1, NULL, 'Part Number0064', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, 0, 0, '2021-07-01 10:26:06', '2021-07-01 10:26:06'),
(65, '12111C4C COMAP, INTELIMAINS BASE BOX', 1, 'single', 1, NULL, NULL, 2, NULL, NULL, 'exclusive', 1, NULL, 'Part Number0065', 'C128', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 2, 0, 0, '2021-07-03 04:04:05', '2021-07-03 04:17:03'),
(66, '3550765 TOP KIT GASKET', 1, 'single', 1, NULL, 4, 3, 5, NULL, 'exclusive', 1, NULL, '3550765', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, 0, 0, '2021-07-03 05:15:58', '2021-07-03 05:15:58'),
(67, '6V-3603 SEAL O-RING', 1, 'single', 1, NULL, 4, 3, NULL, NULL, 'exclusive', 1, NULL, '6V-3603', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, 0, 0, '2021-07-03 05:24:37', '2021-07-03 05:24:37'),
(68, '113-8433 SEAL GP', 1, 'single', 1, NULL, 4, 3, NULL, NULL, 'exclusive', 1, NULL, '113-8433', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, 0, 0, '2021-07-03 05:32:44', '2021-07-03 05:32:44'),
(69, '8N-2555 FILTER SHOOT', 1, 'single', 1, NULL, 4, 4, NULL, NULL, 'exclusive', 1, NULL, '8N-2555', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, 0, 0, '2021-07-03 05:38:37', '2021-07-03 05:38:37'),
(70, '12409797 AIR FILTER', 1, 'single', 1, NULL, 1, 4, NULL, NULL, 'exclusive', 1, NULL, '12409797', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, 0, 0, '2021-07-04 10:34:52', '2021-07-04 10:34:52'),
(71, '12321982 CRANKCASE SENSOR', 1, 'single', 1, NULL, 1, 2, NULL, NULL, 'exclusive', 1, NULL, '12321982', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, 0, 0, '2021-07-04 10:43:57', '2021-07-04 10:49:47'),
(72, '751104 PILZ SAFET RELAY', 1, 'single', 1, NULL, 1, NULL, NULL, NULL, 'exclusive', 1, NULL, '751104', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, 0, 0, '2021-07-04 11:22:12', '2021-07-04 11:22:12'),
(73, 'RE-561823/LF9010 LUBE OIL FILTER', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, 'RE-561823/LF9010', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, 0, 0, '2021-07-05 10:30:00', '2021-07-05 10:30:00'),
(74, 'RE-532952/FS19737 FUEL FILTER', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, 'RE-532952/FS19737', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, 0, 0, '2021-07-05 10:31:56', '2021-07-05 10:31:56'),
(75, 'C12004 Air Filter', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, 'C12004', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, 0, 0, '2021-07-05 10:34:01', '2021-07-05 10:34:01'),
(76, 'Grade -15W40 LUBE OIL', 1, 'single', 2, NULL, NULL, NULL, NULL, NULL, 'exclusive', 1, NULL, 'Grade -15W40', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, 0, 0, '2021-07-05 10:36:39', '2021-07-05 10:36:39'),
(77, 'DIGITAL INPUT CARD (TERBAG)', 1, 'single', 1, NULL, 4, 2, NULL, NULL, 'exclusive', 1, NULL, 'Part Number0077', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, 0, 0, '2021-07-05 11:44:08', '2021-07-05 11:44:08'),
(78, 'CONNECTOR', 1, 'single', 1, NULL, 1, 2, NULL, NULL, 'exclusive', 1, NULL, 'Part Number0078', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, 0, 0, '2021-07-05 12:07:19', '2021-07-05 12:07:19'),
(79, '3887100920 TERBERG TEC CONTROLLER V2.0', 1, 'single', 1, NULL, 4, 2, NULL, NULL, 'exclusive', 1, NULL, 'Part Number0079', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, 0, 0, '2021-07-05 12:21:00', '2021-07-05 12:21:00'),
(80, 'FF5052/3931063, CARTRIDGE FUEL FILTER', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, 'FF5052/3931063,', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 2, 0, 0, '2021-07-06 09:49:05', '2021-07-06 09:49:05'),
(81, '3937743 CARTRIDGE,LUBE OIL FILTER', 1, 'single', 1, NULL, NULL, 4, NULL, NULL, 'exclusive', 1, NULL, '3937743', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 2, 0, 0, '2021-07-06 09:51:19', '2021-07-06 09:51:19'),
(82, '3924893. FILTER AIR ELEMENT', 1, 'single', 1, NULL, 5, NULL, NULL, NULL, 'exclusive', 1, NULL, '3924893', 'C128', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, NULL, 0, 0, '2021-07-06 09:52:57', '2021-07-06 09:52:57');

-- --------------------------------------------------------

--
-- Table structure for table `product_locations`
--

CREATE TABLE `product_locations` (
  `product_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_locations`
--

INSERT INTO `product_locations` (`product_id`, `location_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_racks`
--

CREATE TABLE `product_racks` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `rack` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `row` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_racks`
--

INSERT INTO `product_racks` (`id`, `business_id`, `location_id`, `product_id`, `rack`, `row`, `position`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, NULL, NULL, NULL, '2021-05-08 13:36:53', '2021-06-21 05:14:46'),
(2, 1, 1, 1, NULL, NULL, NULL, '2021-05-08 13:44:37', '2021-05-08 13:44:37'),
(3, 1, 1, 3, NULL, NULL, NULL, '2021-05-09 15:51:10', '2021-05-11 03:05:37'),
(4, 1, 1, 4, NULL, NULL, NULL, '2021-05-11 05:09:10', '2021-05-11 05:13:58'),
(5, 1, 1, 8, NULL, NULL, NULL, '2021-05-12 05:20:58', '2021-05-12 05:20:58'),
(6, 1, 1, 7, NULL, NULL, NULL, '2021-05-12 07:08:19', '2021-05-12 07:08:19'),
(7, 1, 1, 9, NULL, NULL, NULL, '2021-05-13 12:33:08', '2021-05-13 13:05:18'),
(8, 1, 1, 10, NULL, NULL, NULL, '2021-05-13 13:07:25', '2021-05-13 13:07:25'),
(9, 1, 1, 26, NULL, NULL, NULL, '2021-05-27 08:46:19', '2021-05-27 08:46:19'),
(10, 1, 1, 31, NULL, NULL, NULL, '2021-06-10 09:09:49', '2021-06-22 10:45:20'),
(11, 1, 1, 33, NULL, NULL, NULL, '2021-06-10 11:15:17', '2021-06-10 11:15:17'),
(12, 1, 1, 36, NULL, NULL, NULL, '2021-06-13 04:14:05', '2021-06-13 04:14:05'),
(13, 1, 1, 37, NULL, NULL, NULL, '2021-06-13 04:19:15', '2021-06-13 04:19:15'),
(14, 1, 1, 18, NULL, NULL, NULL, '2021-06-13 04:20:51', '2021-06-13 04:20:51'),
(15, 1, 1, 25, NULL, NULL, NULL, '2021-06-20 04:36:58', '2021-06-20 04:36:58'),
(16, 1, 1, 38, NULL, NULL, NULL, '2021-06-20 07:51:13', '2021-06-20 07:51:13'),
(17, 1, 1, 40, NULL, NULL, NULL, '2021-06-21 05:22:17', '2021-06-21 05:22:17'),
(18, 1, 1, 41, NULL, NULL, NULL, '2021-06-21 05:29:00', '2021-06-21 05:29:00'),
(19, 1, 1, 42, NULL, NULL, NULL, '2021-06-21 05:32:34', '2021-06-21 05:32:34'),
(20, 1, 1, 43, NULL, NULL, NULL, '2021-06-21 05:35:17', '2021-06-21 05:35:17'),
(21, 1, 1, 44, NULL, NULL, NULL, '2021-06-21 05:41:27', '2021-06-21 05:41:27'),
(22, 1, 1, 47, NULL, NULL, NULL, '2021-06-23 07:38:19', '2021-06-23 07:38:19'),
(23, 1, 1, 46, NULL, NULL, NULL, '2021-06-23 07:38:56', '2021-06-23 07:38:56'),
(24, 1, 1, 45, NULL, NULL, NULL, '2021-06-23 07:39:35', '2021-06-23 07:39:35'),
(25, 1, 1, 48, NULL, NULL, NULL, '2021-06-23 16:14:54', '2021-06-23 16:14:54'),
(26, 1, 1, 49, NULL, NULL, NULL, '2021-06-25 09:28:27', '2021-06-25 09:28:27'),
(27, 1, 1, 50, NULL, NULL, NULL, '2021-06-25 09:30:58', '2021-06-25 09:30:58'),
(28, 1, 1, 51, NULL, NULL, NULL, '2021-06-25 09:35:28', '2021-06-25 09:35:28'),
(29, 1, 1, 52, NULL, NULL, NULL, '2021-06-25 09:37:24', '2021-06-25 09:37:24'),
(30, 1, 1, 53, NULL, NULL, NULL, '2021-06-25 09:39:28', '2021-06-25 09:39:28'),
(31, 1, 1, 54, NULL, NULL, NULL, '2021-06-25 09:43:45', '2021-06-25 09:43:45'),
(32, 1, 1, 55, NULL, NULL, NULL, '2021-06-25 09:45:23', '2021-06-25 09:45:23'),
(33, 1, 1, 57, NULL, NULL, NULL, '2021-06-28 03:21:24', '2021-06-28 03:21:24'),
(34, 1, 1, 58, NULL, NULL, NULL, '2021-06-28 03:24:44', '2021-06-28 03:24:44'),
(35, 1, 1, 59, NULL, NULL, NULL, '2021-06-28 03:34:32', '2021-06-28 03:34:32'),
(36, 1, 1, 60, NULL, NULL, NULL, '2021-06-28 03:36:49', '2021-06-28 03:36:49'),
(37, 1, 1, 61, NULL, NULL, NULL, '2021-06-28 03:38:25', '2021-06-28 03:38:25'),
(38, 1, 1, 63, NULL, NULL, NULL, '2021-07-01 08:49:10', '2021-07-01 09:38:52'),
(39, 1, 1, 64, NULL, NULL, NULL, '2021-07-01 10:26:07', '2021-07-01 10:26:07'),
(40, 1, 1, 65, NULL, NULL, NULL, '2021-07-03 04:04:05', '2021-07-03 04:17:03'),
(41, 1, 1, 66, NULL, NULL, NULL, '2021-07-03 05:15:58', '2021-07-03 05:15:58'),
(42, 1, 1, 67, NULL, NULL, NULL, '2021-07-03 05:24:37', '2021-07-03 05:24:37'),
(43, 1, 1, 68, NULL, NULL, NULL, '2021-07-03 05:32:44', '2021-07-03 05:32:44'),
(44, 1, 1, 69, NULL, NULL, NULL, '2021-07-03 05:38:37', '2021-07-03 05:38:37'),
(45, 1, 1, 11, NULL, NULL, NULL, '2021-07-03 05:47:21', '2021-07-03 05:47:21'),
(46, 1, 1, 71, NULL, NULL, NULL, '2021-07-04 10:43:57', '2021-07-04 10:49:47'),
(47, 1, 1, 73, NULL, NULL, NULL, '2021-07-05 10:30:00', '2021-07-05 10:30:00'),
(48, 1, 1, 74, NULL, NULL, NULL, '2021-07-05 10:31:56', '2021-07-05 10:31:56'),
(49, 1, 1, 75, NULL, NULL, NULL, '2021-07-05 10:34:01', '2021-07-05 10:34:01'),
(50, 1, 1, 76, NULL, NULL, NULL, '2021-07-05 10:36:39', '2021-07-05 10:36:39'),
(51, 1, 1, 80, NULL, NULL, NULL, '2021-07-06 09:49:05', '2021-07-06 09:49:05'),
(52, 1, 1, 81, NULL, NULL, NULL, '2021-07-06 09:51:19', '2021-07-06 09:51:19'),
(53, 1, 1, 82, NULL, NULL, NULL, '2021-07-06 09:52:57', '2021-07-06 09:52:57');

-- --------------------------------------------------------

--
-- Table structure for table `product_variations`
--

CREATE TABLE `product_variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `variation_template_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `is_dummy` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_variations`
--

INSERT INTO `product_variations` (`id`, `variation_template_id`, `name`, `product_id`, `is_dummy`, `created_at`, `updated_at`) VALUES
(1, NULL, 'DUMMY', 1, 1, '2021-05-08 11:31:19', '2021-05-08 11:31:19'),
(2, NULL, 'DUMMY', 2, 1, '2021-05-08 13:36:53', '2021-05-08 13:36:53'),
(3, NULL, 'DUMMY', 3, 1, '2021-05-09 04:09:46', '2021-05-09 04:09:46'),
(4, NULL, 'DUMMY', 4, 1, '2021-05-11 05:04:32', '2021-05-11 05:04:32'),
(5, NULL, 'DUMMY', 5, 1, '2021-05-11 05:26:45', '2021-05-11 05:26:45'),
(6, NULL, 'DUMMY', 6, 1, '2021-05-11 08:55:35', '2021-05-11 08:55:35'),
(7, NULL, 'DUMMY', 7, 1, '2021-05-11 09:33:12', '2021-05-11 09:33:12'),
(8, NULL, 'DUMMY', 8, 1, '2021-05-12 05:20:58', '2021-05-12 05:20:58'),
(11, NULL, 'DUMMY', 11, 1, '2021-05-20 15:50:01', '2021-05-20 15:50:01'),
(12, NULL, 'DUMMY', 12, 1, '2021-05-20 15:55:44', '2021-05-20 15:55:44'),
(13, NULL, 'DUMMY', 13, 1, '2021-05-22 17:27:22', '2021-05-22 17:27:22'),
(14, NULL, 'DUMMY', 14, 1, '2021-05-22 17:29:36', '2021-05-22 17:29:36'),
(15, NULL, 'DUMMY', 15, 1, '2021-05-22 17:32:27', '2021-05-22 17:32:27'),
(16, NULL, 'DUMMY', 16, 1, '2021-05-22 17:35:33', '2021-05-22 17:35:33'),
(17, NULL, 'DUMMY', 17, 1, '2021-05-22 17:38:55', '2021-05-22 17:38:55'),
(18, NULL, 'DUMMY', 18, 1, '2021-05-23 09:17:56', '2021-05-23 09:17:56'),
(19, NULL, 'DUMMY', 19, 1, '2021-05-23 09:41:58', '2021-05-23 09:41:58'),
(20, NULL, 'DUMMY', 20, 1, '2021-05-23 09:44:29', '2021-05-23 09:44:29'),
(21, NULL, 'DUMMY', 21, 1, '2021-05-23 09:48:13', '2021-05-23 09:48:13'),
(22, NULL, 'DUMMY', 22, 1, '2021-05-23 09:50:57', '2021-05-23 09:50:57'),
(23, NULL, 'DUMMY', 23, 1, '2021-05-23 09:52:59', '2021-05-23 09:52:59'),
(24, NULL, 'DUMMY', 24, 1, '2021-05-23 11:36:38', '2021-05-23 11:36:38'),
(25, NULL, 'DUMMY', 25, 1, '2021-05-23 11:41:38', '2021-05-23 11:41:38'),
(26, NULL, 'DUMMY', 26, 1, '2021-05-27 08:46:19', '2021-05-27 08:46:19'),
(27, NULL, 'DUMMY', 27, 1, '2021-05-27 13:16:03', '2021-05-27 13:16:03'),
(28, NULL, 'DUMMY', 28, 1, '2021-06-10 07:36:20', '2021-06-10 07:36:20'),
(29, NULL, 'DUMMY', 29, 1, '2021-06-10 07:38:14', '2021-06-10 07:38:14'),
(30, NULL, 'DUMMY', 30, 1, '2021-06-10 07:39:59', '2021-06-10 07:39:59'),
(31, NULL, 'DUMMY', 31, 1, '2021-06-10 09:09:49', '2021-06-10 09:09:49'),
(32, NULL, 'DUMMY', 32, 1, '2021-06-10 10:19:03', '2021-06-10 10:19:03'),
(33, NULL, 'DUMMY', 33, 1, '2021-06-10 11:15:17', '2021-06-10 11:15:17'),
(34, NULL, 'DUMMY', 34, 1, '2021-06-11 02:41:03', '2021-06-11 02:41:03'),
(35, NULL, 'DUMMY', 35, 1, '2021-06-12 07:17:08', '2021-06-12 07:17:08'),
(36, NULL, 'DUMMY', 36, 1, '2021-06-13 04:14:05', '2021-06-13 04:14:05'),
(37, NULL, 'DUMMY', 37, 1, '2021-06-13 04:19:15', '2021-06-13 04:19:15'),
(38, NULL, 'DUMMY', 38, 1, '2021-06-20 07:51:13', '2021-06-20 07:51:13'),
(39, NULL, 'DUMMY', 39, 1, '2021-06-21 03:51:18', '2021-06-21 03:51:18'),
(40, NULL, 'DUMMY', 40, 1, '2021-06-21 05:22:17', '2021-06-21 05:22:17'),
(41, NULL, 'DUMMY', 41, 1, '2021-06-21 05:29:00', '2021-06-21 05:29:00'),
(42, NULL, 'DUMMY', 42, 1, '2021-06-21 05:32:34', '2021-06-21 05:32:34'),
(43, NULL, 'DUMMY', 43, 1, '2021-06-21 05:35:17', '2021-06-21 05:35:17'),
(44, NULL, 'DUMMY', 44, 1, '2021-06-21 05:41:27', '2021-06-21 05:41:27'),
(45, NULL, 'DUMMY', 45, 1, '2021-06-22 04:00:41', '2021-06-22 04:00:41'),
(46, NULL, 'DUMMY', 46, 1, '2021-06-23 07:30:55', '2021-06-23 07:30:55'),
(47, NULL, 'DUMMY', 47, 1, '2021-06-23 07:33:00', '2021-06-23 07:33:00'),
(48, NULL, 'DUMMY', 48, 1, '2021-06-23 16:14:54', '2021-06-23 16:14:54'),
(49, NULL, 'DUMMY', 49, 1, '2021-06-25 09:28:27', '2021-06-25 09:28:27'),
(50, NULL, 'DUMMY', 50, 1, '2021-06-25 09:30:58', '2021-06-25 09:30:58'),
(51, NULL, 'DUMMY', 51, 1, '2021-06-25 09:35:28', '2021-06-25 09:35:28'),
(52, NULL, 'DUMMY', 52, 1, '2021-06-25 09:37:24', '2021-06-25 09:37:24'),
(53, NULL, 'DUMMY', 53, 1, '2021-06-25 09:39:28', '2021-06-25 09:39:28'),
(54, NULL, 'DUMMY', 54, 1, '2021-06-25 09:43:45', '2021-06-25 09:43:45'),
(55, NULL, 'DUMMY', 55, 1, '2021-06-25 09:45:23', '2021-06-25 09:45:23'),
(56, NULL, 'DUMMY', 56, 1, '2021-06-27 05:39:17', '2021-06-27 05:39:17'),
(57, NULL, 'DUMMY', 57, 1, '2021-06-28 03:21:24', '2021-06-28 03:21:24'),
(58, NULL, 'DUMMY', 58, 1, '2021-06-28 03:24:44', '2021-06-28 03:24:44'),
(61, NULL, 'DUMMY', 61, 1, '2021-06-28 03:38:25', '2021-06-28 03:38:25'),
(63, NULL, 'DUMMY', 63, 1, '2021-07-01 08:49:10', '2021-07-01 08:49:10'),
(64, NULL, 'DUMMY', 64, 1, '2021-07-01 10:26:07', '2021-07-01 10:26:07'),
(65, NULL, 'DUMMY', 65, 1, '2021-07-03 04:04:05', '2021-07-03 04:04:05'),
(66, NULL, 'DUMMY', 66, 1, '2021-07-03 05:15:58', '2021-07-03 05:15:58'),
(67, NULL, 'DUMMY', 67, 1, '2021-07-03 05:24:37', '2021-07-03 05:24:37'),
(68, NULL, 'DUMMY', 68, 1, '2021-07-03 05:32:44', '2021-07-03 05:32:44'),
(69, NULL, 'DUMMY', 69, 1, '2021-07-03 05:38:37', '2021-07-03 05:38:37'),
(70, NULL, 'DUMMY', 70, 1, '2021-07-04 10:34:52', '2021-07-04 10:34:52'),
(71, NULL, 'DUMMY', 71, 1, '2021-07-04 10:43:57', '2021-07-04 10:43:57'),
(72, NULL, 'DUMMY', 72, 1, '2021-07-04 11:22:12', '2021-07-04 11:22:12'),
(73, NULL, 'DUMMY', 73, 1, '2021-07-05 10:30:00', '2021-07-05 10:30:00'),
(74, NULL, 'DUMMY', 74, 1, '2021-07-05 10:31:56', '2021-07-05 10:31:56'),
(75, NULL, 'DUMMY', 75, 1, '2021-07-05 10:34:01', '2021-07-05 10:34:01'),
(76, NULL, 'DUMMY', 76, 1, '2021-07-05 10:36:39', '2021-07-05 10:36:39'),
(77, NULL, 'DUMMY', 77, 1, '2021-07-05 11:44:08', '2021-07-05 11:44:08'),
(78, NULL, 'DUMMY', 78, 1, '2021-07-05 12:07:19', '2021-07-05 12:07:19'),
(79, NULL, 'DUMMY', 79, 1, '2021-07-05 12:21:00', '2021-07-05 12:21:00'),
(80, NULL, 'DUMMY', 80, 1, '2021-07-06 09:49:05', '2021-07-06 09:49:05'),
(81, NULL, 'DUMMY', 81, 1, '2021-07-06 09:51:19', '2021-07-06 09:51:19'),
(82, NULL, 'DUMMY', 82, 1, '2021-07-06 09:52:57', '2021-07-06 09:52:57');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_lines`
--

CREATE TABLE `purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `pp_without_discount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Purchase price before inline discounts',
  `discount_percent` decimal(5,2) NOT NULL DEFAULT '0.00' COMMENT 'Inline discount percentage',
  `purchase_price` decimal(22,4) NOT NULL,
  `purchase_price_inc_tax` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `quantity_sold` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Quanity sold from this purchase line',
  `quantity_adjusted` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Quanity adjusted in stock adjustment from this purchase line',
  `quantity_returned` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `mfg_quantity_used` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `mfg_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `lot_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_lines`
--

INSERT INTO `purchase_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `pp_without_discount`, `discount_percent`, `purchase_price`, `purchase_price_inc_tax`, `item_tax`, `tax_id`, `quantity_sold`, `quantity_adjusted`, `quantity_returned`, `mfg_quantity_used`, `mfg_date`, `exp_date`, `lot_number`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(1, 8, 2, 2, 22.0000, 19000.0000, 0.00, 19000.0000, 19000.0000, 0.0000, NULL, 22.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-05-08 13:37:20', '2021-07-05 11:18:26'),
(2, 9, 1, 1, 1.0000, 70000.0000, 0.00, 70000.0000, 70000.0000, 0.0000, NULL, 1.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-05-08 13:45:01', '2021-07-04 07:45:42'),
(3, 13, 3, 3, 6.0000, 4930.0000, 0.00, 4930.0000, 4930.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-05-09 04:12:37', '2021-06-21 06:00:38'),
(4, 14, 3, 3, 4.0000, 8545.0000, 0.00, 8545.0000, 8545.0000, 0.0000, NULL, 4.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-05-11 03:05:55', '2021-05-11 04:28:15'),
(5, 19, 4, 4, 1.0000, 18500.0000, 0.00, 18500.0000, 18500.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-05-11 05:06:01', '2021-05-11 05:06:01'),
(6, 20, 4, 4, 1.0000, 35000.0000, 0.00, 35000.0000, 35000.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-05-11 05:12:21', '2021-05-11 05:14:12'),
(7, 21, 5, 5, 19.0000, 1315.7900, 0.00, 1315.7900, 1315.7900, 0.0000, NULL, 19.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-05-11 05:29:48', '2021-05-11 05:51:57'),
(9, 33, 7, 7, 60.0000, 2800.0000, 0.00, 2800.0000, 2800.0000, 0.0000, NULL, 50.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-05-11 09:33:12', '2021-07-05 11:18:26'),
(10, 39, 11, 11, 1.0000, 170000.0000, 0.00, 170000.0000, 170000.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-05-20 15:50:52', '2021-05-22 17:41:49'),
(11, 39, 12, 12, 12.0000, 15000.0000, 0.00, 15000.0000, 15000.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-05-20 15:57:02', '2021-05-22 17:41:49'),
(17, 40, 18, 18, 1.0000, 733110.0000, 0.00, 733110.0000, 733110.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-05-23 09:24:19', '2021-05-23 11:47:43'),
(18, 40, 19, 19, 2.0000, 14198.0000, 0.00, 14198.0000, 14198.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-05-23 10:37:07', '2021-05-23 11:47:43'),
(19, 40, 20, 20, 1.0000, 63525.0000, 0.00, 63525.0000, 63525.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-05-23 10:37:07', '2021-05-23 11:47:43'),
(20, 40, 21, 21, 2.0000, 8977.0000, 0.00, 8977.0000, 8977.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-05-23 10:37:07', '2021-05-23 11:47:43'),
(21, 40, 22, 22, 1.0000, 52290.0000, 0.00, 52290.0000, 52290.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-05-23 10:37:07', '2021-05-23 11:47:43'),
(22, 40, 23, 23, 2.0000, 24675.0000, 0.00, 24675.0000, 24675.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-05-23 10:37:07', '2021-05-23 11:47:43'),
(23, 40, 24, 24, 1.0000, 20475.0000, 0.00, 20475.0000, 20475.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-05-23 11:46:32', '2021-05-23 11:47:43'),
(24, 40, 25, 25, 18.0000, 190.0000, 0.00, 190.0000, 190.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-05-23 11:46:32', '2021-05-23 11:47:43'),
(25, 47, 26, 26, 110.0000, 150.0000, 0.00, 150.0000, 150.0000, 0.0000, NULL, 4.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-05-27 08:46:36', '2021-05-27 08:56:13'),
(26, 49, 27, 27, 7.0000, 8000.0000, 0.00, 8000.0000, 8000.0000, 0.0000, NULL, 7.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-05-27 13:16:03', '2021-06-28 11:21:24'),
(28, 57, 2, 2, 3.0000, 17000.0000, 0.00, 17000.0000, 17000.0000, 0.0000, NULL, 3.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-06-10 12:12:19', '2021-06-22 04:14:56'),
(29, 58, 34, 34, 2.0000, 10000.0000, 0.00, 10000.0000, 10000.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-06-11 02:42:04', '2021-06-11 02:42:04'),
(30, 66, 38, 38, 7.0000, 5700.0000, 0.00, 5700.0000, 5700.0000, 0.0000, NULL, 7.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-06-20 07:52:24', '2021-06-22 13:09:17'),
(31, 71, 39, 39, 1.0000, 300000.0000, 0.00, 300000.0000, 300000.0000, 0.0000, NULL, 1.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-06-21 03:51:18', '2021-06-26 03:32:47'),
(32, 76, 40, 40, 4.0000, 4000.0000, 0.00, 4000.0000, 4000.0000, 0.0000, NULL, 4.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-06-21 05:52:58', '2021-06-22 12:19:16'),
(33, 77, 43, 43, 1.0000, 15000.0000, 0.00, 15000.0000, 15000.0000, 0.0000, NULL, 1.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-06-21 05:56:27', '2021-06-21 06:39:40'),
(34, 77, 44, 44, 1.0000, 40000.0000, 0.00, 40000.0000, 40000.0000, 0.0000, NULL, 1.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-06-21 05:56:27', '2021-06-21 06:39:40'),
(35, 77, 41, 41, 1.0000, 65000.0000, 0.00, 65000.0000, 65000.0000, 0.0000, NULL, 1.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-06-21 05:56:27', '2021-06-21 06:39:40'),
(36, 77, 42, 42, 1.0000, 50000.0000, 0.00, 50000.0000, 50000.0000, 0.0000, NULL, 1.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-06-21 05:56:27', '2021-06-21 06:39:40'),
(37, 78, 40, 40, 7.0000, 4000.0000, 0.00, 4000.0000, 4000.0000, 0.0000, NULL, 7.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-06-21 06:21:48', '2021-06-22 12:19:16'),
(38, 103, 31, 31, 1000.0000, 1.0000, 0.00, 1.0000, 1.0000, 0.0000, NULL, -1951.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-06-22 10:44:11', '2021-07-06 11:09:24'),
(39, 113, 2, 2, 0.0000, 17000.0000, 0.00, 17000.0000, 17000.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-06-23 04:08:02', '2021-06-23 13:03:51'),
(40, 114, 46, 46, 2.0000, 3259.0000, 0.00, 3259.0000, 3259.0000, 0.0000, NULL, 1.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-06-23 07:30:55', '2021-06-23 07:35:38'),
(41, 115, 47, 47, 2.0000, 3911.0000, 0.00, 3911.0000, 3911.0000, 0.0000, NULL, 1.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-06-23 07:33:00', '2021-06-23 07:35:38'),
(42, 117, 45, 45, 2.0000, 6000.0000, 0.00, 6000.0000, 6000.0000, 0.0000, NULL, 2.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-06-23 07:39:48', '2021-07-04 10:37:47'),
(43, 122, 2, 2, 1.0000, 17000.0000, 0.00, 17000.0000, 17000.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-06-23 12:59:46', '2021-06-23 12:59:46'),
(44, 124, 49, 49, 2.0000, 28000.0000, 0.00, 28000.0000, 28000.0000, 0.0000, NULL, 1.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-06-25 09:28:39', '2021-06-25 09:57:28'),
(45, 125, 50, 50, 48.0000, 350.0000, 0.00, 350.0000, 350.0000, 0.0000, NULL, 3.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-06-25 09:31:10', '2021-06-25 09:57:28'),
(46, 126, 51, 51, 1.0000, 42500.0000, 0.00, 42500.0000, 42500.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-06-25 09:35:35', '2021-07-03 04:28:36'),
(47, 127, 52, 52, 1.0000, 2550.0000, 0.00, 2550.0000, 2550.0000, 0.0000, NULL, 1.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-06-25 09:37:33', '2021-06-25 09:57:28'),
(48, 128, 53, 53, 1.0000, 2550.0000, 0.00, 2550.0000, 2550.0000, 0.0000, NULL, 1.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-06-25 09:39:45', '2021-06-25 09:57:28'),
(49, 129, 54, 54, 4.0000, 320.0000, 0.00, 320.0000, 320.0000, 0.0000, NULL, 4.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-06-25 09:43:53', '2021-06-25 09:57:28'),
(50, 130, 55, 55, 2.0000, 300000.0000, 0.00, 300000.0000, 300000.0000, 0.0000, NULL, 1.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-06-25 09:45:32', '2021-06-25 09:46:34'),
(51, 137, 56, 56, 2.0000, 8500.0000, 0.00, 8500.0000, 8500.0000, 0.0000, NULL, 1.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-06-27 05:39:17', '2021-07-05 12:08:47'),
(52, 162, 12, 12, 4.0000, 15000.0000, 0.00, 15000.0000, 15000.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-07-03 04:18:24', '2021-07-03 04:18:24'),
(53, 162, 58, 58, 10.0000, 800.0000, 0.00, 800.0000, 800.0000, 0.0000, NULL, 10.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-07-03 04:18:24', '2021-07-03 04:18:24'),
(54, 162, 33, 33, 50.0000, 70.0000, 0.00, 70.0000, 70.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-07-03 04:18:24', '2021-07-03 04:18:24'),
(55, 162, 57, 57, 16.0000, 5500.0000, 0.00, 5500.0000, 5500.0000, 0.0000, NULL, 16.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-07-03 04:18:24', '2021-07-03 04:18:24'),
(56, 166, 66, 66, 1.0000, 30000.0000, 0.00, 30000.0000, 30000.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-07-03 05:56:54', '2021-07-03 05:56:54'),
(57, 166, 67, 67, 5.0000, 3850.0000, 0.00, 3850.0000, 3850.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-07-03 05:56:54', '2021-07-03 05:56:54'),
(58, 167, 12, 12, 2.0000, 10000.0000, 0.00, 10000.0000, 10000.0000, 0.0000, NULL, 2.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-07-03 06:22:36', '2021-07-04 10:05:02'),
(59, 167, 69, 69, 2.0000, 1500.0000, 0.00, 1500.0000, 1500.0000, 0.0000, NULL, 2.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-07-03 06:22:36', '2021-07-04 10:05:02'),
(62, 169, 33, 33, 100.0000, 70.0000, 0.00, 70.0000, 70.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-07-03 06:36:45', '2021-07-06 11:35:13'),
(63, 169, 27, 27, 2.0000, 0.0000, 0.00, 0.0000, 0.0000, 0.0000, NULL, 2.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-07-03 06:36:45', '2021-07-03 06:36:45'),
(64, 170, 40, 40, 12.0000, 2600.0000, 0.00, 2600.0000, 2600.0000, 0.0000, NULL, 1.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-07-03 06:48:57', '2021-07-03 06:48:57'),
(65, 171, 66, 66, 2.0000, 30000.0000, 0.00, 30000.0000, 30000.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-07-03 07:14:51', '2021-07-04 03:49:15'),
(67, 172, 40, 40, 12.0000, 3850.0000, 0.00, 3850.0000, 3850.0000, 0.0000, NULL, 0.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-07-03 09:09:18', '2021-07-03 09:09:18'),
(68, 176, 65, 65, 1.0000, 170000.0000, 0.00, 170000.0000, 170000.0000, 0.0000, NULL, 1.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-07-04 08:35:43', '2021-07-04 08:35:43'),
(69, 181, 70, 70, 14.0000, 18000.0000, 0.00, 18000.0000, 18000.0000, 0.0000, NULL, 2.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-07-04 10:34:52', '2021-07-04 10:35:36'),
(70, 184, 71, 71, 4.0000, 4500.0000, 0.00, 4500.0000, 4500.0000, 0.0000, NULL, 1.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-07-04 10:48:56', '2021-07-04 10:50:57'),
(71, 191, 72, 72, 1.0000, 19000.0000, 0.00, 19000.0000, 19000.0000, 0.0000, NULL, 1.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-07-04 11:22:12', '2021-07-04 11:25:55'),
(72, 202, 77, 77, 1.0000, 15000.0000, 0.00, 15000.0000, 15000.0000, 0.0000, NULL, 1.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-07-05 11:44:08', '2021-07-05 11:47:44'),
(73, 205, 78, 78, 1.0000, 300.0000, 0.00, 300.0000, 300.0000, 0.0000, NULL, 1.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-07-05 12:07:19', '2021-07-05 12:08:47'),
(74, 208, 79, 79, 1.0000, 800000.0000, 0.00, 800000.0000, 800000.0000, 0.0000, NULL, 1.0000, 0.0000, 0.0000, 0.0000, NULL, NULL, NULL, NULL, '2021-07-05 12:21:00', '2021-07-05 12:22:31');

-- --------------------------------------------------------

--
-- Table structure for table `reference_counts`
--

CREATE TABLE `reference_counts` (
  `id` int(10) UNSIGNED NOT NULL,
  `ref_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref_count` int(11) NOT NULL,
  `business_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reference_counts`
--

INSERT INTO `reference_counts` (`id`, `ref_type`, `ref_count`, `business_id`, `created_at`, `updated_at`) VALUES
(1, 'contacts', 67, 1, '2021-04-10 09:05:48', '2021-07-06 09:58:00'),
(2, 'business_location', 1, 1, '2021-04-10 09:05:48', '2021-04-10 09:05:48'),
(3, 'draft', 17, 1, '2021-05-08 11:31:28', '2021-06-27 09:04:37'),
(4, 'username', 8, 1, '2021-05-08 14:33:11', '2021-05-27 03:00:16'),
(5, 'sell_payment', 74, 1, '2021-05-08 15:15:43', '2021-07-06 11:00:00'),
(6, 'purchase', 23, 1, '2021-05-09 04:12:37', '2021-07-04 08:35:43'),
(7, 'expense', 23, 1, '2021-05-11 04:35:09', '2021-07-04 12:42:16'),
(8, 'purchase_payment', 22, 1, '2021-05-11 05:06:01', '2021-07-04 12:05:11'),
(9, 'opening_balance', 11, 1, '2021-05-11 06:48:56', '2021-07-04 12:55:36'),
(10, 'expense_payment', 2, 1, '2021-06-22 10:25:06', '2021-07-04 12:33:25'),
(11, 'sell_return', 1, 1, '2021-07-03 04:28:36', '2021-07-03 04:28:36');

-- --------------------------------------------------------

--
-- Table structure for table `res_product_modifier_sets`
--

CREATE TABLE `res_product_modifier_sets` (
  `modifier_set_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL COMMENT 'Table use to store the modifier sets applicable for a product'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `res_tables`
--

CREATE TABLE `res_tables` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `is_service_staff` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `business_id`, `is_default`, `is_service_staff`, `created_at`, `updated_at`) VALUES
(1, 'Admin#1', 'web', 1, 1, 0, '2021-04-10 09:05:48', '2021-04-10 09:05:48'),
(3, 'SALES ENGINEER#1', 'web', 1, 0, 0, '2021-05-08 13:00:21', '2021-05-12 16:11:05'),
(4, 'DRIVER#1', 'web', 1, 0, 0, '2021-05-11 11:59:05', '2021-05-11 11:59:05'),
(5, 'ACCOUNT#1', 'web', 1, 0, 1, '2021-05-12 05:56:14', '2021-06-10 11:06:16'),
(6, 'MANAGEMENT#1', 'web', 1, 0, 1, '2021-05-12 16:08:58', '2021-05-12 16:09:49');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(2, 3),
(3, 3),
(6, 3),
(8, 3),
(9, 3),
(10, 3),
(11, 3),
(16, 3),
(18, 3),
(19, 3),
(20, 3),
(23, 3),
(24, 3),
(27, 3),
(28, 3),
(36, 3),
(37, 3),
(40, 3),
(41, 3),
(42, 3),
(48, 3),
(50, 3),
(51, 3),
(63, 3),
(64, 3),
(65, 3),
(66, 3),
(67, 3),
(68, 3),
(69, 3),
(70, 3),
(71, 3),
(72, 3),
(73, 3),
(74, 3),
(75, 3),
(76, 3),
(77, 3),
(78, 3),
(79, 3),
(81, 3),
(83, 3),
(85, 3),
(86, 3),
(87, 3),
(88, 3),
(95, 3),
(96, 3),
(6, 4),
(28, 4),
(81, 4),
(1, 5),
(2, 5),
(6, 5),
(7, 5),
(8, 5),
(9, 5),
(10, 5),
(15, 5),
(16, 5),
(17, 5),
(18, 5),
(21, 5),
(22, 5),
(23, 5),
(24, 5),
(25, 5),
(26, 5),
(27, 5),
(28, 5),
(32, 5),
(33, 5),
(36, 5),
(37, 5),
(40, 5),
(41, 5),
(42, 5),
(44, 5),
(45, 5),
(46, 5),
(52, 5),
(53, 5),
(54, 5),
(55, 5),
(56, 5),
(57, 5),
(58, 5),
(59, 5),
(67, 5),
(68, 5),
(69, 5),
(70, 5),
(79, 5),
(81, 5),
(83, 5),
(84, 5),
(85, 5),
(86, 5),
(87, 5),
(88, 5),
(89, 5),
(90, 5),
(92, 5),
(93, 5),
(94, 5),
(95, 5),
(96, 5),
(1, 6),
(2, 6),
(3, 6),
(6, 6),
(7, 6),
(8, 6),
(9, 6),
(10, 6),
(11, 6),
(12, 6),
(15, 6),
(16, 6),
(17, 6),
(18, 6),
(19, 6),
(20, 6),
(22, 6),
(23, 6),
(24, 6),
(25, 6),
(26, 6),
(27, 6),
(28, 6),
(29, 6),
(32, 6),
(33, 6),
(36, 6),
(37, 6),
(40, 6),
(41, 6),
(42, 6),
(44, 6),
(45, 6),
(46, 6),
(50, 6),
(52, 6),
(53, 6),
(54, 6),
(55, 6),
(56, 6),
(57, 6),
(58, 6),
(59, 6),
(60, 6),
(61, 6),
(62, 6),
(63, 6),
(64, 6),
(65, 6),
(67, 6),
(68, 6),
(71, 6),
(72, 6),
(75, 6),
(76, 6),
(79, 6),
(81, 6),
(83, 6),
(84, 6),
(85, 6),
(86, 6),
(87, 6),
(88, 6),
(91, 6),
(92, 6),
(93, 6),
(94, 6),
(95, 6),
(96, 6);

-- --------------------------------------------------------

--
-- Table structure for table `selling_price_groups`
--

CREATE TABLE `selling_price_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `business_id` int(10) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `selling_price_groups`
--

INSERT INTO `selling_price_groups` (`id`, `name`, `description`, `business_id`, `is_active`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Hole Sales', 'Only for third party', 1, 1, '2021-06-23 07:48:07', '2021-05-08 14:10:15', '2021-06-23 07:48:07');

-- --------------------------------------------------------

--
-- Table structure for table `sell_line_warranties`
--

CREATE TABLE `sell_line_warranties` (
  `sell_line_id` int(11) NOT NULL,
  `warranty_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustments_temp`
--

CREATE TABLE `stock_adjustments_temp` (
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustment_lines`
--

CREATE TABLE `stock_adjustment_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL,
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Last purchase unit price',
  `removed_purchase_line` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system`
--

CREATE TABLE `system` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system`
--

INSERT INTO `system` (`id`, `key`, `value`) VALUES
(1, 'db_version', '4.0'),
(2, 'default_business_active_status', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(22,4) NOT NULL,
  `is_tax_group` tinyint(1) NOT NULL DEFAULT '0',
  `for_tax_group` tinyint(1) NOT NULL DEFAULT '0',
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tax_rates`
--

INSERT INTO `tax_rates` (`id`, `business_id`, `name`, `amount`, `is_tax_group`, `for_tax_group`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sales VAT', 5.0000, 0, 0, 1, NULL, '2021-05-09 15:55:33', '2021-06-20 09:20:26'),
(2, 1, 'Service VAT', 15.0000, 0, 0, 1, NULL, '2021-05-09 15:55:50', '2021-06-20 09:20:14');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED DEFAULT NULL,
  `res_table_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_waiter_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'fields to restaurant module',
  `res_order_status` enum('received','cooked','served') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_quotation` tinyint(1) NOT NULL DEFAULT '0',
  `payment_status` enum('paid','due','partial') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adjustment_type` enum('normal','abnormal') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_id` int(11) UNSIGNED DEFAULT NULL,
  `customer_group_id` int(11) DEFAULT NULL COMMENT 'used to add customer group while selling',
  `invoice_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_repeat_on` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_date` datetime NOT NULL,
  `total_before_tax` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total before the purchase/invoice tax, this includeds the indivisual product tax',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_amount` decimal(22,4) DEFAULT '0.0000',
  `rp_redeemed` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `rp_redeemed_amount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'rp is the short form of reward points',
  `shipping_details` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `shipping_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivered_to` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_charges` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `shipping_custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_custom_field_5` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `additional_notes` text COLLATE utf8mb4_unicode_ci,
  `staff_note` text COLLATE utf8mb4_unicode_ci,
  `round_off_amount` decimal(22,4) NOT NULL DEFAULT '0.0000' COMMENT 'Difference of rounded total and actual total',
  `final_total` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `expense_category_id` int(10) UNSIGNED DEFAULT NULL,
  `expense_for` int(10) UNSIGNED DEFAULT NULL,
  `commission_agent` int(11) DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_direct_sale` tinyint(1) NOT NULL DEFAULT '0',
  `is_suspend` tinyint(1) NOT NULL DEFAULT '0',
  `exchange_rate` decimal(20,3) NOT NULL DEFAULT '1.000',
  `total_amount_recovered` decimal(22,4) DEFAULT NULL COMMENT 'Used for stock adjustment.',
  `transfer_parent_id` int(11) DEFAULT NULL,
  `return_parent_id` int(11) DEFAULT NULL,
  `opening_stock_product_id` int(11) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_batch` int(11) DEFAULT NULL,
  `import_time` datetime DEFAULT NULL,
  `types_of_service_id` int(11) DEFAULT NULL,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `service_custom_field_1` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_2` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_3` text COLLATE utf8mb4_unicode_ci,
  `service_custom_field_4` text COLLATE utf8mb4_unicode_ci,
  `is_created_from_api` tinyint(1) NOT NULL DEFAULT '0',
  `rp_earned` int(11) NOT NULL DEFAULT '0' COMMENT 'rp is the short form of reward points',
  `order_addresses` text COLLATE utf8mb4_unicode_ci,
  `is_recurring` tinyint(1) NOT NULL DEFAULT '0',
  `recur_interval` double(22,4) DEFAULT NULL,
  `recur_interval_type` enum('days','months','years') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recur_repetitions` int(11) DEFAULT NULL,
  `recur_stopped_on` datetime DEFAULT NULL,
  `recur_parent_id` int(11) DEFAULT NULL,
  `invoice_token` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pay_term_number` int(11) DEFAULT NULL,
  `pay_term_type` enum('days','months') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `selling_price_group_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `sub_status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `shipping_custom_field_1`, `shipping_custom_field_2`, `shipping_custom_field_3`, `shipping_custom_field_4`, `shipping_custom_field_5`, `additional_notes`, `staff_note`, `round_off_amount`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(5, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'proforma', 1, NULL, NULL, 1, NULL, '2021/0005', '', NULL, NULL, '2021-05-08 17:47:02', 50.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 50.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-08 11:47:02', '2021-05-08 13:57:57'),
(6, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'proforma', 1, NULL, NULL, 1, NULL, '2021/0006', '', NULL, NULL, '2021-05-08 17:53:43', 50.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 50.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 0, '2021-05-08 11:53:43', '2021-05-08 13:57:40'),
(8, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 19:37:20', 418000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 418000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-08 13:37:20', '2021-06-21 05:20:14'),
(9, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 19:45:01', 70000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 70000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-08 13:45:01', '2021-05-08 13:45:01'),
(13, 1, 1, NULL, NULL, NULL, 'purchase', NULL, 'ordered', NULL, 0, 'partial', NULL, 3, NULL, NULL, 'KST20210505-022', NULL, NULL, '2021-05-09 10:02:00', 29580.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, 'By Air', NULL, NULL, NULL, 18000.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 47580.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'months', NULL, '2021-05-09 04:12:37', '2021-06-21 06:08:00'),
(14, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 09:05:55', 34180.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 34180.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 03:05:55', '2021-05-11 03:05:55'),
(15, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 4, 1, '2021-000003', '', NULL, NULL, '2021-05-10 10:24:00', 44000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Dautia, Kalampur, Dhamrai, Dhaka-1351', 'delivered', 'Md. Shafikul Islam Mandol', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 44000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 44000, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '0fb794192d06212eca612bb7d124e9f7', NULL, 'days', NULL, '2021-05-11 04:28:15', '2021-05-11 04:28:15'),
(17, 1, 1, NULL, NULL, NULL, 'expense', NULL, 'final', NULL, 0, 'paid', NULL, NULL, NULL, NULL, 'EP2021/0002', NULL, NULL, '2021-05-11 10:37:00', 500.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'EID bonus for security gird (Savar Car parking)', NULL, 0.0000, 500.0000, 4, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 04:39:58', '2021-05-11 04:39:58'),
(18, 1, 1, NULL, NULL, NULL, 'expense', NULL, 'final', NULL, 0, 'paid', NULL, 4, NULL, NULL, 'EP2021/0003', NULL, NULL, '2021-05-11 10:40:00', 4000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'part Number 12216896 \r\n04 pcs Air filter sales purpose \r\n1000/each', NULL, 0.0000, 4000.0000, 3, 1, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0.0000, 'days', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 04:43:00', '2021-05-12 07:30:55'),
(19, 1, 1, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 5, NULL, NULL, 'PO2021/0002', NULL, NULL, '2021-05-11 10:53:00', 18500.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 18500.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', NULL, '2021-05-11 05:06:01', '2021-05-11 05:06:01'),
(20, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 11:12:21', 35000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 35000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 05:12:21', '2021-05-11 05:14:12'),
(21, 1, 1, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'partial', NULL, 6, NULL, NULL, 'PO2021/0003', NULL, NULL, '2021-05-11 11:14:00', 25000.0100, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 25000.0100, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', NULL, '2021-05-11 05:29:48', '2021-05-11 05:29:48'),
(22, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 7, 1, '2021-000004', '', NULL, NULL, '2021-05-11 11:50:00', 32300.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, 'Gasket', 'Sarabo, Kashimpur, Gazipur', 'delivered', 'Mr. Faruque Hossain', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 32300.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 32300, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'days', NULL, '2021-05-11 05:51:56', '2021-05-12 16:44:17'),
(23, 1, 1, NULL, NULL, NULL, 'expense', NULL, 'final', NULL, 0, 'paid', NULL, NULL, NULL, NULL, 'EP2021/0004', NULL, NULL, '2021-05-11 12:23:00', 5000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'Sadga for Eidul Fitor', NULL, 0.0000, 5000.0000, 5, 3, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 06:27:34', '2021-05-11 06:27:34'),
(24, 1, 1, NULL, NULL, NULL, 'expense', NULL, 'final', NULL, 0, 'paid', NULL, NULL, NULL, NULL, 'EP2021/0005', NULL, NULL, '2021-05-11 12:29:00', 1928.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'Car gas bill', NULL, 0.0000, 1928.0000, 1, 3, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 06:31:20', '2021-05-11 06:31:20'),
(25, 1, 1, NULL, NULL, NULL, 'expense', NULL, 'final', NULL, 0, 'paid', NULL, NULL, NULL, NULL, 'EP2021/0006', NULL, NULL, '2021-05-11 12:32:00', 100.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'Eid Bonus', NULL, 0.0000, 100.0000, 4, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0.0000, 'days', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 06:35:34', '2021-05-11 07:33:17'),
(26, 1, 1, NULL, NULL, NULL, 'expense', NULL, 'final', NULL, 0, 'paid', NULL, NULL, NULL, NULL, 'EP2021/0007', NULL, NULL, '2021-05-11 12:35:00', 18000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'Miscellaneous payment for MWM clock , T-shirt, Showpiece of MWM engine ETC', NULL, 0.0000, 18000.0000, 5, 3, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 06:40:11', '2021-05-11 06:40:11'),
(27, 1, 1, NULL, NULL, NULL, 'opening_balance', NULL, 'final', NULL, 0, 'paid', NULL, 8, NULL, NULL, '2021/0001', NULL, NULL, '2021-05-11 12:48:56', 21000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 21000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 06:48:56', '2021-07-03 04:15:43'),
(28, 1, 1, NULL, NULL, NULL, 'expense', NULL, 'final', NULL, 0, 'paid', NULL, NULL, NULL, NULL, 'EP2021/0008', NULL, NULL, '2021-05-11 13:37:00', 630.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'Car gas bill', NULL, 0.0000, 630.0000, 1, 4, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 07:39:24', '2021-05-11 07:39:24'),
(29, 1, 1, NULL, NULL, NULL, 'opening_balance', NULL, 'final', NULL, 0, 'paid', NULL, 9, NULL, NULL, '2021/0002', NULL, NULL, '2021-05-11 14:08:08', 216800.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 08:08:08', '2021-05-12 05:52:17'),
(30, 1, 1, NULL, NULL, NULL, 'opening_balance', NULL, 'final', NULL, 0, 'partial', NULL, 10, NULL, NULL, '2021/0003', NULL, NULL, '2021-05-11 14:32:53', 216800.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 216800.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 08:32:53', '2021-05-12 05:49:28'),
(32, 1, 1, NULL, NULL, NULL, 'expense', NULL, 'final', NULL, 0, 'paid', NULL, NULL, NULL, NULL, 'EP2021/0009', NULL, NULL, '2021-05-11 15:06:00', 2600.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, '1. Ring Rod change- 02 pcs\r\n2. Break Pad change- 04 pcs\r\n3. Service Charge - 01 jobs\r\nProbox Dhaka Metro GA 26-7264', NULL, 0.0000, 2600.0000, 7, 4, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0.0000, 'days', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 09:09:04', '2021-05-11 09:16:38'),
(33, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 15:33:12', 168000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 168000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 09:33:12', '2021-05-11 09:33:12'),
(34, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 11, NULL, '2021-000005', '', NULL, NULL, '2021-05-11 15:29:00', 16000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, 'Lube oil filter-04pcs', 'Suit-214, Floor: 08, Muskta Bangla Shopping Complex, Mirpur-01, Dhaka, Bangladesh-1216.', 'delivered', 'Mr. Kamrul Hasan', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 16000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 16000, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '07967ee97b7402e0b33c45ff5cbc18da', NULL, NULL, NULL, '2021-05-11 09:34:48', '2021-07-04 11:36:17'),
(35, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 12, 1, '2021-000006', '', NULL, NULL, '2021-02-20 11:22:00', 35000.0000, NULL, 0.0000, 'fixed', 700.0000, 0, 0.0000, NULL, 'Arakan Road, Ward #06, Chapra, Kalarpul, Patiya, Chittagong', 'delivered', 'Mr. Bodruddoza', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 34300.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 34300, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'months', NULL, '2021-05-12 05:30:09', '2021-05-12 05:42:34'),
(36, 1, 1, NULL, NULL, NULL, 'expense', NULL, 'final', NULL, 0, 'paid', NULL, 12, NULL, NULL, 'LPSL/EP/2021/0010', NULL, NULL, '2021-05-12 13:15:00', 10000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'Battery Charger Repair Purpose\r\nQty: 01pcs.', NULL, 0.0000, 10000.0000, 3, 3, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-12 07:21:20', '2021-05-12 07:24:17'),
(37, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'proforma', 1, NULL, NULL, 2, NULL, '2021/0008', '', NULL, NULL, '2021-05-12 17:53:00', 22000.0000, 1, 1100.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'Terms & Condition:\r\n1) Delivery Time : From Ready Stock after your payment & order confirmation.\r\n2) Payment Terms : 100% as advance\r\n3) Mode of Payment : A/C Payee Cheque Or Pay Order In Favor Of \"Limburg Power Solutions Ltd.\"\r\n4) Offer Validity : 30 Days From The Date Here on Subjected to Prior Sales.\r\n5) Delivery Point : At Your Site.\r\n6) Country Of Origin : Germany / EU', NULL, 0.0000, 23100.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'months', NULL, '2021-05-12 11:56:17', '2021-05-12 12:28:30'),
(38, 1, 1, NULL, NULL, NULL, 'expense', NULL, 'final', NULL, 0, 'paid', NULL, NULL, NULL, NULL, 'LPSL/EP/2021/0011', NULL, NULL, '2021-05-13 18:21:00', 5000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'Eid bonus for Mr. Abdul Kaiyum, Plant In charge  in Fariha Fashion Ltd.\r\nTransaction: Bkash \r\nPersonal number: 01758086347', NULL, 0.0000, 5000.0000, 3, 3, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-13 12:25:59', '2021-05-13 12:25:59'),
(39, 1, 1, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'partial', NULL, 8, NULL, NULL, 'LPSL/PO/2021/0005', NULL, NULL, '2021-05-20 21:45:00', 350000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, 'By Pickup', NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 350000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'months', NULL, '2021-05-20 15:50:52', '2021-07-03 07:09:31'),
(40, 1, 1, NULL, NULL, NULL, 'purchase', NULL, 'ordered', NULL, 0, 'due', NULL, 13, NULL, NULL, 'LPSL/PO/2021/0006', NULL, NULL, '2021-05-22 23:11:00', 968520.0000, NULL, 0.0000, 'fixed', 14953.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 953567.0000, NULL, NULL, NULL, '1621770463_010000909631.pdf', 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-22 17:39:26', '2021-05-23 11:47:43'),
(41, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 15, 1, '210534', '', NULL, NULL, '2021-05-23 11:04:00', 153200.0000, 1, 7160.0000, 'fixed', 10000.0000, 0, 0.0000, NULL, 'West Gomdondy, Shakpura, Boalkhali, Chittagong, Bangladesh.', 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 150360.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 150360, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'months', NULL, '2021-05-23 05:09:26', '2021-07-06 11:00:00'),
(42, 1, 1, NULL, NULL, NULL, 'expense', NULL, 'final', NULL, 0, 'paid', NULL, NULL, NULL, NULL, 'LPSL/EP/2021/0012', NULL, NULL, '2021-05-23 13:05:00', 2355.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, '1) Paper Tech Rim Paper (3x245)= 735/-\r\n2) Office File dorjon (3x105)= 315/-\r\n3) Box Tishu (6x55)= 330/-\r\n4) Salun/Napkin Tishu (2x50)= 100/-\r\n5) Binding Clip dorjon (2x65)= 130/-\r\n6) Costep  (5x85)= 425/-\r\n7) Punch/Plastics File dorjon (2x160)= 320/-\r\n\r\nTotal (735+315+330+100+130+425+320)= 2355/-', NULL, 0.0000, 2355.0000, 11, 5, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-23 07:15:13', '2021-05-23 07:15:13'),
(43, 1, 1, NULL, NULL, NULL, 'expense', NULL, 'final', NULL, 0, 'paid', NULL, NULL, NULL, NULL, 'LPSL/EP/2021/0013', NULL, NULL, '2021-05-23 13:19:00', 2250.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, '1) Mobil Change 1 Ltr. Tk. 1550/-\r\n2) Mobil Filter Change 1 Pcs Tk. 300/-\r\n3) Air Filter change 1 Pcs Tk. 200/-\r\n4) Service Charge 1 job Tk. 200/-\r\n\r\nTotal Paid (1550+300+200+200)= 2250/-', NULL, 0.0000, 2250.0000, 7, 4, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-23 07:24:33', '2021-05-23 07:24:33'),
(44, 1, 1, NULL, NULL, NULL, 'expense', NULL, 'final', NULL, 0, 'paid', NULL, NULL, NULL, NULL, 'LPSL/EP/2021/0014', NULL, NULL, '2021-05-23 15:51:00', 3150.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'Fluke 101 Kit Digital Multimeter/i400E Clamp Kit Includes: Serial Number (S): 43162479WS\r\n* Fluke 101 Basic Digital Multimeter\r\n* TI75 Hard Point Test Lead Set\r\n* Two AAA Batteries (Installed)\r\n* Smart Strap', NULL, 0.0000, 3150.0000, 24, 1, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0.0000, 'days', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-23 09:56:53', '2021-06-20 12:25:55'),
(45, 1, 1, NULL, NULL, NULL, 'expense', NULL, 'final', NULL, 0, 'paid', NULL, NULL, NULL, NULL, 'LPSL/EP/2021/0015', NULL, NULL, '2021-05-17 16:55:00', 320.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'Squire Group, Maa Technology Entertain bill Tk. 320/-', NULL, 0.0000, 320.0000, 12, 5, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-23 10:59:03', '2021-05-23 10:59:03'),
(46, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 16, NULL, '2021-000008', '', NULL, NULL, '2021-05-27 12:43:00', 455000.0000, 1, 22750.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 477750.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 477750, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-27 06:54:12', '2021-07-04 07:51:57'),
(47, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 14:46:36', 16500.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 16500.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 26, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-27 08:46:36', '2021-05-27 08:46:36'),
(48, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 18, NULL, '2021-000009', '', NULL, NULL, '2021-05-27 14:53:00', 1920.0000, 1, 84.0000, 'fixed', 240.0000, 0, 0.0000, NULL, 'Dhonaid, Earpur, Ashulia, Savar, Dhaka', 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 1764.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 1764, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '36b2f930a19dbe47be0241e9a83eb43d', NULL, 'days', NULL, '2021-05-27 08:56:13', '2021-05-27 13:21:48'),
(49, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 19:16:03', 56000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 56000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 27, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-27 13:16:03', '2021-05-27 13:16:03'),
(50, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 19, NULL, '210541', '', NULL, NULL, '2021-05-27 18:39:00', 25000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 25000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 25000, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-27 13:20:50', '2021-07-05 10:25:10'),
(51, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, 'due', NULL, 14, 2, '2021/0010', '', NULL, NULL, '2021-06-10 13:33:00', 336000.0000, 1, 15800.0000, 'fixed', 20000.0000, 0, 0.0000, NULL, 'Mawna, Sreepur, Gazipur, Bangladesh', NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'Terms & Condition:\r\n1) Delivery Time : From Ready Stock after your payment & order confirmation.\r\n2) Payment Terms : 100% as advance\r\n3) Mode of Payment : A/C Payee Cheque or Pay Order in Favor Of \"Limburg Power Solutions Ltd.\"\r\n4) Offer Validity : 30 Days from The Date Here on Subjected to Prior Sales.\r\n5) Delivery Point : At Your Site.\r\n6) Country of Origin : USA', NULL, 0.0000, 331800.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'months', 1, '2021-06-10 07:47:42', '2021-06-10 09:53:13'),
(52, 1, 1, NULL, NULL, NULL, 'opening_balance', NULL, 'final', NULL, 0, 'due', NULL, 14, NULL, NULL, '2021/0004', NULL, NULL, '2021-06-10 14:36:40', 220500.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 220500.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-10 08:36:40', '2021-06-10 08:36:40'),
(54, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, 'due', NULL, 1, 2, '2021/0011', '', NULL, NULL, '2021-06-10 16:14:00', 90000.0000, 1, 3640.0000, 'fixed', 17200.0000, 0, 0.0000, NULL, 'Pagar, Tongi I/A, Gazipur, Bangladesh', NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'Terms & Condition:\r\n1) Delivery Time : From Two Weeks after your payment & order confirmation.\r\n2) Payment Terms : 100% as advance\r\n3) Mode of Payment : A/C Payee Cheque or Pay Order in Favor Of \"Limburg Power Solutions Ltd.\"\r\n4) Offer Validity : 30 Days from The Date Here on Subjected to Prior Sales.\r\n5) Delivery Point : At Your Site.\r\n6) Country of Origin : Italy', NULL, 0.0000, 76440.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '9e46af90506d6536600119f2b454f033', NULL, 'months', NULL, '2021-06-10 10:32:26', '2021-06-13 05:46:15'),
(57, 1, 1, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 21, NULL, NULL, 'LPSL/PO/2021/0008', NULL, NULL, '2021-06-10 18:10:00', 51000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 51000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'days', NULL, '2021-06-10 12:12:19', '2021-06-10 12:16:24'),
(58, 1, 1, NULL, NULL, NULL, 'purchase', NULL, 'ordered', NULL, 0, 'due', NULL, 22, NULL, NULL, 'LPSL/PO/2021/0009', NULL, NULL, '2021-06-11 08:31:00', 20000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 20000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'months', NULL, '2021-06-11 02:42:04', '2021-06-11 02:42:04'),
(62, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, 'due', NULL, 23, 1, '2021/0012', '', NULL, NULL, '2021-06-12 12:45:00', 313000.0000, 1, 13900.0000, 'fixed', 35000.0000, 0, 0.0000, NULL, 'BSCIC I/E, Konabari, Gazipur', NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'Terms & Conditions:\r\n1) Delivery Time      	: From Ready Stock after your order confirmation.\r\n2) Payment Terms 	: 100% as advance.\r\n3) Mode of Payment 	: Account pay Cheque/ Pay order in favor of \"Limburg Power Solutions Ltd.\"\r\n4) Offer Validity  	: 30 days from the date hereon subjected to prior sales.      \r\n5) Service Point 	: At your site.      \r\n6) Country Of Origin : Germany / EU', NULL, 0.0000, 291900.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '253408b88000af9b9cb4706d5cff8a3e', NULL, NULL, 1, '2021-06-12 07:20:39', '2021-06-12 07:23:45'),
(63, 1, 1, NULL, NULL, NULL, 'opening_balance', NULL, 'final', NULL, 0, 'due', NULL, 1, NULL, NULL, '2021/0005', NULL, NULL, '2021-06-13 10:23:32', 1347822.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 883671.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-13 04:23:32', '2021-06-23 03:59:06'),
(66, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 13:52:24', 39900.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 39900.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 38, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-20 07:52:24', '2021-06-20 07:52:24'),
(67, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 2, NULL, '210638', '', NULL, NULL, '2021-06-20 14:55:00', 0.1000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Nanakhi, Sadipur Union, Sonargaon, Narayangonj', 'packed', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.1000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, 'd2ede86ffacbeb80d65bbf0e05d6b339', NULL, NULL, NULL, '2021-06-20 09:08:40', '2021-06-25 10:14:50'),
(71, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 09:51:18', 300000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 300000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 39, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-21 03:51:18', '2021-06-21 03:58:46'),
(73, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 2, NULL, '210639', '', NULL, NULL, '2021-06-21 10:01:00', 560000.0000, NULL, 0.0000, 'fixed', 30000.0000, 0, 0.0000, NULL, 'Nanakhi, Sadipur Union, Sonargaon, Narayangonj', 'shipped', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'In word: Five Lac Thirty Thousand Taka Only.', NULL, 0.0000, 530000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 530000, NULL, 0, 1.0000, 'days', 0, NULL, NULL, 'a4b295aa5f795fcfec44a00c8999a8bb', NULL, NULL, NULL, '2021-06-21 04:09:28', '2021-06-26 04:10:07'),
(74, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 18, NULL, '210640', '', NULL, NULL, '2021-06-21 10:11:00', 7500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Dhonaid, Earpur, Ashulia, Savar, Dhaka', 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 7500.0000, NULL, NULL, NULL, '1624854034_210640 Service Bill.pdf', 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 7500, NULL, 0, 1.0000, 'days', 0, NULL, NULL, 'fbef56a223beb4a96e80913ba5d8a6e7', NULL, NULL, NULL, '2021-06-21 04:29:28', '2021-07-01 11:24:53'),
(75, 1, 1, NULL, NULL, NULL, 'opening_balance', NULL, 'final', NULL, 0, 'due', NULL, 18, NULL, NULL, '2021/0006', NULL, NULL, '2021-06-21 10:46:47', 38000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 38000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-21 04:46:47', '2021-07-01 11:24:53'),
(76, 1, 1, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 27, NULL, NULL, 'NE/742/2021', NULL, NULL, '2021-06-08 11:39:00', 16000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 16000.0000, NULL, NULL, NULL, '1624254778_170,000_National Engineering.jpeg', 0, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-21 05:52:58', '2021-07-04 12:04:33'),
(77, 1, 1, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'partial', NULL, 27, NULL, NULL, 'NE/1241/2021', NULL, NULL, '2021-05-13 11:44:00', 170000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 170000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'months', NULL, '2021-06-21 05:56:27', '2021-06-21 06:26:57'),
(78, 1, 1, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 27, NULL, NULL, 'NE/744/2021', NULL, NULL, '2021-06-09 11:54:00', 28000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 28000.0000, NULL, NULL, NULL, '1624256508_28000_National Engineering.jpeg', 0, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-21 06:21:48', '2021-07-04 12:05:11'),
(79, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 14, 2, '2021-000014', '', NULL, NULL, '2021-06-21 12:35:00', 410000.0000, 1, 18000.0000, 'fixed', 50000.0000, 0, 0.0000, NULL, 'Mawna, Sreepur, Gazipur, Bangladesh', 'delivered', 'Mr. Arman Hossain', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 378000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 378000, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 1, '2021-06-21 06:39:40', '2021-06-21 06:39:40'),
(82, 1, 1, NULL, NULL, NULL, 'opening_balance', NULL, 'final', NULL, 0, 'due', NULL, 29, NULL, NULL, '2021/0007', NULL, NULL, '2021-06-22 09:24:58', 284600.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 284600.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-22 03:24:58', '2021-06-22 03:24:58'),
(86, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 29, NULL, '210641', '', NULL, NULL, '2021-06-22 09:38:00', 4000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, 'cancelled', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 4000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 4000, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '1cd75498849de7ee796f0893aa9f6a9c', NULL, 'months', NULL, '2021-06-22 03:39:49', '2021-06-28 11:30:21'),
(87, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 29, NULL, '210642', '', NULL, NULL, '2021-06-22 09:40:00', 4000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 4000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 4000, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '18b88f542855065bef5767b9b8ec7000', NULL, 'months', NULL, '2021-06-22 03:42:43', '2021-06-22 08:50:38'),
(88, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 29, NULL, '210643', '', NULL, NULL, '2021-06-22 09:43:00', 4000.0000, NULL, 0.0000, 'fixed', 0.0000, 0, 0.0000, NULL, NULL, 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 4000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 4000, NULL, 0, 1.0000, 'days', 0, NULL, NULL, 'd7d8491df665458e43c90c7d5bc74ee5', NULL, 'months', NULL, '2021-06-22 03:44:07', '2021-06-22 08:50:18'),
(90, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 24, 1, '210645', '', NULL, NULL, '2021-06-22 10:10:00', 147600.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, 'SD', '15 Genda, Savar, Dhaka-1340, Bangladesh.', 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 147600.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 147600, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'months', 1, '2021-06-22 04:14:56', '2021-06-25 10:42:46'),
(91, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 30, NULL, '210644', '', NULL, NULL, '2021-06-22 10:19:00', 6000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 6000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 6000, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-22 04:28:35', '2021-07-04 10:37:47'),
(93, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 1, 2, '210614', '', NULL, NULL, '2021-06-11 10:41:00', 0.4200, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Pagar, Tongi I/A, Gazipur, Bangladesh', 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.4200, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, 'cad77e0cf432372b0c53e276679ad78d', NULL, NULL, 1, '2021-06-22 04:51:52', '2021-06-23 03:57:29'),
(94, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 1, 2, '210616', '', NULL, NULL, '2021-06-12 14:53:00', 20000.0000, 2, 3000.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Pagar, Tongi I/A, Gazipur, Bangladesh', 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 23000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 23000, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'months', 1, '2021-06-22 08:58:12', '2021-06-23 03:57:29'),
(95, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 1, 2, '210617', '', NULL, NULL, '2021-06-12 14:58:00', 20000.0000, 2, 3000.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Pagar, Tongi I/A, Gazipur, Bangladesh', 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 23000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 23000, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'months', 1, '2021-06-22 09:02:08', '2021-06-23 03:57:29'),
(96, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 1, 2, '210618', '', NULL, NULL, '2021-06-12 15:03:00', 10000.0000, 2, 1500.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Pagar, Tongi I/A, Gazipur, Bangladesh', 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 11500.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 11500, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '93754ffdb1ad8e68d5495ceea93936c8', NULL, 'months', 1, '2021-06-22 09:05:54', '2021-06-23 03:57:29'),
(97, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 1, 2, '210619', '', NULL, NULL, '2021-06-12 15:08:00', 6000.0000, 2, 900.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Pagar, Tongi I/A, Gazipur, Bangladesh', 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 6900.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 6900, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 1, '2021-06-22 09:11:08', '2021-06-23 03:57:29'),
(98, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 1, 2, '210620', '', NULL, NULL, '2021-06-12 15:11:00', 6000.0000, 2, 900.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Pagar, Tongi I/A, Gazipur, Bangladesh', 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 6900.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 6900, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'months', 1, '2021-06-22 09:14:03', '2021-06-23 03:57:29'),
(99, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 1, 2, '210621', '', NULL, NULL, '2021-06-12 15:14:00', 6000.0000, 2, 900.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Pagar, Tongi I/A, Gazipur, Bangladesh', 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 6900.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 6900, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'months', 1, '2021-06-22 09:16:53', '2021-06-23 03:57:29'),
(100, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 1, 2, '210622', '', NULL, NULL, '2021-06-12 15:17:00', 15000.0000, 2, 2250.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Pagar, Tongi I/A, Gazipur, Bangladesh', 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 17250.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 17250, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'months', 1, '2021-06-22 09:19:56', '2021-06-23 03:57:29'),
(101, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 1, 2, '210624', '', NULL, NULL, '2021-06-14 15:23:00', 152000.0000, 1, 7600.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Pagar, Tongi I/A, Gazipur, Bangladesh', 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 159600.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 159600, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '5116cd3f2373bf90c796cbb9b3f0c784', NULL, 'months', 1, '2021-06-22 09:31:30', '2021-06-23 02:56:47'),
(103, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 16:44:11', 1000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 1000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 31, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-22 10:44:11', '2021-06-22 10:44:11'),
(104, 1, 1, NULL, NULL, NULL, 'expense', NULL, 'final', NULL, 0, 'paid', NULL, 1, NULL, NULL, 'LPSL/EP/2021/0020', NULL, NULL, '2021-06-22 17:12:00', 1610.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, '# Friday 11-06-2021 {Z&Z-Tongi Service}\r\n1. Traveling                =300/-tk\r\n2. Breakfast                 =40/-tk\r\n3. Holiday Allowance =300/-tk\r\n------------------------------------------------\r\nTotal                           =640/-tk\r\n\r\n# Sunday 13-06-2021 {Bank and C&F Work,  Uttara & Airport}\r\n1.Traveling                               =70/-tk\r\n2.Lunch                                  =120/-tk\r\n3.C&F Document Color Print =140/-tk\r\n-------------------------------------------------------\r\nSub Total                                =330/-tk\r\nAdvance Money                     =200/-tk\r\nTotal                                       =130/-tk\r\n\r\n# Monday 14-06-2021 {NAZ Bangladesh Delivery Rajendrapur}\r\n1. Lunch              =120/-tk\r\n-------------------------------------------------------------------\r\nTotal                    =120/-tk\r\n\r\n# Tuesday 15-06-2021 {Bank And C&F Work, Uttara & Airport}\r\n1. Traveling                        =100/-tk\r\n2. Lunch                             =120/-tk\r\n3. C&F with me Food           =70/-tk\r\n---------------------------------------------------------\r\nTotal                                   =290/-tk\r\n\r\n# Friday 18-06-2021 {Z&Z-Tongi Service}\r\n1. Traveling                    =90/-tk\r\n2. Breakfast                   =40/-tk\r\n3. Holiday Allowance   =300/-tk\r\n------------------------------------------------------------\r\ntotal                             =430/-tk\r\n\r\n--------------------------------------------------------------------\r\nTotal Amount = 1610/-tk', NULL, 0.0000, 1610.0000, 25, 9, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 0.0000, 'days', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-22 11:59:19', '2021-07-04 12:33:25'),
(105, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 31, NULL, '210606', '', NULL, NULL, '2021-06-05 18:09:00', 39000.0000, 1, 1950.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 40950.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 40950, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '80f2184d394f7fb90c236ea2b7d9fb0d', NULL, 'months', 1, '2021-06-22 12:19:16', '2021-06-22 12:19:16'),
(106, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 32, NULL, '210628', '', NULL, NULL, '2021-06-17 19:05:00', 126000.0000, 1, 4920.0000, 'fixed', 27600.0000, 0, 0.0000, 'SD', NULL, 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 103320.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 103320, NULL, 0, 1.0000, 'days', 0, NULL, NULL, 'd85056ad1f772bb4c1e32e54770af184', NULL, 'months', 1, '2021-06-22 13:09:17', '2021-06-25 10:43:56');
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `sub_status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `shipping_custom_field_1`, `shipping_custom_field_2`, `shipping_custom_field_3`, `shipping_custom_field_4`, `shipping_custom_field_5`, `additional_notes`, `staff_note`, `round_off_amount`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(108, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'partial', NULL, 32, NULL, '210318', '', NULL, NULL, '2021-03-22 19:36:00', 126000.0000, 1, 4920.0000, 'fixed', 27600.0000, 0, 0.0000, 'SD', NULL, 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 103320.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 103320, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'months', NULL, '2021-06-22 13:39:00', '2021-06-25 10:39:22'),
(109, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 1, 2, '210646', '', NULL, NULL, '2021-06-22 20:32:00', 10000.0000, 2, 1500.0000, 'percentage', 0.0000, 0, 0.0000, 'SD', 'Pagar, Tongi I/A, Gazipur, Bangladesh', 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 11500.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 11500, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '79fc51dde9b1fa6640d4f30408e1f13b', NULL, 'months', 1, '2021-06-22 15:15:48', '2021-06-25 10:39:51'),
(111, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 2, NULL, '210609', '', NULL, NULL, '2021-06-09 21:46:00', 127200.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Nanakhi, Sadipur Union, Sonargaon, Narayangonj', 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 127200.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 127200, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '6ee59f712cf8e706e447818084c1825e', NULL, 'months', NULL, '2021-06-22 15:48:17', '2021-06-25 10:39:16'),
(112, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 2, NULL, '210613', '', NULL, NULL, '2021-06-11 21:52:00', 45000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Nanakhi, Sadipur Union, Sonargaon, Narayangonj', 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 45000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 45000, NULL, 0, 1.0000, 'days', 0, NULL, NULL, 'c7b08f16dcb0e0a4b62b9d785e57006e', NULL, NULL, NULL, '2021-06-22 15:53:53', '2021-06-25 10:14:18'),
(113, 1, 1, NULL, NULL, NULL, 'purchase', NULL, 'ordered', NULL, 0, 'due', NULL, 34, NULL, NULL, 'LPSL/PO/2021/0013', NULL, NULL, '2021-06-23 10:03:00', 0.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 0.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'months', NULL, '2021-06-23 04:08:02', '2021-06-23 13:03:51'),
(114, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 13:30:55', 6518.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 6518.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 46, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-23 07:30:55', '2021-06-23 07:30:55'),
(115, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 13:33:00', 7822.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 7822.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 47, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-23 07:33:00', '2021-06-23 07:33:00'),
(116, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 35, NULL, '210647', '', NULL, NULL, '2021-06-23 13:16:00', 8700.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, 'delivered', 'Mr. Shadat Hossain', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 8700.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 8700, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-23 07:35:38', '2021-06-25 10:29:21'),
(117, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 13:39:48', 12000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 12000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 45, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-23 07:39:48', '2021-06-23 07:39:48'),
(122, 1, 1, NULL, NULL, NULL, 'purchase', NULL, 'ordered', NULL, 0, 'partial', NULL, 21, NULL, NULL, 'LPSL/PO/2021/0014', NULL, NULL, '2021-06-23 18:55:00', 17000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 17000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-23 12:59:44', '2021-06-23 12:59:46'),
(124, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 15:28:39', 56000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 56000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 49, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-25 09:28:39', '2021-06-25 09:28:39'),
(125, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 15:31:10', 16800.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 16800.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 50, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-25 09:31:10', '2021-06-25 09:31:10'),
(126, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 15:35:35', 42500.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 42500.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 51, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-25 09:35:35', '2021-06-25 09:35:35'),
(127, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 15:37:33', 2550.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 2550.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 52, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-25 09:37:33', '2021-06-25 09:37:33'),
(128, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 15:39:45', 2550.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 2550.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 53, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-25 09:39:45', '2021-06-25 09:39:45'),
(129, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 15:43:53', 1280.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 1280.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 54, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-25 09:43:53', '2021-06-25 09:43:53'),
(130, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 15:45:32', 600000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 600000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 55, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-25 09:45:32', '2021-06-25 09:45:32'),
(131, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 35, NULL, '210648', '', NULL, NULL, '2021-06-25 15:29:00', 450000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 450000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 450000, NULL, 0, 1.0000, 'days', 0, NULL, NULL, 'aaa018ffce0dde7115369fa6926e8491', NULL, 'months', NULL, '2021-06-25 09:46:34', '2021-06-25 10:07:35'),
(132, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 32, NULL, '210649', '', NULL, NULL, '2021-06-25 15:16:00', 114900.0000, 1, 5500.0000, 'fixed', 4900.0000, 0, 0.0000, NULL, NULL, 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 115500.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 60900, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '15ce33e3514e051922a2eb3839483cb6', NULL, 'months', NULL, '2021-06-25 09:57:28', '2021-07-03 04:31:41'),
(135, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 38, 2, '210626', '', NULL, NULL, '2021-06-26 11:43:00', 110700.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'In Word : BDT One Lac Ten Thousand Seven Hundred Only.\r\n\r\n\r\nTerms & Conditions:\r\n1) Delivery Time      : After your payment and order confirmation.\r\n2) Payment Terms 	 : 100% As Advance.\r\n3) Mode of Payment  : Account pay Cheque/ Pay order in favor of \"Limburg Power Solutions Ltd.\"\r\n4) Offer Validity  	  : 30 days from the date hereon subjected to prior sales.      \r\n5) Delivery Point 	 : At your site.      \r\n6) Country of origin   : Germany/EU\r\n\r\nFor, Limburg Power Solutions Ltd.\r\n\r\nMd. Shafikul Islam\r\nHead Of Product Support\r\nCell : +8801714615869', NULL, 0.0000, 110700.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'months', 1, '2021-06-26 05:51:54', '2021-06-26 05:51:54'),
(136, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 32, NULL, '210650', '', NULL, NULL, '2021-06-26 17:32:00', 52000.0000, 1, 2600.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Purba Vawal, Mirjapur, Gazipur (Sadar)', NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 54600.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 54600, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '221cf4894ed4c1c8367f11158719cd98', NULL, 'months', NULL, '2021-06-26 11:44:06', '2021-06-26 11:45:36'),
(137, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 11:39:17', 17000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 17000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 56, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-27 05:39:17', '2021-06-27 05:39:17'),
(139, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 39, 1, '2021/0016', '', NULL, NULL, '2021-06-27 12:18:00', 2191800.0000, 1, 109590.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Nagarhawla, Sreepur, Gazipur, Bangladesh.', NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'In word: Twenty Three Lac One Thousand Three Hundred Ninety.\r\n\r\n\r\n\r\n   \r\nTerms & Conditions:\r\n1) Delivery Time : after your payment and order confirmation.\r\n2) Payment Terms : 100% As Advance.\r\n3) Mode of Payment : Account pay Cheque/ Pay order in favor of \"Limburg Power Solutions Ltd.\"\r\n4) Offer Validity : 30 days from the date hereon subjected to prior sales.\r\n5) Delivery Point : At your site.\r\n6) Country of origin : Germany/EU', NULL, 0.0000, 2301390.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '6fe20af6b8d3cd927adc024226b82ed6', NULL, 'months', 1, '2021-06-27 06:28:51', '2021-06-27 06:28:51'),
(141, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, 2, '210627', '', NULL, NULL, '2021-06-27 15:13:00', 480000.0000, 1, 24000.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Pagar, Tongi I/A, Gazipur, Bangladesh', NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'In Words: BDT Five Lac Four Thousand  Only\r\n\r\nTerms & Conditions:\r\n1) Delivery Time      	:  After your payment and order confirmation.\r\n2) Payment Terms 	        : 100% As Advance.\r\n3) Mode of Payment 	: Account pay Cheque/ Pay order in favor of \"Limburg Power Solutions Ltd.\"\r\n4) Offer Validity  	       : 30 days from the date hereon subjected to prior sales.      \r\n5) Delivery Point 	        : At your site.      \r\n6) Country of origin          : Germany/EU.\r\n		\r\nFor, Limburg Power Solutions Ltd.\r\n\r\nMd. Shafikul Islam\r\nHead Of Product Support\r\nCell : +8801714615869', NULL, 0.0000, 504000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'months', 1, '2021-06-27 09:25:40', '2021-06-27 09:25:40'),
(142, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, 2, '210628', '', NULL, NULL, '2021-06-27 15:26:00', 48000.0000, 1, 2400.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Pagar, Tongi I/A, Gazipur, Bangladesh', NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'In Words: BDT Fifty Thousand Four Hundred  Only\r\n\r\nTerms & Conditions:\r\n1) Delivery Time      	:  After your payment and order confirmation.\r\n2) Payment Terms    	: 100% As Advance.\r\n3) Mode of Payment 	: Account pay Cheque/ Pay order in favor of \"Limburg Power Solutions Ltd.\"\r\n4) Offer Validity  	        : 30 days from the date hereon subjected to prior sales.      \r\n5) Delivery Point 	        : At your site.      \r\n6) Country of origin          : Germany/EU.\r\n			\r\nFor, Limburg Power Solutions Ltd.\r\nMd. Shafikul Islam\r\nHead Of Product Support\r\nCell : +8801714615869', NULL, 0.0000, 50400.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'months', 1, '2021-06-27 09:30:31', '2021-06-27 09:30:31'),
(143, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 1, 2, '210629', '', NULL, NULL, '2021-06-27 15:26:00', 584000.0000, 1, 29200.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Pagar, Tongi I/A, Gazipur, Bangladesh', NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'In Words: BDT Six Lac Thirteen Thousand  Thousand Two Hundred  Only.\r\n\r\nTerms & Conditions:\r\n1) Delivery Time      	:  After your payment and order confirmation.\r\n2) Payment Terms    	: 100% As Advance.\r\n3) Mode of Payment 	: Account pay Cheque/ Pay order in favor of \"Limburg Power Solutions Ltd.\"\r\n4) Offer Validity  	        : 30 days from the date hereon subjected to prior sales.      \r\n5) Delivery Point 	        : At your site.      \r\n6) Country of origin          : Germany/EU.\r\n			\r\nFor, Limburg Power Solutions Ltd.\r\n\r\nMd. Shafikul Islam\r\nHead Of Product Support\r\nCell : +8801714615869', NULL, 0.0000, 613200.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'months', 1, '2021-06-27 09:39:04', '2021-06-27 09:39:04'),
(144, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 40, NULL, '210651', '', NULL, NULL, '2021-06-28 09:39:00', 246450.0000, 1, 12322.5000, 'percentage', 0.0000, 0, 0.0000, NULL, '1006-123, DEPZ-Extension Area, Savar, Dhaka.', 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 258772.5000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 258772, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'months', NULL, '2021-06-28 03:48:19', '2021-07-03 04:20:15'),
(146, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 35, NULL, '210652', '', NULL, NULL, '2021-06-28 17:20:00', 48000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 48000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 48000, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'months', NULL, '2021-06-28 11:21:24', '2021-06-28 11:21:24'),
(148, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 38, 2, '210653', '', NULL, NULL, '2021-06-29 09:28:00', 110700.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 110700.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 110700, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'months', 1, '2021-06-29 03:32:29', '2021-06-29 03:32:29'),
(149, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 2, NULL, '210655', '', NULL, NULL, '2021-06-30 10:04:00', 90000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Nanakhi, Sadipur Union, Sonargaon, Narayangonj', NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 90000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 90000, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'months', NULL, '2021-06-30 04:10:57', '2021-06-30 04:10:57'),
(150, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 42, 1, '210656', '', NULL, NULL, '2021-06-30 12:27:00', 34680.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 34680.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 34680, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, 1, '2021-06-30 06:36:07', '2021-06-30 06:36:07'),
(151, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 43, NULL, '210654 (210658)', '', NULL, NULL, '2021-06-30 18:40:00', 46000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 46000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 46000, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'months', NULL, '2021-06-30 12:42:31', '2021-07-01 10:14:04'),
(154, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 11, NULL, '210703', '', NULL, NULL, '2021-07-01 14:50:00', 34800.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Suit-214, Floor: 08, Muskta Bangla Shopping Complex, Mirpur-01, Dhaka, Bangladesh-1216', 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 34800.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 34800, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'months', NULL, '2021-07-01 08:54:09', '2021-07-04 11:14:58'),
(156, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 43, NULL, '210608', '', NULL, NULL, '2021-06-08 16:20:00', 38000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 38000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 38000, NULL, 0, 1.0000, 'days', 0, NULL, NULL, 'efff359a285a6a0efcf621aa698b163b', NULL, 'months', NULL, '2021-07-01 10:22:54', '2021-07-01 10:24:32'),
(157, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, 'due', NULL, 32, NULL, '210701', '', NULL, NULL, '2021-07-01 16:30:00', 40000.0000, 1, 2000.0000, 'percentage', 0.0000, 0, 0.0000, NULL, ': Noman Terry Towel Mills Ltd\r\nPurba vawal,Mirjapur Gazipur (sadar)', NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'In words : Forty Two Thousand Taka Only.\r\nTerms & Conditions:\r\n1) Delivery Time      : after your payment and order confirmation.\r\n2) Payment Terms 	: 100% As Advance.\r\n3) Mode of Payment : Account pay Cheque/ Pay order in favor of \"Limburg Power Solutions Ltd.\"\r\n4) Offer Validity  	: 30 days from the date hereon subjected to prior sales.      \r\n5) Delivery Point 	: At your site.      \r\n6) Country of origin  : USA\r\n\r\nFor, Limburg Power Solutions Ltd.\r\n\r\nMd. Shafikul Islam\r\nHead Of Product Support\r\nCell : +8801714615869', NULL, 0.0000, 42000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'months', NULL, '2021-07-01 10:35:36', '2021-07-01 10:36:14'),
(158, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'partial', NULL, 18, NULL, '210654', '', NULL, NULL, '2021-06-29 17:00:00', 400000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Dhonaid, Earpur, Ashulia, Savar, Dhaka', 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 400000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 400000, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '19d2a021e0d262f50e8f99774b4bcd9d', NULL, 'months', NULL, '2021-07-01 11:01:46', '2021-07-01 11:59:24'),
(161, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 18, NULL, '210704', '', NULL, NULL, '2021-07-01 17:36:00', 20000.0000, 1, 1000.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Dhonaid, Earpur, Ashulia, Savar, Dhaka', 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 21000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 21000, NULL, 0, 1.0000, 'days', 0, NULL, NULL, 'cfe2951e92f789b6e5c4bc326b64a9b6', NULL, 'months', NULL, '2021-07-01 11:37:51', '2021-07-04 12:10:50'),
(162, 1, 1, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'due', NULL, 8, NULL, NULL, 'MHP/27060007175', NULL, NULL, '2021-06-27 10:01:00', 159500.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 159500.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'months', NULL, '2021-07-03 04:18:24', '2021-07-03 04:18:24'),
(164, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 2, NULL, '210705', '', NULL, NULL, '2021-07-03 10:22:00', 200000.0000, 1, 10000.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Nanakhi, Sadipur Union, Sonargaon, Narayangonj', NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 210000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 210000, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'months', NULL, '2021-07-03 04:23:19', '2021-07-03 04:23:19'),
(165, 1, 1, NULL, NULL, NULL, 'sell_return', NULL, 'final', NULL, 0, 'due', NULL, 32, NULL, 'LPSL/CR/2021/0001', NULL, NULL, NULL, '2021-07-03 10:27:00', 52000.0000, 1, 2600.0000, 'fixed', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 54600.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, 132, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-03 04:28:36', '2021-07-03 04:31:41'),
(166, 1, 1, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 8, NULL, NULL, 'MHP/27020005037', NULL, NULL, '2021-02-25 11:54:00', 49250.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 49250.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'months', NULL, '2021-07-03 05:56:54', '2021-07-03 06:00:55'),
(167, 1, 1, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'paid', NULL, 8, NULL, NULL, 'MHP/27030006022', NULL, NULL, '2021-04-01 12:15:00', 23000.0000, NULL, 0.0000, 'fixed', 2000.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 21000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'months', NULL, '2021-07-03 06:22:36', '2021-07-03 06:32:27'),
(169, 1, 1, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'due', NULL, 8, NULL, NULL, 'MHP/27050007083', NULL, NULL, '2021-05-28 12:33:00', 7000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 7000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'months', NULL, '2021-07-03 06:36:45', '2021-07-03 06:36:45'),
(170, 1, 1, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'due', NULL, 8, NULL, NULL, 'MHP/27060007119', NULL, NULL, '2021-06-02 12:46:00', 31200.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 31200.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-03 06:48:57', '2021-07-03 06:48:57'),
(171, 1, 1, NULL, NULL, NULL, 'purchase', NULL, 'pending', NULL, 0, 'due', NULL, 8, NULL, NULL, 'MHP/27060007151', NULL, NULL, '2021-06-17 13:11:00', 60000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 60000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'months', NULL, '2021-07-03 07:14:51', '2021-07-04 03:49:15'),
(172, 1, 1, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'partial', NULL, 46, NULL, NULL, 'HPIL/LMP/CAT.GOODS/2021', NULL, NULL, '2021-06-27 14:55:00', 46200.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 46200.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'months', NULL, '2021-07-03 09:09:18', '2021-07-03 09:11:44'),
(173, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 44, 2, '210701', '', NULL, NULL, '2021-07-04 11:00:00', 35500.0000, 1, 1775.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Teengaon,Duptara.Narayanganj.', NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'In Words : BDT Thirty Seven Thousand Two Hundred Seventy Five Only.\r\n\r\nTerms & Conditions:\r\n1) Delivery Time      :  After your payment and order confirmation.\r\n2) Payment Terms 	: 100% As Advance.\r\n3) Mode of Payment : Account pay Cheque/ Pay order in favor of \"Limburg Power Solutions Ltd.\"\r\n4) Offer Validity  	: 30 days from the date hereon subjected to prior sales.      \r\n5) Delivery Point 	: At your site.      \r\n6) Country of origin  : Germany/EU\r\n\r\nFor, Limburg Power Solutions Ltd.\r\n\r\nShohidul Islam\r\nHead Of Service\r\nCell : +8801716913682', NULL, 0.0000, 37275.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'months', 1, '2021-07-04 05:15:12', '2021-07-04 05:15:12'),
(174, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 11, NULL, '2021-000020', '', NULL, NULL, '2021-06-16 13:42:00', 150000.0000, NULL, 0.0000, 'fixed', 10000.0000, 0, 0.0000, NULL, 'Suit-214, Floor: 08, Muskta Bangla Shopping Complex, Mirpur-01, Dhaka, Bangladesh-1216', 'delivered', 'Mr. Kamrul Hasan', 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 140000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 140000, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'months', NULL, '2021-07-04 07:45:42', '2021-07-04 07:45:42'),
(175, 1, 1, NULL, NULL, NULL, 'opening_balance', NULL, 'final', NULL, 0, 'due', NULL, 56, NULL, NULL, '2021/0008', NULL, NULL, '2021-07-04 14:31:32', 600000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 600000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 08:31:32', '2021-07-04 08:31:32'),
(176, 1, 1, NULL, NULL, NULL, 'purchase', NULL, 'received', NULL, 0, 'due', NULL, 56, NULL, NULL, 'LPSL/PO/2021/0023', NULL, NULL, '2021-07-04 14:31:00', 170000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'Special Warranty:\r\na) All ComAp Products & Services - 2 Years\r\nNote:\r\n4) Repair/maintenance of the equipments will incur charges after expiry of warranty period\r\nTERMS & CONDITIONS\r\nOffer will remain vaild for a period of 30 days from the date of this offer.\r\nDelivery Time: 10 Weeks from first payment (Financial Term, b.1) Received & Drawing Approval from the client.\r\n1) Warranty is provided from the date of delivery at site and on condition that the equipment are run\r\nwithin rated load, necessary protection and adequate earthing.\r\n2) Warranty will be void if any repairing/modification of the equipments/switchgears is carried out without REVERIE\r\npersonnel or its concern.\r\n3) Warranty will be void due maloperation of the system.', NULL, 0.0000, 170000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'months', NULL, '2021-07-04 08:35:43', '2021-07-04 08:35:43'),
(177, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 57, 2, '210704', '', NULL, NULL, '2021-07-04 14:46:00', 21000.0000, 1, 1050.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Jarun,konabari (Ground & 1st Floor),Gazipur sadar,Gazipur', NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'In Words: BDT Twenty Two Thousand Fifty  Only.\r\n\r\nTerms & Conditions:\r\n1) Delivery Time      :  After your payment and order confirmation.\r\n2) Payment Terms 	: 100% As Advance.\r\n3) Mode of Payment  : Account pay Cheque/ Pay order in favor of \"Limburg Power Solutions Ltd.\"\r\n4) Offer Validity  	: 30 days from the date hereon subjected to prior sales.      \r\n5) Delivery Point 	: At your site.      \r\n6) Country of origin   : Germany/EU\r\n\r\nFor, Limburg Power Solutions Ltd.\r\n\r\nMd. Shafikul Islam\r\nHead Of Product Support\r\nCell : +8801714615869', NULL, 0.0000, 22050.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, 'ec4ef922376b55943edfb2a2ec15af9d', NULL, 'months', 1, '2021-07-04 08:55:29', '2021-07-04 08:55:29'),
(179, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 20, NULL, '210401', '', NULL, NULL, '2021-04-01 16:02:00', 38800.0000, 1, 1940.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Factory: Shirir Chala, Bhabanipur, Gazipur, Bangladesh', NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 40740.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 40740, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '222916c1df7e5db26eb250ad7d427dc5', NULL, 'months', NULL, '2021-07-04 10:05:02', '2021-07-04 10:05:02'),
(180, 1, 1, NULL, NULL, NULL, 'opening_balance', NULL, 'final', NULL, 0, 'due', NULL, 11, NULL, NULL, '2021/0009', NULL, NULL, '2021-07-04 16:23:41', 918132.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 918132.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 10:23:41', '2021-07-04 10:23:41'),
(181, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 16:34:52', 252000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 252000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 70, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 10:34:52', '2021-07-04 10:34:52'),
(182, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 30, NULL, '210430', '', NULL, NULL, '2021-04-22 16:29:00', 36000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 36000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 36000, NULL, 0, 1.0000, 'days', 0, NULL, NULL, 'd562345ae5fa88049a3acbc01113ff46', NULL, 'months', NULL, '2021-07-04 10:35:36', '2021-07-04 10:53:42'),
(183, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 11, NULL, '210432', '', NULL, NULL, '2021-04-25 16:38:00', 25000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Suit-214, Floor: 08, Muskta Bangla Shopping Complex, Mirpur-01, Dhaka, Bangladesh-1216', 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 25000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 25000, NULL, 0, 1.0000, 'days', 0, NULL, NULL, 'cef7bb85a2c68773d49d6652c3fbae53', NULL, 'months', NULL, '2021-07-04 10:46:00', '2021-07-04 11:07:24'),
(184, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 16:48:56', 18000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 18000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 71, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 10:48:56', '2021-07-04 10:50:57'),
(185, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 11, NULL, '06012021', '', NULL, NULL, '2021-01-05 16:57:00', 17000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Suit-214, Floor: 08, Muskta Bangla Shopping Complex, Mirpur-01, Dhaka, Bangladesh-1216', 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 17000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 17000, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'months', NULL, '2021-07-04 11:00:04', '2021-07-04 11:00:04'),
(186, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 11, NULL, '08012021', '', NULL, NULL, '2021-01-11 17:00:00', 8500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Suit-214, Floor: 08, Muskta Bangla Shopping Complex, Mirpur-01, Dhaka, Bangladesh-1216', 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 8500.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 8500, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'months', NULL, '2021-07-04 11:04:03', '2021-07-04 11:04:03'),
(187, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 11, NULL, '210121', '', NULL, NULL, '2021-01-26 17:04:00', 8500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Suit-214, Floor: 08, Muskta Bangla Shopping Complex, Mirpur-01, Dhaka, Bangladesh-1216', 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 8500.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 8500, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'months', NULL, '2021-07-04 11:06:25', '2021-07-04 11:11:37'),
(188, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 11, NULL, '210325', '', NULL, NULL, '2021-03-23 17:07:00', 14000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Suit-214, Floor: 08, Muskta Bangla Shopping Complex, Mirpur-01, Dhaka, Bangladesh-1216', 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 14000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 14000, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 11:08:31', '2021-07-04 11:08:31'),
(189, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 11, NULL, '210508', '', NULL, NULL, '2021-05-07 17:16:00', 8500.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Suit-214, Floor: 08, Muskta Bangla Shopping Complex, Mirpur-01, Dhaka, Bangladesh-1216', 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 8500.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 8500, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'months', NULL, '2021-07-04 11:18:15', '2021-07-04 11:18:15'),
(190, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 11, NULL, '210515', '', NULL, NULL, '2021-05-11 17:18:00', 16000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Suit-214, Floor: 08, Muskta Bangla Shopping Complex, Mirpur-01, Dhaka, Bangladesh-1216', 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 16000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 16000, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'months', NULL, '2021-07-04 11:19:54', '2021-07-04 11:19:54'),
(191, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 17:22:12', 19000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 19000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 72, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 11:22:12', '2021-07-04 11:22:12'),
(193, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 19, NULL, '210439', '', NULL, NULL, '2021-04-29 17:24:00', 25000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 25000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 25000, NULL, 0, 1.0000, 'days', 0, NULL, NULL, 'ecadab1a9efb243a904237361c891c10', NULL, 'months', NULL, '2021-07-04 11:25:55', '2021-07-04 11:25:55'),
(195, 1, 1, NULL, NULL, NULL, 'expense', NULL, 'final', NULL, 0, 'due', NULL, NULL, NULL, NULL, 'LPSL/EP/2021/0022', NULL, NULL, '2021-07-04 18:34:00', 1902.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'visit & sevice Purpose', NULL, 0.0000, 1902.0000, 25, 6, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 12:36:44', '2021-07-04 12:36:44'),
(196, 1, 1, NULL, NULL, NULL, 'expense', NULL, 'final', NULL, 0, 'due', NULL, NULL, NULL, NULL, 'LPSL/EP/2021/0023', NULL, NULL, '2021-07-04 18:40:00', 1095.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'Visit & service purpose ( 23/06/2021-29/06/2021)', NULL, 0.0000, 1095.0000, 25, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 12:42:16', '2021-07-04 12:42:16'),
(197, 1, 1, NULL, NULL, NULL, 'opening_balance', NULL, 'final', NULL, 0, 'due', NULL, 49, NULL, NULL, '2021/0010', NULL, NULL, '2021-07-04 18:51:08', 450000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 450000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 12:51:09', '2021-07-04 12:51:09'),
(198, 1, 1, NULL, NULL, NULL, 'opening_balance', NULL, 'final', NULL, 0, 'due', NULL, 57, NULL, NULL, '2021/0011', NULL, NULL, '2021-07-04 18:55:36', 79800.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 79800.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 12:55:36', '2021-07-04 12:55:36'),
(200, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 16, NULL, '210533', '', NULL, NULL, '2021-05-27 17:14:00', 466200.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 466200.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 466200, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '90b14435455582354a7f59d8fcbed6ce', NULL, NULL, NULL, '2021-07-05 11:18:26', '2021-07-05 11:18:26'),
(202, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 17:44:08', 15000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 15000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 77, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-05 11:44:08', '2021-07-05 11:44:08'),
(203, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 61, NULL, '210532', '', NULL, NULL, '2021-05-26 17:36:00', 20000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Kathali, Bhaluka, Mymensingh, Bangladesh', 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 20000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 'fixed', NULL, NULL, NULL, NULL, 0, 20000, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '0638a081e1e10ff4a3de3ec917253b5f', NULL, 'months', NULL, '2021-07-05 11:47:44', '2021-07-05 11:47:44');
INSERT INTO `transactions` (`id`, `business_id`, `location_id`, `res_table_id`, `res_waiter_id`, `res_order_status`, `type`, `sub_type`, `status`, `sub_status`, `is_quotation`, `payment_status`, `adjustment_type`, `contact_id`, `customer_group_id`, `invoice_no`, `ref_no`, `subscription_no`, `subscription_repeat_on`, `transaction_date`, `total_before_tax`, `tax_id`, `tax_amount`, `discount_type`, `discount_amount`, `rp_redeemed`, `rp_redeemed_amount`, `shipping_details`, `shipping_address`, `shipping_status`, `delivered_to`, `shipping_charges`, `shipping_custom_field_1`, `shipping_custom_field_2`, `shipping_custom_field_3`, `shipping_custom_field_4`, `shipping_custom_field_5`, `additional_notes`, `staff_note`, `round_off_amount`, `final_total`, `expense_category_id`, `expense_for`, `commission_agent`, `document`, `is_direct_sale`, `is_suspend`, `exchange_rate`, `total_amount_recovered`, `transfer_parent_id`, `return_parent_id`, `opening_stock_product_id`, `created_by`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `import_batch`, `import_time`, `types_of_service_id`, `packing_charge`, `packing_charge_type`, `service_custom_field_1`, `service_custom_field_2`, `service_custom_field_3`, `service_custom_field_4`, `is_created_from_api`, `rp_earned`, `order_addresses`, `is_recurring`, `recur_interval`, `recur_interval_type`, `recur_repetitions`, `recur_stopped_on`, `recur_parent_id`, `invoice_token`, `pay_term_number`, `pay_term_type`, `selling_price_group_id`, `created_at`, `updated_at`) VALUES
(204, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 53, 2, '210705', '', NULL, NULL, '2021-07-05 17:43:00', 51000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Vabanipur, Sreepur, Gazipur, Bangladesh.', NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'In Words: BDT Fifty One Thousand  Only.\r\n\r\nTerms & Conditions:\r\n1) Delivery Time      : after your payment and order confirmation.\r\n2) Payment Terms 	: 100% As Advance.\r\n3) Mode of Payment  : Account pay Cheque/ Pay order in favor of \"Limburg Power Solutions Ltd.\"\r\n4) Offer Validity  	: 30 days from the date hereon subjected to prior sales.      \r\n5) Delivery Point 	: At your site.      \r\n6) Country of origin  : USA/EU\r\n\r\nMd. Shafikul Islam\r\nHead Of Product Support\r\nCell : +8801714615869', NULL, 0.0000, 51000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '571bf63d5fde208966008ab9cad8b345', NULL, 'months', 1, '2021-07-05 11:58:29', '2021-07-05 11:58:29'),
(205, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 18:07:19', 300.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 300.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 78, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-05 12:07:19', '2021-07-05 12:07:19'),
(206, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 1, 2, '210529', '', NULL, NULL, '2021-05-24 17:54:00', 15500.0000, 1, 775.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Pagar, Tongi I/A, Gazipur, Bangladesh', 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 16275.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 16275, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '47509e552c778b9541de1f42520f3771', NULL, 'months', 1, '2021-07-05 12:08:47', '2021-07-05 12:08:47'),
(207, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 16, NULL, '210528', '', NULL, NULL, '2021-05-24 18:10:00', 16000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, NULL, 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 16000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 16000, NULL, 0, 1.0000, 'days', 0, NULL, NULL, 'bf3f378ad28083173dd3be2de88b6239', NULL, 'months', NULL, '2021-07-05 12:12:46', '2021-07-05 12:12:46'),
(208, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 18:21:00', 800000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 800000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 79, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-05 12:21:00', '2021-07-05 12:21:00'),
(209, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'paid', NULL, 61, NULL, '210211 *(210527)*', '', NULL, NULL, '2021-05-23 18:14:00', 110000.0000, 2, 16500.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Kathali, Bhaluka, Mymensingh, Bangladesh', 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 126500.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 126500, NULL, 0, 1.0000, 'days', 0, NULL, NULL, '872dc5db4657679a2d636f8722523f89', NULL, 'months', NULL, '2021-07-05 12:22:31', '2021-07-05 12:25:23'),
(210, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'draft', 'quotation', 1, NULL, NULL, 67, 2, '210706', '', NULL, NULL, '2021-07-06 15:59:00', 124000.0000, 1, 6200.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'Naval Stores Depot Chattogram', NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 'In Words: BDT One Lac Thirty Thousand Two Hundred Only.\r\n\r\n1) Delivery Time      : after your payment and order confirmation.\r\n2) Payment Terms 	: 100% As Advance.\r\n3) Mode of Payment : Account pay Cheque/ Pay order in favor of \"Limburg Power Solutions Ltd.\"\r\n4) Offer Validity  	: 30 days from the date hereon subjected to prior sales.      \r\n5) Delivery Point 	: At your site.      \r\n6) Country of origin   : USA/EU\r\n7) Warranty                : 01 Year after Installation.\r\n\r\nFor, Limburg Power Solutions Ltd.\r\n\r\nMd. Shafikul Islam\r\nHead Of Product Support\r\nCell : +8801714615869', NULL, 0.0000, 130200.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 1.0000, 'days', 0, NULL, NULL, 'f89660716aa1807032ce099b81236fed', NULL, 'months', 1, '2021-07-06 10:13:18', '2021-07-06 10:13:18'),
(211, 1, 1, NULL, NULL, NULL, 'opening_stock', NULL, 'received', NULL, 0, 'paid', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-01 16:50:12', 80000.0000, NULL, 0.0000, NULL, 0.0000, 0, 0.0000, NULL, NULL, NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 80000.0000, NULL, NULL, NULL, NULL, 0, 0, 1.000, NULL, NULL, NULL, 83, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-06 10:50:12', '2021-07-06 10:50:12'),
(212, 1, 1, NULL, NULL, NULL, 'sell', NULL, 'final', NULL, 0, 'due', NULL, 15, 1, '210326', '', NULL, NULL, '2021-03-28 16:44:00', 30000.0000, NULL, 0.0000, 'percentage', 0.0000, 0, 0.0000, NULL, 'West Gomdondy, Shakpura, Boalkhali, Chittagong, Bangladesh.', 'delivered', NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.0000, 30000.0000, NULL, NULL, NULL, NULL, 1, 0, 1.000, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0.0000, 'fixed', NULL, NULL, NULL, NULL, 0, 30000, NULL, 0, 1.0000, 'days', 0, NULL, NULL, NULL, NULL, 'months', 1, '2021-07-06 11:09:24', '2021-07-06 11:09:24');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_payments`
--

CREATE TABLE `transaction_payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(11) UNSIGNED DEFAULT NULL,
  `business_id` int(11) DEFAULT NULL,
  `is_return` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Used during sales to return the change',
  `amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `method` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_transaction_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_holder_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_month` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_year` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `card_security` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cheque_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_account_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paid_on` datetime DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `is_advance` tinyint(1) NOT NULL DEFAULT '0',
  `payment_for` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `note` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_ref_no` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_payments`
--

INSERT INTO `transaction_payments` (`id`, `transaction_id`, `business_id`, `is_return`, `amount`, `method`, `transaction_no`, `card_transaction_number`, `card_number`, `card_type`, `card_holder_name`, `card_month`, `card_year`, `card_security`, `cheque_number`, `bank_account_number`, `paid_on`, `created_by`, `is_advance`, `payment_for`, `parent_id`, `note`, `document`, `payment_ref_no`, `account_id`, `created_at`, `updated_at`) VALUES
(1, 15, 1, 0, 44000.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-10 10:24:00', 1, 0, 4, NULL, NULL, NULL, 'SP2021/0004', 2, '2021-05-11 04:28:15', '2021-05-11 04:28:15'),
(3, 17, 1, 0, 500.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-10 10:37:00', 1, 0, NULL, NULL, NULL, NULL, 'SP2021/0006', 2, '2021-05-11 04:39:58', '2021-05-11 04:39:58'),
(4, 18, 1, 0, 4000.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 10:40:00', 1, 0, 4, NULL, NULL, NULL, 'SP2021/0007', 2, '2021-05-11 04:43:00', '2021-05-11 04:46:12'),
(5, 19, 1, 0, 18500.0000, 'cheque', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, 'CA 8764081', NULL, '2021-05-11 10:53:00', 1, 0, 5, NULL, NULL, NULL, 'PP2021/0001', 1, '2021-05-11 05:06:01', '2021-05-11 05:06:01'),
(6, 21, 1, 0, 25000.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 11:14:00', 1, 0, 6, NULL, NULL, NULL, 'PP2021/0002', 2, '2021-05-11 05:29:48', '2021-05-11 05:29:48'),
(7, 22, 1, 0, 32300.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 11:50:00', 1, 0, 7, NULL, NULL, NULL, 'SP2021/0008', 2, '2021-05-11 05:51:57', '2021-05-11 05:51:57'),
(8, 23, 1, 0, 5000.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-10 12:23:00', 1, 0, NULL, NULL, 'Sadga for Eidul Fitor receved by Shohidul Islam', NULL, 'SP2021/0009', 2, '2021-05-11 06:27:34', '2021-05-11 06:27:34'),
(9, 24, 1, 0, 1928.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-10 12:29:00', 1, 0, NULL, NULL, 'Car gas bill received by Shohidul islam', NULL, 'SP2021/0010', 2, '2021-05-11 06:31:20', '2021-05-11 06:31:20'),
(10, 25, 1, 0, 100.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 12:32:00', 1, 0, NULL, NULL, 'Beximco Textile Security Eidul Fitor bonus paid received by manwar', NULL, 'SP2021/0011', 2, '2021-05-11 06:35:34', '2021-05-11 07:32:40'),
(11, 26, 1, 0, 18000.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 12:35:00', 1, 0, NULL, NULL, 'Miscellaneous payment for MWM clock , T-shirt, Showpiece of MWM engine ETC sent to F.M Kamal hossain.', NULL, 'SP2021/0012', 2, '2021-05-11 06:40:11', '2021-05-11 06:40:11'),
(12, NULL, 1, 0, 21000.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 12:49:00', 1, 1, 8, NULL, 'Cash paid by online transfer. Bill no: MHP/27030006022', NULL, 'PP2021/0003', 2, '2021-05-11 06:52:30', '2021-05-11 06:52:30'),
(13, 27, 1, 0, 21000.0000, 'cash', 'cash', NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 12:49:00', 1, 0, 8, 12, NULL, NULL, 'PP2021/0004', NULL, '2021-05-11 06:52:30', '2021-05-11 06:52:30'),
(14, 28, 1, 0, 630.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 13:37:00', 1, 0, NULL, NULL, 'Md. Idris Ali for Probox car gas bill', NULL, 'SP2021/0013', 2, '2021-05-11 07:39:24', '2021-05-11 07:39:24'),
(15, NULL, 1, 0, 100000.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 12:33:00', 1, 1, 10, NULL, 'Actuator partials payments', NULL, 'SP2021/0014', 2, '2021-05-11 08:34:49', '2021-05-11 08:34:49'),
(16, 30, 1, 0, 100000.0000, 'cash', 'cash', NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 12:33:00', 1, 0, 10, 15, NULL, NULL, 'PP2021/0005', NULL, '2021-05-11 08:34:49', '2021-05-11 08:34:49'),
(17, 32, 1, 0, 2600.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 15:06:00', 1, 0, NULL, NULL, '1. Ring Rod change- 02 pcs\r\n2. Break Pad change- 04 pcs\r\n3. Service Charge - 01 jobs\r\nDhaka Metro GA-26-7264', NULL, 'SP2021/0015', 2, '2021-05-11 09:09:04', '2021-05-11 09:16:38'),
(19, 35, 1, 0, 34300.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-12 11:34:00', 1, 0, 12, NULL, 'Customer has been deduct AIT 700TK', '1620797870_CamScanner 05-12-2021 10.46.pdf', 'SP2021/0017', 2, '2021-05-12 05:37:50', '2021-05-12 05:37:50'),
(20, 36, 1, 0, 10000.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-12 13:15:00', 1, 0, 12, NULL, 'Battery Charger Repair Purpose and pay to Mr. Bodruddoza Chaudory\r\nQty: 01pcs.\r\nBkash personal no: 01916455766 and 01819547974.', NULL, 'SP2021/0018', 2, '2021-05-12 07:21:20', '2021-05-12 07:24:17'),
(21, 38, 1, 0, 5000.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-13 18:21:00', 1, 0, NULL, NULL, 'Eid bonus for Mr. Abdul Kaiyum, Plant In charge  in Fariha Fashion Ltd.\r\nTransaction: Bkash \r\nPersonal number: 01758086347', NULL, 'LPSL/SP/2021/0019', 2, '2021-05-13 12:25:59', '2021-05-13 12:25:59'),
(22, 42, 1, 0, 2355.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-23 13:05:00', 5, 0, NULL, NULL, '1) Paper Tech Rim Paper (3x245)= 735/-\r\n2) Office File dorjon (3x105)= 315/-\r\n3) Box Tishu (6x55)= 330/-\r\n4) Salun/Napkin Tishu (2x50)= 100/-\r\n5) Binding Clip dorjon (2x65)= 130/-\r\n6) Costep ', NULL, 'LPSL/SP/2021/0020', 2, '2021-05-23 07:15:13', '2021-05-23 07:15:13'),
(23, 43, 1, 0, 2250.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-23 13:19:00', 5, 0, NULL, NULL, ') Mobil Change 1 Ltr. Tk. 1550/-\r\n2) Mobil Filter Change 1 Pcs Tk. 300/-\r\n3) Air Filter change 1 Pcs Tk. 200/-\r\n4) Service Charge 1 job Tk. 200/-\r\n\r\nTotal Paid (1550+300+200+200)= 2250/-', NULL, 'LPSL/SP/2021/0021', 2, '2021-05-23 07:24:33', '2021-05-23 07:24:33'),
(24, 44, 1, 0, 3150.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-23 15:51:00', 5, 0, NULL, NULL, 'Fluke 101 Kit Digital Multimeter/i400E Clamp Kit Includes: Serial Number (S): 43162479WS\r\n* Fluke 101 Basic Digital Multimeter\r\n* TI75 Hard Point Test Lead Set\r\n* Two AAA Batteries (Installed', NULL, 'LPSL/SP/2021/0022', 2, '2021-05-23 09:56:53', '2021-05-23 09:56:53'),
(25, 45, 1, 0, 320.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-17 16:55:00', 5, 0, NULL, NULL, 'Squire Group, Maa Technology Entertain bill Tk. 320/-', NULL, 'LPSL/SP/2021/0023', NULL, '2021-05-23 10:59:03', '2021-05-23 10:59:03'),
(26, 48, 1, 0, 1764.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-27 18:34:00', 1, 0, 18, NULL, NULL, NULL, 'LPSL/SP/2021/0025', 2, '2021-05-27 12:35:33', '2021-05-27 12:35:33'),
(27, NULL, 1, 0, 150000.0000, 'cheque', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, '8764086', NULL, '2021-06-10 17:06:00', 5, 1, 8, NULL, 'Cheque Draw- Partial Payment Paid for MHP/27050007062, Billing Date: 20/05/2021, Amount Tk. 350,000/-, Ch. No: 8764086, Date: 06/06/2021, MBL (GNB), Ch. Amount Tk. 150,000/-', '1623323270_150,000_MH Power Solution & Technology.pdf', 'LPSL/PP/2021/0006', 1, '2021-06-10 11:07:50', '2021-06-10 11:07:50'),
(28, 39, 1, 0, 150000.0000, 'cheque', 'cheque', NULL, NULL, 'credit', NULL, NULL, NULL, NULL, '8764086', NULL, '2021-06-10 17:06:00', 5, 0, 8, 27, NULL, NULL, 'LPSL/PP/2021/0007', NULL, '2021-06-10 11:07:50', '2021-06-10 11:07:50'),
(29, 57, 1, 0, 51000.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-10 18:15:00', 5, 0, 21, NULL, 'Prechamber Purchases 3 Pcs in Cash', NULL, 'LPSL/PP/2021/0008', 2, '2021-06-10 12:16:24', '2021-06-10 12:16:24'),
(32, NULL, 1, 0, 29580.0000, 'cheque', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, '8743181', NULL, '2021-05-19 12:03:00', 5, 1, 3, NULL, 'P/I: KST20210505-022, Item- 1) Air Filter Element (P/N: 12216896) 06 Pcs @ RMB ¥ 340= ¥ 2040 Convarsation Rate 14.5= BDT 29,580/-. Ch.No: 8743181, Date: 09/06/2021', '1624255680_29580_06 Pcs Air Filter Element Payment (China).pdf', 'LPSL/PP/2021/0009', 1, '2021-06-21 06:08:00', '2021-06-21 06:08:00'),
(33, 13, 1, 0, 29580.0000, 'cheque', 'cheque', NULL, NULL, 'credit', NULL, NULL, NULL, NULL, '8743181', NULL, '2021-05-19 12:03:00', 5, 0, 3, 32, NULL, NULL, 'LPSL/PP/2021/0010', NULL, '2021-06-21 06:08:00', '2021-06-21 06:08:00'),
(34, 77, 1, 0, 100000.0000, 'cheque', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, '8764083', NULL, '2021-06-10 12:23:00', 5, 0, 27, NULL, 'Partial Payment for Bill No: NE/1241/2021; Ch. No: 8764083, Date: 10.06.2021, MBL (GNB); Amount TK. 100,000/-', NULL, 'LPSL/PP/2021/0011', 1, '2021-06-21 06:25:35', '2021-06-21 06:25:35'),
(36, 108, 1, 0, 35849.0000, 'cheque', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, '93840', NULL, '2021-06-22 19:39:00', 5, 0, 32, NULL, '93840, Date: 22/06/2021, Krishi Bank Ltd. Ch. Amount Tk. 35,849/-', NULL, 'LPSL/SP/2021/0034', 1, '2021-06-22 13:41:51', '2021-06-22 13:41:51'),
(60, 122, 1, 0, 10000.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-23 18:55:00', 5, 0, 21, NULL, '1 Pcs Prechamber Spark Plug (12453572) Purchases Purpose Partial paid Tk. 10,000/- Out of TK. 17,000/-, so, 7000/- is recent Due Balance', NULL, 'LPSL/PP/2021/0015', NULL, '2021-06-23 12:59:46', '2021-06-23 12:59:46'),
(62, NULL, 1, 0, 172200.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-24 19:02:00', 5, 1, 2, NULL, '9246214\r\nSouteast bank (bongshal bra.)', '1624539954_IMG_20210624_131129.jpg', 'LPSL/SP/2021/0057', 2, '2021-06-24 13:05:54', '2021-06-24 13:05:54'),
(63, 111, 1, 0, 127200.0000, 'cash', 'cash', NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-24 19:02:00', 5, 0, 2, 62, NULL, NULL, 'LPSL/SP/2021/0058', NULL, '2021-06-24 13:05:54', '2021-06-24 13:05:54'),
(64, 112, 1, 0, 45000.0000, 'cash', 'cash', NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-24 19:02:00', 5, 0, 2, 62, NULL, NULL, 'LPSL/SP/2021/0059', NULL, '2021-06-24 13:05:54', '2021-06-24 13:05:54'),
(70, 158, 1, 0, 150000.0000, 'cheque', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, '1482791', NULL, '2021-06-30 17:25:00', 5, 0, 18, NULL, 'Partial Payment Received Ch. No: 1482791, Date: 28/06/2021; Amount TK. 150,000/-', NULL, 'LPSL/SP/2021/0067', 1, '2021-07-01 11:26:04', '2021-07-01 11:26:04'),
(72, 166, 1, 0, 49250.0000, 'cheque', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, '8764062', NULL, '2021-03-18 11:57:00', 5, 0, 8, NULL, 'Cheque Draw from Bank **MH Power Solution & Technology** name chequ paid. Bill No: MHP/27020005037, Amount Tk. 49250/-. Ch. No: 8764062, Date: 18.03.2021, MBL (Gareeb-E-Newaz). **N.B : New 2 ', '1625292055_49,250_MH Power Solution & Technology.pdf', 'LPSL/PP/2021/0017', 1, '2021-07-03 06:00:55', '2021-07-03 06:00:55'),
(73, 167, 1, 0, 21000.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-11 12:30:00', 5, 0, 8, NULL, 'Cash Full payment paid for Bill No: MHP/27030006022, Tk. 21,000/-', NULL, 'LPSL/PP/2021/0018', 2, '2021-07-03 06:32:27', '2021-07-03 06:32:27'),
(74, 39, 1, 0, 100000.0000, 'cheque', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, '8764090', NULL, '2021-06-27 12:57:00', 5, 0, 8, NULL, 'Cheque Isse- for MHP/27050007062 - Partial Payment Paid Tk. 100,000/-, Ch. No: 8764090, Date: 27/06/2021, MBL (GNB)', '1625296171_100,000_MH Power Solution & Technology.pdf', 'LPSL/PP/2021/0019', 1, '2021-07-03 07:09:31', '2021-07-03 07:09:31'),
(75, 172, 1, 0, 23200.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-05-27 15:10:00', 5, 0, 46, NULL, 'Bill No: HPIL/LMP/CAT.GOODS/2021; Item- 1) Engine Oil Filter 12 Pcs @ Tk. 3850/-= 46200/-. Partial Payment paid Tk. 23200/- & rest 23000 added in due balance.', NULL, 'LPSL/PP/2021/0020', 2, '2021-07-03 09:11:44', '2021-07-03 09:11:44'),
(77, 187, 1, 0, 8500.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-01-26 17:04:00', 1, 0, 11, NULL, NULL, NULL, 'LPSL/SP/2021/0071', NULL, '2021-07-04 11:06:25', '2021-07-04 11:11:37'),
(78, 193, 1, 0, 25000.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 17:24:00', 5, 0, 19, NULL, NULL, NULL, 'LPSL/SP/2021/0072', NULL, '2021-07-04 11:25:55', '2021-07-04 11:25:55'),
(79, 76, 1, 0, 16000.0000, 'cheque', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, '8764089', NULL, '2021-06-27 18:03:00', 5, 0, 27, NULL, 'Cheque Draw- for Bill No: NE/742/2021; Amount Tk. 16000/-; & NE/744/2021; Amount Tk. 28000/-. Total (16000+28000)= 44000/-. Ch. No: 8764089, Date: 27/06/2021, MBL (GNB), Amount Tk. 44,000/-', NULL, 'LPSL/PP/2021/0021', 1, '2021-07-04 12:04:33', '2021-07-04 12:04:33'),
(80, 78, 1, 0, 28000.0000, 'cheque', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, '8764089', NULL, '2021-06-27 18:04:00', 5, 0, 27, NULL, 'Cheque Draw- for Bill No: NE/742/2021; Amount Tk. 16000/-; & NE/744/2021; Amount Tk. 28000/-. Total (16000+28000)= 44000/-. Ch. No: 8764089, Date: 27/06/2021, MBL (GNB), Amount Tk. 44,000/-', NULL, 'LPSL/PP/2021/0022', 1, '2021-07-04 12:05:11', '2021-07-04 12:05:11'),
(81, 104, 1, 0, 1610.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-04 18:32:00', 1, 0, 1, NULL, NULL, NULL, 'LPSL/EP/2021/0002', 2, '2021-07-04 12:33:25', '2021-07-04 12:33:25'),
(82, 209, 1, 0, 1260000.0000, 'cash', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, NULL, NULL, '2021-07-05 18:14:00', 5, 0, 61, NULL, NULL, NULL, 'LPSL/SP/2021/0073', NULL, '2021-07-05 12:22:31', '2021-07-05 12:22:31'),
(83, 41, 1, 0, 150360.0000, 'cheque', NULL, NULL, NULL, 'credit', NULL, NULL, NULL, NULL, 'EFTN', NULL, '2021-07-06 16:56:00', 5, 0, 15, NULL, 'Cash Deposited or EFTN fund transferred against bill no: LPSL/SP/I/210534 .\r\nSales Amount Tk. 153,200/-\r\nDiscount Fixed Tk. 10,000/-\r\nWithout VAT Sales Amount Tk. 143,200/-\r\n5% VAT TK. 7,160/', NULL, 'LPSL/SP/2021/0074', 1, '2021-07-06 11:00:00', '2021-07-06 11:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines`
--

CREATE TABLE `transaction_sell_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `quantity` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `quantity_returned` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `unit_price_before_discount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `unit_price` decimal(22,4) DEFAULT NULL COMMENT 'Sell price excluding tax',
  `line_discount_type` enum('fixed','percentage') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `line_discount_amount` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `unit_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `item_tax` decimal(22,4) NOT NULL COMMENT 'Tax for one quantity',
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `discount_id` int(11) DEFAULT NULL,
  `lot_no_line_id` int(11) DEFAULT NULL,
  `sell_line_note` text COLLATE utf8mb4_unicode_ci,
  `res_service_staff_id` int(11) DEFAULT NULL,
  `res_line_order_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_sell_line_id` int(11) DEFAULT NULL,
  `children_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Type of children for the parent, like modifier or combo',
  `sub_unit_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines`
--

INSERT INTO `transaction_sell_lines` (`id`, `transaction_id`, `product_id`, `variation_id`, `quantity`, `quantity_returned`, `unit_price_before_discount`, `unit_price`, `line_discount_type`, `line_discount_amount`, `unit_price_inc_tax`, `item_tax`, `tax_id`, `discount_id`, `lot_no_line_id`, `sell_line_note`, `res_service_staff_id`, `res_line_order_status`, `parent_sell_line_id`, `children_type`, `sub_unit_id`, `created_at`, `updated_at`) VALUES
(5, 5, 1, 1, 1.0000, 0.0000, 50.0000, 50.0000, 'fixed', 0.0000, 50.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-08 11:47:02', '2021-05-08 11:47:02'),
(6, 6, 1, 1, 1.0000, 0.0000, 50.0000, 50.0000, 'fixed', 0.0000, 50.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-08 11:53:43', '2021-05-08 11:53:43'),
(7, 15, 3, 3, 4.0000, 0.0000, 11000.0000, 11000.0000, 'fixed', 0.0000, 11000.0000, 0.0000, NULL, NULL, NULL, 'Ready Stock', NULL, NULL, NULL, '', NULL, '2021-05-11 04:28:15', '2021-05-11 04:28:15'),
(8, 22, 5, 5, 19.0000, 0.0000, 1700.0000, 1700.0000, 'fixed', 0.0000, 1700.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-11 05:51:56', '2021-05-11 05:51:56'),
(9, 34, 7, 7, 4.0000, 0.0000, 4000.0000, 4000.0000, 'fixed', 0.0000, 4000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-11 09:34:48', '2021-05-12 08:43:45'),
(10, 35, 8, 8, 1.0000, 0.0000, 35000.0000, 35000.0000, 'fixed', 0.0000, 35000.0000, 0.0000, NULL, NULL, NULL, 'G3516A CAT generator 60Amp battery charger repair works.', NULL, NULL, NULL, '', NULL, '2021-05-12 05:30:09', '2021-05-12 05:42:34'),
(11, 37, 3, 3, 2.0000, 0.0000, 11000.0000, 11000.0000, 'fixed', 0.0000, 11000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-12 11:56:17', '2021-05-12 11:56:17'),
(12, 41, 7, 7, 4.0000, 0.0000, 7000.0000, 7000.0000, 'fixed', 0.0000, 7000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-23 05:09:26', '2021-07-06 10:42:28'),
(13, 41, 6, 6, 2.0000, 0.0000, 1600.0000, 1600.0000, 'fixed', 0.0000, 1600.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-23 05:09:26', '2021-07-06 10:42:28'),
(14, 41, 2, 2, 2.0000, 0.0000, 45000.0000, 45000.0000, 'fixed', 0.0000, 45000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-23 05:09:26', '2021-07-06 10:42:28'),
(15, 41, 3, 3, 2.0000, 0.0000, 16000.0000, 16000.0000, 'fixed', 0.0000, 16000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-23 05:09:26', '2021-07-06 10:42:28'),
(16, 46, 2, 2, 14.0000, 0.0000, 32500.0000, 32500.0000, 'fixed', 0.0000, 32500.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-27 06:54:12', '2021-07-04 07:51:57'),
(17, 48, 26, 26, 4.0000, 0.0000, 480.0000, 480.0000, 'fixed', 0.0000, 480.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-27 08:56:13', '2021-05-27 13:21:48'),
(18, 50, 27, 27, 2.0000, 0.0000, 8500.0000, 8500.0000, 'fixed', 0.0000, 8500.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-27 13:20:50', '2021-07-05 10:25:10'),
(19, 50, 7, 7, 2.0000, 0.0000, 4000.0000, 4000.0000, 'fixed', 0.0000, 4000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-05-27 13:20:50', '2021-07-05 10:25:10'),
(20, 51, 28, 28, 16.0000, 0.0000, 7000.0000, 7000.0000, 'fixed', 0.0000, 7000.0000, 0.0000, NULL, NULL, NULL, 'Ready Stock', NULL, NULL, NULL, '', NULL, '2021-06-10 07:47:42', '2021-06-10 09:53:13'),
(21, 51, 29, 29, 16.0000, 0.0000, 7000.0000, 7000.0000, 'fixed', 0.0000, 7000.0000, 0.0000, NULL, NULL, NULL, 'Ready Stock', NULL, NULL, NULL, '', NULL, '2021-06-10 07:47:42', '2021-06-10 09:53:13'),
(22, 51, 30, 30, 16.0000, 0.0000, 7000.0000, 7000.0000, 'fixed', 0.0000, 7000.0000, 0.0000, NULL, NULL, NULL, 'Ready Stock', NULL, NULL, NULL, '', NULL, '2021-06-10 07:47:42', '2021-06-10 09:53:13'),
(24, 54, 32, 32, 1.0000, 0.0000, 90000.0000, 90000.0000, 'fixed', 0.0000, 90000.0000, 0.0000, NULL, NULL, NULL, 'Delivery Time: we have ready stock for support.', NULL, NULL, NULL, '', NULL, '2021-06-10 10:32:26', '2021-06-13 05:46:15'),
(29, 62, 34, 34, 3.0000, 0.0000, 26000.0000, 26000.0000, 'fixed', 0.0000, 26000.0000, 0.0000, NULL, NULL, NULL, 'One Week', NULL, NULL, NULL, '', NULL, '2021-06-12 07:20:39', '2021-06-12 07:23:45'),
(30, 62, 23, 23, 5.0000, 0.0000, 35000.0000, 35000.0000, 'fixed', 0.0000, 35000.0000, 0.0000, NULL, NULL, NULL, 'One Week', NULL, NULL, NULL, '', NULL, '2021-06-12 07:20:39', '2021-06-12 07:23:45'),
(31, 62, 35, 35, 1.0000, 0.0000, 60000.0000, 60000.0000, 'fixed', 0.0000, 60000.0000, 0.0000, NULL, NULL, NULL, 'Ready Stock', NULL, NULL, NULL, '', NULL, '2021-06-12 07:20:39', '2021-06-12 07:23:45'),
(34, 67, 31, 31, 1.0000, 0.0000, 0.1000, 0.1000, 'fixed', 0.0000, 0.1000, 0.0000, NULL, NULL, NULL, 'Actuator Repair 12210285\r\nSTG-30\r\nProblem: Actuator Current High (More than 6 Amp)', NULL, NULL, NULL, '', NULL, '2021-06-20 09:08:40', '2021-06-25 10:14:50'),
(40, 73, 39, 39, 1.0000, 0.0000, 560000.0000, 560000.0000, 'fixed', 0.0000, 560000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-21 04:09:28', '2021-06-26 04:10:07'),
(41, 74, 31, 31, 1.0000, 0.0000, 7500.0000, 7500.0000, 'fixed', 0.0000, 7500.0000, 0.0000, NULL, NULL, NULL, 'Crankcase Pressure & Lube Oil Temperature High-\r\nDate: 01/05/2021,\r\nEngine Model: CG170;\r\nSerial No: 2212253;\r\nRunning Hour: 42278', NULL, NULL, NULL, '', NULL, '2021-06-21 04:29:28', '2021-06-28 04:20:34'),
(42, 79, 42, 42, 1.0000, 0.0000, 105000.0000, 105000.0000, 'fixed', 0.0000, 105000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-21 06:39:40', '2021-06-21 06:39:40'),
(43, 79, 41, 41, 1.0000, 0.0000, 90000.0000, 90000.0000, 'fixed', 0.0000, 90000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-21 06:39:40', '2021-06-21 06:39:40'),
(44, 79, 43, 43, 1.0000, 0.0000, 35000.0000, 35000.0000, 'fixed', 0.0000, 35000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-21 06:39:40', '2021-06-21 06:39:40'),
(45, 79, 44, 44, 1.0000, 0.0000, 180000.0000, 180000.0000, 'fixed', 0.0000, 180000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-21 06:39:40', '2021-06-21 06:39:40'),
(51, 86, 31, 31, 1.0000, 0.0000, 4000.0000, 4000.0000, 'fixed', 0.0000, 4000.0000, 0.0000, NULL, NULL, NULL, 'Subject: AMC Visit Charge;\r\nDate Of Visit: 17/05/2021;\r\nEngine Serial No: 2210827;\r\nEngine Running Hour: .........................', NULL, NULL, NULL, '', NULL, '2021-06-22 03:39:49', '2021-06-28 11:30:21'),
(52, 87, 31, 31, 1.0000, 0.0000, 4000.0000, 4000.0000, 'fixed', 0.0000, 4000.0000, 0.0000, NULL, NULL, NULL, 'Subject: AMC Visit Charge;\r\nDate Of Visit: 04/06/2021;\r\nEngine Serial No: 2210827;\r\nEngine Running Hour: .........................', NULL, NULL, NULL, '', NULL, '2021-06-22 03:42:43', '2021-06-22 08:50:38'),
(53, 88, 31, 31, 1.0000, 0.0000, 4000.0000, 4000.0000, 'fixed', 0.0000, 4000.0000, 0.0000, NULL, NULL, NULL, 'Subject: AMC Visit Charge;\r\nDate Of Visit: 22/06/2021;\r\nEngine Serial No: 2210827;\r\nEngine Running Hour: .........................', NULL, NULL, NULL, '', NULL, '2021-06-22 03:44:08', '2021-06-22 08:50:18'),
(55, 90, 2, 2, 6.0000, 0.0000, 24600.0000, 24600.0000, 'fixed', 0.0000, 24600.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-22 04:14:56', '2021-06-22 04:15:21'),
(56, 91, 45, 45, 1.0000, 0.0000, 6000.0000, 6000.0000, 'fixed', 0.0000, 6000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-22 04:28:35', '2021-07-04 10:37:47'),
(58, 93, 38, 38, 1.0000, 0.0000, 0.4200, 0.4200, 'fixed', 0.0000, 0.4200, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-22 04:51:52', '2021-06-22 08:40:27'),
(59, 94, 31, 31, 1.0000, 0.0000, 20000.0000, 20000.0000, 'fixed', 0.0000, 20000.0000, 0.0000, NULL, NULL, NULL, 'Subject: Water Leakage From 8 Nos Cylinder.\r\n\r\nDate: 15/05/2021;\r\nEngine Serial No: 2214257;\r\nEngine Running H: 16904;', NULL, NULL, NULL, '', NULL, '2021-06-22 08:58:12', '2021-06-22 09:07:03'),
(60, 95, 31, 31, 1.0000, 0.0000, 20000.0000, 20000.0000, 'fixed', 0.0000, 20000.0000, 0.0000, NULL, NULL, NULL, 'Subject: Water Leakage From A1, A5, A8, B5 & B7 Cylinder Head.\r\nDate: 16/05/2021;\r\nEngine Serial No: 2214289;\r\nEngine Running H: 14445', NULL, NULL, NULL, '', NULL, '2021-06-22 09:02:08', '2021-06-22 09:07:23'),
(61, 96, 31, 31, 1.0000, 0.0000, 10000.0000, 10000.0000, 'fixed', 0.0000, 10000.0000, 0.0000, NULL, NULL, NULL, 'Subject: A2 & B8 Cylinder Tapped Change.\r\nDate: 22/05/2021;\r\nEngine Serial No: 2214255;\r\nEngine Running H: 16686.', NULL, NULL, NULL, '', NULL, '2021-06-22 09:05:54', '2021-06-22 09:06:37'),
(62, 97, 31, 31, 1.0000, 0.0000, 6000.0000, 6000.0000, 'fixed', 0.0000, 6000.0000, 0.0000, NULL, NULL, NULL, 'Subject: Generator Voltage Down, Not Increase.\r\nDate: 28/05/2021;\r\nEngine Serial No: 2214299;\r\nEngine Running Hour: 11316', NULL, NULL, NULL, '', NULL, '2021-06-22 09:11:08', '2021-06-22 09:11:08'),
(63, 98, 31, 31, 1.0000, 0.0000, 6000.0000, 6000.0000, 'fixed', 0.0000, 6000.0000, 0.0000, NULL, NULL, NULL, 'Subject: E-40 Schedule Maintenance;\r\nDate: 04/06/2021;\r\nEngine Serial No: 2214246;\r\nEngine Running H: 18207.', NULL, NULL, NULL, '', NULL, '2021-06-22 09:14:03', '2021-06-22 09:14:03'),
(64, 99, 31, 31, 1.0000, 0.0000, 6000.0000, 6000.0000, 'fixed', 0.0000, 6000.0000, 0.0000, NULL, NULL, NULL, 'Subject: Suddenly Engine Tripped Due to Actuator Current High.\r\nDate: 07/06/2021;\r\nEngine Serial No: 2214289;\r\nEngine Running H: 14892', NULL, NULL, NULL, '', NULL, '2021-06-22 09:16:53', '2021-06-22 09:16:53'),
(65, 100, 31, 31, 1.0000, 0.0000, 15000.0000, 15000.0000, 'fixed', 0.0000, 15000.0000, 0.0000, NULL, NULL, NULL, 'Subject: Camp Shaft Check;\r\nDate: 11/06/2021;\r\nEngine Serial No: 2214255;\r\nEngine Running Hour: 17152.', NULL, NULL, NULL, '', NULL, '2021-06-22 09:19:56', '2021-06-22 09:19:56'),
(66, 101, 3, 3, 16.0000, 0.0000, 9500.0000, 9500.0000, 'fixed', 0.0000, 9500.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-22 09:31:30', '2021-06-23 02:56:47'),
(67, 105, 40, 40, 12.0000, 0.0000, 3250.0000, 3250.0000, 'fixed', 0.0000, 3250.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-22 12:19:16', '2021-06-22 12:19:16'),
(68, 106, 38, 38, 12.0000, 0.0000, 10500.0000, 10500.0000, 'fixed', 0.0000, 10500.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-22 13:09:17', '2021-06-22 13:48:37'),
(70, 108, 38, 38, 12.0000, 0.0000, 10500.0000, 10500.0000, 'fixed', 0.0000, 10500.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-22 13:39:00', '2021-06-22 13:39:00'),
(71, 109, 31, 31, 1.0000, 0.0000, 10000.0000, 10000.0000, 'fixed', 0.0000, 10000.0000, 0.0000, NULL, NULL, NULL, 'Subject: A & B Side Camshaft & Tapped Check.;\r\nDate: 18/06/2021\r\nEng. Model: CG-170-16;\r\nS/L No: 2214257;\r\nRunning H: 17605;', NULL, NULL, NULL, '', NULL, '2021-06-22 15:15:48', '2021-06-23 02:53:30'),
(74, 111, 7, 7, 16.0000, 0.0000, 7500.0000, 7500.0000, 'fixed', 0.0000, 7500.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-22 15:48:17', '2021-06-25 10:39:16'),
(75, 111, 6, 6, 4.0000, 0.0000, 1800.0000, 1800.0000, 'fixed', 0.0000, 1800.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-22 15:48:17', '2021-06-25 10:39:16'),
(76, 112, 34, 34, 1.0000, 0.0000, 45000.0000, 45000.0000, 'fixed', 0.0000, 45000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-22 15:53:53', '2021-06-25 10:14:18'),
(77, 116, 46, 46, 1.0000, 0.0000, 4000.0000, 4000.0000, 'fixed', 0.0000, 4000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-23 07:35:38', '2021-06-25 10:29:21'),
(78, 116, 47, 47, 1.0000, 0.0000, 4700.0000, 4700.0000, 'fixed', 0.0000, 4700.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-23 07:35:38', '2021-06-25 10:29:21'),
(88, 131, 55, 55, 1.0000, 0.0000, 450000.0000, 450000.0000, 'fixed', 0.0000, 450000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-25 09:46:34', '2021-06-25 10:07:35'),
(89, 132, 49, 49, 1.0000, 0.0000, 45000.0000, 45000.0000, 'fixed', 0.0000, 45000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-25 09:57:28', '2021-07-03 04:31:41'),
(90, 132, 50, 50, 3.0000, 0.0000, 1800.0000, 1800.0000, 'fixed', 0.0000, 1800.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-25 09:57:28', '2021-07-03 04:31:41'),
(91, 132, 51, 51, 1.0000, 1.0000, 52000.0000, 52000.0000, 'fixed', 0.0000, 52000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-25 09:57:28', '2021-07-03 04:31:41'),
(92, 132, 52, 52, 1.0000, 0.0000, 4000.0000, 4000.0000, 'fixed', 0.0000, 4000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-25 09:57:28', '2021-07-03 04:31:41'),
(93, 132, 53, 53, 1.0000, 0.0000, 4000.0000, 4000.0000, 'fixed', 0.0000, 4000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-25 09:57:28', '2021-07-03 04:31:41'),
(94, 132, 54, 54, 4.0000, 0.0000, 1000.0000, 1000.0000, 'fixed', 0.0000, 1000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-25 09:57:28', '2021-07-03 04:31:41'),
(95, 132, 15, 15, 2.0000, 0.0000, 250.0000, 250.0000, 'fixed', 0.0000, 250.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-25 09:57:28', '2021-07-03 04:31:41'),
(103, 135, 27, 27, 6.0000, 0.0000, 9000.0000, 9000.0000, 'fixed', 0.0000, 9000.0000, 0.0000, NULL, NULL, NULL, 'Ready stock', NULL, NULL, NULL, '', NULL, '2021-06-26 05:51:54', '2021-06-26 05:51:54'),
(104, 135, 7, 7, 12.0000, 0.0000, 4500.0000, 4500.0000, 'fixed', 0.0000, 4500.0000, 0.0000, NULL, NULL, NULL, 'Ready stock', NULL, NULL, NULL, '', NULL, '2021-06-26 05:51:54', '2021-06-26 05:51:54'),
(105, 135, 6, 6, 3.0000, 0.0000, 900.0000, 900.0000, 'fixed', 0.0000, 900.0000, 0.0000, NULL, NULL, NULL, 'Ready stock', NULL, NULL, NULL, '', NULL, '2021-06-26 05:51:54', '2021-06-26 05:51:54'),
(106, 136, 51, 51, 1.0000, 0.0000, 52000.0000, 52000.0000, 'fixed', 0.0000, 52000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-26 11:44:06', '2021-06-26 11:45:36'),
(114, 139, 3, 3, 52.0000, 0.0000, 8900.0000, 8900.0000, 'fixed', 0.0000, 8900.0000, 0.0000, NULL, NULL, NULL, 'Ready Stock', NULL, NULL, NULL, '', NULL, '2021-06-27 06:28:51', '2021-06-27 06:28:51'),
(115, 139, 27, 27, 9.0000, 0.0000, 8500.0000, 8500.0000, 'fixed', 0.0000, 8500.0000, 0.0000, NULL, NULL, NULL, 'Ready Stock', NULL, NULL, NULL, '', NULL, '2021-06-27 06:28:51', '2021-06-27 06:28:51'),
(116, 139, 7, 7, 28.0000, 0.0000, 4500.0000, 4500.0000, 'fixed', 0.0000, 4500.0000, 0.0000, NULL, NULL, NULL, 'Ready Stock', NULL, NULL, NULL, '', NULL, '2021-06-27 06:28:51', '2021-06-27 06:28:51'),
(117, 139, 2, 2, 60.0000, 0.0000, 23000.0000, 23000.0000, 'fixed', 0.0000, 23000.0000, 0.0000, NULL, NULL, NULL, '15pcs Ready Stock. 45pcs need two weeks.', NULL, NULL, NULL, '', NULL, '2021-06-27 06:28:51', '2021-06-27 06:28:51'),
(118, 139, 34, 34, 5.0000, 0.0000, 15000.0000, 15000.0000, 'fixed', 0.0000, 15000.0000, 0.0000, NULL, NULL, NULL, 'Ready Stock', NULL, NULL, NULL, '', NULL, '2021-06-27 06:28:51', '2021-06-27 06:28:51'),
(119, 139, 35, 35, 1.0000, 0.0000, 42500.0000, 42500.0000, 'fixed', 0.0000, 42500.0000, 0.0000, NULL, NULL, NULL, 'Ready Stock', NULL, NULL, NULL, '', NULL, '2021-06-27 06:28:51', '2021-06-27 06:28:51'),
(120, 139, 56, 56, 2.0000, 0.0000, 14500.0000, 14500.0000, 'fixed', 0.0000, 14500.0000, 0.0000, NULL, NULL, NULL, 'Ready Stock', NULL, NULL, NULL, '', NULL, '2021-06-27 06:28:51', '2021-06-27 06:28:51'),
(122, 141, 39, 39, 1.0000, 0.0000, 480000.0000, 480000.0000, 'fixed', 0.0000, 480000.0000, 0.0000, NULL, NULL, NULL, '2-3 weeks', NULL, NULL, NULL, '', NULL, '2021-06-27 09:25:40', '2021-06-27 09:25:40'),
(123, 142, 38, 38, 6.0000, 0.0000, 8000.0000, 8000.0000, 'fixed', 0.0000, 8000.0000, 0.0000, NULL, NULL, NULL, 'Ready stock', NULL, NULL, NULL, '', NULL, '2021-06-27 09:30:31', '2021-06-27 09:30:31'),
(124, 143, 2, 2, 16.0000, 0.0000, 36500.0000, 36500.0000, 'fixed', 0.0000, 36500.0000, 0.0000, NULL, NULL, NULL, '8 pcs ready stock other 8 pcs need 2 week', NULL, NULL, NULL, '', NULL, '2021-06-27 09:39:04', '2021-06-27 09:39:04'),
(125, 144, 57, 57, 16.0000, 0.0000, 8137.5000, 8137.5000, 'fixed', 0.0000, 8137.5000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-28 03:48:19', '2021-07-03 04:20:15'),
(126, 144, 58, 58, 10.0000, 0.0000, 945.0000, 945.0000, 'fixed', 0.0000, 945.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-28 03:48:19', '2021-07-03 04:20:15'),
(131, 146, 27, 27, 6.0000, 0.0000, 8000.0000, 8000.0000, 'fixed', 0.0000, 8000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-28 11:21:24', '2021-06-28 11:21:24'),
(135, 148, 27, 27, 6.0000, 0.0000, 9000.0000, 9000.0000, 'fixed', 0.0000, 9000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-29 03:32:29', '2021-06-29 03:32:29'),
(136, 148, 7, 7, 12.0000, 0.0000, 4500.0000, 4500.0000, 'fixed', 0.0000, 4500.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-29 03:32:29', '2021-06-29 03:32:29'),
(137, 148, 6, 6, 3.0000, 0.0000, 900.0000, 900.0000, 'fixed', 0.0000, 900.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-29 03:32:29', '2021-06-29 03:32:29'),
(138, 149, 34, 34, 2.0000, 0.0000, 45000.0000, 45000.0000, 'fixed', 0.0000, 45000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-30 04:10:57', '2021-06-30 04:10:57'),
(139, 150, 27, 27, 4.0000, 0.0000, 8670.0000, 8670.0000, 'fixed', 0.0000, 8670.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-30 06:36:07', '2021-06-30 06:36:07'),
(140, 151, 2, 2, 2.0000, 0.0000, 23000.0000, 23000.0000, 'fixed', 0.0000, 23000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-06-30 12:42:31', '2021-07-01 10:14:04'),
(147, 154, 27, 27, 2.0000, 0.0000, 9000.0000, 9000.0000, 'fixed', 0.0000, 9000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-07-01 08:54:09', '2021-07-04 11:14:58'),
(148, 154, 7, 7, 4.0000, 0.0000, 4000.0000, 4000.0000, 'fixed', 0.0000, 4000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-07-01 08:54:09', '2021-07-04 11:14:58'),
(149, 154, 6, 6, 1.0000, 0.0000, 800.0000, 800.0000, 'fixed', 0.0000, 800.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-07-01 08:54:09', '2021-07-04 11:14:58'),
(151, 156, 2, 2, 1.0000, 0.0000, 38000.0000, 38000.0000, 'fixed', 0.0000, 38000.0000, 0.0000, NULL, NULL, NULL, 'Original\r\n**Sample- Returnable**', NULL, NULL, NULL, '', NULL, '2021-07-01 10:22:54', '2021-07-01 10:24:32'),
(152, 157, 64, 64, 1.0000, 0.0000, 40000.0000, 40000.0000, 'fixed', 0.0000, 40000.0000, 0.0000, NULL, NULL, NULL, 'Ready Stock', NULL, NULL, NULL, '', NULL, '2021-07-01 10:35:36', '2021-07-01 10:36:14'),
(153, 158, 63, 63, 1.0000, 0.0000, 400000.0000, 400000.0000, 'fixed', 0.0000, 400000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-07-01 11:01:46', '2021-07-01 11:59:24'),
(156, 161, 27, 27, 2.0000, 0.0000, 10000.0000, 10000.0000, 'fixed', 0.0000, 10000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-07-01 11:37:51', '2021-07-04 12:10:50'),
(158, 164, 65, 65, 1.0000, 0.0000, 200000.0000, 200000.0000, 'fixed', 0.0000, 200000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-07-03 04:23:19', '2021-07-03 04:23:19'),
(159, 173, 27, 27, 2.0000, 0.0000, 9000.0000, 9000.0000, 'fixed', 0.0000, 9000.0000, 0.0000, NULL, NULL, NULL, 'Ready Stock', NULL, NULL, NULL, '', NULL, '2021-07-04 05:15:12', '2021-07-04 05:15:12'),
(160, 173, 6, 6, 1.0000, 0.0000, 800.0000, 800.0000, 'fixed', 0.0000, 800.0000, 0.0000, NULL, NULL, NULL, 'Ready Stock', NULL, NULL, NULL, '', NULL, '2021-07-04 05:15:12', '2021-07-04 05:15:12'),
(161, 173, 7, 7, 4.0000, 0.0000, 4175.0000, 4175.0000, 'fixed', 0.0000, 4175.0000, 0.0000, NULL, NULL, NULL, 'Ready Stock', NULL, NULL, NULL, '', NULL, '2021-07-04 05:15:12', '2021-07-04 05:15:12'),
(162, 174, 1, 1, 1.0000, 0.0000, 150000.0000, 150000.0000, 'fixed', 0.0000, 150000.0000, 0.0000, NULL, NULL, NULL, 'Prime Power: 30 KVA \r\nRecondition', NULL, NULL, NULL, '', NULL, '2021-07-04 07:45:42', '2021-07-04 07:45:42'),
(163, 177, 7, 7, 4.0000, 0.0000, 5000.0000, 5000.0000, 'fixed', 0.0000, 5000.0000, 0.0000, NULL, NULL, NULL, 'Ready Stock', NULL, NULL, NULL, '', NULL, '2021-07-04 08:55:29', '2021-07-04 08:55:29'),
(164, 177, 6, 6, 1.0000, 0.0000, 1000.0000, 1000.0000, 'fixed', 0.0000, 1000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-07-04 08:55:29', '2021-07-04 08:55:29'),
(167, 179, 12, 12, 2.0000, 0.0000, 16100.0000, 16100.0000, 'fixed', 0.0000, 16100.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-07-04 10:05:02', '2021-07-04 10:05:02'),
(168, 179, 69, 69, 4.0000, 0.0000, 1650.0000, 1650.0000, 'fixed', 0.0000, 1650.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-07-04 10:05:02', '2021-07-04 10:05:02'),
(169, 182, 70, 70, 2.0000, 0.0000, 18000.0000, 18000.0000, 'fixed', 0.0000, 18000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-07-04 10:35:36', '2021-07-04 10:53:42'),
(170, 183, 71, 71, 1.0000, 0.0000, 25000.0000, 25000.0000, 'fixed', 0.0000, 25000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-07-04 10:46:00', '2021-07-04 11:07:24'),
(171, 185, 27, 27, 2.0000, 0.0000, 8500.0000, 8500.0000, 'fixed', 0.0000, 8500.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-07-04 11:00:04', '2021-07-04 11:00:04'),
(172, 186, 27, 27, 1.0000, 0.0000, 8500.0000, 8500.0000, 'fixed', 0.0000, 8500.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-07-04 11:04:03', '2021-07-04 11:04:03'),
(173, 187, 27, 27, 1.0000, 0.0000, 8500.0000, 8500.0000, 'fixed', 0.0000, 8500.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-07-04 11:06:25', '2021-07-04 11:06:25'),
(174, 188, 27, 27, 2.0000, 0.0000, 7000.0000, 7000.0000, 'fixed', 0.0000, 7000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-07-04 11:08:31', '2021-07-04 11:08:31'),
(175, 189, 27, 27, 1.0000, 0.0000, 8500.0000, 8500.0000, 'fixed', 0.0000, 8500.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-07-04 11:18:15', '2021-07-04 11:18:15'),
(176, 190, 7, 7, 4.0000, 0.0000, 4000.0000, 4000.0000, 'fixed', 0.0000, 4000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-07-04 11:19:54', '2021-07-04 11:19:54'),
(178, 193, 72, 72, 1.0000, 0.0000, 25000.0000, 25000.0000, 'fixed', 0.0000, 25000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-07-04 11:25:55', '2021-07-04 11:25:55'),
(183, 200, 2, 2, 14.0000, 0.0000, 32500.0000, 32500.0000, 'fixed', 0.0000, 32500.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-07-05 11:18:26', '2021-07-05 11:18:26'),
(184, 200, 7, 7, 4.0000, 0.0000, 2800.0000, 2800.0000, 'fixed', 0.0000, 2800.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-07-05 11:18:26', '2021-07-05 11:18:26'),
(189, 203, 77, 77, 1.0000, 0.0000, 20000.0000, 20000.0000, 'fixed', 0.0000, 20000.0000, 0.0000, NULL, NULL, NULL, '**Repair Charge**', NULL, NULL, NULL, '', NULL, '2021-07-05 11:47:44', '2021-07-05 11:47:44'),
(190, 204, 73, 73, 1.0000, 0.0000, 3500.0000, 3500.0000, 'fixed', 0.0000, 3500.0000, 0.0000, NULL, NULL, NULL, 'Ready Stock', NULL, NULL, NULL, '', NULL, '2021-07-05 11:58:29', '2021-07-05 11:58:29'),
(191, 204, 74, 74, 2.0000, 0.0000, 3000.0000, 3000.0000, 'fixed', 0.0000, 3000.0000, 0.0000, NULL, NULL, NULL, 'Ready Stock', NULL, NULL, NULL, '', NULL, '2021-07-05 11:58:29', '2021-07-05 11:58:29'),
(192, 204, 75, 75, 1.0000, 0.0000, 8700.0000, 8700.0000, 'fixed', 0.0000, 8700.0000, 0.0000, NULL, NULL, NULL, 'Ready Stock', NULL, NULL, NULL, '', NULL, '2021-07-05 11:58:29', '2021-07-05 11:58:29'),
(193, 204, 76, 76, 80.0000, 0.0000, 410.0000, 410.0000, 'fixed', 0.0000, 410.0000, 0.0000, NULL, NULL, NULL, 'Ready Stock', NULL, NULL, NULL, '', NULL, '2021-07-05 11:58:29', '2021-07-05 11:58:29'),
(194, 206, 56, 56, 1.0000, 0.0000, 15000.0000, 15000.0000, 'fixed', 0.0000, 15000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-07-05 12:08:47', '2021-07-05 12:08:47'),
(195, 206, 78, 78, 1.0000, 0.0000, 500.0000, 500.0000, 'fixed', 0.0000, 500.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-07-05 12:08:47', '2021-07-05 12:08:47'),
(196, 207, 27, 27, 2.0000, 0.0000, 8000.0000, 8000.0000, 'fixed', 0.0000, 8000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-07-05 12:12:46', '2021-07-05 12:12:46'),
(197, 209, 79, 79, 1.0000, 0.0000, 110000.0000, 110000.0000, 'fixed', 0.0000, 110000.0000, 0.0000, NULL, NULL, NULL, '', NULL, NULL, NULL, '', NULL, '2021-07-05 12:22:31', '2021-07-05 12:25:23'),
(198, 210, 80, 80, 40.0000, 0.0000, 1000.0000, 1000.0000, 'fixed', 0.0000, 1000.0000, 0.0000, NULL, NULL, NULL, 'Ready Stock', NULL, NULL, NULL, '', NULL, '2021-07-06 10:13:18', '2021-07-06 10:13:18'),
(199, 210, 81, 81, 40.0000, 0.0000, 1200.0000, 1200.0000, 'fixed', 0.0000, 1200.0000, 0.0000, NULL, NULL, NULL, 'Ready stock', NULL, NULL, NULL, '', NULL, '2021-07-06 10:13:18', '2021-07-06 10:13:18'),
(200, 210, 82, 82, 8.0000, 0.0000, 4500.0000, 4500.0000, 'fixed', 0.0000, 4500.0000, 0.0000, NULL, NULL, NULL, 'Ready stock', NULL, NULL, NULL, '', NULL, '2021-07-06 10:13:18', '2021-07-06 10:13:18'),
(201, 212, 31, 31, 1.0000, 0.0000, 30000.0000, 30000.0000, 'fixed', 0.0000, 30000.0000, 0.0000, NULL, NULL, NULL, 'BATTERY CHARGER REPAIR', NULL, NULL, NULL, '', NULL, '2021-07-06 11:09:24', '2021-07-06 11:09:24');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_sell_lines_purchase_lines`
--

CREATE TABLE `transaction_sell_lines_purchase_lines` (
  `id` int(10) UNSIGNED NOT NULL,
  `sell_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from transaction_sell_lines',
  `stock_adjustment_line_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'id from stock_adjustment_lines',
  `purchase_line_id` int(10) UNSIGNED NOT NULL COMMENT 'id from purchase_lines',
  `quantity` decimal(22,4) NOT NULL,
  `qty_returned` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_sell_lines_purchase_lines`
--

INSERT INTO `transaction_sell_lines_purchase_lines` (`id`, `sell_line_id`, `stock_adjustment_line_id`, `purchase_line_id`, `quantity`, `qty_returned`, `created_at`, `updated_at`) VALUES
(1, 7, NULL, 4, 4.0000, 0.0000, '2021-05-11 04:28:15', '2021-05-11 04:28:15'),
(2, 8, NULL, 7, 19.0000, 0.0000, '2021-05-11 05:51:57', '2021-05-11 05:51:57'),
(3, 9, NULL, 9, 4.0000, 0.0000, '2021-05-11 09:34:48', '2021-05-11 09:34:48'),
(4, 10, NULL, 0, 1.0000, 0.0000, '2021-05-12 05:30:09', '2021-05-12 05:30:09'),
(5, 10, NULL, 0, 1.0000, 0.0000, '2021-05-12 05:42:34', '2021-05-12 05:42:34'),
(6, 12, NULL, 9, 4.0000, 0.0000, '2021-05-27 03:04:56', '2021-05-27 03:04:56'),
(7, 13, NULL, 0, 1.0000, 0.0000, '2021-05-27 03:04:56', '2021-05-27 03:04:56'),
(8, 14, NULL, 1, 2.0000, 0.0000, '2021-05-27 03:04:56', '2021-05-27 03:04:56'),
(9, 15, NULL, 0, 2.0000, 0.0000, '2021-05-27 03:04:56', '2021-05-27 03:04:56'),
(10, 16, NULL, 1, 14.0000, 0.0000, '2021-05-27 06:54:12', '2021-07-04 07:51:57'),
(11, 17, NULL, 25, 4.0000, 0.0000, '2021-05-27 08:56:13', '2021-05-27 08:56:13'),
(12, 18, NULL, 26, 2.0000, 0.0000, '2021-05-27 13:20:51', '2021-05-27 13:20:51'),
(13, 19, NULL, 9, 2.0000, 0.0000, '2021-05-27 13:20:51', '2021-05-27 13:20:51'),
(17, 13, NULL, 0, 1.0000, 0.0000, '2021-06-10 11:38:43', '2021-06-10 11:38:43'),
(18, 15, NULL, 0, 2.0000, 0.0000, '2021-06-10 11:38:43', '2021-06-10 11:38:43'),
(149, 34, NULL, 0, 1.0000, 0.0000, '2021-06-20 09:08:40', '2021-06-20 09:08:40'),
(248, 41, NULL, 0, 1.0000, 0.0000, '2021-06-21 04:29:28', '2021-06-21 04:29:28'),
(314, 42, NULL, 36, 1.0000, 0.0000, '2021-06-21 06:39:40', '2021-06-21 06:39:40'),
(315, 43, NULL, 35, 1.0000, 0.0000, '2021-06-21 06:39:40', '2021-06-21 06:39:40'),
(316, 44, NULL, 33, 1.0000, 0.0000, '2021-06-21 06:39:40', '2021-06-21 06:39:40'),
(317, 45, NULL, 34, 1.0000, 0.0000, '2021-06-21 06:39:40', '2021-06-21 06:39:40'),
(330, 51, NULL, 0, 1.0000, 0.0000, '2021-06-22 03:39:49', '2021-06-22 03:39:49'),
(331, 52, NULL, 0, 1.0000, 0.0000, '2021-06-22 03:42:43', '2021-06-22 03:42:43'),
(332, 53, NULL, 0, 1.0000, 0.0000, '2021-06-22 03:44:08', '2021-06-22 03:44:08'),
(334, 55, NULL, 1, 1.0000, 0.0000, '2021-06-22 04:14:56', '2021-06-22 04:14:56'),
(335, 55, NULL, 28, 3.0000, 0.0000, '2021-06-22 04:14:56', '2021-06-22 04:14:56'),
(336, 55, NULL, 0, 2.0000, 0.0000, '2021-06-22 04:14:56', '2021-06-22 04:14:56'),
(337, 55, NULL, 0, 6.0000, 0.0000, '2021-06-22 04:15:21', '2021-06-22 04:15:21'),
(370, 56, NULL, 42, 1.0000, 0.0000, '2021-06-22 04:28:35', '2021-06-23 07:39:48'),
(373, 58, NULL, 30, 1.0000, 0.0000, '2021-06-22 04:51:52', '2021-06-22 04:51:52'),
(374, 53, NULL, 0, 1.0000, 0.0000, '2021-06-22 04:59:26', '2021-06-22 04:59:26'),
(375, 53, NULL, 0, 1.0000, 0.0000, '2021-06-22 04:59:52', '2021-06-22 04:59:52'),
(376, 53, NULL, 0, 1.0000, 0.0000, '2021-06-22 04:59:52', '2021-06-22 04:59:52'),
(763, 53, NULL, 0, 1.0000, 0.0000, '2021-06-22 08:50:18', '2021-06-22 08:50:18'),
(764, 53, NULL, 0, 1.0000, 0.0000, '2021-06-22 08:50:18', '2021-06-22 08:50:18'),
(765, 53, NULL, 0, 1.0000, 0.0000, '2021-06-22 08:50:18', '2021-06-22 08:50:18'),
(766, 53, NULL, 0, 1.0000, 0.0000, '2021-06-22 08:50:18', '2021-06-22 08:50:18'),
(767, 52, NULL, 0, 1.0000, 0.0000, '2021-06-22 08:50:38', '2021-06-22 08:50:38'),
(768, 51, NULL, 0, 1.0000, 0.0000, '2021-06-22 08:51:12', '2021-06-22 08:51:12'),
(1281, 59, NULL, 0, 1.0000, 0.0000, '2021-06-22 08:58:12', '2021-06-22 08:58:12'),
(1282, 60, NULL, 0, 1.0000, 0.0000, '2021-06-22 09:02:08', '2021-06-22 09:02:08'),
(1283, 61, NULL, 0, 1.0000, 0.0000, '2021-06-22 09:05:54', '2021-06-22 09:05:54'),
(1284, 61, NULL, 0, 1.0000, 0.0000, '2021-06-22 09:06:37', '2021-06-22 09:06:37'),
(1285, 59, NULL, 0, 1.0000, 0.0000, '2021-06-22 09:07:03', '2021-06-22 09:07:03'),
(1286, 60, NULL, 0, 1.0000, 0.0000, '2021-06-22 09:07:23', '2021-06-22 09:07:23'),
(1287, 62, NULL, 0, 1.0000, 0.0000, '2021-06-22 09:11:08', '2021-06-22 09:11:08'),
(1288, 63, NULL, 0, 1.0000, 0.0000, '2021-06-22 09:14:03', '2021-06-22 09:14:03'),
(1289, 64, NULL, 0, 1.0000, 0.0000, '2021-06-22 09:16:53', '2021-06-22 09:16:53'),
(1290, 65, NULL, 0, 1.0000, 0.0000, '2021-06-22 09:19:56', '2021-06-22 09:19:56'),
(1291, 66, NULL, 0, 16.0000, 0.0000, '2021-06-22 09:31:30', '2021-06-22 09:31:30'),
(1292, 66, NULL, 0, 16.0000, 0.0000, '2021-06-22 12:00:04', '2021-06-22 12:00:04'),
(1293, 67, NULL, 32, 4.0000, 0.0000, '2021-06-22 12:19:16', '2021-06-22 12:19:16'),
(1294, 67, NULL, 37, 7.0000, 0.0000, '2021-06-22 12:19:16', '2021-06-22 12:19:16'),
(1295, 67, NULL, 64, 1.0000, 0.0000, '2021-06-22 12:19:16', '2021-07-03 06:48:57'),
(1296, 68, NULL, 30, 6.0000, 0.0000, '2021-06-22 13:09:17', '2021-06-22 13:09:17'),
(1297, 68, NULL, 0, 6.0000, 0.0000, '2021-06-22 13:09:17', '2021-06-22 13:09:17'),
(1299, 70, NULL, 0, 12.0000, 0.0000, '2021-06-22 13:39:00', '2021-06-22 13:39:00'),
(1300, 68, NULL, 0, 12.0000, 0.0000, '2021-06-22 13:48:37', '2021-06-22 13:48:37'),
(1301, 71, NULL, 38, 1.0000, 0.0000, '2021-06-22 15:15:48', '2021-06-22 15:15:48'),
(1305, 74, NULL, 9, 16.0000, 0.0000, '2021-06-22 15:48:17', '2021-06-22 15:48:17'),
(1306, 75, NULL, 0, 4.0000, 0.0000, '2021-06-22 15:48:17', '2021-06-22 15:48:17'),
(1307, 76, NULL, 0, 1.0000, 0.0000, '2021-06-22 15:53:53', '2021-06-22 15:53:53'),
(1308, 66, NULL, 0, 16.0000, 0.0000, '2021-06-23 02:52:00', '2021-06-23 02:52:00'),
(1309, 66, NULL, 0, 16.0000, 0.0000, '2021-06-23 02:52:00', '2021-06-23 02:52:00'),
(1310, 66, NULL, 0, 16.0000, 0.0000, '2021-06-23 02:56:47', '2021-06-23 02:56:47'),
(1311, 66, NULL, 0, 16.0000, 0.0000, '2021-06-23 02:56:47', '2021-06-23 02:56:47'),
(1312, 66, NULL, 0, 16.0000, 0.0000, '2021-06-23 02:56:47', '2021-06-23 02:56:47'),
(1313, 66, NULL, 0, 16.0000, 0.0000, '2021-06-23 02:56:47', '2021-06-23 02:56:47'),
(1314, 77, NULL, 40, 1.0000, 0.0000, '2021-06-23 07:35:38', '2021-06-23 07:35:38'),
(1315, 78, NULL, 41, 1.0000, 0.0000, '2021-06-23 07:35:38', '2021-06-23 07:35:38'),
(1318, 88, NULL, 50, 1.0000, 0.0000, '2021-06-25 09:46:34', '2021-06-25 09:46:34'),
(1319, 89, NULL, 44, 1.0000, 0.0000, '2021-06-25 09:57:28', '2021-06-25 09:57:28'),
(1320, 90, NULL, 45, 3.0000, 0.0000, '2021-06-25 09:57:28', '2021-06-25 09:57:28'),
(1321, 91, NULL, 46, 1.0000, 1.0000, '2021-06-25 09:57:28', '2021-07-03 04:28:36'),
(1322, 92, NULL, 47, 1.0000, 0.0000, '2021-06-25 09:57:28', '2021-06-25 09:57:28'),
(1323, 93, NULL, 48, 1.0000, 0.0000, '2021-06-25 09:57:28', '2021-06-25 09:57:28'),
(1324, 94, NULL, 49, 4.0000, 0.0000, '2021-06-25 09:57:28', '2021-06-25 09:57:28'),
(1325, 95, NULL, 0, 2.0000, 0.0000, '2021-06-25 09:57:28', '2021-06-25 09:57:28'),
(1330, 76, NULL, 0, 1.0000, 0.0000, '2021-06-25 10:14:18', '2021-06-25 10:14:18'),
(1331, 34, NULL, 38, 1.0000, 0.0000, '2021-06-25 10:14:50', '2021-06-25 10:14:50'),
(1332, 95, NULL, 0, 2.0000, 0.0000, '2021-06-25 10:17:09', '2021-06-25 10:17:09'),
(1333, 75, NULL, 0, 4.0000, 0.0000, '2021-06-25 10:39:16', '2021-06-25 10:39:16'),
(1334, 40, NULL, 31, 1.0000, 0.0000, '2021-06-26 03:32:47', '2021-06-26 03:32:47'),
(1335, 95, NULL, 0, 2.0000, 0.0000, '2021-06-26 03:57:31', '2021-06-26 03:57:31'),
(1336, 95, NULL, 0, 2.0000, 0.0000, '2021-06-26 03:57:31', '2021-06-26 03:57:31'),
(1337, 106, NULL, 0, 1.0000, 0.0000, '2021-06-26 11:44:06', '2021-06-26 11:44:06'),
(1338, 106, NULL, 0, 1.0000, 0.0000, '2021-06-26 11:45:36', '2021-06-26 11:45:36'),
(1339, 125, NULL, 55, 16.0000, 0.0000, '2021-06-28 03:48:19', '2021-07-03 04:18:24'),
(1340, 126, NULL, 53, 10.0000, 0.0000, '2021-06-28 03:48:19', '2021-07-03 04:18:24'),
(1341, 127, NULL, 0, 48.0000, 0.0000, '2021-06-28 03:48:19', '2021-06-28 03:48:19'),
(1342, 128, NULL, 0, 12.0000, 0.0000, '2021-06-28 03:48:19', '2021-06-28 03:48:19'),
(1343, 129, NULL, 0, 4.0000, 0.0000, '2021-06-28 03:48:19', '2021-06-28 03:48:19'),
(1346, 127, NULL, 0, 48.0000, 0.0000, '2021-06-28 04:02:06', '2021-06-28 04:02:06'),
(1347, 128, NULL, 0, 12.0000, 0.0000, '2021-06-28 04:02:06', '2021-06-28 04:02:06'),
(1348, 129, NULL, 0, 4.0000, 0.0000, '2021-06-28 04:02:06', '2021-06-28 04:02:06'),
(1478, 41, NULL, 38, 1.0000, 0.0000, '2021-06-28 04:20:34', '2021-06-28 04:20:34'),
(1481, 131, NULL, 26, 5.0000, 0.0000, '2021-06-28 11:21:24', '2021-06-28 11:21:24'),
(1482, 131, NULL, 63, 1.0000, 0.0000, '2021-06-28 11:21:24', '2021-07-03 06:36:45'),
(1485, 51, NULL, 38, 1.0000, 0.0000, '2021-06-28 11:30:21', '2021-06-28 11:30:21'),
(1486, 51, NULL, 38, 1.0000, 0.0000, '2021-06-28 11:30:21', '2021-06-28 11:30:21'),
(1490, 135, NULL, 63, 1.0000, 0.0000, '2021-06-29 03:32:29', '2021-07-03 06:36:45'),
(1491, 136, NULL, 9, 12.0000, 0.0000, '2021-06-29 03:32:29', '2021-06-29 03:32:29'),
(1492, 137, NULL, 0, 3.0000, 0.0000, '2021-06-29 03:32:29', '2021-06-29 03:32:29'),
(1493, 138, NULL, 0, 2.0000, 0.0000, '2021-06-30 04:10:57', '2021-06-30 04:10:57'),
(1494, 139, NULL, 0, 4.0000, 0.0000, '2021-06-30 06:36:07', '2021-06-30 06:36:07'),
(1495, 140, NULL, 0, 2.0000, 0.0000, '2021-06-30 12:42:31', '2021-06-30 12:42:31'),
(1496, 140, NULL, 0, 2.0000, 0.0000, '2021-07-01 03:08:49', '2021-07-01 03:08:49'),
(1497, 147, NULL, 0, 2.0000, 0.0000, '2021-07-01 08:54:09', '2021-07-01 08:54:09'),
(1498, 148, NULL, 9, 4.0000, 0.0000, '2021-07-01 08:54:09', '2021-07-01 08:54:09'),
(1499, 149, NULL, 0, 1.0000, 0.0000, '2021-07-01 08:54:09', '2021-07-01 08:54:09'),
(1504, 140, NULL, 0, 2.0000, 0.0000, '2021-07-01 10:14:04', '2021-07-01 10:14:04'),
(1505, 140, NULL, 0, 2.0000, 0.0000, '2021-07-01 10:14:04', '2021-07-01 10:14:04'),
(1534, 151, NULL, 0, 1.0000, 0.0000, '2021-07-01 10:22:54', '2021-07-01 10:22:54'),
(1535, 151, NULL, 0, 1.0000, 0.0000, '2021-07-01 10:23:32', '2021-07-01 10:23:32'),
(1536, 151, NULL, 0, 1.0000, 0.0000, '2021-07-01 10:24:32', '2021-07-01 10:24:32'),
(1537, 151, NULL, 0, 1.0000, 0.0000, '2021-07-01 10:24:32', '2021-07-01 10:24:32'),
(1538, 153, NULL, 0, 1.0000, 0.0000, '2021-07-01 11:01:46', '2021-07-01 11:01:46'),
(1542, 156, NULL, 0, 2.0000, 0.0000, '2021-07-01 11:37:51', '2021-07-01 11:37:51'),
(1543, 153, NULL, 0, 1.0000, 0.0000, '2021-07-01 11:59:24', '2021-07-01 11:59:24'),
(1545, 125, NULL, 0, 16.0000, 0.0000, '2021-07-03 04:20:15', '2021-07-03 04:20:15'),
(1546, 126, NULL, 0, 10.0000, 0.0000, '2021-07-03 04:20:15', '2021-07-03 04:20:15'),
(1547, 128, NULL, 0, 12.0000, 0.0000, '2021-07-03 04:20:15', '2021-07-03 04:20:15'),
(1548, 128, NULL, 0, 12.0000, 0.0000, '2021-07-03 04:20:15', '2021-07-03 04:20:15'),
(1549, 129, NULL, 0, 4.0000, 0.0000, '2021-07-03 04:20:15', '2021-07-03 04:20:15'),
(1550, 129, NULL, 0, 4.0000, 0.0000, '2021-07-03 04:20:15', '2021-07-03 04:20:15'),
(1552, 158, NULL, 68, 1.0000, 0.0000, '2021-07-03 04:23:19', '2021-07-04 08:35:43'),
(1553, 135, NULL, 0, 5.0000, 0.0000, '2021-07-03 06:36:45', '2021-07-03 06:36:45'),
(1555, 162, NULL, 2, 1.0000, 0.0000, '2021-07-04 07:45:42', '2021-07-04 07:45:42'),
(1559, 167, NULL, 58, 2.0000, 0.0000, '2021-07-04 10:05:02', '2021-07-04 10:05:02'),
(1560, 168, NULL, 59, 2.0000, 0.0000, '2021-07-04 10:05:02', '2021-07-04 10:05:02'),
(1561, 168, NULL, 0, 2.0000, 0.0000, '2021-07-04 10:05:02', '2021-07-04 10:05:02'),
(1562, 169, NULL, 69, 2.0000, 0.0000, '2021-07-04 10:35:36', '2021-07-04 10:35:36'),
(1563, 56, NULL, 42, 1.0000, 0.0000, '2021-07-04 10:37:47', '2021-07-04 10:37:47'),
(1564, 170, NULL, 70, 1.0000, 0.0000, '2021-07-04 10:46:00', '2021-07-04 10:48:56'),
(1565, 147, NULL, 0, 2.0000, 0.0000, '2021-07-04 10:55:55', '2021-07-04 10:55:55'),
(1566, 149, NULL, 0, 1.0000, 0.0000, '2021-07-04 10:55:55', '2021-07-04 10:55:55'),
(1567, 171, NULL, 0, 2.0000, 0.0000, '2021-07-04 11:00:04', '2021-07-04 11:00:04'),
(1568, 172, NULL, 0, 1.0000, 0.0000, '2021-07-04 11:04:03', '2021-07-04 11:04:03'),
(1569, 173, NULL, 0, 1.0000, 0.0000, '2021-07-04 11:06:25', '2021-07-04 11:06:25'),
(1570, 174, NULL, 0, 2.0000, 0.0000, '2021-07-04 11:08:31', '2021-07-04 11:08:31'),
(1571, 147, NULL, 0, 2.0000, 0.0000, '2021-07-04 11:14:58', '2021-07-04 11:14:58'),
(1572, 147, NULL, 0, 2.0000, 0.0000, '2021-07-04 11:14:58', '2021-07-04 11:14:58'),
(1573, 149, NULL, 0, 1.0000, 0.0000, '2021-07-04 11:14:58', '2021-07-04 11:14:58'),
(1574, 149, NULL, 0, 1.0000, 0.0000, '2021-07-04 11:14:58', '2021-07-04 11:14:58'),
(1575, 175, NULL, 0, 1.0000, 0.0000, '2021-07-04 11:18:15', '2021-07-04 11:18:15'),
(1576, 176, NULL, 9, 4.0000, 0.0000, '2021-07-04 11:19:54', '2021-07-04 11:19:54'),
(1578, 178, NULL, 71, 1.0000, 0.0000, '2021-07-04 11:25:55', '2021-07-04 11:25:55'),
(1579, 156, NULL, 0, 2.0000, 0.0000, '2021-07-04 11:33:07', '2021-07-04 11:33:07'),
(1580, 156, NULL, 0, 2.0000, 0.0000, '2021-07-04 12:10:50', '2021-07-04 12:10:50'),
(1581, 156, NULL, 0, 2.0000, 0.0000, '2021-07-04 12:10:50', '2021-07-04 12:10:50'),
(1582, 183, NULL, 1, 5.0000, 0.0000, '2021-07-05 11:18:26', '2021-07-05 11:18:26'),
(1583, 183, NULL, 0, 9.0000, 0.0000, '2021-07-05 11:18:26', '2021-07-05 11:18:26'),
(1584, 184, NULL, 9, 4.0000, 0.0000, '2021-07-05 11:18:26', '2021-07-05 11:18:26'),
(1585, 189, NULL, 72, 1.0000, 0.0000, '2021-07-05 11:47:44', '2021-07-05 11:47:44'),
(1586, 194, NULL, 51, 1.0000, 0.0000, '2021-07-05 12:08:47', '2021-07-05 12:08:47'),
(1587, 195, NULL, 73, 1.0000, 0.0000, '2021-07-05 12:08:47', '2021-07-05 12:08:47'),
(1588, 196, NULL, 0, 2.0000, 0.0000, '2021-07-05 12:12:46', '2021-07-05 12:12:46'),
(1589, 197, NULL, 74, 1.0000, 0.0000, '2021-07-05 12:22:31', '2021-07-05 12:22:31'),
(1590, 13, NULL, 0, 2.0000, 0.0000, '2021-07-06 10:41:08', '2021-07-06 10:41:08'),
(1591, 13, NULL, 0, 2.0000, 0.0000, '2021-07-06 10:41:08', '2021-07-06 10:41:08'),
(1592, 15, NULL, 0, 2.0000, 0.0000, '2021-07-06 10:41:08', '2021-07-06 10:41:08'),
(1593, 15, NULL, 0, 2.0000, 0.0000, '2021-07-06 10:41:08', '2021-07-06 10:41:08'),
(1594, 13, NULL, 0, 2.0000, 0.0000, '2021-07-06 10:42:28', '2021-07-06 10:42:28'),
(1595, 13, NULL, 0, 2.0000, 0.0000, '2021-07-06 10:42:28', '2021-07-06 10:42:28'),
(1596, 13, NULL, 0, 2.0000, 0.0000, '2021-07-06 10:42:28', '2021-07-06 10:42:28'),
(1597, 13, NULL, 0, 2.0000, 0.0000, '2021-07-06 10:42:28', '2021-07-06 10:42:28'),
(1598, 15, NULL, 0, 2.0000, 0.0000, '2021-07-06 10:42:28', '2021-07-06 10:42:28'),
(1599, 15, NULL, 0, 2.0000, 0.0000, '2021-07-06 10:42:28', '2021-07-06 10:42:28'),
(1600, 15, NULL, 0, 2.0000, 0.0000, '2021-07-06 10:42:28', '2021-07-06 10:42:28'),
(1601, 15, NULL, 0, 2.0000, 0.0000, '2021-07-06 10:42:28', '2021-07-06 10:42:28'),
(1602, 201, NULL, 38, 1.0000, 0.0000, '2021-07-06 11:09:24', '2021-07-06 11:09:24');

-- --------------------------------------------------------

--
-- Table structure for table `types_of_services`
--

CREATE TABLE `types_of_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `business_id` int(11) NOT NULL,
  `location_price_group` text COLLATE utf8mb4_unicode_ci,
  `packing_charge` decimal(22,4) DEFAULT NULL,
  `packing_charge_type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enable_custom_fields` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `types_of_services`
--

INSERT INTO `types_of_services` (`id`, `name`, `description`, `business_id`, `location_price_group`, `packing_charge`, `packing_charge_type`, `enable_custom_fields`, `created_at`, `updated_at`) VALUES
(1, 'TROUBLE SHOOTING', NULL, 1, '{\"1\":\"0\"}', 0.0000, 'fixed', 0, '2021-06-23 05:00:33', '2021-06-23 05:00:33'),
(2, 'SCHEDULE MAINTENANCE', NULL, 1, '{\"1\":\"0\"}', 0.0000, 'fixed', 0, '2021-06-23 05:40:48', '2021-06-23 05:40:48'),
(3, 'MACHENICAL JOBS', NULL, 1, '{\"1\":\"0\"}', 0.0000, 'fixed', 0, '2021-06-23 05:41:10', '2021-06-23 05:41:10');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `actual_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `allow_decimal` tinyint(1) NOT NULL,
  `base_unit_id` int(11) DEFAULT NULL,
  `base_unit_multiplier` decimal(20,4) DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `business_id`, `actual_name`, `short_name`, `allow_decimal`, `base_unit_id`, `base_unit_multiplier`, `created_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pieces', 'Pc(s)', 0, NULL, NULL, 1, NULL, '2021-04-10 09:05:48', '2021-04-10 09:05:48'),
(2, 1, 'Litter', 'Ltr', 1, NULL, NULL, 1, NULL, '2021-05-08 14:09:09', '2021-05-08 14:09:09'),
(3, 1, 'JOBS', 'JOB', 1, NULL, NULL, 1, NULL, '2021-05-12 05:19:57', '2021-05-12 05:19:57'),
(4, 1, 'Meter', 'Mtrs', 1, NULL, NULL, 1, NULL, '2021-06-20 07:42:21', '2021-06-20 07:42:21');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `surname` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `contact_no` char(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `business_id` int(10) UNSIGNED DEFAULT NULL,
  `max_sales_discount_percent` decimal(5,2) DEFAULT NULL,
  `allow_login` tinyint(1) NOT NULL DEFAULT '1',
  `status` enum('active','inactive','terminated') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `is_cmmsn_agnt` tinyint(1) NOT NULL DEFAULT '0',
  `cmmsn_percent` decimal(4,2) NOT NULL DEFAULT '0.00',
  `selected_contacts` tinyint(1) NOT NULL DEFAULT '0',
  `dob` date DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marital_status` enum('married','unmarried','divorced') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `blood_group` char(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `family_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fb_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `social_media_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permanent_address` text COLLATE utf8mb4_unicode_ci,
  `current_address` text COLLATE utf8mb4_unicode_ci,
  `guardian_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_2` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_3` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field_4` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_details` longtext COLLATE utf8mb4_unicode_ci,
  `id_proof_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_proof_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type`, `surname`, `first_name`, `last_name`, `username`, `email`, `password`, `language`, `contact_no`, `address`, `remember_token`, `business_id`, `max_sales_discount_percent`, `allow_login`, `status`, `is_cmmsn_agnt`, `cmmsn_percent`, `selected_contacts`, `dob`, `gender`, `marital_status`, `blood_group`, `contact_number`, `alt_number`, `family_number`, `fb_link`, `twitter_link`, `social_media_1`, `social_media_2`, `permanent_address`, `current_address`, `guardian_name`, `custom_field_1`, `custom_field_2`, `custom_field_3`, `custom_field_4`, `bank_details`, `id_proof_name`, `id_proof_number`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'user', 'Md', 'Shafikul', 'Islam', 'pos-admin', 'shafikul@limburg-power.com', '$2y$10$vhHxcE8mSLkPIN4QgIK8b.Ft9oHoetNoK.Ys8cBTFmL5DUOyBpfgS', 'en', NULL, NULL, NULL, 1, NULL, 1, 'active', 0, 0.00, 0, '1990-02-15', 'male', 'married', 'AB+', '+8801714615869', NULL, NULL, NULL, NULL, NULL, NULL, '51/2, chayabithy\r\n1234', '51/2, chayabithy\r\n1234', NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2021-04-10 09:05:48', '2021-05-08 12:53:57'),
(2, 'user', 'Md', 'Sabur Uddin', NULL, 'sabur@limburg-power.com', 'sabur@limburg-power.com', '$2y$10$92SZB4ULr8dFevMJr15HvOky1hnRXRjUEAUD9r3gezCQJJxDZjsBK', 'en', NULL, NULL, NULL, 1, NULL, 1, 'active', 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2021-05-08 14:33:11', '2021-06-13 06:33:57'),
(3, 'user', 'Md', 'Shohidul', 'Islam', 'shohidul@limburg-power.com', 'shohidul@limburg-power.com', '$2y$10$76AAwMOr1XKoRZ156OxMoO0DxL7e/Bnvyk8m0dDtPvRIee9oA4NNi', 'en', NULL, NULL, NULL, 1, NULL, 1, 'active', 0, 0.00, 0, '1982-08-22', 'male', 'married', 'B Positive', '+8801716913682', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2021-05-09 03:49:12', '2021-07-04 04:16:02'),
(4, 'user', 'Md', 'Idris', 'Ali', 'Idris', 'abc@yahoo.com', '$2y$10$rL.bAkOv98Amj0GcfyNZCu5eb2WWFcBLaH1lmeUaLs1AAWXHPV8LO', 'en', NULL, NULL, NULL, 1, NULL, 1, 'active', 0, 0.00, 0, '1982-02-01', 'male', 'married', 'O+', '01722603764', NULL, '01933125095', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, '2021-06-20 06:34:01', '2021-05-11 07:37:15', '2021-06-20 06:34:01'),
(5, 'user', 'Md', 'Firoz', 'Ahmad', 'accounts@limburg-power.com', 'accounts@limburg-power.com', '$2y$10$7rc7mAUdBk0y7oY/D7jtBOFiYhZZtFSRrFx8xlNRfCs2mg46hniN.', 'en', NULL, NULL, NULL, 1, NULL, 1, 'active', 0, 0.00, 0, NULL, 'male', NULL, 'o+', '01321135711', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2021-05-11 12:06:35', '2021-06-22 11:56:47'),
(6, 'user', 'Md', 'Manwar', 'Hossain', 'manwar@limburg-power.com', 'manwar@limburg-power.com', '$2y$10$s7I5I78SBx3b0tdOJPTfSeJdQAMznyJrGMhcetERaZ1novIRpFsfW', 'en', NULL, NULL, NULL, 1, NULL, 1, 'active', 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2021-05-11 12:08:24', '2021-07-04 12:34:29'),
(7, 'user', 'F.M', 'Kamal', 'Hossain', 'netherlands@limburg-power.com', 'netherlands@limburg-power.com', '$2y$10$oYhUyY/5OZDIToaRR2N4Xe1gL2SXYzUnQkGfh5g5KsfSF6hveUocy', 'en', NULL, NULL, NULL, 1, NULL, 1, 'active', 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2021-05-12 16:13:52', '2021-05-12 16:13:52'),
(8, 'user', 'MD.', 'RASHAID', 'MIA', 'rashaid@limburg-power.com', 'rashaid@limburg-power.com', '$2y$10$2lpMSirRW.D3CMgqV7D7l.bzxhEsk4CM4hKjicZyUrkIjwXAiu7C.', 'en', NULL, NULL, NULL, 1, NULL, 1, 'active', 0, 0.00, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":null,\"account_number\":null,\"bank_name\":null,\"bank_code\":null,\"branch\":null,\"tax_payer_id\":null}', NULL, NULL, NULL, '2021-05-23 11:11:21', '2021-05-23 11:11:21'),
(9, 'user', 'Md.', 'Mahadi', 'Hassan', 'mahadi@limburg-power.com', 'mahadi@limburg-power.com', '$2y$10$94YCH6.6t85K/.3AIRjaXOz6U0lPBFiIbLsfZvcOsu2JuWZio4Wgi', 'en', NULL, NULL, 'vSY8XTnFnOoJxiJOG2MmMMGwoDLixpCm3CnFDvn4uEdwhmgOYeBC0uFx4xMy', 1, NULL, 1, 'active', 0, 0.00, 0, '1998-04-11', 'male', 'married', 'A+', '01404863386', NULL, '01718641726', NULL, NULL, NULL, NULL, 'House: 15, Road: 07, Block: E, Mirpur-1, Dhaka, Bangladesh', 'House: 15, Road: 07, Block: E, Mirpur-1, Dhaka, Bangladesh', NULL, NULL, NULL, NULL, NULL, '{\"account_holder_name\":\"Md. Mahadi Hassan\",\"account_number\":null,\"bank_name\":\"Mercantile Bank Limited.\",\"bank_code\":null,\"branch\":\"Garib E Newaz\",\"tax_payer_id\":null}', NULL, NULL, NULL, '2021-05-27 03:00:16', '2021-07-01 03:32:58');

-- --------------------------------------------------------

--
-- Table structure for table `user_contact_access`
--

CREATE TABLE `user_contact_access` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variations`
--

CREATE TABLE `variations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `sub_sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL,
  `variation_value_id` int(11) DEFAULT NULL,
  `default_purchase_price` decimal(22,4) DEFAULT NULL,
  `dpp_inc_tax` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `profit_percent` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `default_sell_price` decimal(22,4) DEFAULT NULL,
  `sell_price_inc_tax` decimal(22,4) DEFAULT NULL COMMENT 'Sell price including tax',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `combo_variations` text COLLATE utf8mb4_unicode_ci COMMENT 'Contains the combo variation details'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variations`
--

INSERT INTO `variations` (`id`, `name`, `product_id`, `sub_sku`, `product_variation_id`, `variation_value_id`, `default_purchase_price`, `dpp_inc_tax`, `profit_percent`, `default_sell_price`, `sell_price_inc_tax`, `created_at`, `updated_at`, `deleted_at`, `combo_variations`) VALUES
(1, 'DUMMY', 1, '0001', 1, NULL, 70000.0000, 70000.0000, 200.0000, 210000.0000, 210000.0000, '2021-05-08 11:31:19', '2021-05-08 13:44:37', NULL, '[]'),
(2, 'DUMMY', 2, '((((', 2, NULL, 17000.0000, 17000.0000, 123.5300, 38000.0000, 38000.0000, '2021-05-08 13:36:53', '2021-06-21 05:14:46', NULL, '[]'),
(3, 'DUMMY', 3, '12216896', 3, NULL, 4930.0000, 4930.0000, 123.1237, 11000.0000, 11000.0000, '2021-05-09 04:09:46', '2021-06-21 06:00:38', NULL, '[]'),
(4, 'DUMMY', 4, '12322054', 4, NULL, 35000.0000, 35000.0000, 28.5700, 45000.0000, 45000.0000, '2021-05-11 05:04:32', '2021-05-11 05:13:58', NULL, '[]'),
(5, 'DUMMY', 5, 'FP 205', 5, NULL, 1315.7900, 1315.7900, 51.9999, 2000.0000, 2000.0000, '2021-05-11 05:26:45', '2021-05-11 05:29:48', NULL, '[]'),
(6, 'DUMMY', 6, '12272453', 6, NULL, 800.0000, 800.0000, 87.5000, 1500.0000, 1500.0000, '2021-05-11 08:55:35', '2021-05-11 08:55:35', NULL, '[]'),
(7, 'DUMMY', 7, '12128936', 7, NULL, 2800.0000, 2800.0000, 132.1400, 6500.0000, 6500.0000, '2021-05-11 09:33:12', '2021-05-12 07:08:19', NULL, '[]'),
(8, 'DUMMY', 8, 'Part Number0008', 8, NULL, 10000.0000, 10000.0000, 10.0000, 11000.0000, 11000.0000, '2021-05-12 05:20:58', '2021-05-12 05:20:58', NULL, '[]'),
(11, 'DUMMY', 11, '4160610', 11, NULL, 170000.0000, 170000.0000, 23.5300, 210000.0000, 210000.0000, '2021-05-20 15:50:01', '2021-07-03 05:47:21', NULL, '[]'),
(12, 'DUMMY', 12, '1858786', 12, NULL, 15000.0000, 15000.0000, 16.6667, 17500.0000, 17500.0000, '2021-05-20 15:55:44', '2021-07-03 06:29:10', NULL, '[]'),
(13, 'DUMMY', 13, 'Part Number0013', 13, NULL, 1469.0000, 1469.0000, 50.0000, 2203.5000, 2203.5000, '2021-05-22 17:27:22', '2021-05-22 17:27:22', NULL, '[]'),
(14, 'DUMMY', 14, '01171113', 14, NULL, 220.5000, 220.5000, 50.0000, 330.7500, 330.7500, '2021-05-22 17:29:36', '2021-05-22 17:29:36', NULL, '[]'),
(15, 'DUMMY', 15, '12128846', 15, NULL, 152.2500, 152.2500, 50.0000, 228.3800, 228.3800, '2021-05-22 17:32:27', '2021-05-22 17:32:27', NULL, '[]'),
(16, 'DUMMY', 16, '12302087', 16, NULL, 11812.5000, 11812.5000, 50.0000, 17718.7500, 17718.7500, '2021-05-22 17:35:33', '2021-05-22 17:35:33', NULL, '[]'),
(17, 'DUMMY', 17, '12302287', 17, NULL, 94812.0000, 94812.0000, 50.0000, 142218.0000, 142218.0000, '2021-05-22 17:38:55', '2021-05-22 17:38:55', NULL, '[]'),
(18, 'DUMMY', 18, '12300501', 18, NULL, 750000.0000, 750000.0000, 22.6700, 920000.0000, 920000.0000, '2021-05-23 09:17:56', '2021-06-13 04:20:51', NULL, '[]'),
(19, 'DUMMY', 19, '12137125', 19, NULL, 14198.0000, 14198.0000, 50.0000, 21297.0000, 21297.0000, '2021-05-23 09:41:58', '2021-05-23 09:41:58', NULL, '[]'),
(20, 'DUMMY', 20, '12507242', 20, NULL, 63525.0000, 63525.0000, 50.0000, 95287.5000, 95287.5000, '2021-05-23 09:44:29', '2021-05-23 09:44:29', NULL, '[]'),
(21, 'DUMMY', 21, '200/WS-026', 21, NULL, 8977.0000, 8977.0000, 50.0000, 13465.5000, 13465.5000, '2021-05-23 09:48:13', '2021-05-23 09:48:13', NULL, '[]'),
(22, 'DUMMY', 22, '12501531', 22, NULL, 52290.0000, 52290.0000, 50.0000, 78435.0000, 78435.0000, '2021-05-23 09:50:57', '2021-05-23 09:50:57', NULL, '[]'),
(23, 'DUMMY', 23, '12037138', 23, NULL, 24675.0000, 24675.0000, 50.0000, 37012.5000, 37012.5000, '2021-05-23 09:52:59', '2021-05-23 09:52:59', NULL, '[]'),
(24, 'DUMMY', 24, '12403084', 24, NULL, 20475.0000, 20475.0000, 50.0000, 30712.5000, 30712.5000, '2021-05-23 11:36:38', '2021-05-23 11:36:38', NULL, '[]'),
(25, 'DUMMY', 25, '01149127', 25, NULL, 200.0000, 200.0000, 50.0000, 300.0000, 300.0000, '2021-05-23 11:41:38', '2021-06-20 04:36:58', NULL, '[]'),
(26, 'DUMMY', 26, '(((((((', 26, NULL, 150.0000, 150.0000, 200.0000, 450.0000, 450.0000, '2021-05-27 08:46:19', '2021-05-27 08:46:19', NULL, '[]'),
(27, 'DUMMY', 27, '12189925', 27, NULL, 0.0000, 0.0000, 0.0000, 12000.0000, 12000.0000, '2021-05-27 13:16:03', '2021-07-03 06:36:45', NULL, '[]'),
(28, 'DUMMY', 28, '7E7581', 28, NULL, 6500.0000, 6500.0000, 50.0000, 9750.0000, 9750.0000, '2021-06-10 07:36:20', '2021-06-10 07:36:20', NULL, '[]'),
(29, 'DUMMY', 29, '8N1234', 29, NULL, 6500.0000, 6500.0000, 50.0000, 9750.0000, 9750.0000, '2021-06-10 07:38:14', '2021-06-10 07:38:14', NULL, '[]'),
(30, 'DUMMY', 30, '7W2221', 30, NULL, 6500.0000, 6500.0000, 50.0000, 9750.0000, 9750.0000, '2021-06-10 07:39:59', '2021-06-10 07:39:59', NULL, '[]'),
(31, 'DUMMY', 31, '((((((((((((((', 31, NULL, 0.0000, 0.0000, 0.0000, 6000.0000, 6000.0000, '2021-06-10 09:09:49', '2021-07-03 07:14:51', NULL, '[]'),
(32, 'DUMMY', 32, 'M40FA640', 32, NULL, 70000.0000, 70000.0000, 50.0000, 105000.0000, 105000.0000, '2021-06-10 10:19:03', '2021-06-10 10:19:03', NULL, '[]'),
(33, 'DUMMY', 33, '((((((((((', 33, NULL, 70.0000, 70.0000, 50.0000, 105.0000, 105.0000, '2021-06-10 11:15:17', '2021-06-10 11:15:17', NULL, '[]'),
(34, 'DUMMY', 34, '12323810', 34, NULL, 10000.0000, 10000.0000, 150.0000, 25000.0000, 25000.0000, '2021-06-11 02:41:03', '2021-06-11 02:42:04', NULL, '[]'),
(35, 'DUMMY', 35, '12323518', 35, NULL, 35000.0000, 35000.0000, 50.0000, 52500.0000, 52500.0000, '2021-06-12 07:17:08', '2021-06-12 07:17:08', NULL, '[]'),
(36, 'DUMMY', 36, '12320854', 36, NULL, 32000.0000, 32000.0000, 18.7500, 38000.0000, 38000.0000, '2021-06-13 04:14:05', '2021-06-13 04:14:05', NULL, '[]'),
(37, 'DUMMY', 37, '(((((((((', 37, NULL, 750000.0000, 750000.0000, 22.6700, 920000.0000, 920000.0000, '2021-06-13 04:19:15', '2021-06-13 04:19:15', NULL, '[]'),
(38, 'DUMMY', 38, '12136975', 38, NULL, 5700.0000, 5700.0000, 50.0000, 8550.0000, 8550.0000, '2021-06-20 07:51:13', '2021-06-20 07:51:13', NULL, '[]'),
(39, 'DUMMY', 39, 'ACTUATOR', 39, NULL, 500000.0000, 500000.0000, 50.0000, 750000.0000, 750000.0000, '2021-06-21 03:51:18', '2021-06-21 03:51:18', NULL, '[]'),
(40, 'DUMMY', 40, '((((((((((((', 40, NULL, 3850.0000, 3850.0000, 9.0909, 4200.0000, 4200.0000, '2021-06-21 05:22:17', '2021-07-03 09:09:18', NULL, '[]'),
(41, 'DUMMY', 41, '(((((((((((((((((((((', 41, NULL, 65000.0000, 65000.0000, 38.4615, 90000.0000, 90000.0000, '2021-06-21 05:29:00', '2021-06-21 05:56:27', NULL, '[]'),
(42, 'DUMMY', 42, '(((((((((((((', 42, NULL, 50000.0000, 50000.0000, 110.0000, 105000.0000, 105000.0000, '2021-06-21 05:32:34', '2021-06-21 05:56:27', NULL, '[]'),
(43, 'DUMMY', 43, '((((((((((((((((((((((((((((((((((((((((((', 43, NULL, 15000.0000, 15000.0000, 133.3300, 35000.0000, 35000.0000, '2021-06-21 05:35:17', '2021-06-21 05:35:17', NULL, '[]'),
(44, 'DUMMY', 44, '(((((((((((((((((((((((((((((((((((((((((((((', 44, NULL, 40000.0000, 40000.0000, 350.0000, 180000.0000, 180000.0000, '2021-06-21 05:41:27', '2021-06-21 05:56:27', NULL, '[]'),
(45, 'DUMMY', 45, '12030164', 45, NULL, 6000.0000, 6000.0000, 50.0000, 9000.0000, 9000.0000, '2021-06-22 04:00:41', '2021-06-23 07:39:35', NULL, '[]'),
(46, 'DUMMY', 46, '12301481', 46, NULL, 3259.0000, 3259.0000, 513.6900, 20000.0000, 20000.0000, '2021-06-23 07:30:55', '2021-06-23 07:38:56', NULL, '[]'),
(47, 'DUMMY', 47, '12301480', 47, NULL, 3911.0000, 3911.0000, 539.2200, 25000.0000, 25000.0000, '2021-06-23 07:33:00', '2021-06-23 07:38:19', NULL, '[]'),
(48, 'DUMMY', 48, 'Part Number0048', 48, NULL, 15000.0000, 15000.0000, 50.0000, 22500.0000, 22500.0000, '2021-06-23 16:14:54', '2021-06-23 16:14:54', NULL, '[]'),
(49, 'DUMMY', 49, '((((((', 49, NULL, 28000.0000, 28000.0000, 35.7100, 38000.0000, 38000.0000, '2021-06-25 09:28:27', '2021-06-25 09:28:27', NULL, '[]'),
(50, 'DUMMY', 50, '((((((((((((((((((((((((((((((((((((((((', 50, NULL, 350.0000, 350.0000, 414.2900, 1800.0000, 1800.0000, '2021-06-25 09:30:58', '2021-06-25 09:30:58', NULL, '[]'),
(51, 'DUMMY', 51, '(((((((((((((((((((((((((((((((((((((', 51, NULL, 42500.0000, 42500.0000, 50.0000, 63750.0000, 63750.0000, '2021-06-25 09:35:28', '2021-06-25 09:35:28', NULL, '[]'),
(52, 'DUMMY', 52, '((((((((((((((((((((((((', 52, NULL, 2550.0000, 2550.0000, 56.8600, 4000.0000, 4000.0000, '2021-06-25 09:37:24', '2021-06-25 09:37:24', NULL, '[]'),
(53, 'DUMMY', 53, '(((((((((((((((((((((((((((((((((((((((((((', 53, NULL, 2550.0000, 2550.0000, 56.8600, 4000.0000, 4000.0000, '2021-06-25 09:39:28', '2021-06-25 09:39:28', NULL, '[]'),
(54, 'DUMMY', 54, '(((((', 54, NULL, 320.0000, 320.0000, 212.5000, 1000.0000, 1000.0000, '2021-06-25 09:43:45', '2021-06-25 09:43:45', NULL, '[]'),
(55, 'DUMMY', 55, '((((((((((((((((((((((((((((((', 55, NULL, 300000.0000, 300000.0000, 50.0000, 450000.0000, 450000.0000, '2021-06-25 09:45:23', '2021-06-25 09:45:23', NULL, '[]'),
(56, 'DUMMY', 56, '12299465', 56, NULL, 8500.0000, 8500.0000, 50.0000, 12750.0000, 12750.0000, '2021-06-27 05:39:17', '2021-06-27 05:39:17', NULL, '[]'),
(57, 'DUMMY', 57, 'Part Number0057', 57, NULL, 5500.0000, 5775.0000, 111.3636, 11625.0000, 12206.2500, '2021-06-28 03:21:24', '2021-07-03 04:18:24', NULL, '[]'),
(58, 'DUMMY', 58, 'Part Number0058', 58, NULL, 800.0000, 840.0000, 68.7500, 1350.0000, 1417.5000, '2021-06-28 03:24:44', '2021-07-03 04:18:24', NULL, '[]'),
(61, 'DUMMY', 61, 'Part Number0061', 61, NULL, 15000.0000, 15000.0000, 50.0000, 22500.0000, 22500.0000, '2021-06-28 03:38:25', '2021-06-28 03:38:25', NULL, '[]'),
(63, 'DUMMY', 63, 'Part Number0063', 63, NULL, 400000.0000, 400000.0000, 50.0000, 600000.0000, 600000.0000, '2021-07-01 08:49:10', '2021-07-01 09:38:52', NULL, '[]'),
(64, 'DUMMY', 64, 'Part Number0064', 64, NULL, 32000.0000, 32000.0000, 50.0000, 48000.0000, 48000.0000, '2021-07-01 10:26:07', '2021-07-01 10:26:07', NULL, '[]'),
(65, 'DUMMY', 65, 'Part Number0065', 65, NULL, 170000.0000, 170000.0000, 50.0000, 255000.0000, 255000.0000, '2021-07-03 04:04:05', '2021-07-03 04:17:03', NULL, '[]'),
(66, 'DUMMY', 66, '3550765', 66, NULL, 30000.0000, 30000.0000, 50.0000, 45000.0000, 45000.0000, '2021-07-03 05:15:58', '2021-07-04 03:49:15', NULL, '[]'),
(67, 'DUMMY', 67, '6V-3603', 67, NULL, 3850.0000, 3850.0000, 50.0000, 5775.0000, 5775.0000, '2021-07-03 05:24:37', '2021-07-03 05:24:37', NULL, '[]'),
(68, 'DUMMY', 68, '113-8433', 68, NULL, 0.0000, 0.0000, 50.0000, 0.0000, 0.0000, '2021-07-03 05:32:44', '2021-07-03 05:32:44', NULL, '[]'),
(69, 'DUMMY', 69, '8N-2555', 69, NULL, 1500.0000, 1500.0000, 50.0000, 2250.0000, 2250.0000, '2021-07-03 05:38:37', '2021-07-03 05:38:37', NULL, '[]'),
(70, 'DUMMY', 70, '12409797', 70, NULL, 18000.0000, 18000.0000, 50.0000, 27000.0000, 27000.0000, '2021-07-04 10:34:52', '2021-07-04 10:34:52', NULL, '[]'),
(71, 'DUMMY', 71, '12321982', 71, NULL, 4500.0000, 4500.0000, 900.0000, 45000.0000, 45000.0000, '2021-07-04 10:43:57', '2021-07-04 10:49:47', NULL, '[]'),
(72, 'DUMMY', 72, '751104', 72, NULL, 19000.0000, 19000.0000, 50.0000, 28500.0000, 28500.0000, '2021-07-04 11:22:12', '2021-07-04 11:22:12', NULL, '[]'),
(73, 'DUMMY', 73, 'RE-561823/LF9010', 73, NULL, 2650.0000, 2650.0000, 50.0000, 3975.0000, 3975.0000, '2021-07-05 10:30:00', '2021-07-05 10:30:00', NULL, '[]'),
(74, 'DUMMY', 74, 'RE-532952/FS19737', 74, NULL, 2200.0000, 2200.0000, 50.0000, 3300.0000, 3300.0000, '2021-07-05 10:31:56', '2021-07-05 10:31:56', NULL, '[]'),
(75, 'DUMMY', 75, 'C12004', 75, NULL, 7600.0000, 7600.0000, 50.0000, 11400.0000, 11400.0000, '2021-07-05 10:34:01', '2021-07-05 10:34:01', NULL, '[]'),
(76, 'DUMMY', 76, 'Grade -15W40', 76, NULL, 380.0000, 380.0000, 50.0000, 570.0000, 570.0000, '2021-07-05 10:36:39', '2021-07-05 10:36:39', NULL, '[]'),
(77, 'DUMMY', 77, 'Part Number0077', 77, NULL, 15000.0000, 15000.0000, 50.0000, 22500.0000, 22500.0000, '2021-07-05 11:44:08', '2021-07-05 11:44:08', NULL, '[]'),
(78, 'DUMMY', 78, 'Part Number0078', 78, NULL, 0.0000, 0.0000, 50.0000, 0.0000, 0.0000, '2021-07-05 12:07:19', '2021-07-05 12:07:19', NULL, '[]'),
(79, 'DUMMY', 79, 'Part Number0079', 79, NULL, 800000.0000, 800000.0000, 50.0000, 1200000.0000, 1200000.0000, '2021-07-05 12:21:00', '2021-07-05 12:21:00', NULL, '[]'),
(80, 'DUMMY', 80, 'FF5052/3931063,', 80, NULL, 600.0000, 600.0000, 50.0000, 900.0000, 900.0000, '2021-07-06 09:49:05', '2021-07-06 09:49:05', NULL, '[]'),
(81, 'DUMMY', 81, '3937743', 81, NULL, 750.0000, 750.0000, 50.0000, 1125.0000, 1125.0000, '2021-07-06 09:51:19', '2021-07-06 09:51:19', NULL, '[]'),
(82, 'DUMMY', 82, '3924893', 82, NULL, 3500.0000, 3500.0000, 50.0000, 5250.0000, 5250.0000, '2021-07-06 09:52:57', '2021-07-06 09:52:57', NULL, '[]');

-- --------------------------------------------------------

--
-- Table structure for table `variation_group_prices`
--

CREATE TABLE `variation_group_prices` (
  `id` int(10) UNSIGNED NOT NULL,
  `variation_id` int(10) UNSIGNED NOT NULL,
  `price_group_id` int(10) UNSIGNED NOT NULL,
  `price_inc_tax` decimal(22,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_location_details`
--

CREATE TABLE `variation_location_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_variation_id` int(10) UNSIGNED NOT NULL COMMENT 'id from product_variations table',
  `variation_id` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `qty_available` decimal(22,4) NOT NULL DEFAULT '0.0000',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `variation_location_details`
--

INSERT INTO `variation_location_details` (`id`, `product_id`, `product_variation_id`, `variation_id`, `location_id`, `qty_available`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 2, 1, -14.0000, '2021-05-08 13:37:20', '2021-07-05 11:18:26'),
(2, 1, 1, 1, 1, 0.0000, '2021-05-08 13:45:01', '2021-07-04 07:45:42'),
(3, 3, 3, 3, 1, -18.0000, '2021-05-11 03:05:55', '2021-07-01 11:33:44'),
(4, 4, 4, 4, 1, 2.0000, '2021-05-11 05:06:01', '2021-05-11 05:14:12'),
(5, 5, 5, 5, 1, 0.0000, '2021-05-11 05:29:48', '2021-05-11 05:51:57'),
(6, 6, 6, 6, 1, -10.0000, '2021-05-11 08:56:07', '2021-07-06 10:41:08'),
(7, 7, 7, 7, 1, 10.0000, '2021-05-11 09:33:12', '2021-07-05 11:18:26'),
(8, 8, 8, 8, 1, -1.0000, '2021-05-12 05:30:09', '2021-05-12 05:30:09'),
(9, 11, 11, 11, 1, 1.0000, '2021-05-22 17:41:49', '2021-07-03 08:51:07'),
(10, 12, 12, 12, 1, 16.0000, '2021-05-22 17:41:49', '2021-07-04 10:05:02'),
(11, 26, 26, 26, 1, 106.0000, '2021-05-27 08:46:36', '2021-05-27 08:56:13'),
(12, 27, 27, 27, 1, -22.0000, '2021-05-27 13:16:03', '2021-07-05 12:12:46'),
(13, 31, 31, 31, 1, 986.0000, '2021-06-10 09:23:28', '2021-07-06 11:09:24'),
(14, 33, 33, 33, 1, 150.0000, '2021-06-10 11:17:20', '2021-07-06 11:35:13'),
(15, 34, 34, 34, 1, -3.0000, '2021-06-11 02:45:40', '2021-06-30 04:10:57'),
(16, 38, 38, 38, 1, -18.0000, '2021-06-20 07:52:24', '2021-06-22 13:39:00'),
(17, 39, 39, 39, 1, 0.0000, '2021-06-21 03:51:18', '2021-06-26 03:32:47'),
(18, 40, 40, 40, 1, 23.0000, '2021-06-21 05:52:58', '2021-07-03 09:09:18'),
(19, 43, 43, 43, 1, 0.0000, '2021-06-21 05:56:27', '2021-06-21 06:39:40'),
(20, 44, 44, 44, 1, 0.0000, '2021-06-21 05:56:27', '2021-06-21 06:39:40'),
(21, 41, 41, 41, 1, 0.0000, '2021-06-21 05:56:27', '2021-06-21 06:39:40'),
(22, 42, 42, 42, 1, 0.0000, '2021-06-21 05:56:27', '2021-06-21 06:39:40'),
(23, 45, 45, 45, 1, 1.0000, '2021-06-22 04:01:54', '2021-06-23 07:39:48'),
(24, 46, 46, 46, 1, 1.0000, '2021-06-23 07:30:55', '2021-06-23 07:35:38'),
(25, 47, 47, 47, 1, 1.0000, '2021-06-23 07:33:00', '2021-06-23 07:35:38'),
(26, 48, 48, 48, 1, 0.0000, '2021-06-23 16:20:15', '2021-06-24 15:54:33'),
(27, 49, 49, 49, 1, 1.0000, '2021-06-25 09:28:39', '2021-06-25 09:57:28'),
(28, 50, 50, 50, 1, 45.0000, '2021-06-25 09:31:10', '2021-06-25 09:57:28'),
(29, 51, 51, 51, 1, 0.0000, '2021-06-25 09:35:35', '2021-07-03 04:28:36'),
(30, 52, 52, 52, 1, 0.0000, '2021-06-25 09:37:33', '2021-06-25 09:57:28'),
(31, 53, 53, 53, 1, 0.0000, '2021-06-25 09:39:45', '2021-06-25 09:57:28'),
(32, 54, 54, 54, 1, 0.0000, '2021-06-25 09:43:53', '2021-06-25 09:57:28'),
(33, 55, 55, 55, 1, 1.0000, '2021-06-25 09:45:32', '2021-06-25 09:46:34'),
(34, 15, 15, 15, 1, -2.0000, '2021-06-25 09:57:28', '2021-06-25 09:57:28'),
(35, 56, 56, 56, 1, 1.0000, '2021-06-27 05:39:17', '2021-07-05 12:08:47'),
(36, 57, 57, 57, 1, 0.0000, '2021-06-28 03:48:19', '2021-07-03 04:18:24'),
(37, 58, 58, 58, 1, 0.0000, '2021-06-28 03:48:19', '2021-07-03 04:18:24'),
(41, 63, 63, 63, 1, -1.0000, '2021-07-01 11:01:46', '2021-07-01 11:01:46'),
(42, 65, 65, 65, 1, 0.0000, '2021-07-03 04:18:32', '2021-07-04 08:35:43'),
(43, 66, 66, 66, 1, 1.0000, '2021-07-03 05:56:54', '2021-07-03 05:56:54'),
(44, 67, 67, 67, 1, 5.0000, '2021-07-03 05:56:54', '2021-07-03 05:56:54'),
(45, 69, 69, 69, 1, -2.0000, '2021-07-03 06:22:36', '2021-07-04 10:05:02'),
(46, 70, 70, 70, 1, 12.0000, '2021-07-04 10:34:52', '2021-07-04 10:35:36'),
(47, 71, 71, 71, 1, 3.0000, '2021-07-04 10:46:00', '2021-07-04 10:50:57'),
(48, 72, 72, 72, 1, 0.0000, '2021-07-04 11:22:12', '2021-07-04 11:25:55'),
(49, 77, 77, 77, 1, 0.0000, '2021-07-05 11:44:08', '2021-07-05 11:47:44'),
(50, 78, 78, 78, 1, 0.0000, '2021-07-05 12:07:19', '2021-07-05 12:08:47'),
(51, 79, 79, 79, 1, 0.0000, '2021-07-05 12:21:00', '2021-07-05 12:22:31');

-- --------------------------------------------------------

--
-- Table structure for table `variation_templates`
--

CREATE TABLE `variation_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `variation_value_templates`
--

CREATE TABLE `variation_value_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `variation_template_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warranties`
--

CREATE TABLE `warranties` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `business_id` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `duration` int(11) NOT NULL,
  `duration_type` enum('days','months','years') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warranties`
--

INSERT INTO `warranties` (`id`, `name`, `business_id`, `description`, `duration`, `duration_type`, `created_at`, `updated_at`) VALUES
(1, 'Warranty', 1, '4000 Running Hour', 180, 'days', '2021-05-08 13:32:49', '2021-06-23 07:50:42'),
(2, 'Warranty', 1, '8000 Running Hour', 365, 'days', '2021-06-23 07:50:26', '2021-06-23 07:50:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accounts_business_id_index` (`business_id`),
  ADD KEY `accounts_account_type_id_index` (`account_type_id`),
  ADD KEY `accounts_created_by_index` (`created_by`);

--
-- Indexes for table `account_transactions`
--
ALTER TABLE `account_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_transactions_account_id_index` (`account_id`),
  ADD KEY `account_transactions_transaction_id_index` (`transaction_id`),
  ADD KEY `account_transactions_transaction_payment_id_index` (`transaction_payment_id`),
  ADD KEY `account_transactions_transfer_transaction_id_index` (`transfer_transaction_id`),
  ADD KEY `account_transactions_created_by_index` (`created_by`),
  ADD KEY `account_transactions_type_index` (`type`),
  ADD KEY `account_transactions_sub_type_index` (`sub_type`);

--
-- Indexes for table `account_types`
--
ALTER TABLE `account_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_types_parent_account_type_id_index` (`parent_account_type_id`),
  ADD KEY `account_types_business_id_index` (`business_id`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barcodes_business_id_foreign` (`business_id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_contact_id_foreign` (`contact_id`),
  ADD KEY `bookings_business_id_foreign` (`business_id`),
  ADD KEY `bookings_created_by_foreign` (`created_by`),
  ADD KEY `bookings_table_id_index` (`table_id`),
  ADD KEY `bookings_waiter_id_index` (`waiter_id`),
  ADD KEY `bookings_location_id_index` (`location_id`),
  ADD KEY `bookings_booking_status_index` (`booking_status`),
  ADD KEY `bookings_correspondent_id_index` (`correspondent_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_business_id_foreign` (`business_id`),
  ADD KEY `brands_created_by_foreign` (`created_by`);

--
-- Indexes for table `business`
--
ALTER TABLE `business`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_owner_id_foreign` (`owner_id`),
  ADD KEY `business_currency_id_foreign` (`currency_id`),
  ADD KEY `business_default_sales_tax_foreign` (`default_sales_tax`);

--
-- Indexes for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `business_locations_business_id_index` (`business_id`),
  ADD KEY `business_locations_invoice_scheme_id_foreign` (`invoice_scheme_id`),
  ADD KEY `business_locations_invoice_layout_id_foreign` (`invoice_layout_id`),
  ADD KEY `business_locations_sale_invoice_layout_id_index` (`sale_invoice_layout_id`),
  ADD KEY `business_locations_selling_price_group_id_index` (`selling_price_group_id`),
  ADD KEY `business_locations_receipt_printer_type_index` (`receipt_printer_type`),
  ADD KEY `business_locations_printer_id_index` (`printer_id`);

--
-- Indexes for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_registers_business_id_foreign` (`business_id`),
  ADD KEY `cash_registers_user_id_foreign` (`user_id`),
  ADD KEY `cash_registers_location_id_index` (`location_id`);

--
-- Indexes for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cash_register_transactions_cash_register_id_foreign` (`cash_register_id`),
  ADD KEY `cash_register_transactions_transaction_id_index` (`transaction_id`),
  ADD KEY `cash_register_transactions_type_index` (`type`),
  ADD KEY `cash_register_transactions_transaction_type_index` (`transaction_type`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_business_id_foreign` (`business_id`),
  ADD KEY `categories_created_by_foreign` (`created_by`),
  ADD KEY `categories_parent_id_index` (`parent_id`);

--
-- Indexes for table `categorizables`
--
ALTER TABLE `categorizables`
  ADD KEY `categorizables_categorizable_type_categorizable_id_index` (`categorizable_type`,`categorizable_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_business_id_foreign` (`business_id`),
  ADD KEY `contacts_created_by_foreign` (`created_by`),
  ADD KEY `contacts_type_index` (`type`),
  ADD KEY `contacts_contact_status_index` (`contact_status`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_groups_business_id_foreign` (`business_id`),
  ADD KEY `customer_groups_created_by_index` (`created_by`),
  ADD KEY `customer_groups_price_calculation_type_index` (`price_calculation_type`),
  ADD KEY `customer_groups_selling_price_group_id_index` (`selling_price_group_id`);

--
-- Indexes for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dashboard_configurations_business_id_foreign` (`business_id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `discounts_business_id_index` (`business_id`),
  ADD KEY `discounts_brand_id_index` (`brand_id`),
  ADD KEY `discounts_category_id_index` (`category_id`),
  ADD KEY `discounts_location_id_index` (`location_id`),
  ADD KEY `discounts_priority_index` (`priority`);

--
-- Indexes for table `discount_variations`
--
ALTER TABLE `discount_variations`
  ADD KEY `discount_variations_discount_id_index` (`discount_id`),
  ADD KEY `discount_variations_variation_id_index` (`variation_id`);

--
-- Indexes for table `document_and_notes`
--
ALTER TABLE `document_and_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_and_notes_business_id_index` (`business_id`),
  ADD KEY `document_and_notes_notable_id_index` (`notable_id`),
  ADD KEY `document_and_notes_created_by_index` (`created_by`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_categories_business_id_foreign` (`business_id`);

--
-- Indexes for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD KEY `group_sub_taxes_group_tax_id_foreign` (`group_tax_id`),
  ADD KEY `group_sub_taxes_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_layouts_business_id_foreign` (`business_id`);

--
-- Indexes for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_schemes_business_id_foreign` (`business_id`),
  ADD KEY `invoice_schemes_scheme_type_index` (`scheme_type`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_business_id_index` (`business_id`),
  ADD KEY `media_uploaded_by_index` (`uploaded_by`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_type_model_id_index` (`model_type`,`model_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `printers_business_id_foreign` (`business_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_sub_category_id_foreign` (`sub_category_id`),
  ADD KEY `products_tax_foreign` (`tax`),
  ADD KEY `products_name_index` (`name`),
  ADD KEY `products_business_id_index` (`business_id`),
  ADD KEY `products_unit_id_index` (`unit_id`),
  ADD KEY `products_created_by_index` (`created_by`),
  ADD KEY `products_warranty_id_index` (`warranty_id`),
  ADD KEY `products_type_index` (`type`),
  ADD KEY `products_tax_type_index` (`tax_type`),
  ADD KEY `products_barcode_type_index` (`barcode_type`);

--
-- Indexes for table `product_locations`
--
ALTER TABLE `product_locations`
  ADD KEY `product_locations_product_id_index` (`product_id`),
  ADD KEY `product_locations_location_id_index` (`location_id`);

--
-- Indexes for table `product_racks`
--
ALTER TABLE `product_racks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_racks_business_id_index` (`business_id`),
  ADD KEY `product_racks_location_id_index` (`location_id`),
  ADD KEY `product_racks_product_id_index` (`product_id`);

--
-- Indexes for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_variations_name_index` (`name`),
  ADD KEY `product_variations_product_id_index` (`product_id`);

--
-- Indexes for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `purchase_lines_product_id_foreign` (`product_id`),
  ADD KEY `purchase_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `purchase_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `purchase_lines_sub_unit_id_index` (`sub_unit_id`),
  ADD KEY `purchase_lines_lot_number_index` (`lot_number`);

--
-- Indexes for table `reference_counts`
--
ALTER TABLE `reference_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reference_counts_business_id_index` (`business_id`);

--
-- Indexes for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD KEY `res_product_modifier_sets_modifier_set_id_foreign` (`modifier_set_id`);

--
-- Indexes for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `res_tables_business_id_foreign` (`business_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_business_id_foreign` (`business_id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `selling_price_groups_business_id_foreign` (`business_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- Indexes for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_adjustment_lines_product_id_foreign` (`product_id`),
  ADD KEY `stock_adjustment_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `stock_adjustment_lines_transaction_id_index` (`transaction_id`),
  ADD KEY `stock_adjustment_lines_lot_no_line_id_index` (`lot_no_line_id`);

--
-- Indexes for table `system`
--
ALTER TABLE `system`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tax_rates_business_id_foreign` (`business_id`),
  ADD KEY `tax_rates_created_by_foreign` (`created_by`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_tax_id_foreign` (`tax_id`),
  ADD KEY `transactions_business_id_index` (`business_id`),
  ADD KEY `transactions_type_index` (`type`),
  ADD KEY `transactions_contact_id_index` (`contact_id`),
  ADD KEY `transactions_transaction_date_index` (`transaction_date`),
  ADD KEY `transactions_created_by_index` (`created_by`),
  ADD KEY `transactions_location_id_index` (`location_id`),
  ADD KEY `transactions_expense_for_foreign` (`expense_for`),
  ADD KEY `transactions_expense_category_id_index` (`expense_category_id`),
  ADD KEY `transactions_sub_type_index` (`sub_type`),
  ADD KEY `transactions_return_parent_id_index` (`return_parent_id`),
  ADD KEY `type` (`type`),
  ADD KEY `transactions_status_index` (`status`),
  ADD KEY `transactions_sub_status_index` (`sub_status`),
  ADD KEY `transactions_res_table_id_index` (`res_table_id`),
  ADD KEY `transactions_res_waiter_id_index` (`res_waiter_id`),
  ADD KEY `transactions_res_order_status_index` (`res_order_status`),
  ADD KEY `transactions_payment_status_index` (`payment_status`),
  ADD KEY `transactions_discount_type_index` (`discount_type`),
  ADD KEY `transactions_commission_agent_index` (`commission_agent`),
  ADD KEY `transactions_transfer_parent_id_index` (`transfer_parent_id`),
  ADD KEY `transactions_types_of_service_id_index` (`types_of_service_id`),
  ADD KEY `transactions_packing_charge_type_index` (`packing_charge_type`),
  ADD KEY `transactions_recur_parent_id_index` (`recur_parent_id`),
  ADD KEY `transactions_selling_price_group_id_index` (`selling_price_group_id`);

--
-- Indexes for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_payments_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_payments_created_by_index` (`created_by`),
  ADD KEY `transaction_payments_parent_id_index` (`parent_id`);

--
-- Indexes for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_sell_lines_transaction_id_foreign` (`transaction_id`),
  ADD KEY `transaction_sell_lines_product_id_foreign` (`product_id`),
  ADD KEY `transaction_sell_lines_variation_id_foreign` (`variation_id`),
  ADD KEY `transaction_sell_lines_tax_id_foreign` (`tax_id`),
  ADD KEY `transaction_sell_lines_children_type_index` (`children_type`),
  ADD KEY `transaction_sell_lines_parent_sell_line_id_index` (`parent_sell_line_id`),
  ADD KEY `transaction_sell_lines_line_discount_type_index` (`line_discount_type`),
  ADD KEY `transaction_sell_lines_discount_id_index` (`discount_id`),
  ADD KEY `transaction_sell_lines_lot_no_line_id_index` (`lot_no_line_id`),
  ADD KEY `transaction_sell_lines_sub_unit_id_index` (`sub_unit_id`);

--
-- Indexes for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sell_line_id` (`sell_line_id`),
  ADD KEY `stock_adjustment_line_id` (`stock_adjustment_line_id`),
  ADD KEY `purchase_line_id` (`purchase_line_id`);

--
-- Indexes for table `types_of_services`
--
ALTER TABLE `types_of_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `types_of_services_business_id_index` (`business_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_business_id_foreign` (`business_id`),
  ADD KEY `units_created_by_foreign` (`created_by`),
  ADD KEY `units_base_unit_id_index` (`base_unit_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_business_id_foreign` (`business_id`),
  ADD KEY `users_user_type_index` (`user_type`);

--
-- Indexes for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_contact_access_user_id_index` (`user_id`),
  ADD KEY `user_contact_access_contact_id_index` (`contact_id`);

--
-- Indexes for table `variations`
--
ALTER TABLE `variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variations_product_id_foreign` (`product_id`),
  ADD KEY `variations_product_variation_id_foreign` (`product_variation_id`),
  ADD KEY `variations_name_index` (`name`),
  ADD KEY `variations_sub_sku_index` (`sub_sku`),
  ADD KEY `variations_variation_value_id_index` (`variation_value_id`);

--
-- Indexes for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_group_prices_variation_id_foreign` (`variation_id`),
  ADD KEY `variation_group_prices_price_group_id_foreign` (`price_group_id`);

--
-- Indexes for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_location_details_location_id_foreign` (`location_id`),
  ADD KEY `variation_location_details_product_id_index` (`product_id`),
  ADD KEY `variation_location_details_product_variation_id_index` (`product_variation_id`),
  ADD KEY `variation_location_details_variation_id_index` (`variation_id`);

--
-- Indexes for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_templates_business_id_foreign` (`business_id`);

--
-- Indexes for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `variation_value_templates_name_index` (`name`),
  ADD KEY `variation_value_templates_variation_template_id_index` (`variation_template_id`);

--
-- Indexes for table `warranties`
--
ALTER TABLE `warranties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warranties_business_id_index` (`business_id`),
  ADD KEY `warranties_duration_type_index` (`duration_type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `account_transactions`
--
ALTER TABLE `account_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `account_types`
--
ALTER TABLE `account_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=782;

--
-- AUTO_INCREMENT for table `barcodes`
--
ALTER TABLE `barcodes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `business`
--
ALTER TABLE `business`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `business_locations`
--
ALTER TABLE `business_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cash_registers`
--
ALTER TABLE `cash_registers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_and_notes`
--
ALTER TABLE `document_and_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=258;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `printers`
--
ALTER TABLE `printers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `product_racks`
--
ALTER TABLE `product_racks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `product_variations`
--
ALTER TABLE `product_variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `reference_counts`
--
ALTER TABLE `reference_counts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `res_tables`
--
ALTER TABLE `res_tables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system`
--
ALTER TABLE `system`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;

--
-- AUTO_INCREMENT for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=202;

--
-- AUTO_INCREMENT for table `transaction_sell_lines_purchase_lines`
--
ALTER TABLE `transaction_sell_lines_purchase_lines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1603;

--
-- AUTO_INCREMENT for table `types_of_services`
--
ALTER TABLE `types_of_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_contact_access`
--
ALTER TABLE `user_contact_access`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variations`
--
ALTER TABLE `variations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `variation_templates`
--
ALTER TABLE `variation_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warranties`
--
ALTER TABLE `warranties`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barcodes`
--
ALTER TABLE `barcodes`
  ADD CONSTRAINT `barcodes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookings_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `brands`
--
ALTER TABLE `brands`
  ADD CONSTRAINT `brands_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `brands_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business`
--
ALTER TABLE `business`
  ADD CONSTRAINT `business_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `business_default_sales_tax_foreign` FOREIGN KEY (`default_sales_tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `business_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `business_locations`
--
ALTER TABLE `business_locations`
  ADD CONSTRAINT `business_locations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_layout_id_foreign` FOREIGN KEY (`invoice_layout_id`) REFERENCES `invoice_layouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `business_locations_invoice_scheme_id_foreign` FOREIGN KEY (`invoice_scheme_id`) REFERENCES `invoice_schemes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_registers`
--
ALTER TABLE `cash_registers`
  ADD CONSTRAINT `cash_registers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cash_registers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cash_register_transactions`
--
ALTER TABLE `cash_register_transactions`
  ADD CONSTRAINT `cash_register_transactions_cash_register_id_foreign` FOREIGN KEY (`cash_register_id`) REFERENCES `cash_registers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `categories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `contacts_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD CONSTRAINT `customer_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dashboard_configurations`
--
ALTER TABLE `dashboard_configurations`
  ADD CONSTRAINT `dashboard_configurations_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD CONSTRAINT `expense_categories_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `group_sub_taxes`
--
ALTER TABLE `group_sub_taxes`
  ADD CONSTRAINT `group_sub_taxes_group_tax_id_foreign` FOREIGN KEY (`group_tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `group_sub_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_layouts`
--
ALTER TABLE `invoice_layouts`
  ADD CONSTRAINT `invoice_layouts_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_schemes`
--
ALTER TABLE `invoice_schemes`
  ADD CONSTRAINT `invoice_schemes_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `printers`
--
ALTER TABLE `printers`
  ADD CONSTRAINT `printers_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_sub_category_id_foreign` FOREIGN KEY (`sub_category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_tax_foreign` FOREIGN KEY (`tax`) REFERENCES `tax_rates` (`id`),
  ADD CONSTRAINT `products_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_variations`
--
ALTER TABLE `product_variations`
  ADD CONSTRAINT `product_variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_lines`
--
ALTER TABLE `purchase_lines`
  ADD CONSTRAINT `purchase_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `res_product_modifier_sets`
--
ALTER TABLE `res_product_modifier_sets`
  ADD CONSTRAINT `res_product_modifier_sets_modifier_set_id_foreign` FOREIGN KEY (`modifier_set_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `res_tables`
--
ALTER TABLE `res_tables`
  ADD CONSTRAINT `res_tables_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `selling_price_groups`
--
ALTER TABLE `selling_price_groups`
  ADD CONSTRAINT `selling_price_groups_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_adjustment_lines`
--
ALTER TABLE `stock_adjustment_lines`
  ADD CONSTRAINT `stock_adjustment_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_adjustment_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD CONSTRAINT `tax_rates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tax_rates_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_contact_id_foreign` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_expense_for_foreign` FOREIGN KEY (`expense_for`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transactions_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  ADD CONSTRAINT `transactions_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_payments`
--
ALTER TABLE `transaction_payments`
  ADD CONSTRAINT `transaction_payments_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `transaction_sell_lines`
--
ALTER TABLE `transaction_sell_lines`
  ADD CONSTRAINT `transaction_sell_lines_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_transaction_id_foreign` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_sell_lines_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `units_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `units_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variations`
--
ALTER TABLE `variations`
  ADD CONSTRAINT `variations_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variations_product_variation_id_foreign` FOREIGN KEY (`product_variation_id`) REFERENCES `product_variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_group_prices`
--
ALTER TABLE `variation_group_prices`
  ADD CONSTRAINT `variation_group_prices_price_group_id_foreign` FOREIGN KEY (`price_group_id`) REFERENCES `selling_price_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `variation_group_prices_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_location_details`
--
ALTER TABLE `variation_location_details`
  ADD CONSTRAINT `variation_location_details_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `business_locations` (`id`),
  ADD CONSTRAINT `variation_location_details_variation_id_foreign` FOREIGN KEY (`variation_id`) REFERENCES `variations` (`id`);

--
-- Constraints for table `variation_templates`
--
ALTER TABLE `variation_templates`
  ADD CONSTRAINT `variation_templates_business_id_foreign` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `variation_value_templates`
--
ALTER TABLE `variation_value_templates`
  ADD CONSTRAINT `variation_value_templates_variation_template_id_foreign` FOREIGN KEY (`variation_template_id`) REFERENCES `variation_templates` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
