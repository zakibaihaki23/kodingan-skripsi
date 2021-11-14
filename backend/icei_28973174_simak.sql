-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 25, 2021 at 01:02 PM
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
(2, 4, 9, 'Kecamatan Majasari', 'Kelurahan Sukaratu', 2, 2, 4, 2, 3, 5, 1, 2, 3, 2, 3, 5, 1, 1, 2, 1, 0, 1, '2021-06-18', '2021-06-24 01:34:31', '2021-06-24 01:34:31');

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
(3, 4, 8, 'Kecamatan Majasari', 'Kelurahan Saruni', 90000, 60000, 90000, 10, 0, 'Sempurna', '2021-01-01', '2021-06-18 07:58:46', '2021-06-18 07:58:46'),
(5, 3, 4, 'Kecamatan Pandeglang', 'Kelurahan Pandeglang', 0, 20000, 9000, 10000, 0, 'ngutang dulu boss', '2021-01-01', '2021-06-18 09:21:38', '2021-06-19 05:50:23'),
(8, 4, 9, 'Kecamatan Majasari', 'Kelurahan Sukaratu', 9000000, 100000, 900000, 9, 10000000, 'Mantap', '2021-06-01', '2021-06-22 08:26:46', '2021-06-22 08:26:46');

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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `instansi`
--

INSERT INTO `instansi` (`id`, `instansi`, `created_at`, `updated_at`) VALUES
(1, 'Sekretariat Daerah', '2021-06-18 05:37:11', '2021-06-18 05:37:11'),
(2, 'Diskomsantik', '2021-06-18 05:37:35', '2021-06-18 05:37:35'),
(3, 'Kecamatan Pandeglang', '2021-06-18 05:37:41', '2021-06-18 05:37:41'),
(4, 'Kecamatan Majasari', '2021-06-18 05:37:51', '2021-06-18 05:37:51'),
(5, 'Kecamatan Angsana', '2021-06-18 05:37:56', '2021-06-18 05:37:56'),
(6, 'Kecamatan Banjar', '2021-06-18 05:37:59', '2021-06-18 05:37:59'),
(7, 'Kecamatan Bojong', '2021-06-18 05:38:03', '2021-06-18 05:38:03'),
(8, 'Kecamatan Cadasari', '2021-06-18 05:38:08', '2021-06-18 05:38:08'),
(9, 'Kecamatan Carita', '2021-06-18 05:38:13', '2021-06-18 05:38:13'),
(10, 'Kecamatan Cibaliung', '2021-06-18 05:38:22', '2021-06-18 05:38:22'),
(11, 'Kecamatan Cibitung', '2021-06-18 05:38:29', '2021-06-18 05:38:29'),
(12, 'Kecamatan Cigeulis', '2021-06-18 05:38:36', '2021-06-18 05:38:36'),
(13, 'Kecamatan Cikedal', '2021-06-18 05:38:40', '2021-06-18 05:38:40'),
(14, 'Kecamatan Cikeusik', '2021-06-18 05:38:47', '2021-06-18 05:38:47'),
(15, 'Kecamatan Cimanggu', '2021-06-18 05:38:52', '2021-06-18 05:38:52'),
(16, 'Kecamatan Cimanuk', '2021-06-18 05:38:56', '2021-06-18 05:38:56'),
(17, 'Kecamatan Cipeucang', '2021-06-18 05:39:00', '2021-06-18 05:39:00'),
(18, 'Kecamatan Cisata', '2021-06-18 05:39:04', '2021-06-18 05:39:04'),
(19, 'Kecamatan Jiput', '2021-06-18 05:39:13', '2021-06-18 05:39:13'),
(20, 'Kecamatan Kaduhejo', '2021-06-18 05:39:18', '2021-06-18 05:39:18'),
(21, 'Kecamatan Karang Tanjung', '2021-06-18 05:39:25', '2021-06-18 05:39:25'),
(22, 'Kecamatan Koroncong', '2021-06-18 05:39:32', '2021-06-18 05:39:32'),
(23, 'Kecamatan Labuan', '2021-06-18 05:39:37', '2021-06-18 05:39:37'),
(24, 'Kecamatan Mandalawangi', '2021-06-18 05:39:44', '2021-06-18 05:39:44'),
(25, 'Kecamatan Mekarjaya', '2021-06-18 05:39:51', '2021-06-18 05:39:51'),
(26, 'Kecamatan Menes', '2021-06-18 05:39:55', '2021-06-18 05:39:55'),
(27, 'Kecamatan Munjul', '2021-06-18 05:39:59', '2021-06-18 05:39:59'),
(28, 'Kecamatan Pagelaran', '2021-06-18 05:40:08', '2021-06-18 05:40:08'),
(29, 'Kecamatan Panimbang', '2021-06-18 05:40:12', '2021-06-18 05:40:12'),
(30, 'Kecamatan Patia', '2021-06-18 05:40:18', '2021-06-18 05:40:18'),
(31, 'Kecamatan Picung', '2021-06-18 05:40:21', '2021-06-18 05:40:21'),
(32, 'Kecamatan Pulosari', '2021-06-18 05:40:27', '2021-06-18 05:40:27'),
(33, 'Kecamatan Saketi', '2021-06-18 05:40:32', '2021-06-18 05:40:32'),
(34, 'Kecamatan Sindangresmi', '2021-06-18 05:40:39', '2021-06-18 05:40:39'),
(35, 'Kecamatan Sobang', '2021-06-18 05:40:43', '2021-06-18 05:40:43'),
(36, 'Kecamatan Sukaresmi', '2021-06-18 05:40:48', '2021-06-18 05:40:48'),
(37, 'Kecamatan Sumur', '2021-06-18 05:40:51', '2021-06-18 05:40:51');

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
(9, 4, 'Kelurahan Sukaratu', '2021-06-18 06:10:13', '2021-06-18 06:10:13');

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
('03df6bde665c708200c6257f0ad2d16b80be917818f34c5a7160b90578f04e4e007f889821924591', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-20 06:37:32', '2021-06-20 06:37:32', '2021-06-21 13:37:32'),
('06ce623de861ec70de7df5b462c29979bff883fb1ee05115b76a97f8373243cc2b24f44444c63af0', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-20 23:31:51', '2021-06-20 23:31:51', '2021-06-22 06:31:51'),
('06f2ff570611346e50845f41fe99a03ef6ce41a0ddc93a60346c9741ce7845538d8516d84c8e0eee', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 06:35:06', '2021-06-18 06:35:06', '2022-06-18 13:35:06'),
('0da8c227b037f0e65a3b6fc96a9eccac7cfe1d1da081db031298f72ae1ed3082cf0903d95627586a', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-24 00:02:48', '2021-06-24 00:02:48', '2021-06-25 07:02:48'),
('0e242735779ce2d9b3b5739940f78428a4651211c1a6cba17adcba78a61ae063923e475530ea04c8', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-20 20:51:44', '2021-06-20 20:51:44', '2021-06-22 03:51:44'),
('10dfb4f89d39455016d6af53751699fe4f582698ed3939b8249fcc7d237ab75992c1f5fc50e3a184', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 06:51:14', '2021-06-18 06:51:14', '2022-06-18 13:51:14'),
('14403d1983e76374ce43342b02f30ff4e4a6cf50f5d6fd9b3091875defd04426caacaef160645d95', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 08:14:44', '2021-06-18 08:14:44', '2022-06-18 15:14:44'),
('1794d381d5aa7e9ea12ccd93e73e9349c5d11a227e31cbde1a24304d05f99f320e4e30042fafe826', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-19 02:01:00', '2021-06-19 02:01:00', '2021-06-19 09:02:00'),
('17b70a2d08a9752da03ed3e5041c1ff28d57f39d8ff7689576c7d225a1e7cf6a5921262ce25eaa93', 2, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-22 08:47:14', '2021-06-22 08:47:14', '2021-06-23 15:47:14'),
('1a90c56871d41d191abcea4ce6d5741932b6ae5c1364bd6ce3739ea135a515ab91a89e6a261c089e', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-19 01:58:31', '2021-06-19 01:58:31', '2022-06-19 08:58:31'),
('1c56d5d55dc29602f6627dd775f5537eb75a5f876fe7ecc8b9947aa99b4b7f9c0863abef66a69a4d', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 08:44:57', '2021-06-18 08:44:57', '2022-06-18 15:44:57'),
('210a13a9f29ef1c1efeca5be5c00cfb559f296e9c7d50af9651c67095b9e1907832cb74e99b5eeb7', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-22 02:28:13', '2021-06-22 02:28:13', '2021-06-23 09:28:13'),
('2141bec1378cbbfe69cc9882c2140115fae9bd8ecf293b5dacbad11a0af44af95535288eef2109b5', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 08:19:42', '2021-06-18 08:19:42', '2022-06-18 15:19:42'),
('246172b733d3b2947d089479f4610a3c5601c5bca21c17e10139bc84adb1958b0be74ff64c5dc793', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 08:05:00', '2021-06-18 08:05:00', '2022-06-18 15:05:00'),
('2ec130c096d4e2af45644a21ffef88c6e6acb6e9d90730fac8ede76819d519e6ff10d5a2a9bf7530', 2, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 06:49:31', '2021-06-18 06:49:31', '2022-06-18 13:49:31'),
('2f157c94da7be870970834dc21bc86a88ccccf13e0717118b866df6552ad9651c3004f2c4ad9f348', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-22 02:33:46', '2021-06-22 02:33:46', '2021-06-23 09:33:46'),
('2f709e5e8dd5ee99b49a110f8a0858a41a28f2d4a66a4c297b1bbe42163be42f5f2ade877558c59c', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 06:35:22', '2021-06-18 06:35:22', '2022-06-18 13:35:22'),
('31451ff47bf66a9c62b3d47b0cd2df12a6b0c7b38964c9c2d1fa81089312007f9cc0a9baaf68247b', 2, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 08:06:11', '2021-06-18 08:06:11', '2022-06-18 15:06:11'),
('33f28affea2995aaa43085a8d627e250ebe52cd2b3f26f3db9138176e7c2aca4575e6f57f4efce58', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-19 02:04:33', '2021-06-19 02:04:33', '2021-06-19 09:04:43'),
('35ce0adcca9c4b4f24a4f78063deceb28ba0927fb82fdc0322bc9ccd0300c0546bc81be438d311ef', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-22 02:24:06', '2021-06-22 02:24:06', '2021-06-23 09:24:06'),
('3cbc56379e08ff0000c407eefd93fb8e7cc20f439018ea3662f936ddafb192ea47097e65e809d483', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 08:18:31', '2021-06-18 08:18:31', '2022-06-18 15:18:31'),
('3ce6235f471c51c6509c375311dbd54df9d8976cae94d91b51aa2ddce2aa842f9af2c2f85b012e7f', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-22 05:23:45', '2021-06-22 05:23:45', '2021-06-23 12:23:45'),
('3d40cd9c30903214f22c294645ed74a43f1b9e019067333709e36b9d754d9a8f4b26cff55e1e2b6c', 2, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 10:17:19', '2021-06-18 10:17:19', '2022-06-18 17:17:19'),
('3eefefe287d72a52ad6e603acff046d2d873b10fc520c77ba96711a82957234663236e19b751eb3c', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 08:28:31', '2021-06-18 08:28:31', '2022-06-18 15:28:31'),
('3f123b2e6123f80d657a6fab101f5c1685546a936d27d9d140ca28f1e3f0d1e57c5d3e851e8f1fd4', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-20 06:38:13', '2021-06-20 06:38:13', '2021-06-21 13:38:13'),
('3f3fca6eb1de7060fe917ac955161e4901adb14513e6ce74a29a9f50d4e576546a7a8e4ad9742d0a', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-19 01:30:00', '2021-06-19 01:30:00', '2022-06-19 08:30:00'),
('46e511663a950cee17c3e2f139e6daa852fd902f01097b69014ace4f3e27f945d43bf133a878ed89', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-22 02:22:35', '2021-06-22 02:22:35', '2021-06-23 09:22:35'),
('49ba07a4e5dc9c12e76c54354d11df4cb02558bbb963f50a91edc7bbdafca01b7cc75987861a00ff', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-22 02:25:52', '2021-06-22 02:25:52', '2021-06-23 09:25:52'),
('4a9cae117beb4845f82e52c5fa9f32e25bec0a964eb2f623a14c7ee5feed6256ded4c1f003eb913e', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-20 06:37:46', '2021-06-20 06:37:46', '2021-06-21 13:37:46'),
('4dfe7fe1aaca8ef420041443fe83bb0d6ab5ff92919bf35d2cbaa41a1ec3cd2d6bb0500eee378824', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-22 02:32:01', '2021-06-22 02:32:01', '2021-06-23 09:32:01'),
('4e43e5690ee66805c17087e988b97926e33016a06ac111d13dcc021cb2eced173f3b99ba8b684871', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-20 23:33:22', '2021-06-20 23:33:22', '2021-06-22 06:33:22'),
('4fc4948cd7741607ce706a3357e516065515eb1e0c22846e507559d9634aa5589dd1f43b7b7f35f9', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 08:17:58', '2021-06-18 08:17:58', '2022-06-18 15:17:58'),
('50c645f309014d177f0681d1626b93bec21c4bffe664d88f9f9afc596fba444b5bc04acd4fb90cd9', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 08:29:35', '2021-06-18 08:29:35', '2022-06-18 15:29:35'),
('54370f8859fba56199173700dd3e9f3fe92d448725d9d2555f949ab6125ee778fe1f71e2482855f9', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-20 06:37:24', '2021-06-20 06:37:24', '2021-06-21 13:37:24'),
('561751f2a37058e41a8f28f3e398270e81491246e4e1e6d4b2baf3caeaac8c763752665e83d96dac', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-19 01:45:03', '2021-06-19 01:45:03', '2022-06-19 08:45:03'),
('5a6ca9b2be793333cf8aa38615afeac05f1907a08d1ac9712c7d5c1f7b99ee010f6e9fedce05e86c', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-20 23:17:08', '2021-06-20 23:17:08', '2021-06-22 06:17:08'),
('62caf929a87675998bf14f26c20ae7b7c1dc6c6a96a0dce81725761c8e235af4819071b50bd4f21e', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-22 05:23:35', '2021-06-22 05:23:35', '2021-06-23 12:23:35'),
('662b0721f47f41aebf697b9e268f85b2cfd24b654da43807501f48d9d4dfe7975543303680325411', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 06:33:37', '2021-06-18 06:33:37', '2022-06-18 13:33:37'),
('6cc421788a3a4a660dfabdb4a7a7154ad119d3ec160b0227d255b533659780836ba1fe3d56731de6', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-20 20:52:06', '2021-06-20 20:52:06', '2021-06-22 03:52:06'),
('6fce1d746bf485e18b27ffd7363700663410e22e026194ed469d6c79c56b4d7b096db8fc1d042301', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-19 01:40:58', '2021-06-19 01:40:58', '2022-06-19 08:40:58'),
('7301c82607abd1ae42176400219dacf69e21eed26b40fbf735ab085d597bf7f8d1aa7240e2af9cce', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-22 08:19:48', '2021-06-22 08:19:48', '2021-06-23 15:19:48'),
('74082ce765004819f27d07b164179a930132224b4ac072f442aa113cf6b2e8cccf2fe5bb45ef0ab0', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 08:16:14', '2021-06-18 08:16:14', '2022-06-18 15:16:14'),
('7455f4d29cfcc70852eab0fc1be6a96d57393364f239f2b891be2b0a5216fe08a4d38cd6d565763a', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-22 02:43:44', '2021-06-22 02:43:44', '2021-06-23 09:43:44'),
('75619dbb4b87aec81e903d9cc32ff60872b8bbb270768af103c4a355ffa18439c9b97d0f97c18649', 2, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-22 08:25:32', '2021-06-22 08:25:32', '2021-06-23 15:25:32'),
('7e70180240ce15849ce35edaea24604b781e0669ab2f0b392f8ada47340628ff46fe5c4230aae5d2', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 08:25:53', '2021-06-18 08:25:53', '2022-06-18 15:25:53'),
('804f6b08b3ba3b5fda3a292cccff0725d3a467f25b5ce968692c5b4e0173bbd895b3f1ec3220ddff', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-20 23:38:26', '2021-06-20 23:38:26', '2021-06-22 06:38:26'),
('886e1e7a887caa3f37d545bf53bba9c5acb65076801fd3df7ea48d432da7bd49ac25d76745092da2', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 07:30:39', '2021-06-18 07:30:39', '2022-06-18 14:30:39'),
('89bd02406247fb06ea61be2d8dab6d0074bba97f883c8aedf5e1f7b9bc88b2b13cabd292b1c07e61', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-20 23:36:01', '2021-06-20 23:36:01', '2021-06-22 06:36:01'),
('8b5c2390eee898de73cda6bafbc4283799ed1b706f7478402ad3b8fb7ad2e86c5ef76df410e885c0', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 11:22:56', '2021-06-18 11:22:56', '2022-06-18 18:22:56'),
('8f517c135f09f0201e479e5dcacc3f50c0292a9b4d131d3ea534acd5527909e04683413fa0163f15', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-20 23:49:32', '2021-06-20 23:49:32', '2021-06-22 06:49:32'),
('915d9da08879f4d6e154c0caf5276fd153c3ba1848630f61af2cb9bf058088acfe05087037689c3d', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-22 02:30:18', '2021-06-22 02:30:18', '2021-06-23 09:30:18'),
('91c1809895b3f21b15d8b3062c1bb22b6477bb93504c43400003ba175e264462447a747685d39bcd', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-20 23:21:58', '2021-06-20 23:21:58', '2021-06-22 06:21:58'),
('92e154750784f3b3f831e959a9c5e4123f7523c4a04777806ca68cb2f3f998f009c25acaff51506d', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 08:12:51', '2021-06-18 08:12:51', '2022-06-18 15:12:51'),
('95d3562fe02fb70115e3ee88aa97edc5b33f79d62e5eb0b2687c8ed3ae852050bdaeca1b1ed7c4b7', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 08:13:49', '2021-06-18 08:13:49', '2022-06-18 15:13:49'),
('987f0878295761a624b4cd373cf1ce7161a8be6e2a2d76901559bf503173f0010e05e2b98ebc72ca', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-20 23:46:46', '2021-06-20 23:46:46', '2021-06-22 06:46:46'),
('9b7e60e0a136512663043214b662930d4b0496e5b4ce903ecfcd1c9b4be176f6fe5eaa116e775115', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 06:32:48', '2021-06-18 06:32:48', '2022-06-18 13:32:48'),
('9bca013d43f267d56ae7edaa85eaa42c0e7b8a2386b751113a8a21e3ef2b619e8cd86ed72def9b49', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 08:17:16', '2021-06-18 08:17:16', '2022-06-18 15:17:16'),
('9deb3a8b979bf01a0f9062edc75af4c30490b3c7b20c7f455e9787da1e85c812d051fe1cf3cd4e6c', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-20 05:39:59', '2021-06-20 05:39:59', '2021-06-21 12:39:59'),
('9f72652f49c141c5e6a7aee45b62b720f7e1ce0182b5e6b36cdb7cbb52e12294d84ce0b8b6322fe1', 2, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-19 01:43:04', '2021-06-19 01:43:04', '2022-06-19 08:43:04'),
('a238f31601815c63b0b7a53c9cca46038294bcc1aba51922fb338be84589e908cebbef234525459a', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-20 23:44:49', '2021-06-20 23:44:49', '2021-06-22 06:44:49'),
('a2ea667fa502750071fca6eba56d486079197992db6446d42b95588efd3cbe5d5403609524b30272', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-20 23:31:03', '2021-06-20 23:31:03', '2021-06-22 06:31:03'),
('a5f0db4dae468b64b51a63ecc88764d1e05431824e1da75c0227cb6fa11f134209e0d4ad41f4ed4c', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-22 02:46:47', '2021-06-22 02:46:47', '2021-06-23 09:46:47'),
('a77ee933392d2af8b96dd5ffad376249851a92e0bdb35870fe5957a41e8aac4ac47cad41aba8c777', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 08:13:35', '2021-06-18 08:13:35', '2022-06-18 15:13:35'),
('a9e8843436b68a95b474079cda9484358fc9f1a265ed4500f70e5b9796a07f6bd8ce2c8f9f8a7f66', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-20 23:43:52', '2021-06-20 23:43:52', '2021-06-22 06:43:52'),
('aa03ab900ec9ed3b07178214a5371d7db2180f614bc00c3ba3673c3d2743fb54c749af17a7477771', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-19 01:47:24', '2021-06-19 01:47:24', '2022-06-19 08:47:24'),
('ab072730d112cfbda8071c277b1c0f33fcdb16e6f8daf8da910f68d738c7c3bee5a9f8c06a13bc9f', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-23 23:37:47', '2021-06-23 23:37:47', '2021-06-25 06:37:46'),
('b0da3e88dfc94ef7e962f58d6414395585ef5e5325075b74227c68f492c9bd76058df1cc10cc0a0e', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-20 23:21:12', '2021-06-20 23:21:12', '2021-06-22 06:21:12'),
('b630e7d2d3efd65f7eb7a6d83c6329a04c087b4010618825b866a8acc153624ae96146e8fa171c57', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-19 01:57:44', '2021-06-19 01:57:44', '2022-06-19 08:57:44'),
('b99b98a2bac169dcb89311b7f4a2b0db2f363f7966104060aceb794ae03a2acfd2c965ff99e8df46', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 06:35:50', '2021-06-18 06:35:50', '2022-06-18 13:35:50'),
('ba23994a0aa787f5d62a3cb3901c98a166bc98f1d0b30651efba38fd30c8f8c0e9edb2104ed750ed', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-20 23:19:25', '2021-06-20 23:19:25', '2021-06-22 06:19:25'),
('bcef2622e7edc997f22e4f1bb38e46ef33859d2cf60c200bf8adde8feae0164e119bbe914e15679b', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-20 23:30:26', '2021-06-20 23:30:26', '2021-06-22 06:30:26'),
('bd392cf69ac2a35d9f13f9b5d36b27c825bd5eec52349ac44ea7cb4f760fa8fd8350d4d2a28d8a2c', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-20 23:32:46', '2021-06-20 23:32:46', '2021-06-22 06:32:46'),
('c1b4c1769f337483f15fb61cbbb74b24d3da3a60d151c7442b856cfc8e82149bfca240906d3b5862', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-19 01:35:23', '2021-06-19 01:35:23', '2022-06-19 08:35:23'),
('c49795d874ef9f0e62d4bff47cf46bad53ba0fb6e4068b5490fdbe305e84ac6eefa37ffcef5d6ff0', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 06:36:12', '2021-06-18 06:36:12', '2022-06-18 13:36:12'),
('c67e8d603efdd83fdccdb60791dd985ddf46cce2b684b4c4302a61c35798fcd6bc4be172199f7be6', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-22 08:29:39', '2021-06-22 08:29:39', '2021-06-23 15:29:39'),
('cb80759b3abb2ed19f0ad5bbf6ccbf909127b1e3860c905066c5bdedc629df13ba209c94c8579e66', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-22 02:12:09', '2021-06-22 02:12:09', '2021-06-23 09:12:09'),
('ce4abbbb520124ee39f50bc94999b2515cd88c38c63aea45b9f1218b74f0515e85c9d32a69ae7499', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-20 23:36:13', '2021-06-20 23:36:13', '2021-06-22 06:36:13'),
('ceb6816bc5f21a742cf3ef1b0f9bd7891086340e4f4786fbed2ae88200e8fca3380439caf49bc8d4', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 08:11:11', '2021-06-18 08:11:11', '2022-06-18 15:11:11'),
('d2ec8ee8bfc8a031705b8d7a18590921fc64b2c34025d5e0a139a902be44487e2ab9c5a0b885d7ed', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 08:28:23', '2021-06-18 08:28:23', '2022-06-18 15:28:23'),
('d34c188205f39eebcf2ca267c8fbc0127e4f7af0a1a4da13164fff1ff4919167f282ac92fbf2001c', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 08:15:20', '2021-06-18 08:15:20', '2022-06-18 15:15:20'),
('d92afbcbaf11af9ea01417178d71123e30927e63f56d8b95d268250fe128a70ef3e635560a6e4eed', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-22 02:42:19', '2021-06-22 02:42:19', '2021-06-23 09:42:19'),
('ddbbbbbf15e8f4bae5299aa0006608856cde79d4993c85843c6bf17bd057297f7edd85c6cec296fe', 2, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 07:54:54', '2021-06-18 07:54:54', '2022-06-18 14:54:54'),
('dffc346a25026c061687e55352b37b0464894ee8413a5792f31b513f02e5a63c5944fc171342347d', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-22 02:27:47', '2021-06-22 02:27:47', '2021-06-23 09:27:47'),
('e0f78457237d24a26900133f5d1b85412671f2bb0dc0494e6d602d97651cc0c94c5acf3fcb90e121', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 08:21:23', '2021-06-18 08:21:23', '2022-06-18 15:21:23'),
('e3effabab377f55b2443f973e7052a6fd46d7293545b48cfb860a6546d920421eae1725f321e90b1', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-24 02:51:49', '2021-06-24 02:51:49', '2021-06-25 09:51:49'),
('e57a5c1f3fe2c202d52fee54502b53e3b8ecf4a695037dac006a84f1a09ab43d9e0b85dc239688d4', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-19 01:44:46', '2021-06-19 01:44:46', '2022-06-19 08:44:46'),
('e98d3b2df8bf8d6ad7e9864cd290de072d6a170e11cbb43f4320ade7eaa1159efb98387a8e2652e2', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-19 05:28:03', '2021-06-19 05:28:03', '2021-06-20 12:28:03'),
('ef3a6440d2343d5fa81fdb143fa9ad300b286962c814fd8f878776d741d755632566492da253b614', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 06:49:59', '2021-06-18 06:49:59', '2022-06-18 13:49:59'),
('f1344b5e1e2d5e277e379db9983da98c3c34138215bccb7143c26d735556a2eaf05da9330895f9f4', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 08:23:50', '2021-06-18 08:23:50', '2022-06-18 15:23:50'),
('fa0cd3a52ebed5227c2dec88a2bda4d5615f164cc6962c32ea54bbee8e0ee955a7b5d1631fdd7405', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-19 01:35:50', '2021-06-19 01:35:50', '2022-06-19 08:35:50'),
('fc93d3ded007f9a71b7ae5f6f4b30795e664cd9b57a0919f1e804ba42270435edf8e650b507dfdb2', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-19 02:05:22', '2021-06-19 02:05:22', '2021-06-20 09:05:22'),
('fe051f1045516b0cf8d1ceecfb6bd42408dad4ded877cb7710891155ab43ff9031307ea2f647f38a', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-18 08:27:05', '2021-06-18 08:27:05', '2022-06-18 15:27:05'),
('fe81b630a4ce70194d747afbca8ac9b8f07296ec680aa33932dc110827ed48f7956181e728b9ebd5', 1, 3, 'Laravel Password Grant Client', '[]', 0, '2021-06-19 01:58:04', '2021-06-19 01:58:04', '2022-06-19 08:58:04');

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
(1, 3, 'Ahmad Budi', 'pandeglangkec', 'pandeglangkec@gmail.com', '$2y$10$x.b8.UnJ21k4Bj8Oc.e.0.zEMBLv.zGsSLPVDVbd.uOgrRc0YX9uC', 'Kecamatan Pandeglang', 'User', '2021-06-18 06:14:43', '2021-06-18 06:14:43'),
(2, 4, 'Budi', 'majasarikec', 'majasarikec@gmail.com', '$2y$10$GckGlQ/HV38ZpcifUvDoD.L3T56F/oAyRca0DM.XxHAfNBHFSz3me', 'Kecamatan Majasari', 'User', '2021-06-18 06:24:31', '2021-06-18 06:24:31');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `db_paten`
--
ALTER TABLE `db_paten`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_realisasi_pbb`
--
ALTER TABLE `db_realisasi_pbb`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
-- AUTO_INCREMENT for table `tree`
--
ALTER TABLE `tree`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
