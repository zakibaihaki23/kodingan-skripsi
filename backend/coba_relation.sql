-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 30, 2021 at 04:47 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coba_relation`
--

-- --------------------------------------------------------

--
-- Table structure for table `db_informasi`
--

CREATE TABLE `db_informasi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `instansi_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `informasi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `waktu` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_informasi`
--

INSERT INTO `db_informasi` (`id`, `instansi_id`, `informasi`, `waktu`, `created_at`, `updated_at`) VALUES
(1, 0, 'Untuk Semua', '2021-11-29', '2021-11-29 04:16:46', '2021-11-29 04:16:46'),
(2, 3, 'Untuk Kecamatan Pandeglang', '2021-11-29', '2021-11-29 05:21:01', '2021-11-29 05:21:01'),
(4, 3, 'Untuk Pandeglang', '2021-11-30', '2021-11-29 13:14:10', '2021-11-29 13:14:10'),
(5, 4, 'Untuk Majasari', '2021-11-29', '2021-11-29 13:14:40', '2021-11-29 13:14:40'),
(6, 3, 'Pandeglang harus', '2021-11-29', '2021-11-29 14:03:19', '2021-11-29 14:03:19'),
(7, 0, 'Semua siapppppp', '2021-11-29', NULL, NULL),
(8, 3, 'Semua siapppppp', '2021-11-29', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `db_realisasi_pbb`
--

CREATE TABLE `db_realisasi_pbb` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `instansi_id` bigint(20) UNSIGNED NOT NULL,
  `kelurahan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_pbb` double NOT NULL,
  `realisasi_bln_lalu` double NOT NULL,
  `realisasi_bln_ini` double NOT NULL,
  `jmlh_realisasi` double NOT NULL,
  `sisa_target` double NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `periode` date NOT NULL,
  `is_verified` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_realisasi_pbb`
--

INSERT INTO `db_realisasi_pbb` (`id`, `instansi_id`, `kelurahan`, `target_pbb`, `realisasi_bln_lalu`, `realisasi_bln_ini`, `jmlh_realisasi`, `sisa_target`, `keterangan`, `periode`, `is_verified`, `created_at`, `updated_at`) VALUES
(1, 3, 'Kelurahan Pandeglang', 100000, 90000, 90000, 9, 90000, '', '2021-11-01', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `instansi`
--

CREATE TABLE `instansi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_instansi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pimpinan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` double(10,6) NOT NULL,
  `lng` double(10,6) NOT NULL,
  `instansi` enum('Kecamatan','Pemkab') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Kecamatan',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `instansi`
--

INSERT INTO `instansi` (`id`, `nama_instansi`, `pimpinan`, `lat`, `lng`, `instansi`, `created_at`, `updated_at`) VALUES
(1, 'Diskomsantik', 'Ir. Girgijantoro', -6.308133, 106.106765, 'Pemkab', '2021-11-26 14:54:45', NULL),
(2, 'Sekretariat Daerah', 'Taufik Hidayat', -6.309591, 106.104914, 'Pemkab', '2021-11-26 14:54:45', NULL),
(3, 'Kecamatan Pandeglang', 'M Arief', -6.310473, 106.110413, 'Kecamatan', '2021-11-26 14:54:45', NULL),
(4, 'Kecamatan Majasari', 'M Bajja', -6.328842, 106.093506, 'Kecamatan', '2021-11-26 14:54:45', NULL),
(5, 'Kecamatan Kaduhejo', 'Ahmad Subagya', -6.332721, 106.057522, 'Kecamatan', '2021-11-26 16:34:28', '2021-11-26 16:34:28'),
(6, 'Kecamatan Banjar', 'Banjarin', -6.364649, 106.100202, 'Kecamatan', '2021-11-26 16:41:43', '2021-11-26 16:41:43'),
(7, 'Kecamatan Angsana', 'Banjarin', -6.577312, 105.860560, 'Kecamatan', '2021-11-26 16:43:05', '2021-11-26 16:43:05'),
(8, 'Kecamatan Labuan', 'LabuanBajo', -6.380005, 105.835195, 'Kecamatan', '2021-11-26 16:52:28', '2021-11-26 16:52:28'),
(9, 'Kecamatan Mandalawangi', 'Amuk Marugul', -6.309909, 105.988892, 'Kecamatan', '2021-11-26 16:56:15', '2021-11-26 16:56:15'),
(10, 'Kecamatan Cibaliung', 'Dede', -6.715764, 105.705511, 'Kecamatan', '2021-11-26 17:05:11', '2021-11-26 17:05:11'),
(11, 'Kecamatan Carita', 'Carli', -6.319521, 105.839225, 'Kecamatan', '2021-11-26 17:06:47', '2021-11-26 17:06:47'),
(12, 'Kecamatan Cadasari', 'Yana', -6.267537, 106.120658, 'Kecamatan', '2021-11-26 17:20:01', '2021-11-26 17:20:01'),
(13, 'Kecamatan Bojong', 'Bule', -6.471679, 106.000063, 'Kecamatan', '2021-11-26 17:26:37', '2021-11-26 17:26:37'),
(14, 'Kecamatan Saketi', 'Aceng', -6.397585, 105.990595, 'Kecamatan', '2021-11-26 17:28:25', '2021-11-26 17:28:25'),
(15, 'Kecamatan Picung', 'Deden', -6.505918, 105.972620, 'Kecamatan', '2021-11-26 17:30:48', '2021-11-26 17:30:48'),
(16, 'Kecamatan Cibitung', 'Deden', -6.768684, 105.700491, 'Kecamatan', '2021-11-26 17:38:35', '2021-11-26 17:38:35'),
(17, 'Kecamatan Cigeulis', 'Mahmud', -6.588634, 105.694042, 'Kecamatan', '2021-11-26 17:39:00', '2021-11-26 17:39:00'),
(18, 'Kecamatan Cikedal', 'Kelii', -6.381690, 105.883256, 'Kecamatan', '2021-11-26 17:53:50', '2021-11-26 17:53:50'),
(19, 'Kecamatan Cikeusik', 'Hendrik', -6.728640, 105.871798, 'Kecamatan', '2021-11-26 17:54:36', '2021-11-26 17:54:36'),
(20, 'Kecamatan Cimanggu', 'Agung', -6.700618, 105.649913, 'Kecamatan', '2021-11-26 17:57:43', '2021-11-26 17:57:43'),
(21, 'Kecamatan Cimanuk', 'Derren', -6.350508, 106.043316, 'Kecamatan', '2021-11-26 18:00:31', '2021-11-26 18:00:31'),
(22, 'Kecamatan Cipeucang', 'Derren', -6.380975, 106.019019, 'Kecamatan', '2021-11-26 18:01:37', '2021-11-26 18:01:37');

-- --------------------------------------------------------

--
-- Table structure for table `kelurahan`
--

CREATE TABLE `kelurahan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `instansi_id` bigint(20) UNSIGNED NOT NULL,
  `nama_kelurahan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kelurahan`
--

INSERT INTO `kelurahan` (`id`, `instansi_id`, `nama_kelurahan`, `created_at`, `updated_at`) VALUES
(1, 3, 'Kelurahan Babakan Kalanganyar', '2021-11-26 18:11:43', '2021-11-26 18:11:43'),
(2, 3, 'Kelurahan Kabayan', '2021-11-26 18:12:00', '2021-11-26 18:12:00'),
(3, 3, 'Kelurahan Kadomas', '2021-11-26 18:12:04', '2021-11-26 18:12:04'),
(4, 3, 'Kelurahan Pandeglang', '2021-11-26 18:12:07', '2021-11-26 18:12:07'),
(5, 4, 'Kelurahan Cilaja', '2021-11-26 18:12:32', '2021-11-26 18:12:32'),
(6, 4, 'Kelurahan Karaton', '2021-11-26 18:12:37', '2021-11-26 18:12:37'),
(7, 4, 'Kelurahan Pagerbatu', '2021-11-26 18:12:41', '2021-11-26 18:12:41'),
(8, 4, 'Kelurahan Saruni', '2021-11-26 18:12:44', '2021-11-26 18:12:44'),
(9, 4, 'Kelurahan Sukaratu', '2021-11-26 18:12:50', '2021-11-26 18:12:50'),
(10, 5, 'Desa Banjarsari', '2021-11-26 18:13:18', '2021-11-26 18:13:18'),
(11, 5, 'Desa Bayumundu', '2021-11-26 18:13:22', '2021-11-26 18:13:22'),
(12, 5, 'Desa Campaka', '2021-11-26 18:13:26', '2021-11-26 18:13:26'),
(13, 5, 'Desa Ciputri', '2021-11-26 18:13:30', '2021-11-26 18:13:30'),
(14, 5, 'Desa Kadugemblo', '2021-11-26 18:13:36', '2021-11-26 18:13:36'),
(15, 5, 'Desa Mandalasari', '2021-11-26 18:13:42', '2021-11-26 18:13:42'),
(16, 5, 'Desa Palurahan', '2021-11-26 18:13:47', '2021-11-26 18:13:47'),
(17, 5, 'Desa Saninten', '2021-11-26 18:13:51', '2021-11-26 18:13:51'),
(18, 5, 'Desa Sukamanah', '2021-11-26 18:13:56', '2021-11-26 18:13:56'),
(19, 5, 'Desa Sukasari', '2021-11-26 18:13:59', '2021-11-26 18:13:59'),
(20, 6, 'Desa Bandung', '2021-11-26 18:14:36', '2021-11-26 18:14:36'),
(21, 6, 'Desa Banjar', '2021-11-26 18:14:39', '2021-11-26 18:14:39'),
(22, 6, 'Desa Cibereum', '2021-11-26 18:14:43', '2021-11-26 18:14:43'),
(23, 6, 'Desa Cibodas', '2021-11-26 18:14:47', '2021-11-26 18:14:47'),
(24, 6, 'Desa Citalahab', '2021-11-26 18:14:51', '2021-11-26 18:14:51'),
(25, 6, 'Desa Gunungputri', '2021-11-26 18:14:57', '2021-11-26 18:14:57'),
(26, 6, 'Desa Kadubale', '2021-11-26 18:15:01', '2021-11-26 18:15:01'),
(27, 6, 'Desa Kadulimus', '2021-11-26 18:15:05', '2021-11-26 18:15:05'),
(28, 6, 'Desa Kadumaneuh', '2021-11-26 18:15:12', '2021-11-26 18:15:12'),
(29, 6, 'Desa Mogana', '2021-11-26 18:15:17', '2021-11-26 18:15:17'),
(30, 6, 'Desa Pasirawi', '2021-11-26 18:15:22', '2021-11-26 18:15:22');

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
(12, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(13, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(14, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(15, '2016_06_01_000004_create_oauth_clients_table', 1),
(16, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(17, '2019_08_19_000000_create_failed_jobs_table', 1),
(18, '2021_06_18_123004_create_kecamatan_table', 1),
(19, '2021_06_18_123114_create_users_table', 1),
(20, '2021_06_18_134125_create_kelurahans_table', 1),
(21, '2021_06_18_135453_create_p_b_b_s_table', 1),
(22, '2021_11_27_203939_create_roles_table', 2),
(23, '2021_11_28_142829_paten', 3),
(24, '2021_11_28_210240_informasi', 4);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('09a76b4b2f4e46631465160151b25ab601e43cc8d921ea7e881211c21cfa9dee6cbcc916d162206d', 4, 1, 'Token', '[]', 0, '2021-11-29 08:20:13', '2021-11-29 08:20:13', '2021-11-30 15:20:13'),
('0edb08e1f3cd749bf6a69739f4a96606d7d4fadda66a6075b6d4b29116f0a6a5979eae16e3d4d3ce', 3, 1, 'Token', '[]', 0, '2021-11-29 14:04:02', '2021-11-29 14:04:02', '2021-11-30 21:04:02'),
('112fe28bce578e152a47bc475cf00d9f7bf7a911568e57363120a75e733630409dea54c2f75df6e6', 4, 1, 'Token', '[]', 0, '2021-11-29 16:58:32', '2021-11-29 16:58:32', '2021-11-30 23:58:32'),
('1542ad5b006e7829f00453d6a749ec781d567b9af233ba672bceb143ef7f8ebf812c16e7113587ed', 4, 1, 'Token', '[]', 0, '2021-11-29 08:36:59', '2021-11-29 08:36:59', '2021-11-30 15:36:59'),
('198ec4147e8ae5a5afda30f8996fbf755abc96d7cd9b8662b475ad0fd6828c4acf7dd949664f5ee1', 1, 1, 'Token', '[]', 0, '2021-11-29 13:13:41', '2021-11-29 13:13:41', '2021-11-30 20:13:41'),
('1af3fb3a56ea8f149f1c1e21da7a5138200c329553bc66cfaf1c3c3e18e401161bd506459ee7f160', 3, 1, 'Token', '[]', 0, '2021-11-29 16:57:46', '2021-11-29 16:57:46', '2021-11-30 23:57:45'),
('21e18524d39a7bbe2916ec0b3b08ae93b097677b703eebc4e6d835d636e5163d6586ec1ffb3ae641', 1, 1, 'Token', '[]', 0, '2021-11-29 08:19:49', '2021-11-29 08:19:49', '2021-11-30 15:19:49'),
('24c77afd62c8718c81433fb449d60507e05f0926c8f2a5f094866f9b2200f70d8fb4f33b3979f008', 3, 1, 'Token', '[]', 0, '2021-11-29 17:11:33', '2021-11-29 17:11:33', '2021-12-01 00:11:33'),
('290bd338c1064bfd633c30801324d6f0e18bc870a0fe8831ac6b8a369251a7be8ac3dc24a96b5e29', 4, 1, 'Token', '[]', 0, '2021-11-28 17:22:03', '2021-11-28 17:22:03', '2021-11-30 00:22:03'),
('30064e321b3034f23b3c10880ca9817db7380815ee4b6f27007b879b6e1128d85bb7cb638fccbca9', 3, 1, 'Token', '[]', 0, '2021-11-29 17:00:13', '2021-11-29 17:00:13', '2021-12-01 00:00:13'),
('3462daf682a5a4a9764afeb0938295d733c5db627836eb88a69acf1a6520bd0c5352de6d4a24891e', 3, 1, 'Token', '[]', 0, '2021-11-29 12:17:50', '2021-11-29 12:17:50', '2021-11-30 19:17:50'),
('39ea91c8ec2bab3011ffa0ab567edd778180dac1d28b3027ccb4e44b4c4998c9332e2df9f1fdd850', 3, 1, 'Token', '[]', 0, '2021-11-29 13:18:11', '2021-11-29 13:18:11', '2021-11-30 20:18:11'),
('536b6ac2364f0deafd3a51f143973fac22df614102204b890014083146cfe9a623e6d157f3857d83', 4, 1, 'Token', '[]', 0, '2021-11-29 16:58:56', '2021-11-29 16:58:56', '2021-11-30 23:58:56'),
('59313c5b8b8e2f3b7fbde48ebb656c0c608c8fd3aebf12ef4e665b777ef91a44a71811ac5afd2669', 1, 1, 'Token', '[]', 0, '2021-11-29 14:46:30', '2021-11-29 14:46:30', '2021-11-30 21:46:29'),
('5932ff92ca3335f3a8693993e927e7c9252e58444ad2be6d0d4fa49d8ff217fb91ba6d51655c7270', 4, 1, 'Token', '[]', 0, '2021-11-29 08:27:17', '2021-11-29 08:27:17', '2021-11-30 15:27:16'),
('5c182f19569940c91f8873a558228c8c59ab21e361579841c493d99cb5282af54951b00d7cb24727', 3, 1, 'Token', '[]', 0, '2021-11-29 14:54:03', '2021-11-29 14:54:03', '2021-11-30 21:54:03'),
('6dd9e485e9d3483e1b55bb9c989a03a053dc164bb8241038736da3d2250110573003fec175cfa858', 4, 1, 'Token', '[]', 0, '2021-11-29 07:31:46', '2021-11-29 07:31:46', '2021-11-30 14:31:45'),
('7d18ec5b8d6d30dde692f4137067362503fff4531759d9c3b3eb4afdcb3b0a8947a59977b8370d24', 3, 1, 'Token', '[]', 0, '2021-11-29 07:32:00', '2021-11-29 07:32:00', '2021-11-30 14:31:59'),
('90e08ca820a44d722a3adcd999edec43498fe781806ae6fcb35be8026b483136440843e714eec411', 4, 1, 'Token', '[]', 0, '2021-11-29 08:28:14', '2021-11-29 08:28:14', '2021-11-30 15:28:14'),
('94cecd3a0935466cab852d29e8c2f66b778902acaa32a4f2833b00ed951fd7e1e43941ecca0ef5e1', 1, 1, 'Token', '[]', 0, '2021-11-28 14:16:07', '2021-11-28 14:16:07', '2021-11-29 21:16:07'),
('a45f9d67eb9d35db31d648c8d2fce5dcd29f7c88cb757339b50ba51eee9d8be21c9efb8a2f3dc1ab', 3, 1, 'Token', '[]', 0, '2021-11-29 08:38:43', '2021-11-29 08:38:43', '2021-11-30 15:38:43'),
('c5e682abc6da989fdcd2815a3989c57a301c05064d06b706d4aaa8819de9d75f517b47360debfd67', 1, 1, 'Token', '[]', 0, '2021-11-29 12:05:47', '2021-11-29 12:05:47', '2021-11-30 19:05:46'),
('cc3b650fad7606e5b49e9922361ff897ef57092be42962c3dec1adf5272e7b9cd6514a628c916eef', 3, 1, 'Token', '[]', 0, '2021-11-29 07:25:46', '2021-11-29 07:25:46', '2021-11-30 14:25:46'),
('ce7ebfeb3c1796841aed775e7ec137d7a44c4ea37f3ba515dc99d238c2168e21ce898f50561acf12', 3, 1, 'Token', '[]', 0, '2021-11-29 07:11:20', '2021-11-29 07:11:20', '2021-11-30 14:11:20'),
('cf2c05556875f4b4c0c3246999ea94cf4f0d5b7f53cd6eeb086d2b9698e8ab1572df2a257f4914b8', 1, 1, 'Token', '[]', 0, '2021-11-29 14:02:15', '2021-11-29 14:02:15', '2021-11-30 21:02:14'),
('d0ead66d8b1d0944baaa480160be69ea3e2271db47e788ce415a7551d1f5fb9c56857618e3650187', 4, 1, 'Token', '[]', 0, '2021-11-29 07:00:13', '2021-11-29 07:00:13', '2021-11-30 14:00:12'),
('d54425b76dbde13bde2e95e08af2db42c108206cc8c9de1573cac106bd4e2259ed2b3a0ae0439ccc', 4, 1, 'Token', '[]', 0, '2021-11-29 08:21:47', '2021-11-29 08:21:47', '2021-11-30 15:21:47'),
('dbdd0e50398c8c7b89c524aa3272226694a4d62499826d50d530d3314ad28d0c1fbffa4b46e1ac78', 4, 1, 'Token', '[]', 0, '2021-11-29 08:26:52', '2021-11-29 08:26:52', '2021-11-30 15:26:52'),
('dedf3f2765909b18f84b717a0433ea7d237c8c6a93d9890e4741d2b72eaa49771ea059c10070696f', 4, 1, 'Token', '[]', 0, '2021-11-29 08:27:55', '2021-11-29 08:27:55', '2021-11-30 15:27:55'),
('e1d123c149d5e3ed0fb4071814796afa0fe564d8a7ccc30affa06c6a3cae4efa0882c3c05cdb6993', 4, 1, 'Token', '[]', 0, '2021-11-29 07:18:09', '2021-11-29 07:18:09', '2021-11-30 14:18:09'),
('e5c0f78d2ab770aedbba0954f92c94854ba15c35ca2bcb84cad9d4e44949de3c68c47f946efdd556', 3, 1, 'Token', '[]', 0, '2021-11-28 13:36:34', '2021-11-28 13:36:34', '2021-11-29 20:36:34'),
('e6950983d538cccdc638ec143556d80a7754ebc04003b170a47949d89ad0f003ee32254fe6df6a9c', 1, 1, 'Token', '[]', 0, '2021-11-29 17:32:25', '2021-11-29 17:32:25', '2021-12-01 00:32:24'),
('e79b5f2504534b7f5bb065d64f4721d785da259da1e4cbb57c906c40ea1312bbe6a47a3bd367d9f0', 3, 1, 'Token', '[]', 0, '2021-11-29 08:40:02', '2021-11-29 08:40:02', '2021-11-30 15:40:01'),
('fd643746f66e16707a1832b894c85195f7ba3bf5e7eb1c2a1cb7d9a222fef61405174b837b909e2d', 4, 1, 'Token', '[]', 0, '2021-11-29 08:27:37', '2021-11-29 08:27:37', '2021-11-30 15:27:37');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'UAYl5q53wMXI1gCQifwMJ3FQNYHyfw6hNJl6g2Tw', NULL, 'http://localhost', 1, 0, 0, '2021-11-28 13:36:27', '2021-11-28 13:36:27'),
(2, NULL, 'Laravel Password Grant Client', 'zNOoGzvdwq7cRhKRuoMSC92GDwRy2Le4ambzp8Wm', 'users', 'http://localhost', 0, 1, 0, '2021-11-28 13:36:27', '2021-11-28 13:36:27');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-11-28 13:36:27', '2021-11-28 13:36:27');

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
-- Table structure for table `rekapitulasi_paten`
--

CREATE TABLE `rekapitulasi_paten` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `instansi_id` bigint(20) UNSIGNED NOT NULL,
  `kelurahan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `perekaman_ktp` double NOT NULL,
  `pengantar_kk` double NOT NULL,
  `ket_pindah` double NOT NULL,
  `ket_domisili` double NOT NULL,
  `pengantar_akta_lahir` double NOT NULL,
  `pengantar_akta_mati` double NOT NULL,
  `pencatatan_perkawinan` double NOT NULL,
  `pencatatan_perceraian` double NOT NULL,
  `skck` double NOT NULL,
  `sktm` double NOT NULL,
  `rekomendasi` double NOT NULL,
  `legalisasi` double NOT NULL,
  `ket_lain` double NOT NULL,
  `imb` double NOT NULL,
  `situ_siup` double NOT NULL,
  `izin_merobohkan_bangunan` double NOT NULL,
  `izin_keramaian` double NOT NULL,
  `izin_partai` double NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `periode` date NOT NULL,
  `is_verified` double NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rekapitulasi_paten`
--

INSERT INTO `rekapitulasi_paten` (`id`, `instansi_id`, `kelurahan`, `perekaman_ktp`, `pengantar_kk`, `ket_pindah`, `ket_domisili`, `pengantar_akta_lahir`, `pengantar_akta_mati`, `pencatatan_perkawinan`, `pencatatan_perceraian`, `skck`, `sktm`, `rekomendasi`, `legalisasi`, `ket_lain`, `imb`, `situ_siup`, `izin_merobohkan_bangunan`, `izin_keramaian`, `izin_partai`, `keterangan`, `periode`, `is_verified`, `created_at`, `updated_at`) VALUES
(1, 3, 'Kelurahan Pandeglang', 2, 1, 3, 2, 3, 2, 4, 3, 3, 3, 3, 5, 3, 3, 3, 4, 3, 4, '3', '2021-11-01', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `instansi_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('Admin','User','Camat') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'User',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `instansi_id`, `name`, `username`, `email`, `password`, `role`, `created_at`, `updated_at`) VALUES
(1, 1, 'Super Admin', 'superadmin', 'superadmin@gmail.com', '$2y$10$2sX.kusFZZrDRnFOG2Sf7Ow1ZAagzBWugDrC3iMbHCJEz4KK9vn2e', 'Admin', '2021-11-26 14:54:45', NULL),
(2, 2, 'Sekretariat Daerah', 'sekda', 'sekda@gmail.com', '$2y$10$144mKgPxFX6FS33Ux8RRa.W4qTakgVgiBmDWmy8ozKCxrgblFT.je', 'Admin', '2021-11-26 14:54:45', NULL),
(3, 3, 'Muhammad Bagya', 'pandeglangkec', 'pandeglangkec@gmail.com', '$2y$10$a3UeeWTABIQgGLf7OcfAt.xG1WkJZ02VugrThe3Kv7QD.bDEoEByO', 'User', '2021-11-26 14:54:45', NULL),
(4, 4, 'Andi Riansyah', 'majasarikec', 'pandeglangkec@gmail.com', '$2y$10$cEJv.4.LUUBkXJmfinfh6.9IUwGQgWXoTDXQLgdnMc2kYqhemupOS', 'User', '2021-11-26 14:54:45', NULL),
(5, 5, 'Fajri', 'kaduhejokec', 'kaduhejokec@gmail.com', '$2y$10$lQy1FZEndsks8n.KMgelLu0oTZOiOdtH/hra/fZ1o6bwFRE3GEzUS', 'User', '2021-11-26 18:04:28', '2021-11-26 18:04:28'),
(9, 3, 'M Arief', 'camatpdg', 'pdgkec@gmail.com', '$2y$10$90fkayWQ3XcBPiFHEw/pMedYmY5bpqkt3pL54FQYMzS2ZhM6wQ.y.', 'Camat', '2021-11-27 05:09:16', '2021-11-27 05:09:16'),
(10, 6, 'Budi Surli', 'banjarkec', 'banjarkec@gmail.com', '$2y$10$c/uyv2IGtEEjbT/cEpR1y.y8il0zf3PhKPlsHf7/O8fTFnyykmhWy', 'User', '2021-11-27 14:08:34', '2021-11-27 14:08:34');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `db_informasi`
--
ALTER TABLE `db_informasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_realisasi_pbb`
--
ALTER TABLE `db_realisasi_pbb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `instansi`
--
ALTER TABLE `instansi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kelurahan`
--
ALTER TABLE `kelurahan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
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
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `rekapitulasi_paten`
--
ALTER TABLE `rekapitulasi_paten`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `db_informasi`
--
ALTER TABLE `db_informasi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `db_realisasi_pbb`
--
ALTER TABLE `db_realisasi_pbb`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instansi`
--
ALTER TABLE `instansi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `kelurahan`
--
ALTER TABLE `kelurahan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rekapitulasi_paten`
--
ALTER TABLE `rekapitulasi_paten`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
