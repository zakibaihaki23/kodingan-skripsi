-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 08, 2021 at 05:10 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_instansi` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instansi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('Admin','User') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `id_instansi`, `name`, `username`, `email`, `password`, `instansi`, `role`, `created_at`, `updated_at`) VALUES
(1, 1, 'Burhan Udin', 'diskomsantik', 'diskomsantik@gmail.com', '$2y$10$gOG10oVw4m6ND40.M5imJO8jS7reU1ioyRVgUQuEoOYdTr2rYbywu', 'Diskomsantik', 'Admin', '2021-06-18 08:12:51', '2021-06-18 08:12:51');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_kependudukan`
--

CREATE TABLE `db_kependudukan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_instansi` bigint(20) UNSIGNED NOT NULL,
  `id_kelurahan` bigint(20) UNSIGNED NOT NULL,
  `instansi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kelurahan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jmlh_penduduk_bln_lalu_l` bigint(20) NOT NULL,
  `jmlh_penduduk_bln_lalu_p` bigint(20) NOT NULL,
  `jmlh_penduduk_bln_lalu_l_p` bigint(20) NOT NULL,
  `lahir_l` bigint(20) NOT NULL,
  `lahir_p` bigint(20) NOT NULL,
  `lahir_l_p` bigint(20) NOT NULL,
  `meninggal_l` bigint(20) NOT NULL,
  `meninggal_p` bigint(20) NOT NULL,
  `meninggal_l_p` bigint(20) NOT NULL,
  `datang_l` bigint(20) NOT NULL,
  `datang_p` bigint(20) NOT NULL,
  `datang_l_p` bigint(20) NOT NULL,
  `pindah_l` bigint(20) NOT NULL,
  `pindah_p` bigint(20) NOT NULL,
  `pindah_l_p` bigint(20) NOT NULL,
  `jmlh_penduduk_bln_ini_l` bigint(20) NOT NULL,
  `jmlh_penduduk_bln_ini_p` bigint(20) NOT NULL,
  `jmlh_penduduk_bln_ini_l_p` bigint(20) NOT NULL,
  `waktu` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_kependudukan`
--

INSERT INTO `db_kependudukan` (`id`, `id_instansi`, `id_kelurahan`, `instansi`, `kelurahan`, `jmlh_penduduk_bln_lalu_l`, `jmlh_penduduk_bln_lalu_p`, `jmlh_penduduk_bln_lalu_l_p`, `lahir_l`, `lahir_p`, `lahir_l_p`, `meninggal_l`, `meninggal_p`, `meninggal_l_p`, `datang_l`, `datang_p`, `datang_l_p`, `pindah_l`, `pindah_p`, `pindah_l_p`, `jmlh_penduduk_bln_ini_l`, `jmlh_penduduk_bln_ini_p`, `jmlh_penduduk_bln_ini_l_p`, `waktu`, `created_at`, `updated_at`) VALUES
(1, 3, 1, 'Kecamatan Pandeglang', 'Kelurahan Babakan Kalanganyar', 2, 2, 4, 2, 3, 5, 1, 2, 3, 2, 3, 5, 1, 1, 2, 1, 0, 1, '2021-06-18', '2021-06-24 00:06:45', '2021-06-24 00:06:45'),
(2, 4, 9, 'Kecamatan Majasari', 'Kelurahan Sukaratu', 2, 2, 4, 2, 3, 5, 1, 2, 3, 2, 3, 5, 1, 1, 2, 1, 0, 1, '2021-11-01', '2021-06-24 01:34:31', '2021-06-24 01:34:31');

-- --------------------------------------------------------

--
-- Table structure for table `db_paten`
--

CREATE TABLE `db_paten` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_instansi` bigint(20) UNSIGNED NOT NULL,
  `id_kelurahan` bigint(20) UNSIGNED NOT NULL,
  `instansi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kelurahan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `perekaman_ktp` bigint(20) NOT NULL,
  `pengantar_kk` bigint(20) NOT NULL,
  `ket_pindah` bigint(20) NOT NULL,
  `ket_domisili` bigint(20) NOT NULL,
  `pengantar_akta_lahir` bigint(20) NOT NULL,
  `pencatatan_lahir_mati` bigint(20) NOT NULL,
  `pencatatan_perkawinan` bigint(20) NOT NULL,
  `pencatatan_perceraian` bigint(20) NOT NULL,
  `skck` bigint(20) NOT NULL,
  `sktm` bigint(20) NOT NULL,
  `rekomendasi` bigint(20) NOT NULL,
  `legalisasi` bigint(20) NOT NULL,
  `ket_lain` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imb` bigint(20) NOT NULL,
  `situ_siup` bigint(20) NOT NULL,
  `merobohkan_bangunan` bigint(20) NOT NULL,
  `izin_keramaian` bigint(20) NOT NULL,
  `izin_partai` bigint(20) NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `waktu` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_realisasi_pbb`
--

CREATE TABLE `db_realisasi_pbb` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_instansi` bigint(20) UNSIGNED NOT NULL,
  `id_kelurahan` bigint(20) UNSIGNED NOT NULL,
  `instansi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kelurahan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_pbb` double NOT NULL,
  `realisasi_bln_lalu` double NOT NULL,
  `realisasi_bln_ini` double NOT NULL,
  `jmlh_realisasi` double NOT NULL,
  `sisa_target` double NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `waktu` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_realisasi_pbb`
--

INSERT INTO `db_realisasi_pbb` (`id`, `id_instansi`, `id_kelurahan`, `instansi`, `kelurahan`, `target_pbb`, `realisasi_bln_lalu`, `realisasi_bln_ini`, `jmlh_realisasi`, `sisa_target`, `keterangan`, `waktu`, `created_at`, `updated_at`) VALUES
(23, 4, 8, 'Kecamatan Majasari', 'Kelurahan Saruni', 10000, 20000, 9000, 10000, 0, 'ngutang dulu boss', '2021-06-20', '2021-10-18 19:40:39', '2021-10-18 19:40:39'),
(24, 4, 8, 'Kecamatan Majasari', 'Kelurahan Saruni', 10000, 20000, 9000, 10000, 0, 'ngutang dulu boss', '2021-07-20', '2021-10-18 19:40:46', '2021-10-18 19:40:46'),
(25, 4, 9, 'Kecamatan Majasari', 'Kelurahan Sukaratu', 100000, 100000, 100000, 1, 100000, 'Tidak ada', '2021-06-01', '2021-10-18 23:56:59', '2021-10-18 23:56:59'),
(26, 4, 9, 'Kecamatan Majasari', 'Kelurahan Sukaratu', 1111, 111, 1111, 1, 11111, '11', '2021-07-01', '2021-10-19 00:10:37', '2021-10-19 00:10:37'),
(28, 3, 4, 'Kecamatan Pandeglang', 'Kelurahan Pandeglang', 111, 111, 11, 1, 111, '11', '2021-01-01', '2021-10-22 00:26:46', '2021-10-22 00:26:46'),
(29, 3, 4, 'Kecamatan Pandeglang', 'Kelurahan Pandeglang', 166, 100, 189, 1, 199, '1', '2021-07-01', '2021-10-22 00:32:54', '2021-10-22 00:32:54'),
(30, 4, 5, 'Kecamatan Majasari', 'Kelurahan Cilaja', 100000, 90000, 100000, 1, 10000, '1', '2021-06-01', '2021-10-25 06:27:42', '2021-10-25 06:27:42'),
(31, 4, 5, 'Kecamatan Majasari', 'Kelurahan Cilaja', 1111, 1111, 1111, 1111, 111, '111', '2021-08-01', '2021-10-25 15:07:35', '2021-10-25 15:07:35'),
(32, 4, 9, 'Kecamatan Majasari', 'Kelurahan Sukaratu', 111, 111, 111, 111, 111, '11', '2021-12-01', '2021-10-25 15:08:05', '2021-10-25 15:08:05'),
(33, 4, 9, 'Kecamatan Majasari', 'Kelurahan Sukaratu', 1212, 1212, 1212, 1, 1212, '1212', '2021-11-01', '2021-11-03 12:56:43', '2021-11-03 12:56:43'),
(34, 24, 10, 'Kecamatan Mandalawangi', 'Kelurahan Mandalawangi', 1212, 1212, 1212, 1, 1212, '22', '2021-11-01', '2021-11-04 04:24:33', '2021-11-04 04:24:33'),
(35, 24, 11, 'Kecamatan Mandalawangi', 'Pandat', 12, 1212, 1212, 1, 1212, '11', '2021-12-01', '2021-11-04 04:24:52', '2021-11-04 04:24:52');

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
-- Table structure for table `genders`
--

CREATE TABLE `genders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `instansi`
--

CREATE TABLE `instansi` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `instansi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lat` float(10,6) DEFAULT NULL,
  `lng` float(10,6) DEFAULT NULL,
  `role` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'User',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `instansi`
--

INSERT INTO `instansi` (`id`, `instansi`, `lat`, `lng`, `role`, `created_at`, `updated_at`) VALUES
(1, 'Sekretariat Daerah', NULL, NULL, 'Admin', '2021-06-18 05:37:11', '2021-06-18 05:37:11'),
(2, 'Diskomsantik', NULL, NULL, 'Admin', '2021-06-18 05:37:35', '2021-06-18 05:37:35'),
(3, 'Kecamatan Pandeglang', -6.310473, 106.110413, 'User', '2021-06-18 05:37:41', '2021-06-18 05:37:41'),
(4, 'Kecamatan Majasari', -6.328842, 106.093506, 'User', '2021-06-18 05:37:51', '2021-06-18 05:37:51'),
(5, 'Kecamatan Angsana', NULL, NULL, 'User', '2021-06-18 05:37:56', '2021-06-18 05:37:56'),
(6, 'Kecamatan Banjar', NULL, NULL, 'User', '2021-06-18 05:37:59', '2021-06-18 05:37:59'),
(7, 'Kecamatan Bojong', NULL, NULL, 'User', '2021-06-18 05:38:03', '2021-06-18 05:38:03'),
(8, 'Kecamatan Cadasari', NULL, NULL, 'User', '2021-06-18 05:38:08', '2021-06-18 05:38:08'),
(9, 'Kecamatan Carita', NULL, NULL, 'User', '2021-06-18 05:38:13', '2021-06-18 05:38:13'),
(10, 'Kecamatan Cibaliung', NULL, NULL, 'User', '2021-06-18 05:38:22', '2021-06-18 05:38:22'),
(11, 'Kecamatan Cibitung', NULL, NULL, 'User', '2021-06-18 05:38:29', '2021-06-18 05:38:29'),
(12, 'Kecamatan Cigeulis', NULL, NULL, 'User', '2021-06-18 05:38:36', '2021-06-18 05:38:36'),
(13, 'Kecamatan Cikedal', NULL, NULL, 'User', '2021-06-18 05:38:40', '2021-06-18 05:38:40'),
(14, 'Kecamatan Cikeusik', NULL, NULL, 'User', '2021-06-18 05:38:47', '2021-06-18 05:38:47'),
(15, 'Kecamatan Cimanggu', NULL, NULL, 'User', '2021-06-18 05:38:52', '2021-06-18 05:38:52'),
(16, 'Kecamatan Cimanuk', NULL, NULL, 'User', '2021-06-18 05:38:56', '2021-06-18 05:38:56'),
(17, 'Kecamatan Cipeucang', NULL, NULL, 'User', '2021-06-18 05:39:00', '2021-06-18 05:39:00'),
(18, 'Kecamatan Cisata', NULL, NULL, 'User', '2021-06-18 05:39:04', '2021-06-18 05:39:04'),
(19, 'Kecamatan Jiput', NULL, NULL, 'User', '2021-06-18 05:39:13', '2021-06-18 05:39:13'),
(20, 'Kecamatan Kaduhejo', NULL, NULL, 'User', '2021-06-18 05:39:18', '2021-06-18 05:39:18'),
(21, 'Kecamatan Karang Tanjung', NULL, NULL, 'User', '2021-06-18 05:39:25', '2021-06-18 05:39:25'),
(22, 'Kecamatan Koroncong', NULL, NULL, 'User', '2021-06-18 05:39:32', '2021-06-18 05:39:32'),
(23, 'Kecamatan Labuan', NULL, NULL, 'User', '2021-06-18 05:39:37', '2021-06-18 05:39:37'),
(24, 'Kecamatan Mandalawangi', -6.309857, 105.988838, 'User', '2021-06-18 05:39:44', '2021-06-18 05:39:44'),
(25, 'Kecamatan Mekarjaya', NULL, NULL, 'User', '2021-06-18 05:39:51', '2021-06-18 05:39:51'),
(26, 'Kecamatan Menes', NULL, NULL, 'User', '2021-06-18 05:39:55', '2021-06-18 05:39:55'),
(27, 'Kecamatan Munjul', NULL, NULL, 'User', '2021-06-18 05:39:59', '2021-06-18 05:39:59'),
(28, 'Kecamatan Pagelaran', NULL, NULL, 'User', '2021-06-18 05:40:08', '2021-06-18 05:40:08'),
(29, 'Kecamatan Panimbang', NULL, NULL, 'User', '2021-06-18 05:40:12', '2021-06-18 05:40:12'),
(30, 'Kecamatan Patia', NULL, NULL, 'User', '2021-06-18 05:40:18', '2021-06-18 05:40:18'),
(31, 'Kecamatan Picung', NULL, NULL, 'User', '2021-06-18 05:40:21', '2021-06-18 05:40:21'),
(32, 'Kecamatan Pulosari', NULL, NULL, 'User', '2021-06-18 05:40:27', '2021-06-18 05:40:27'),
(33, 'Kecamatan Saketi', NULL, NULL, 'User', '2021-06-18 05:40:32', '2021-06-18 05:40:32'),
(34, 'Kecamatan Sindangresmi', NULL, NULL, 'User', '2021-06-18 05:40:39', '2021-06-18 05:40:39'),
(35, 'Kecamatan Sobang', NULL, NULL, 'User', '2021-06-18 05:40:43', '2021-06-18 05:40:43'),
(36, 'Kecamatan Sukaresmi', NULL, NULL, 'User', '2021-06-18 05:40:48', '2021-06-18 05:40:48'),
(37, 'Kecamatan Sumur', NULL, NULL, 'User', '2021-06-18 05:40:51', '2021-06-18 05:40:51');

-- --------------------------------------------------------

--
-- Table structure for table `kelurahan`
--

CREATE TABLE `kelurahan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_instansi` bigint(20) UNSIGNED NOT NULL,
  `kelurahan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kelurahan`
--

INSERT INTO `kelurahan` (`id`, `id_instansi`, `kelurahan`, `created_at`, `updated_at`) VALUES
(1, 3, 'Kelurahan Babakan Kalanganyar', '2021-06-18 06:09:02', '2021-06-18 06:09:02'),
(2, 3, 'Kelurahan Kabayan', '2021-06-18 06:09:12', '2021-06-18 06:09:12'),
(3, 3, 'Kelurahan Kadomas', '2021-06-18 06:09:15', '2021-06-18 06:09:15'),
(4, 3, 'Kelurahan Pandeglang', '2021-06-18 06:09:19', '2021-06-18 06:09:19'),
(5, 4, 'Kelurahan Cilaja', '2021-06-18 06:09:45', '2021-06-18 06:09:45'),
(6, 4, 'Kelurahan Karaton', '2021-06-18 06:09:53', '2021-06-18 06:09:53'),
(7, 4, 'Kelurahan Pagerbatu', '2021-06-18 06:10:03', '2021-06-18 06:10:03'),
(8, 4, 'Kelurahan Saruni', '2021-06-18 06:10:08', '2021-06-18 06:10:08'),
(9, 4, 'Kelurahan Sukaratu', '2021-06-18 06:10:13', '2021-06-18 06:10:13'),
(10, 24, 'Kelurahan Mandalawangi', NULL, NULL),
(11, 24, 'Pandat', NULL, NULL);

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
(40, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(41, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(42, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(43, '2016_06_01_000004_create_oauth_clients_table', 1),
(44, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(45, '2019_08_19_000000_create_failed_jobs_table', 1),
(46, '2020_12_15_085143_create_persons_table', 1),
(47, '2020_12_15_090123_create_genders_table', 1),
(48, '2020_12_15_091346_create_countries_table', 1),
(49, '2020_12_16_034728_create_tree_table', 1),
(50, '2021_06_18_123004_create_kecamatan_table', 1),
(51, '2021_06_18_123114_create_users_table', 1),
(52, '2021_06_18_124524_create_admins_table', 1),
(53, '2021_06_18_134125_create_kelurahans_table', 2),
(54, '2021_06_18_135453_create_p_b_b_s_table', 3),
(55, '2021_06_19_114023_create_patens_table', 4),
(56, '2021_06_24_064103_create_kependudukans_table', 5);

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
('0799231b1eb4f55db8fd6d9e72d9574b451548953971914691e2f66847a57e3c77f192edb6e87221', 5, 3, 'Token', '[]', 0, '2021-10-28 05:56:19', '2021-10-28 05:56:19', '2021-10-29 12:56:19'),
('086b0a0b068d751fb3fcbd7989ea446767209f82d62be9b2eca6c53e509ed2ee65213fd201b0120f', 1, 3, 'Token', '[]', 0, '2021-11-03 09:43:30', '2021-11-03 09:43:30', '2021-11-04 16:43:30'),
('0a38048fd3ab7b320f62414a703067ac77cb016c5953a98adf01beefa0e755b5ecc5dd05f8635522', 5, 3, 'Token', '[]', 0, '2021-10-28 06:03:03', '2021-10-28 06:03:03', '2021-10-29 13:03:03'),
('191a340566af84652d4bff5ab67294e0508f8ffd321ffad0a4bdc091f79d39a156023cad5f5cbc83', 2, 3, 'Token', '[]', 0, '2021-10-28 05:02:54', '2021-10-28 05:02:54', '2021-10-29 12:02:54'),
('1f1fe1b8980476f0407589b080cd1136e187a5a66915e449e2b72e1f2599aa49982660bf17a64400', 2, 3, 'Token', '[]', 0, '2021-10-29 06:07:50', '2021-10-29 06:07:50', '2021-10-30 13:07:50'),
('24ca68e66e51e8dc9f0cca12f2599cbad62d6ad02180a9739b393e2f8782c40d96bf07b15e186cf2', 6, 3, 'Token', '[]', 0, '2021-11-04 04:24:14', '2021-11-04 04:24:14', '2021-11-05 11:24:13'),
('250e861cb60964cac45273b3c2fbd5115c1f9265d310d93dbcc8af710872f8cdf54961789d29cb9c', 5, 3, 'Token', '[]', 0, '2021-11-03 09:34:57', '2021-11-03 09:34:57', '2021-11-04 16:34:57'),
('2676b320ca366ddff267c8db10697833c230397bbe2006db29dfdc07657897802daafb4d0d9e2c34', 1, 3, 'Token', '[]', 0, '2021-11-03 09:34:18', '2021-11-03 09:34:18', '2021-11-04 16:34:18'),
('39a1ed5fa213def78743a42c7a25a481f4b84ab386a90e0f112e566a518d31ccbfadfa156ade39ab', 2, 3, 'Token', '[]', 0, '2021-10-28 04:52:39', '2021-10-28 04:52:39', '2021-10-29 11:52:39'),
('3fa3ef6b68219b0395b3818e72b27ed1c6cce63dde91528daf33d5a003177a0468b0abb28f165fd3', 1, 3, 'Token', '[]', 0, '2021-11-03 09:28:07', '2021-11-03 09:28:07', '2021-11-04 16:28:07'),
('4488abebb05a8a7da37a1aa84db91d11e4554a61215de720053103ef509695d59e468110c3ad2a4d', 5, 3, 'Token', '[]', 0, '2021-11-03 15:30:26', '2021-11-03 15:30:26', '2021-11-04 22:30:26'),
('49eba4753ab8d1d93066caa1a8581b119a31c7f17243b4bb4de7d4d087f77c19d7a9e2fba19bc224', 5, 3, 'Token', '[]', 0, '2021-10-28 07:02:59', '2021-10-28 07:02:59', '2021-10-29 14:02:59'),
('580de993ac8085abd767998f9e1a34becdcfc43b80eefa63ed6a07ba81dcf79dc2867e5f73abaedb', 3, 3, 'Token', '[]', 0, '2021-11-04 04:20:34', '2021-11-04 04:20:34', '2021-11-05 11:20:34'),
('585856610b8a3588b0a39303c457e8b8b0504c8cb44bfcb3047e09ee546cf7e1fd1f3b5729ec9d86', 2, 3, 'Token', '[]', 0, '2021-10-28 05:31:34', '2021-10-28 05:31:34', '2021-10-29 12:31:34'),
('59ced31fa9f4716ac9f3b91e10115472783464a4e187c5ce2a018090809d3cef4e83d2b5e2bd02c8', 5, 3, 'Token', '[]', 0, '2021-10-28 05:30:55', '2021-10-28 05:30:55', '2021-10-29 12:30:55'),
('5d69a00dab0d23aa8e0d3ea87e3f1253852638faa5e3b4075a45b66cbc92a54eee44e27a91668107', 5, 3, 'Token', '[]', 0, '2021-10-28 05:56:38', '2021-10-28 05:56:38', '2021-10-29 12:56:38'),
('60197371b2738acf6c4379bfefca3cc8bb9f162421da59608762d237953648dfe7ae45e343037d7c', 2, 3, 'Token', '[]', 0, '2021-10-28 06:24:10', '2021-10-28 06:24:10', '2021-10-29 13:24:10'),
('64cd6c6ab173349ae792b399661c605b2070973b4183c2b91cd7f1b8c18e0c2e793bd241655252fe', 5, 3, 'Token', '[]', 0, '2021-11-03 15:57:56', '2021-11-03 15:57:56', '2021-11-04 22:57:56'),
('6d9cb28e3b28bfa5a1ec46947f849bf8ed467dee2cc692dcf15ee7b523830ebd7f57dfba95460ac1', 5, 3, 'Token', '[]', 0, '2021-11-04 04:36:47', '2021-11-04 04:36:47', '2021-11-05 11:36:46'),
('72143449504e75d153dc65c0405ee3546b7eb09dadfeaf903bc80ea62d8fc0f79ab59d3f6bcc7a91', 5, 3, 'Token', '[]', 0, '2021-11-03 12:40:11', '2021-11-03 12:40:11', '2021-11-04 19:40:11'),
('7ae54f83ea6c901bc3fdc36e545bac7a2483d951b3eed60c6eb9cacca52b86a646ad469484818d26', 5, 3, 'Token', '[]', 0, '2021-10-28 05:31:24', '2021-10-28 05:31:24', '2021-10-29 12:31:24'),
('7b00f00a01370c51b096df1c933469f7cb697fa72211ec82cd29f9b7841a9152d9e5543e4c06af85', 5, 3, 'Token', '[]', 0, '2021-11-03 12:40:23', '2021-11-03 12:40:23', '2021-11-04 19:40:23'),
('7ba8460e0bc25c6af865f37a25e67eae6995cd94a8522346d24b1c1dc4afb8786a4b5050c3a5a64d', 1, 3, 'Token', '[]', 0, '2021-11-03 09:38:40', '2021-11-03 09:38:40', '2021-11-04 16:38:40'),
('7cb8bccfb771ebfa3fe7f6c0837046eb38eb10d65e2d405e962eb5a142032e398e66b47c666e7cb8', 5, 3, 'Token', '[]', 0, '2021-11-03 15:58:20', '2021-11-03 15:58:20', '2021-11-04 22:58:20'),
('83bff3c5a0481796c4bd7c93b302b2c5ef9285b07c541a19060ae0fb1bc62170d96cb3aefc0e63fc', 5, 3, 'Token', '[]', 0, '2021-10-28 07:52:30', '2021-10-28 07:52:30', '2021-10-29 14:52:30'),
('895564069d702db40cdd76c77b6a72dcb6075f42f1678f9b5cb041eff65aa77894bf64a677505dcf', 5, 3, 'Token', '[]', 0, '2021-10-28 07:34:53', '2021-10-28 07:34:53', '2021-10-29 14:34:53'),
('8c1649a2c820516393534ab350ded6010f9c88a6a3f24d01eb438957a6397fbb2959629b027ad186', 2, 3, 'Token', '[]', 0, '2021-10-28 07:54:53', '2021-10-28 07:54:53', '2021-10-29 14:54:53'),
('900f3e03ff6bfb1c8d244e2bd9a40b565919011d24edcf0f5657220265f233e2d3583ab4caf66ad0', 5, 3, 'Token', '[]', 0, '2021-10-28 05:32:48', '2021-10-28 05:32:48', '2021-10-29 12:32:48'),
('923e9c0391f33fcdf5725d1416e89661299bd92648e062e1e4d6a2eb11dc69a4df9f31d61aeefcaf', 5, 3, 'Token', '[]', 0, '2021-10-28 05:16:45', '2021-10-28 05:16:45', '2021-10-29 12:16:45'),
('92ccafa8f8ef717c92417fc30581c3e67c74ed3981432e172f805b75f8eb96fd2d5e81874956491f', 2, 3, 'Token', '[]', 0, '2021-11-03 09:35:08', '2021-11-03 09:35:08', '2021-11-04 16:35:08'),
('95c966eaa8a3dd3a96f45e8f1abdaea26d86e731da9a6cbf1fff1c8f652fe5b9f7e48dfb9e1b64f9', 5, 3, 'Token', '[]', 0, '2021-10-28 05:27:15', '2021-10-28 05:27:15', '2021-10-29 12:27:15'),
('9a4c6e8684ff377cc24773a3652ccb465e68b813483ef455cb1872fa2fd5b747cf448ca136236376', 5, 3, 'Token', '[]', 0, '2021-10-28 05:32:27', '2021-10-28 05:32:27', '2021-10-29 12:32:27'),
('9c542398c8a9a7f48c05c75647dabb1705d91ab39f242476c76e848e9847ca06f38504c3bcac8a9d', 5, 3, 'Token', '[]', 0, '2021-10-28 04:56:25', '2021-10-28 04:56:25', '2021-10-29 11:56:25'),
('9df1124a685e512d93988a02ae775a4ee117e3f63145b39a48ad39e506404f6caed2df91de83ac50', 1, 3, 'Token', '[]', 0, '2021-10-28 04:48:53', '2021-10-28 04:48:53', '2021-10-29 11:48:53'),
('b28a3811f3476717971c9cf85267c691f674a7cc3016de3afa3ae58598c22366dd039ceee926a911', 5, 3, 'Token', '[]', 0, '2021-10-28 06:03:26', '2021-10-28 06:03:26', '2021-10-29 13:03:26'),
('bef5bedd1c092d1a8229cb6a3db1173611b654f3e1dc70ec7efa2d4d0747cf85f88636b60e28a5d2', 5, 3, 'Token', '[]', 0, '2021-10-28 05:29:38', '2021-10-28 05:29:38', '2021-10-29 12:29:38'),
('bf3ca94ef5db15de42b83acc5f0796b110440fcb815c2b4b4e6158c9a2e0846389177538e03a2d96', 5, 3, 'Token', '[]', 0, '2021-11-03 15:55:44', '2021-11-03 15:55:44', '2021-11-04 22:55:44'),
('cd4a61e9749b4964c9dfdfa30d3c20721a5d83654394fb24c337e3ecee903b45ce3ddbe87e6e65df', 2, 3, 'Token', '[]', 0, '2021-10-28 07:44:01', '2021-10-28 07:44:01', '2021-10-29 14:44:01'),
('d4b303ae73f03b1a1a73138db1fb326a7fe1a2da444826c45e1041a5c5f5abe26eec33e515c50e6e', 5, 3, 'Token', '[]', 0, '2021-11-03 11:17:44', '2021-11-03 11:17:44', '2021-11-04 18:17:43'),
('d8d0e63c73ea8e592d0ff4b901c1e0b1e79b311f09fb66893def72fe334287a7832984c0dc6e7658', 2, 3, 'Token', '[]', 0, '2021-10-28 06:11:23', '2021-10-28 06:11:23', '2021-10-29 13:11:23'),
('dc852eccb1d58e489b2ec8ab13add558f0c38b74ac1b56ee447d5b886f7cbe6617ec8d557e8e89d7', 1, 3, 'Token', '[]', 0, '2021-11-03 09:36:38', '2021-11-03 09:36:38', '2021-11-04 16:36:38'),
('e1cde7bc135ff108ac5998b667b96bca05625d49ce46467df99d047370e2c184f463ebf3c7726559', 5, 3, 'Token', '[]', 0, '2021-10-28 04:40:33', '2021-10-28 04:40:33', '2021-10-29 11:40:33'),
('f04d793fc248354df5f9358857d927ad12de9c76a0b9ab2d5cf6e5601dd9f5fe836cf954e30b433e', 5, 3, 'Token', '[]', 0, '2021-11-03 09:43:18', '2021-11-03 09:43:18', '2021-11-04 16:43:18'),
('f79797b69bb40e6a3b6f914a8cfd503789bb5bd0d812ae22d6b0bf51d39cef6614ba04f4cff361d6', 5, 3, 'Token', '[]', 0, '2021-10-28 04:54:59', '2021-10-28 04:54:59', '2021-10-29 11:54:59'),
('ff2b409348c6e1b82f9b9ac365e5bc53bbc693043c62ff248348eba22e4a425412b11a712a2b99cd', 2, 3, 'Token', '[]', 0, '2021-10-28 04:56:15', '2021-10-28 04:56:15', '2021-10-29 11:56:15'),
('ff6c564932514882c96497bc4c23654dd9f86b1eb32ca4b62c6ab81b25058a6e1afa90329121c762', 2, 3, 'Token', '[]', 0, '2021-11-03 12:49:20', '2021-11-03 12:49:20', '2021-11-04 19:49:20');

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
(1, NULL, 'Laravel Personal Access Client', 'gw8O8gGjlWuImd5CB5a5zprKt49EaTUqrcd71Je6', NULL, 'http://localhost', 1, 0, 0, '2021-06-18 06:32:33', '2021-06-18 06:32:33'),
(2, NULL, 'Laravel Password Grant Client', 'pFlKB5JkSk0j2GmFWXZzqce6yIutVqXtWhdyS4JT', 'users', 'http://localhost', 0, 1, 0, '2021-06-18 06:32:33', '2021-06-18 06:32:33'),
(3, NULL, 'Laravel Personal Access Client', 'wC5PXQ0ZouCoGkkUDTRUBhaB9RzAsa2yqqIcrOIS', NULL, 'http://localhost', 1, 0, 0, '2021-06-18 06:32:41', '2021-06-18 06:32:41'),
(4, NULL, 'Laravel Password Grant Client', 'HXAUHVuFIDjp4I4TJ7nEzfRltJnNdAXmOtSQKTUn', 'users', 'http://localhost', 0, 1, 0, '2021-06-18 06:32:41', '2021-06-18 06:32:41');

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
(1, 1, '2021-06-18 06:32:33', '2021-06-18 06:32:33'),
(2, 3, '2021-06-18 06:32:41', '2021-06-18 06:32:41');

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
-- Table structure for table `persons`
--

CREATE TABLE `persons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` date NOT NULL,
  `gender_id` int(10) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `birth_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_country_id` int(10) UNSIGNED NOT NULL,
  `residence_country_id` int(10) UNSIGNED NOT NULL,
  `hometown` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_living` tinyint(1) NOT NULL DEFAULT 1,
  `story` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `peta`
--

CREATE TABLE `peta` (
  `id` int(11) NOT NULL,
  `lat` float(10,6) NOT NULL,
  `lng` float(10,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `peta`
--

INSERT INTO `peta` (`id`, `lat`, `lng`) VALUES
(1, -6.577255, 105.860458),
(2, -6.706574, 105.687775),
(3, -6.309580, 106.107262);

-- --------------------------------------------------------

--
-- Table structure for table `tree`
--

CREATE TABLE `tree` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `person_id` int(10) UNSIGNED NOT NULL,
  `father_id` int(10) UNSIGNED DEFAULT NULL,
  `mother_id` int(10) UNSIGNED DEFAULT NULL,
  `spouse_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_instansi` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `instansi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('Admin','User') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'User',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `id_instansi`, `name`, `username`, `email`, `password`, `instansi`, `role`, `created_at`, `updated_at`) VALUES
(1, 3, 'Ahmad Budi', 'pandeglangkec', 'pandeglangkec@gmail.com', '$2y$10$7XQNQmJboGAW32MUkWqUFuUFCC0Qp/b3TF/v5xn/X/KeII24UR60S', 'Kecamatan Pandeglang', 'User', '2021-06-18 06:14:43', '2021-10-26 03:52:41'),
(2, 4, 'Budi', 'majasarikec', 'majasarikec@gmail.com', '$2y$10$GckGlQ/HV38ZpcifUvDoD.L3T56F/oAyRca0DM.XxHAfNBHFSz3me', 'Kecamatan Majasari', 'User', '2021-06-18 06:24:31', '2021-06-18 06:24:31'),
(5, 1, 'mbajja', 'mbajabaja', 'mbaja@email.com', '$2y$10$dbvsgx1iPUrnND7hx76XPuXLCDzfpzwhcjGT2o8drV4Lvx0GLPzsG', 'Sekretariat Daerah', 'Admin', '2021-10-14 19:57:37', '2021-10-28 07:37:22'),
(6, 24, 'Muhammad Mandala', 'manalawangikec', 'mandala@email.com', '$2y$10$JuHu0Z2Ez3408OfHoP/FiOVFNoo2gR4je1T/DUeakYcgQRfkH7vUe', 'Kecamatan Mandalawangi', 'User', '2021-11-04 04:23:55', '2021-11-04 04:23:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id_instansi_foreign` (`id_instansi`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_kependudukan`
--
ALTER TABLE `db_kependudukan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `db_kependudukan_id_instansi_foreign` (`id_instansi`),
  ADD KEY `db_kependudukan_id_kelurahan_foreign` (`id_kelurahan`);

--
-- Indexes for table `db_paten`
--
ALTER TABLE `db_paten`
  ADD PRIMARY KEY (`id`),
  ADD KEY `db_paten_id_instansi_foreign` (`id_instansi`),
  ADD KEY `db_paten_id_kelurahan_foreign` (`id_kelurahan`);

--
-- Indexes for table `db_realisasi_pbb`
--
ALTER TABLE `db_realisasi_pbb`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_instansi` (`id_instansi`),
  ADD KEY `id_kelurahan` (`id_kelurahan`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genders`
--
ALTER TABLE `genders`
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
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelurahan_id_instansi_foreign` (`id_instansi`);

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
-- Indexes for table `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peta`
--
ALTER TABLE `peta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tree`
--
ALTER TABLE `tree`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_id_instansi_foreign` (`id_instansi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_kependudukan`
--
ALTER TABLE `db_kependudukan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `db_paten`
--
ALTER TABLE `db_paten`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_realisasi_pbb`
--
ALTER TABLE `db_realisasi_pbb`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `genders`
--
ALTER TABLE `genders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `instansi`
--
ALTER TABLE `instansi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `kelurahan`
--
ALTER TABLE `kelurahan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `persons`
--
ALTER TABLE `persons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `peta`
--
ALTER TABLE `peta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tree`
--
ALTER TABLE `tree`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_id_instansi_foreign` FOREIGN KEY (`id_instansi`) REFERENCES `instansi` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `db_kependudukan`
--
ALTER TABLE `db_kependudukan`
  ADD CONSTRAINT `db_kependudukan_id_instansi_foreign` FOREIGN KEY (`id_instansi`) REFERENCES `instansi` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `db_kependudukan_id_kelurahan_foreign` FOREIGN KEY (`id_kelurahan`) REFERENCES `kelurahan` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `db_paten`
--
ALTER TABLE `db_paten`
  ADD CONSTRAINT `db_paten_id_instansi_foreign` FOREIGN KEY (`id_instansi`) REFERENCES `instansi` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `db_paten_id_kelurahan_foreign` FOREIGN KEY (`id_kelurahan`) REFERENCES `kelurahan` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `db_realisasi_pbb`
--
ALTER TABLE `db_realisasi_pbb`
  ADD CONSTRAINT `db_realisasi_pbb_ibfk_1` FOREIGN KEY (`id_instansi`) REFERENCES `instansi` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `db_realisasi_pbb_ibfk_2` FOREIGN KEY (`id_kelurahan`) REFERENCES `kelurahan` (`id`);

--
-- Constraints for table `kelurahan`
--
ALTER TABLE `kelurahan`
  ADD CONSTRAINT `kelurahan_id_instansi_foreign` FOREIGN KEY (`id_instansi`) REFERENCES `instansi` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_id_instansi_foreign` FOREIGN KEY (`id_instansi`) REFERENCES `instansi` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
