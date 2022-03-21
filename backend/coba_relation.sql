-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2022 at 04:10 AM
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
-- Table structure for table `db_bencana_alam`
--

CREATE TABLE `db_bencana_alam` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `instansi_id` bigint(20) UNSIGNED NOT NULL,
  `kelurahan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jmlh_kk` double DEFAULT NULL,
  `jmlh_jiwa` double DEFAULT NULL,
  `rumah_rusak_berat` double DEFAULT NULL,
  `rumah_rusak_sedang` double DEFAULT NULL,
  `rumah_rusak_ringan` double DEFAULT NULL,
  `kantor_rusak_berat` double DEFAULT NULL,
  `kantor_rusak_sedang` double DEFAULT NULL,
  `kantor_rusak_ringan` double DEFAULT NULL,
  `pendidikan_rusak_berat` double DEFAULT NULL,
  `pendidikan_rusak_sedang` double DEFAULT NULL,
  `pendidikan_rusak_ringan` double DEFAULT NULL,
  `ibadah_rusak_berat` double DEFAULT NULL,
  `ibadah_rusak_sedang` double DEFAULT NULL,
  `ibadah_rusak_ringan` double DEFAULT NULL,
  `jembatan_rusak_berat` double DEFAULT NULL,
  `jembatan_rusak_sedang` double DEFAULT NULL,
  `jembatan_rusak_ringan` double DEFAULT NULL,
  `lainnya_rusak_berat` double DEFAULT NULL,
  `lainnya_rusak_sedang` double DEFAULT NULL,
  `lainnya_rusak_ringan` double DEFAULT NULL,
  `korban_menderita` double DEFAULT NULL,
  `korban_luka` double DEFAULT NULL,
  `korban_meninggal` double DEFAULT NULL,
  `kerugian` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `periode` date DEFAULT NULL,
  `is_verified` double NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_bencana_alam`
--

INSERT INTO `db_bencana_alam` (`id`, `instansi_id`, `kelurahan`, `jmlh_kk`, `jmlh_jiwa`, `rumah_rusak_berat`, `rumah_rusak_sedang`, `rumah_rusak_ringan`, `kantor_rusak_berat`, `kantor_rusak_sedang`, `kantor_rusak_ringan`, `pendidikan_rusak_berat`, `pendidikan_rusak_sedang`, `pendidikan_rusak_ringan`, `ibadah_rusak_berat`, `ibadah_rusak_sedang`, `ibadah_rusak_ringan`, `jembatan_rusak_berat`, `jembatan_rusak_sedang`, `jembatan_rusak_ringan`, `lainnya_rusak_berat`, `lainnya_rusak_sedang`, `lainnya_rusak_ringan`, `korban_menderita`, `korban_luka`, `korban_meninggal`, `kerugian`, `periode`, `is_verified`, `created_at`, `updated_at`) VALUES
(11, 7, 'Desa Cikayas', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '10000', '2021-02-01', 3, '2021-12-25 13:53:12', '2021-12-25 13:53:12'),
(12, 6, 'Desa Banjar', 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, '10000', '2021-12-01', 1, '2021-12-27 11:48:40', '2021-12-27 12:06:15'),
(13, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-01', 3, '2021-12-27 11:53:19', '2021-12-27 12:04:56');

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
(44, 0, 'Semua Kecamatan diharapkan input data', '2021-12-27', '2021-12-26 02:57:52', '2021-12-26 02:57:52');

-- --------------------------------------------------------

--
-- Table structure for table `db_kegiatan_camat`
--

CREATE TABLE `db_kegiatan_camat` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `instansi_id` bigint(20) UNSIGNED NOT NULL,
  `waktu` datetime DEFAULT NULL,
  `tempat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uraian_kegiatan` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `periode` date DEFAULT NULL,
  `is_verified` double NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_kegiatan_camat`
--

INSERT INTO `db_kegiatan_camat` (`id`, `instansi_id`, `waktu`, `tempat`, `uraian_kegiatan`, `periode`, `is_verified`, `created_at`, `updated_at`) VALUES
(25, 6, NULL, NULL, NULL, '2021-12-01', 1, '2021-12-27 09:18:39', '2021-12-27 11:30:58'),
(29, 6, '2021-12-01 07:00:00', 'AB', 'ABCD', '2021-12-01', 1, '2021-12-27 09:37:57', '2021-12-27 11:30:46'),
(31, 6, '2021-02-28 18:30:00', 'Musholla', 'Sholat', '2021-02-01', 1, '2021-12-27 11:28:56', '2021-12-27 11:31:14'),
(32, 6, '2021-02-26 09:00:00', 'A', 'A', '2021-02-01', 1, '2021-12-27 11:36:59', '2021-12-27 11:36:59'),
(33, 6, '2021-02-05 06:30:00', 'S', 'S', '2021-02-01', 1, '2021-12-27 11:37:23', '2021-12-27 11:37:23'),
(34, 6, NULL, NULL, NULL, '2021-10-01', 1, '2021-12-27 11:37:57', '2021-12-27 11:37:57');

-- --------------------------------------------------------

--
-- Table structure for table `db_kependudukan`
--

CREATE TABLE `db_kependudukan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `instansi_id` bigint(20) UNSIGNED NOT NULL,
  `kelurahan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jmlh_penduduk_bln_lalu_l` double DEFAULT NULL,
  `jmlh_penduduk_bln_lalu_p` double DEFAULT NULL,
  `total_penduduk_bln_lalu` double DEFAULT NULL,
  `lahir_l` double DEFAULT NULL,
  `lahir_p` double DEFAULT NULL,
  `total_lahir` double DEFAULT NULL,
  `meninggal_l` double DEFAULT NULL,
  `meninggal_p` double DEFAULT NULL,
  `total_meninggal` double DEFAULT NULL,
  `datang_l` double DEFAULT NULL,
  `datang_p` double DEFAULT NULL,
  `total_datang` double DEFAULT NULL,
  `pindah_l` double DEFAULT NULL,
  `pindah_p` double DEFAULT NULL,
  `total_pindah` double DEFAULT NULL,
  `jmlh_penduduk_bln_ini_l` double DEFAULT NULL,
  `jmlh_penduduk_bln_ini_p` double DEFAULT NULL,
  `total_penduduk_bln_ini` double DEFAULT NULL,
  `periode` date DEFAULT NULL,
  `is_verified` double NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_kependudukan`
--

INSERT INTO `db_kependudukan` (`id`, `instansi_id`, `kelurahan`, `jmlh_penduduk_bln_lalu_l`, `jmlh_penduduk_bln_lalu_p`, `total_penduduk_bln_lalu`, `lahir_l`, `lahir_p`, `total_lahir`, `meninggal_l`, `meninggal_p`, `total_meninggal`, `datang_l`, `datang_p`, `total_datang`, `pindah_l`, `pindah_p`, `total_pindah`, `jmlh_penduduk_bln_ini_l`, `jmlh_penduduk_bln_ini_p`, `total_penduduk_bln_ini`, `periode`, `is_verified`, `created_at`, `updated_at`) VALUES
(6, 6, 'Desa Bandung', 2, 3, 5, 3, 4, 7, 2, NULL, 2, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, 0, '2021-12-01', 3, NULL, '2021-12-27 08:32:54'),
(7, 10, 'Desa Angsana', 1, 1, 2, 1, 1, 2, 1, 1, 2, 1, 1, 2, 1, 1, 2, 1, 1, 2, '2021-02-01', 2, NULL, NULL),
(8, 10, 'Desa Bangkonol', 1, 1, 2, 1, 1, 2, 1, 1, 2, 1, 1, 2, 1, 1, 2, 1, 1, 2, '2021-02-01', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `db_realisasi_pbb`
--

CREATE TABLE `db_realisasi_pbb` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `instansi_id` bigint(20) UNSIGNED NOT NULL,
  `kelurahan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_pbb` double DEFAULT NULL,
  `realisasi_bln_lalu` double DEFAULT NULL,
  `realisasi_bln_ini` double DEFAULT NULL,
  `jmlh_realisasi` double DEFAULT NULL,
  `sisa_target` double DEFAULT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `periode` date DEFAULT NULL,
  `is_verified` double NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_realisasi_pbb`
--

INSERT INTO `db_realisasi_pbb` (`id`, `instansi_id`, `kelurahan`, `target_pbb`, `realisasi_bln_lalu`, `realisasi_bln_ini`, `jmlh_realisasi`, `sisa_target`, `keterangan`, `periode`, `is_verified`, `created_at`, `updated_at`) VALUES
(1, 30, 'Desa Cadasari', 2, 3, 4, 5, 6, '7', '2021-02-01', 2, '2021-12-27 08:03:26', '2021-12-27 08:03:26'),
(2, 6, 'Desa Bandung', 100000, 1, 1, 1, 1, '1', '2021-02-01', 2, '2021-12-27 17:46:10', '2021-12-27 17:46:10');

-- --------------------------------------------------------

--
-- Table structure for table `db_rekapitulasi_paten`
--

CREATE TABLE `db_rekapitulasi_paten` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `instansi_id` bigint(20) UNSIGNED NOT NULL,
  `kelurahan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `perekaman_ktp` double DEFAULT NULL,
  `pengantar_kk` double DEFAULT NULL,
  `ket_pindah` double DEFAULT NULL,
  `ket_domisili` double DEFAULT NULL,
  `pengantar_akta_lahir` double DEFAULT NULL,
  `pengantar_akta_mati` double DEFAULT NULL,
  `pencatatan_perkawinan` double DEFAULT NULL,
  `pencatatan_perceraian` double DEFAULT NULL,
  `skck` double DEFAULT NULL,
  `sktm` double DEFAULT NULL,
  `rekomendasi` double DEFAULT NULL,
  `legalisasi` double DEFAULT NULL,
  `ket_lain` double DEFAULT NULL,
  `imb` double DEFAULT NULL,
  `situ_siup` double DEFAULT NULL,
  `izin_merobohkan_bangunan` double DEFAULT NULL,
  `izin_keramaian` double DEFAULT NULL,
  `izin_partai` double DEFAULT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `periode` date DEFAULT NULL,
  `is_verified` double NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `db_rekapitulasi_paten`
--

INSERT INTO `db_rekapitulasi_paten` (`id`, `instansi_id`, `kelurahan`, `perekaman_ktp`, `pengantar_kk`, `ket_pindah`, `ket_domisili`, `pengantar_akta_lahir`, `pengantar_akta_mati`, `pencatatan_perkawinan`, `pencatatan_perceraian`, `skck`, `sktm`, `rekomendasi`, `legalisasi`, `ket_lain`, `imb`, `situ_siup`, `izin_merobohkan_bangunan`, `izin_keramaian`, `izin_partai`, `keterangan`, `periode`, `is_verified`, `created_at`, `updated_at`) VALUES
(8, 6, 'Desa Banjar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-11-01', 2, '2021-12-25 05:02:00', '2021-12-27 08:22:16'),
(9, 7, 'Desa Cikayas', 11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'AAAA', '2021-12-01', 2, '2021-12-25 13:52:30', '2021-12-25 13:52:30'),
(10, 7, 'Desa Cikayas', 3, 4, 5, 6, 6, 6, 6, 11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '1', '2021-12-01', 3, '2021-12-27 02:51:11', '2021-12-27 02:51:11'),
(11, 6, 'Desa Banjar', 1, 11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '1', '2021-02-01', 1, '2021-12-27 17:47:44', '2021-12-27 17:47:44');

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
  `lat` double(10,6) NOT NULL,
  `lng` double(10,6) NOT NULL,
  `instansi` enum('Kecamatan','Pemkab') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Kecamatan',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `instansi`
--

INSERT INTO `instansi` (`id`, `nama_instansi`, `lat`, `lng`, `instansi`, `created_at`, `updated_at`) VALUES
(1, 'Diskomsantik', -6.308133, 106.106765, 'Pemkab', '2021-11-26 14:54:45', NULL),
(2, 'Sekretariat Daerah', -6.309591, 106.104914, 'Pemkab', '2021-11-26 14:54:45', NULL),
(3, 'Kecamatan Pandeglang', -6.310473, 106.110413, 'Kecamatan', '2021-11-26 14:54:45', NULL),
(4, 'Kecamatan Majasari', -6.328842, 106.093506, 'Kecamatan', '2021-11-26 14:54:45', NULL),
(5, 'Kecamatan Kaduhejo', -6.332721, 106.057522, 'Kecamatan', '2021-11-26 16:34:28', '2021-11-26 16:34:28'),
(6, 'Kecamatan Banjar', -6.364649, 106.100202, 'Kecamatan', '2021-11-26 16:41:43', '2021-11-26 16:41:43'),
(7, 'Kecamatan Angsana', -6.577312, 105.860560, 'Kecamatan', '2021-11-26 16:43:05', '2021-11-26 16:43:05'),
(8, 'Kecamatan Labuan', -6.380005, 105.835195, 'Kecamatan', '2021-11-26 16:52:28', '2021-11-26 16:52:28'),
(9, 'Kecamatan Mandalawangi', -6.309909, 105.988892, 'Kecamatan', '2021-11-26 16:56:15', '2021-11-26 16:56:15'),
(10, 'Kecamatan Cibaliung', -6.715764, 105.705511, 'Kecamatan', '2021-11-26 17:05:11', '2021-11-26 17:05:11'),
(11, 'Kecamatan Carita', -6.319521, 105.839225, 'Kecamatan', '2021-11-26 17:06:47', '2021-11-26 17:06:47'),
(12, 'Kecamatan Cadasari', -6.267537, 106.120658, 'Kecamatan', '2021-11-26 17:20:01', '2021-11-26 17:20:01'),
(13, 'Kecamatan Bojong', -6.471679, 106.000063, 'Kecamatan', '2021-11-26 17:26:37', '2021-11-26 17:26:37'),
(14, 'Kecamatan Saketi', -6.397585, 105.990595, 'Kecamatan', '2021-11-26 17:28:25', '2021-11-26 17:28:25'),
(15, 'Kecamatan Picung', -6.505918, 105.972620, 'Kecamatan', '2021-11-26 17:30:48', '2021-11-26 17:30:48'),
(16, 'Kecamatan Cibitung', -6.768684, 105.700491, 'Kecamatan', '2021-11-26 17:38:35', '2021-11-26 17:38:35'),
(17, 'Kecamatan Cigeulis', -6.588634, 105.694042, 'Kecamatan', '2021-11-26 17:39:00', '2021-11-26 17:39:00'),
(18, 'Kecamatan Cikedal', -6.381690, 105.883256, 'Kecamatan', '2021-11-26 17:53:50', '2021-11-26 17:53:50'),
(19, 'Kecamatan Cikeusik', -6.728640, 105.871798, 'Kecamatan', '2021-11-26 17:54:36', '2021-11-26 17:54:36'),
(20, 'Kecamatan Cimanggu', -6.700618, 105.649913, 'Kecamatan', '2021-11-26 17:57:43', '2021-11-26 17:57:43'),
(21, 'Kecamatan Cimanuk', -6.350508, 106.043316, 'Kecamatan', '2021-11-26 18:00:31', '2021-11-26 18:00:31'),
(22, 'Kecamatan Cipeucang', -6.380975, 106.019019, 'Kecamatan', '2021-11-26 18:01:37', '2021-11-26 18:01:37'),
(23, 'Kecamatan Cisata', -6.393556, 105.940416, 'Kecamatan', '2021-12-20 06:59:33', '2021-12-20 06:59:33'),
(24, 'Kecamatan Jiput', -6.349532, 105.865990, 'Kecamatan', '2021-12-20 07:02:14', '2021-12-20 07:02:14'),
(25, 'Kecamatan Karang Tanjung', -6.287168, 106.125353, 'Kecamatan', '2021-12-20 12:51:16', '2021-12-20 12:51:16'),
(26, 'Kecamatan Koroncong', -6.278401, 106.167172, 'Kecamatan', '2021-12-20 12:52:22', '2021-12-20 12:52:22'),
(27, 'Kecamatan Mekarjaya', -6.390445, 106.064909, 'Kecamatan', '2021-12-20 12:53:43', '2021-12-20 12:53:43'),
(28, 'Kecamatan Menes', -6.377089, 105.919476, 'Kecamatan', '2021-12-20 12:54:23', '2021-12-20 12:54:23'),
(29, 'Kecamatan Munjul', -6.604687, 105.904267, 'Kecamatan', '2021-12-20 12:55:15', '2021-12-20 12:55:15'),
(30, 'Kecamatan Pagelaran', -6.431718, 105.858484, 'Kecamatan', '2021-12-20 12:56:16', '2021-12-20 12:56:16'),
(31, 'Kecamatan Panimbang', -6.499151, 105.791943, 'Kecamatan', '2021-12-20 12:57:03', '2021-12-20 12:57:03'),
(32, 'Kecamatan Patia', -6.492423, 105.857186, 'Kecamatan', '2021-12-20 12:57:29', '2021-12-20 12:57:29'),
(33, 'Kecamatan Pulosari', -6.340272, 105.937628, 'Kecamatan', '2021-12-20 12:58:31', '2021-12-20 12:58:31'),
(34, 'Kecamatan Sindangresmi', -6.544635, 105.922224, 'Kecamatan', '2021-12-20 12:59:05', '2021-12-20 12:59:05'),
(35, 'Kecamatan Sobang', -6.563309, 105.755415, 'Kecamatan', '2021-12-20 12:59:55', '2021-12-20 12:59:55'),
(36, 'Kecamatan Sukaresmi', -6.498330, 105.835485, 'Kecamatan', '2021-12-20 13:00:23', '2021-12-20 13:00:23'),
(37, 'Kecamatan Sumur', -6.659151, 105.582775, 'Kecamatan', '2021-12-20 13:00:53', '2021-12-20 13:00:53');

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
(30, 6, 'Desa Pasirawi', '2021-11-26 18:15:22', '2021-11-26 18:15:22'),
(31, 7, 'Desa Angsana', '2021-12-20 13:12:01', '2021-12-20 13:12:01'),
(32, 7, 'Desa Cikayas', '2021-12-20 13:12:12', '2021-12-20 13:12:12'),
(33, 7, 'Desa Cipinang', '2021-12-20 13:12:17', '2021-12-20 13:12:17'),
(34, 7, 'Desa Kadubadak', '2021-12-20 13:12:22', '2021-12-20 13:12:22'),
(35, 7, 'Desa Karangsari', '2021-12-20 13:12:27', '2021-12-20 13:12:27'),
(36, 7, 'Desa Kramatmanik', '2021-12-20 13:12:34', '2021-12-20 13:12:34'),
(37, 7, 'Desa Padaherang', '2021-12-20 13:12:38', '2021-12-20 13:12:38'),
(38, 7, 'Desa Padamulya', '2021-12-20 13:12:42', '2021-12-20 13:12:42'),
(39, 7, 'Desa Sumurlaban', '2021-12-20 13:12:47', '2021-12-20 13:12:47'),
(40, 13, 'Desa Banyumas', '2021-12-20 13:18:06', '2021-12-20 13:18:06'),
(41, 13, 'Desa Bojong', '2021-12-20 13:18:13', '2021-12-20 13:18:13'),
(42, 13, 'Desa Cahayamekar', '2021-12-20 13:18:19', '2021-12-20 13:18:19'),
(43, 13, 'Desa Cijakan', '2021-12-20 13:18:25', '2021-12-20 13:18:25'),
(44, 13, 'Desa Citumenggung', '2021-12-20 13:18:31', '2021-12-20 13:18:31'),
(45, 13, 'Desa Geredug', '2021-12-20 13:18:37', '2021-12-20 13:18:37'),
(46, 13, 'Desa Manggungjaya', '2021-12-20 13:18:42', '2021-12-20 13:18:42'),
(47, 13, 'Desa Mekarsari', '2021-12-20 13:18:48', '2021-12-20 13:18:48'),
(48, 12, 'Desa Cadasari', '2021-12-20 13:19:13', '2021-12-20 13:19:13'),
(49, 12, 'Desa Ciinjuk', '2021-12-20 13:19:17', '2021-12-20 13:19:17'),
(50, 12, 'Desa Cikentrung', '2021-12-20 13:19:22', '2021-12-20 13:19:22'),
(51, 12, 'Desa Kaduela', '2021-12-20 14:18:01', '2021-12-20 14:18:01'),
(52, 12, 'Desa Kaduengang', '2021-12-20 14:18:30', '2021-12-20 14:18:30'),
(53, 12, 'Desa Kaungcaang', '2021-12-20 14:18:37', '2021-12-20 14:18:37'),
(54, 12, 'Desa Koranji', '2021-12-20 14:18:42', '2021-12-20 14:18:42'),
(55, 12, 'Desa Kurungdahu', '2021-12-20 14:18:51', '2021-12-20 14:18:51'),
(56, 12, 'Desa Pasirpeuteuy', '2021-12-20 14:19:07', '2021-12-20 14:19:07'),
(57, 12, 'Desa Tanagara', '2021-12-20 14:19:13', '2021-12-20 14:19:13'),
(58, 12, 'Desa Tapos', '2021-12-20 14:19:19', '2021-12-20 14:19:19'),
(59, 11, 'Desa Banjarmasin', '2021-12-20 14:20:07', '2021-12-20 14:20:07'),
(60, 11, 'Desa Carita', '2021-12-20 14:20:10', '2021-12-20 14:20:10'),
(61, 11, 'Desa Cinoyong', '2021-12-20 14:20:15', '2021-12-20 14:20:15'),
(62, 11, 'Desa Kawoyang', '2021-12-20 14:20:22', '2021-12-20 14:20:22'),
(63, 11, 'Desa Pejamben', '2021-12-20 14:20:27', '2021-12-20 14:20:27'),
(64, 11, 'Desa Sindanglaut', '2021-12-20 14:20:36', '2021-12-20 14:20:36'),
(65, 11, 'Desa Sukajadi', '2021-12-20 14:20:41', '2021-12-20 14:20:41'),
(66, 11, 'Desa Sukanagara', '2021-12-20 14:20:48', '2021-12-20 14:20:48'),
(67, 11, 'Desa Sukarame', '2021-12-20 14:20:55', '2021-12-20 14:20:55'),
(68, 11, 'Desa Tembong', '2021-12-20 14:21:00', '2021-12-20 14:21:00'),
(69, 10, 'Desa Cibaliung', '2021-12-20 14:21:20', '2021-12-20 14:21:20'),
(70, 10, 'Desa Cibingbin', '2021-12-20 14:21:28', '2021-12-20 14:21:28'),
(71, 10, 'Desa Cihanjuang', '2021-12-20 14:21:38', '2021-12-20 14:21:38'),
(72, 10, 'Desa Curug', '2021-12-20 14:21:42', '2021-12-20 14:21:42'),
(73, 10, 'Desa Mahendra', '2021-12-20 14:21:47', '2021-12-20 14:21:47'),
(74, 10, 'Desa Mendung', '2021-12-20 14:21:51', '2021-12-20 14:21:51'),
(75, 10, 'Desa Sorongan', '2021-12-20 14:21:57', '2021-12-20 14:21:57'),
(76, 10, 'Desa Sudimanik', '2021-12-20 14:22:04', '2021-12-20 14:22:04'),
(77, 10, 'Desa Sukajadi', '2021-12-20 14:23:39', '2021-12-20 14:23:39'),
(78, 16, 'Desa Cikadu', '2021-12-20 14:25:53', '2021-12-20 14:25:53'),
(79, 16, 'Desa Cikalong', '2021-12-20 14:25:58', '2021-12-20 14:25:58'),
(80, 16, 'Desa Cikiruh', '2021-12-20 14:26:04', '2021-12-20 14:26:04'),
(81, 16, 'Desa Citeluk', '2021-12-20 14:26:11', '2021-12-20 14:26:11'),
(82, 16, 'Desa Kiarajangkung', '2021-12-20 14:26:20', '2021-12-20 14:26:20'),
(83, 16, 'Desa Kiarapayung', '2021-12-20 14:26:27', '2021-12-20 14:26:27'),
(84, 16, 'Desa Kutakarang', '2021-12-20 14:26:33', '2021-12-20 14:26:33'),
(85, 16, 'Desa Malangnengah', '2021-12-20 14:26:47', '2021-12-20 14:26:47'),
(86, 16, 'Desa Manglid', '2021-12-20 14:26:52', '2021-12-20 14:26:52'),
(87, 16, 'Desa Sindangkerta', '2021-12-20 14:26:58', '2021-12-20 14:26:58'),
(88, 17, 'Desa Banyuasih', '2021-12-20 14:27:17', '2021-12-20 14:27:17'),
(89, 17, 'Desa Cigeulis', '2021-12-20 14:27:22', '2021-12-20 14:27:22'),
(90, 17, 'Desa Ciseureuheun', '2021-12-20 14:27:31', '2021-12-20 14:27:31'),
(91, 17, 'Desa Karangbolong', '2021-12-20 14:27:37', '2021-12-20 14:27:37'),
(92, 17, 'Desa Karyabuana', '2021-12-20 14:27:43', '2021-12-20 14:27:43'),
(93, 17, 'Desa Katumbiri', '2021-12-20 14:27:49', '2021-12-20 14:27:49'),
(94, 17, 'Desa Sinarjaya', '2021-12-20 14:27:55', '2021-12-20 14:27:55'),
(95, 17, 'Desa Tarumanagara', '2021-12-20 14:28:01', '2021-12-20 14:28:01'),
(96, 17, 'Desa Waringinjaya', '2021-12-20 14:28:08', '2021-12-20 14:28:08'),
(97, 18, 'Desa Babakanlor', '2021-12-20 14:28:27', '2021-12-20 14:28:27'),
(98, 18, 'Desa Bangkuyung', '2021-12-20 14:28:33', '2021-12-20 14:28:33'),
(99, 18, 'Desa Cening', '2021-12-20 14:28:37', '2021-12-20 14:28:37'),
(100, 18, 'Desa Cipicung', '2021-12-20 14:28:43', '2021-12-20 14:28:43'),
(101, 18, 'Desa Dahu', '2021-12-20 14:28:47', '2021-12-20 14:28:47'),
(102, 18, 'Desa Karyasari', '2021-12-20 14:28:53', '2021-12-20 14:28:53'),
(103, 18, 'Desa Karyautama', '2021-12-20 14:28:59', '2021-12-20 14:28:59'),
(104, 18, 'Desa Mekarjaya', '2021-12-20 14:29:04', '2021-12-20 14:29:04'),
(105, 18, 'Desa Padahayu', '2021-12-20 14:29:10', '2021-12-20 14:29:10'),
(106, 18, 'Desa Tegal', '2021-12-20 14:29:13', '2021-12-20 14:29:13'),
(107, 19, 'Desa Cikadongdong', '2021-12-20 14:29:34', '2021-12-20 14:29:34'),
(108, 19, 'Desa Cikeusik', '2021-12-20 14:29:39', '2021-12-20 14:29:39'),
(109, 19, 'Desa Cikiruhwetan', '2021-12-20 14:29:46', '2021-12-20 14:29:46'),
(110, 19, 'Desa Curugciung', '2021-12-20 14:29:53', '2021-12-20 14:29:53'),
(111, 19, 'Desa Leuwibalang', '2021-12-20 14:30:03', '2021-12-20 14:30:03'),
(112, 19, 'Desa Nanggala', '2021-12-20 14:30:12', '2021-12-20 14:30:12'),
(113, 19, 'Desa Parungkokosan', '2021-12-20 14:30:20', '2021-12-20 14:30:20'),
(114, 19, 'Desa Rancaseneng', '2021-12-20 14:30:31', '2021-12-20 14:30:31'),
(115, 19, 'Desa Sukamulya', '2021-12-20 14:30:41', '2021-12-20 14:30:41'),
(116, 19, 'Desa Sukaseneng', '2021-12-20 14:30:53', '2021-12-20 14:30:53'),
(117, 19, 'Desa Sukawaris', '2021-12-20 14:31:51', '2021-12-20 14:31:51'),
(118, 19, 'Desa Sumurbatu', '2021-12-20 14:31:57', '2021-12-20 14:31:57'),
(119, 19, 'Desa Tanjungan', '2021-12-20 14:32:03', '2021-12-20 14:32:03'),
(120, 19, 'Desa Umbulan', '2021-12-20 14:32:07', '2021-12-20 14:32:07'),
(121, 20, 'Desa Batuhideung', '2021-12-20 14:32:30', '2021-12-20 14:32:30'),
(122, 20, 'Desa Cibadak', '2021-12-20 14:32:35', '2021-12-20 14:32:35'),
(123, 20, 'Desa Ciburial', '2021-12-20 14:32:41', '2021-12-20 14:32:41'),
(124, 20, 'Desa Cijalarang', '2021-12-20 14:32:47', '2021-12-20 14:32:47'),
(125, 20, 'Desa Cimanggu', '2021-12-20 14:32:52', '2021-12-20 14:32:52'),
(126, 20, 'Desa Kramatjaya', '2021-12-20 14:32:59', '2021-12-20 14:32:59'),
(127, 20, 'Desa Mangkualam', '2021-12-20 14:33:05', '2021-12-20 14:33:05'),
(128, 20, 'Desa Padasuka', '2021-12-20 14:33:09', '2021-12-20 14:33:09'),
(129, 20, 'Desa Rancapinang', '2021-12-20 14:33:15', '2021-12-20 14:33:15'),
(130, 20, 'Desa Tangkilsari', '2021-12-20 14:33:28', '2021-12-20 14:33:28'),
(131, 20, 'Desa Tugu', '2021-12-20 14:33:31', '2021-12-20 14:33:31'),
(132, 20, 'Desa Waringinkurung', '2021-12-20 14:33:38', '2021-12-20 14:33:38'),
(133, 21, 'Desa Batubantar', '2021-12-20 14:33:58', '2021-12-20 14:33:58'),
(134, 21, 'Desa Cimanuk', '2021-12-20 14:34:03', '2021-12-20 14:34:03'),
(135, 21, 'Desa Dalembalar', '2021-12-20 14:34:09', '2021-12-20 14:34:09'),
(136, 21, 'Desa Gunungcupu', '2021-12-20 14:34:15', '2021-12-20 14:34:15'),
(137, 21, 'Desa Gunungdatar', '2021-12-20 14:34:24', '2021-12-20 14:34:24'),
(138, 21, 'Desa Kadubungbang', '2021-12-20 14:34:31', '2021-12-20 14:34:31'),
(139, 21, 'Desa Kadudodol', '2021-12-20 14:34:38', '2021-12-20 14:34:38'),
(140, 21, 'Desa Kadumadang', '2021-12-20 14:34:45', '2021-12-20 14:34:45'),
(141, 21, 'Desa Kaduhandap', '2021-12-20 14:34:51', '2021-12-20 14:34:51'),
(142, 21, 'Desa Rocek', '2021-12-20 14:34:54', '2021-12-20 14:34:54'),
(143, 21, 'Desa Sekong', '2021-12-20 14:34:58', '2021-12-20 14:34:58'),
(144, 22, 'Desa Baturanjang', '2021-12-20 14:35:16', '2021-12-20 14:35:16'),
(145, 22, 'Desa Cikadueun', '2021-12-20 14:35:25', '2021-12-20 14:35:25'),
(146, 22, 'Desa Curugbarang', '2021-12-20 14:35:31', '2021-12-20 14:35:31'),
(147, 22, 'Desa Kadugadung', '2021-12-20 14:35:36', '2021-12-20 14:35:36'),
(148, 22, 'Desa Kalanggunung', '2021-12-20 14:35:43', '2021-12-20 14:35:43'),
(149, 22, 'Desa Koncang', '2021-12-20 14:35:48', '2021-12-20 14:35:48'),
(150, 22, 'Desa Palanyar', '2021-12-20 14:35:53', '2021-12-20 14:35:53'),
(151, 22, 'Desa Parumasan', '2021-12-20 14:36:00', '2021-12-20 14:36:00'),
(152, 22, 'Desa Pasireurih', '2021-12-20 14:36:07', '2021-12-20 14:36:07'),
(153, 22, 'Desa Pasirmae', '2021-12-20 14:36:21', '2021-12-20 14:36:21'),
(154, 23, 'Desa Cibarani', '2021-12-20 14:36:38', '2021-12-20 14:36:38'),
(155, 23, 'Desa Ciherangjaya', '2021-12-20 14:36:47', '2021-12-20 14:36:47'),
(156, 23, 'Desa Cisereh', '2021-12-20 14:36:52', '2021-12-20 14:36:52'),
(157, 23, 'Desa Kaduronyok', '2021-12-20 14:36:59', '2021-12-20 14:36:59'),
(158, 23, 'Desa Kondangjaya', '2021-12-20 14:37:06', '2021-12-20 14:37:06'),
(159, 23, 'Desa Kubangkondang', '2021-12-20 14:37:20', '2021-12-20 14:37:20'),
(160, 23, 'Desa Palembang', '2021-12-20 14:37:25', '2021-12-20 14:37:25'),
(161, 23, 'Desa Pasireurih', '2021-12-20 14:37:36', '2021-12-20 14:37:36'),
(162, 23, 'Desa Rawasari', '2021-12-20 14:37:41', '2021-12-20 14:37:41'),
(163, 24, 'Desa Babadsari', '2021-12-20 14:38:03', '2021-12-20 14:38:03'),
(164, 24, 'Desa Banyuresmi', '2021-12-20 14:38:11', '2021-12-20 14:38:11'),
(165, 24, 'Desa Citaman', '2021-12-20 14:38:16', '2021-12-20 14:38:16'),
(166, 24, 'Desa Janaka', '2021-12-20 14:38:21', '2021-12-20 14:38:21'),
(167, 24, 'Desa Jayamekar', '2021-12-20 14:38:25', '2021-12-20 14:38:25'),
(168, 24, 'Desa Jiput', '2021-12-20 14:38:30', '2021-12-20 14:38:30'),
(169, 24, 'Desa Pamarayan', '2021-12-20 14:38:38', '2021-12-20 14:38:38'),
(170, 24, 'Desa Salapraya', '2021-12-20 14:38:45', '2021-12-20 14:38:45'),
(171, 24, 'Desa Sampangbitung', '2021-12-20 14:38:51', '2021-12-20 14:38:51'),
(172, 24, 'Desa Sikulan', '2021-12-20 14:38:55', '2021-12-20 14:38:55'),
(173, 24, 'Desa Sukacai', '2021-12-20 14:38:59', '2021-12-20 14:38:59'),
(174, 24, 'Desa Sukamanah', '2021-12-20 14:39:04', '2021-12-20 14:39:04'),
(175, 24, 'Desa Tenjolahang', '2021-12-20 14:39:13', '2021-12-20 14:39:13'),
(176, 25, 'Kelurahan Cigadung', '2021-12-20 14:40:56', '2021-12-20 14:40:56'),
(177, 25, 'Kelurahan Juhut', '2021-12-20 14:41:00', '2021-12-20 14:41:00'),
(178, 25, 'Kelurahan Kadumerak', '2021-12-20 14:41:05', '2021-12-20 14:41:05'),
(179, 25, 'Kelurahan Pagadungan', '2021-12-20 14:41:12', '2021-12-20 14:41:12'),
(180, 26, 'Desa Awilega', '2021-12-20 14:41:31', '2021-12-20 14:41:31'),
(181, 26, 'Desa Bangkonol', '2021-12-20 14:41:36', '2021-12-20 14:41:36'),
(182, 26, 'Desa Gerendong', '2021-12-20 14:41:45', '2021-12-20 14:41:45'),
(183, 26, 'Desa Karangsetra', '2021-12-20 14:41:50', '2021-12-20 14:41:50'),
(184, 26, 'Desa Koroncong', '2021-12-20 14:41:55', '2021-12-20 14:41:55'),
(185, 26, 'Desa Pakuluran', '2021-12-20 14:42:00', '2021-12-20 14:42:00'),
(186, 26, 'Desa Paniis', '2021-12-20 14:42:03', '2021-12-20 14:42:03'),
(187, 26, 'Desa Pasirjaksa', '2021-12-20 14:42:07', '2021-12-20 14:42:07'),
(188, 26, 'Desa Pasirkarag', '2021-12-20 14:42:23', '2021-12-20 14:42:23'),
(189, 26, 'Desa Setrajaya', '2021-12-20 14:42:30', '2021-12-20 14:42:30'),
(190, 26, 'Desa Sukajaya', '2021-12-20 14:42:33', '2021-12-20 14:42:33'),
(191, 26, 'Desa Tegalongok', '2021-12-20 14:42:41', '2021-12-20 14:42:41'),
(192, 8, 'Desa Banyubiru', '2021-12-20 14:42:56', '2021-12-20 14:42:56'),
(193, 8, 'Desa Banyumekar', '2021-12-20 14:43:01', '2021-12-20 14:43:01'),
(194, 8, 'Desa Caringin', '2021-12-20 14:43:05', '2021-12-20 14:43:05'),
(195, 8, 'Desa Cigondang', '2021-12-20 14:43:11', '2021-12-20 14:43:11'),
(196, 8, 'Desa Kalanganyar', '2021-12-20 14:43:16', '2021-12-20 14:43:16'),
(197, 8, 'Desa Labuan', '2021-12-20 14:43:20', '2021-12-20 14:43:20'),
(198, 8, 'Desa Rancateureup', '2021-12-20 14:43:28', '2021-12-20 14:43:28'),
(199, 8, 'Desa Sukamaju', '2021-12-20 14:43:33', '2021-12-20 14:43:33'),
(200, 8, 'Desa Teluk', '2021-12-20 14:43:37', '2021-12-20 14:43:37'),
(201, 9, 'Desa Cikoneng', '2021-12-20 14:45:42', '2021-12-20 14:45:42'),
(202, 9, 'Desa Cikumbueun', '2021-12-20 14:46:06', '2021-12-20 14:46:06'),
(203, 9, 'Desa Curuglemo', '2021-12-20 14:46:12', '2021-12-20 14:46:12'),
(204, 9, 'Desa Giripawana', '2021-12-20 14:46:19', '2021-12-20 14:46:19'),
(205, 9, 'Desa Gunungsari', '2021-12-20 14:46:25', '2021-12-20 14:46:25'),
(206, 9, 'Desa Kurungkambing', '2021-12-20 14:46:34', '2021-12-20 14:46:34'),
(207, 9, 'Desa Mandalasari', '2021-12-20 14:46:41', '2021-12-20 14:46:41'),
(208, 9, 'Desa Mandalawangi', '2021-12-20 14:46:50', '2021-12-20 14:46:50'),
(209, 9, 'Desa Nembol', '2021-12-20 14:46:55', '2021-12-20 14:46:55'),
(210, 9, 'Desa Pandat', '2021-12-20 14:46:59', '2021-12-20 14:46:59'),
(211, 9, 'Desa Panjangjaya', '2021-12-20 14:47:05', '2021-12-20 14:47:05'),
(212, 9, 'Desa Pari', '2021-12-20 14:47:09', '2021-12-20 14:47:09'),
(213, 9, 'Desa Ramea', '2021-12-20 14:47:13', '2021-12-20 14:47:13'),
(214, 9, 'Desa Sinarjaya', '2021-12-20 14:47:18', '2021-12-20 14:47:18'),
(215, 9, 'Desa Sinargalih', '2021-12-20 14:47:22', '2021-12-20 14:47:22'),
(216, 27, 'Desa Kadubelang', '2021-12-20 14:47:42', '2021-12-20 14:47:42'),
(217, 27, 'Desa Kadujangkung', '2021-12-20 14:47:48', '2021-12-20 14:47:48'),
(218, 27, 'Desa Medong', '2021-12-20 14:47:53', '2021-12-20 14:47:53'),
(219, 27, 'Desa Mekarjaya', '2021-12-20 14:47:58', '2021-12-20 14:47:58'),
(220, 27, 'Desa Pareang', '2021-12-20 14:48:02', '2021-12-20 14:48:02'),
(221, 27, 'Desa Rancabugel', '2021-12-20 14:48:07', '2021-12-20 14:48:07'),
(222, 27, 'Desa Sukamulya', '2021-12-20 14:48:12', '2021-12-20 14:48:12'),
(223, 27, 'Desa Wirasinga', '2021-12-20 14:48:39', '2021-12-20 14:48:39'),
(224, 28, 'Desa Alaswangi', '2021-12-20 14:49:55', '2021-12-20 14:49:55'),
(225, 28, 'Desa Cigandeng', '2021-12-20 14:50:00', '2021-12-20 14:50:00'),
(226, 28, 'Desa Cilabanbulan', '2021-12-20 14:50:11', '2021-12-20 14:50:11'),
(227, 28, 'Desa Kadupayung', '2021-12-20 14:50:16', '2021-12-20 14:50:16'),
(228, 28, 'Desa Kananga', '2021-12-20 14:50:21', '2021-12-20 14:50:21'),
(229, 28, 'Desa Menes', '2021-12-20 14:50:26', '2021-12-20 14:50:26'),
(230, 28, 'Desa Muruy', '2021-12-20 14:50:30', '2021-12-20 14:50:30'),
(231, 28, 'Desa Purwaraja', '2021-12-20 14:50:49', '2021-12-20 14:50:49'),
(232, 28, 'Desa Ramaya', '2021-12-20 14:50:53', '2021-12-20 14:50:53'),
(233, 28, 'Desa Sindangkarya', '2021-12-20 14:51:00', '2021-12-20 14:51:00'),
(234, 28, 'Desa Sukamanah', '2021-12-20 14:51:04', '2021-12-20 14:51:04'),
(235, 28, 'Desa Tegalwangi', '2021-12-20 14:51:09', '2021-12-20 14:51:09'),
(236, 29, 'Desa Cibitung', '2021-12-20 14:51:45', '2021-12-20 14:51:45'),
(237, 29, 'Desa Curuglanglang', '2021-12-20 14:51:53', '2021-12-20 14:51:53'),
(238, 29, 'Desa Gunungbatu', '2021-12-20 14:51:59', '2021-12-20 14:51:59'),
(239, 29, 'Desa Kotadukuh', '2021-12-20 14:52:04', '2021-12-20 14:52:04'),
(240, 29, 'Desa Lebak', '2021-12-20 14:52:08', '2021-12-20 14:52:08'),
(241, 29, 'Desa Munjul', '2021-12-20 14:52:14', '2021-12-20 14:52:14'),
(242, 29, 'Desa Panacaran', '2021-12-20 14:52:21', '2021-12-20 14:52:21'),
(243, 29, 'Desa Pasanggrahan', '2021-12-20 14:52:29', '2021-12-20 14:52:29'),
(244, 29, 'Desa Sukasaba', '2021-12-20 14:52:33', '2021-12-20 14:52:33'),
(245, 30, 'Desa Bama', '2021-12-20 14:52:56', '2021-12-20 14:52:56'),
(246, 30, 'Desa Bulagor', '2021-12-20 14:53:03', '2021-12-20 14:53:03'),
(247, 30, 'Desa Harapankarya', '2021-12-20 14:53:07', '2021-12-20 14:53:07'),
(248, 30, 'Desa Kartasana', '2021-12-20 14:53:35', '2021-12-20 14:53:35'),
(249, 30, 'Desa Margagiri', '2021-12-20 14:53:47', '2021-12-20 14:53:47'),
(250, 30, 'Desa Margasana', '2021-12-20 14:53:53', '2021-12-20 14:53:53'),
(251, 30, 'Desa Montor', '2021-12-20 14:53:58', '2021-12-20 14:53:58'),
(252, 30, 'Desa Pagelaran', '2021-12-20 14:54:02', '2021-12-20 14:54:02'),
(253, 30, 'Desa Senangsari', '2021-12-20 14:54:10', '2021-12-20 14:54:10'),
(254, 30, 'Desa Sindanglaya', '2021-12-20 14:54:17', '2021-12-20 14:54:17'),
(255, 30, 'Desa Sukadame', '2021-12-20 14:54:25', '2021-12-20 14:54:25'),
(256, 30, 'Desa Surakarta', '2021-12-20 14:54:32', '2021-12-20 14:54:32'),
(257, 30, 'Desa Tegalpapak', '2021-12-20 14:54:37', '2021-12-20 14:54:37'),
(258, 31, 'Desa Citeureup', '2021-12-20 14:55:53', '2021-12-20 14:55:53'),
(259, 31, 'Desa Gombong', '2021-12-20 14:55:59', '2021-12-20 14:55:59'),
(260, 31, 'Desa Mekarsari', '2021-12-20 14:56:24', '2021-12-20 14:56:24'),
(261, 31, 'Desa Mekarjaya', '2021-12-20 14:56:31', '2021-12-20 14:56:31'),
(262, 31, 'Desa Panimbangjaya', '2021-12-20 14:56:39', '2021-12-20 14:56:39'),
(263, 31, 'Desa Tanjungjaya', '2021-12-20 14:56:50', '2021-12-20 14:56:50'),
(264, 32, 'Desa Babakankeusik', '2021-12-20 14:57:13', '2021-12-20 14:57:13'),
(265, 32, 'Desa Ciawi', '2021-12-20 14:57:17', '2021-12-20 14:57:17'),
(266, 32, 'Desa Cimoyan', '2021-12-20 14:57:22', '2021-12-20 14:57:22'),
(267, 32, 'Desa Idaman', '2021-12-20 14:57:41', '2021-12-20 14:57:41'),
(268, 32, 'Desa Pasirgadung', '2021-12-20 14:57:46', '2021-12-20 14:57:46'),
(269, 32, 'Desa Patia', '2021-12-20 14:57:51', '2021-12-20 14:57:51'),
(270, 32, 'Desa Rahayu', '2021-12-20 14:57:55', '2021-12-20 14:57:55'),
(271, 32, 'Desa Simpangtiga', '2021-12-20 14:58:01', '2021-12-20 14:58:01'),
(272, 32, 'Desa Surianeun', '2021-12-20 14:58:07', '2021-12-20 14:58:07'),
(273, 32, 'Desa Turus', '2021-12-20 14:58:11', '2021-12-20 14:58:11'),
(274, 15, 'Desa Bungurcopong', '2021-12-20 14:58:29', '2021-12-20 14:58:29'),
(275, 15, 'Desa Ciherang', '2021-12-20 14:58:33', '2021-12-20 14:58:33'),
(276, 15, 'Desa Cililitan', '2021-12-20 14:58:38', '2021-12-20 14:58:38'),
(277, 15, 'Desa Ganggaeng', '2021-12-20 14:58:44', '2021-12-20 14:58:44'),
(278, 15, 'Desa Kadubera', '2021-12-20 15:00:51', '2021-12-20 15:00:51'),
(279, 15, 'Desa Kadupandak', '2021-12-20 15:01:00', '2021-12-20 15:01:00'),
(280, 15, 'Desa Kolelet', '2021-12-20 15:01:05', '2021-12-20 15:01:05'),
(281, 15, 'Desa Pasirpanjang', '2021-12-20 15:01:10', '2021-12-20 15:01:10'),
(282, 15, 'Desa Pasirsedang', '2021-12-20 15:01:15', '2021-12-20 15:01:15'),
(283, 33, 'Desa Banjarnegara', '2021-12-20 15:01:51', '2021-12-20 15:01:51'),
(284, 33, 'Desa Banjarwangi', '2021-12-20 15:01:57', '2021-12-20 15:01:57'),
(285, 33, 'Desa Cilentung', '2021-12-20 15:02:02', '2021-12-20 15:02:02'),
(286, 33, 'Desa Kaduhejo', '2021-12-20 15:02:07', '2021-12-20 15:02:07'),
(287, 33, 'Desa Karyawangi', '2021-12-20 15:02:14', '2021-12-20 15:02:14'),
(288, 33, 'Desa Koranji', '2021-12-20 15:02:18', '2021-12-20 15:02:18'),
(289, 33, 'Desa Sanghiangdengdek', '2021-12-20 15:02:27', '2021-12-20 15:02:27'),
(290, 33, 'Desa Sukaraja', '2021-12-20 15:02:31', '2021-12-20 15:02:31'),
(291, 33, 'Desa Sukasari', '2021-12-20 15:02:35', '2021-12-20 15:02:35'),
(292, 14, 'Desa Ciandur', '2021-12-20 15:02:50', '2021-12-20 15:02:50'),
(293, 14, 'Desa Girijaya', '2021-12-20 15:02:54', '2021-12-20 15:02:54'),
(294, 14, 'Desa Kadudampit', '2021-12-20 15:02:59', '2021-12-20 15:02:59'),
(295, 14, 'Desa Langensari', '2021-12-20 15:03:05', '2021-12-20 15:03:05'),
(296, 14, 'Desa Majau', '2021-12-20 15:03:09', '2021-12-20 15:03:09'),
(297, 14, 'Desa Medalsari', '2021-12-20 15:03:14', '2021-12-20 15:03:14'),
(298, 14, 'Desa Mekarwangi', '2021-12-20 15:03:18', '2021-12-20 15:03:18'),
(299, 14, 'Desa Parigi', '2021-12-20 15:03:22', '2021-12-20 15:03:22'),
(300, 14, 'Desa Saketi', '2021-12-20 15:03:25', '2021-12-20 15:03:25'),
(301, 14, 'Desa Sindanghayu', '2021-12-20 15:03:30', '2021-12-20 15:03:30'),
(302, 14, 'Desa Sodong', '2021-12-20 15:03:34', '2021-12-20 15:03:34'),
(303, 14, 'Desa Sukalangu', '2021-12-20 15:03:40', '2021-12-20 15:03:40'),
(304, 14, 'Desa Talagasari', '2021-12-20 15:03:46', '2021-12-20 15:03:46'),
(305, 14, 'Desa Wanagiri', '2021-12-20 15:03:51', '2021-12-20 15:03:51'),
(306, 34, 'Desa Bojongmanik', '2021-12-20 15:04:26', '2021-12-20 15:04:26'),
(307, 34, 'Desa Campakawarna', '2021-12-20 15:04:55', '2021-12-20 15:04:55'),
(308, 34, 'Desa Ciodeng', '2021-12-20 15:05:01', '2021-12-20 15:05:01'),
(309, 34, 'Desa Kadumalati', '2021-12-20 15:05:06', '2021-12-20 15:05:06'),
(310, 34, 'Desa Pasirdurung', '2021-12-20 15:05:11', '2021-12-20 15:05:11'),
(311, 34, 'Desa Pasirlancar', '2021-12-20 15:05:16', '2021-12-20 15:05:16'),
(312, 34, 'Desa Pasirloa', '2021-12-20 15:05:22', '2021-12-20 15:05:22'),
(313, 34, 'Desa Pasirtenjo', '2021-12-20 15:05:29', '2021-12-20 15:05:29'),
(314, 34, 'Desa Sindangresmi', '2021-12-20 15:05:44', '2021-12-20 15:05:44'),
(315, 35, 'Desa Bojen', '2021-12-20 15:06:25', '2021-12-20 15:06:25'),
(316, 35, 'Desa Bojenwetan', '2021-12-20 15:06:31', '2021-12-20 15:06:31'),
(317, 35, 'Desa Cimanis', '2021-12-20 15:06:34', '2021-12-20 15:06:34'),
(318, 35, 'Desa Kertaraharja', '2021-12-20 15:06:49', '2021-12-20 15:06:49'),
(319, 35, 'Desa Kutamekar', '2021-12-20 15:06:54', '2021-12-20 15:06:54'),
(320, 35, 'Desa Pangkalan', '2021-12-20 15:06:59', '2021-12-20 15:06:59'),
(321, 35, 'Desa Sobang', '2021-12-20 15:07:03', '2021-12-20 15:07:03'),
(322, 35, 'Desa Teluklada', '2021-12-20 15:07:09', '2021-12-20 15:07:09'),
(323, 36, 'Desa Cibungur', '2021-12-20 15:07:30', '2021-12-20 15:07:30'),
(324, 36, 'Desa Cikuya', '2021-12-20 15:07:34', '2021-12-20 15:07:34'),
(325, 36, 'Desa Karyasari', '2021-12-20 15:07:39', '2021-12-20 15:07:39'),
(326, 36, 'Desa Kubangkampil', '2021-12-20 15:07:45', '2021-12-20 15:07:45'),
(327, 36, 'Desa Pasirkadu', '2021-12-20 15:07:49', '2021-12-20 15:07:49'),
(328, 36, 'Desa Perdana', '2021-12-20 15:07:53', '2021-12-20 15:07:53'),
(329, 36, 'Desa Seuseupan', '2021-12-20 15:08:01', '2021-12-20 15:08:01'),
(330, 36, 'Desa Sidamukti', '2021-12-20 15:08:07', '2021-12-20 15:08:07'),
(331, 36, 'Desa Sukaresmi', '2021-12-20 15:08:13', '2021-12-20 15:08:13'),
(332, 36, 'Desa Weru', '2021-12-20 15:08:17', '2021-12-20 15:08:17'),
(333, 37, 'Desa Cigorondong', '2021-12-20 15:08:33', '2021-12-20 15:08:33'),
(334, 37, 'Desa Kertajaya', '2021-12-20 15:08:53', '2021-12-20 15:08:53'),
(335, 37, 'Desa Kertamukti', '2021-12-20 15:08:58', '2021-12-20 15:08:58'),
(336, 37, 'Desa Sumberjaya', '2021-12-20 15:09:05', '2021-12-20 15:09:05'),
(337, 37, 'Desa Tamanjaya', '2021-12-20 15:09:12', '2021-12-20 15:09:12'),
(338, 37, 'Desa Tunggaljaya', '2021-12-20 15:09:20', '2021-12-20 15:09:20'),
(339, 37, 'Desa Ujungjaya', '2021-12-20 15:09:25', '2021-12-20 15:09:25');

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
(24, '2021_11_28_210240_informasi', 4),
(28, '2021_11_28_142829_paten', 5),
(29, '2021_12_03_152802_kependudukan', 5),
(30, '2021_12_03_153513_akta', 5),
(31, '2021_12_03_153525_bencana', 5);

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
('01dade60643ec64e1bd5807e11f5e92c7c892e2041d973d343669a934e103806029d5f7cdc2626cb', 3, 1, 'Token', '[]', 0, '2021-12-14 04:09:48', '2021-12-14 04:09:48', '2021-12-15 11:09:48'),
('02310cc4634cf8548ec2c16eb4c6214e52459c3967ad9c9cff3d36d4c0c6a0b51f8bcd2b634dce2f', 26, 1, 'Token', '[]', 0, '2021-12-27 15:59:18', '2021-12-27 15:59:18', '2021-12-28 22:59:18'),
('04aa6ccde49328b273e3f85edb881004f2892bafbe297576211548d558856cdf8ef62338983302d1', 3, 1, 'Token', '[]', 0, '2021-12-13 15:05:07', '2021-12-13 15:05:07', '2021-12-14 22:05:06'),
('04ba0135aa5cc997991dadcebe514c5be437dbc30ac5a062cebe1d7d3417b81d3de85fc12230b20b', 7, 1, 'Token', '[]', 0, '2021-12-25 12:53:59', '2021-12-25 12:53:59', '2021-12-26 19:53:59'),
('05364515e272c86e39de7ef50e713cc39c19f3920403a3660b18d48a43414220a6f41b912ae6e6be', 3, 1, 'Token', '[]', 0, '2021-12-14 04:10:07', '2021-12-14 04:10:07', '2021-12-15 11:10:07'),
('05b350f6e94ed3d99a9822da3efc9582a1c9d30ed405aa96174caa018ef4520c64606ace379328aa', 7, 1, 'Token', '[]', 0, '2021-12-25 13:45:20', '2021-12-25 13:45:20', '2021-12-26 20:45:20'),
('073c858e4cb27bdfea769b10e5b79c25b6d2a6bf76874d66d75188a7770557accc53f79e899d080a', 6, 1, 'Token', '[]', 0, '2021-12-25 04:49:42', '2021-12-25 04:49:42', '2021-12-26 11:49:42'),
('07c3f6ddfa5d9934be468da7b02469132fd8d5d426023dd524204db35de319cde7fde085149ce553', 6, 1, 'Token', '[]', 0, '2021-12-18 12:51:20', '2021-12-18 12:51:20', '2021-12-19 19:51:20'),
('084cd6d6f0b53c41ec95a9c196645b8e6ef8507b07be00cd02328985333ecf6e9b0c55d6c887a4e3', 7, 1, 'Token', '[]', 0, '2021-12-27 15:56:41', '2021-12-27 15:56:41', '2021-12-28 22:56:41'),
('0932bbb61d6f5ecd5d03c073d9570362d90fff23aa03f368bd255bb79d381ae4cc08d6b1e67454fe', 6, 1, 'Token', '[]', 0, '2021-12-13 06:04:11', '2021-12-13 06:04:11', '2021-12-14 13:04:11'),
('09a76b4b2f4e46631465160151b25ab601e43cc8d921ea7e881211c21cfa9dee6cbcc916d162206d', 4, 1, 'Token', '[]', 0, '2021-11-29 08:20:13', '2021-11-29 08:20:13', '2021-11-30 15:20:13'),
('09ade17b306bdd90c241d5b6c19fcc59f59e587ca56a33eac060e62c514c8259875c1f18e8620ec1', 7, 1, 'Token', '[]', 0, '2021-12-27 15:56:47', '2021-12-27 15:56:47', '2021-12-28 22:56:47'),
('0a0a9415594376a106cfe27cae91512a8a87141d0accbeb58545a1f5b076dff35d060e991aafb45b', 1, 1, 'Token', '[]', 0, '2021-12-25 10:51:13', '2021-12-25 10:51:13', '2021-12-26 17:51:13'),
('0ae8207f433b29bd206c585397261e3f9d9c17e9caba26d156f681c25de05b9993fa16670d93a3a6', 6, 1, 'Token', '[]', 0, '2021-12-19 11:46:56', '2021-12-19 11:46:56', '2021-12-20 18:46:56'),
('0edb08e1f3cd749bf6a69739f4a96606d7d4fadda66a6075b6d4b29116f0a6a5979eae16e3d4d3ce', 3, 1, 'Token', '[]', 0, '2021-11-29 14:04:02', '2021-11-29 14:04:02', '2021-11-30 21:04:02'),
('0f50011cca85083a57795190332a0fbfd44d5cde0569616f370f7ca5b9c7c79a318c29bca07ff550', 3, 1, 'Token', '[]', 0, '2021-12-08 09:26:59', '2021-12-08 09:26:59', '2021-12-09 16:26:59'),
('112fe28bce578e152a47bc475cf00d9f7bf7a911568e57363120a75e733630409dea54c2f75df6e6', 4, 1, 'Token', '[]', 0, '2021-11-29 16:58:32', '2021-11-29 16:58:32', '2021-11-30 23:58:32'),
('1195258277a91b9f040c4101cdad9c8d4eda24f203341093a21c82fe2626f0c3270a6ebddecb9554', 7, 1, 'Token', '[]', 0, '2021-12-21 11:01:17', '2021-12-21 11:01:17', '2021-12-22 18:01:16'),
('125b9a52afa22ee1bee38505385ff06024bb21edf9a5438d001d290dcdbf8e944217087c521aafb3', 3, 1, 'Token', '[]', 0, '2021-12-14 04:08:45', '2021-12-14 04:08:45', '2021-12-15 11:08:45'),
('144f74a8b698310462746267c3ffa19ea04ebe2102360e972c2cafb5b2b48741840d8b5a0aaaed8a', 7, 1, 'Token', '[]', 0, '2021-12-25 11:15:46', '2021-12-25 11:15:46', '2021-12-26 18:15:46'),
('1542ad5b006e7829f00453d6a749ec781d567b9af233ba672bceb143ef7f8ebf812c16e7113587ed', 4, 1, 'Token', '[]', 0, '2021-11-29 08:36:59', '2021-11-29 08:36:59', '2021-11-30 15:36:59'),
('15aaad91404a7465cfddda61b3c4413d6bccc629450570302015ee78ac5f84db51f86759ff4191af', 7, 1, 'Token', '[]', 0, '2021-12-25 10:52:36', '2021-12-25 10:52:36', '2021-12-26 17:52:36'),
('182eb53a633e8df57f7f98c7b70f82e93e606507a93b155ce1ad5dc2034d11594a037050b08fd7df', 7, 1, 'Token', '[]', 0, '2021-12-21 09:49:36', '2021-12-21 09:49:36', '2021-12-22 16:49:36'),
('193a067f5e31fdb82aff932e03f8729b0917850eaf67e5db5cca83f72fc6eed5e5c95d082de0c312', 1, 1, 'Token', '[]', 0, '2021-12-25 05:03:07', '2021-12-25 05:03:07', '2021-12-26 12:03:07'),
('195af67458bcf507bdf86cca833f0a1d9df45d4b6dfa34a2c7bcea41e16efc51980a57df2bcc2b92', 6, 1, 'Token', '[]', 0, '2021-12-17 04:19:39', '2021-12-17 04:19:39', '2021-12-18 11:19:39'),
('198ec4147e8ae5a5afda30f8996fbf755abc96d7cd9b8662b475ad0fd6828c4acf7dd949664f5ee1', 1, 1, 'Token', '[]', 0, '2021-11-29 13:13:41', '2021-11-29 13:13:41', '2021-11-30 20:13:41'),
('1af3fb3a56ea8f149f1c1e21da7a5138200c329553bc66cfaf1c3c3e18e401161bd506459ee7f160', 3, 1, 'Token', '[]', 0, '2021-11-29 16:57:46', '2021-11-29 16:57:46', '2021-11-30 23:57:45'),
('1d059aee0d5d382770edafaa5fb9a4bca45708149fe2c2f69eb8923663ea743d6d8fbfda5ea8a5dd', 3, 1, 'Token', '[]', 0, '2021-12-08 07:39:59', '2021-12-08 07:39:59', '2021-12-09 14:39:59'),
('1d5910fccee91fa1d8dce144493066424341c55517f2b9938bd8629def5b389ed93440d573c8c56d', 3, 1, 'Token', '[]', 0, '2021-12-13 14:00:58', '2021-12-13 14:00:58', '2021-12-14 21:00:58'),
('1e7bbaf073b9021cc5c991c88588a42f1496cf5719d2bd1404d5edd7ff883207c9010da4848a61c3', 3, 1, 'Token', '[]', 0, '2021-12-13 13:21:29', '2021-12-13 13:21:29', '2021-12-14 20:21:28'),
('1ef847065b41d8c0e47b8eace771249c38eaad56365b5451dceb9be757f7bf6c8e94982faaaa1be7', 7, 1, 'Token', '[]', 0, '2021-12-27 15:55:51', '2021-12-27 15:55:51', '2021-12-28 22:55:51'),
('2032f1d838ae9e3f718bdce392dad549dee804d3791f15ba591d8ec0814bcb466d51fc76c087b1ff', 26, 1, 'Token', '[]', 0, '2021-12-27 16:21:07', '2021-12-27 16:21:07', '2021-12-28 23:21:07'),
('21e18524d39a7bbe2916ec0b3b08ae93b097677b703eebc4e6d835d636e5163d6586ec1ffb3ae641', 1, 1, 'Token', '[]', 0, '2021-11-29 08:19:49', '2021-11-29 08:19:49', '2021-11-30 15:19:49'),
('220f79e49ca9608400c0bd70a534858cd70ae5fec71cc1ea233323990a8897b7618419f574e07a71', 6, 1, 'Token', '[]', 0, '2021-12-13 02:01:55', '2021-12-13 02:01:55', '2021-12-14 09:01:54'),
('239f0550fad50d1276ad50025498bc599fa1d190164346651278b5d10accf6288f9c4f3b8c3bbe0d', 7, 1, 'Token', '[]', 0, '2021-12-27 15:41:49', '2021-12-27 15:41:49', '2021-12-28 22:41:49'),
('24c77afd62c8718c81433fb449d60507e05f0926c8f2a5f094866f9b2200f70d8fb4f33b3979f008', 3, 1, 'Token', '[]', 0, '2021-11-29 17:11:33', '2021-11-29 17:11:33', '2021-12-01 00:11:33'),
('26575038faf796a6e0538d5edfc7ad21d9fab6b394127b0719af80802eb320dc7a157fb7c3c8802d', 4, 1, 'Token', '[]', 0, '2021-12-19 05:38:23', '2021-12-19 05:38:23', '2021-12-20 12:38:20'),
('290bd338c1064bfd633c30801324d6f0e18bc870a0fe8831ac6b8a369251a7be8ac3dc24a96b5e29', 4, 1, 'Token', '[]', 0, '2021-11-28 17:22:03', '2021-11-28 17:22:03', '2021-11-30 00:22:03'),
('2934f31e2cbff0d5f360f40e70a9bbc66b4e28f2affd1c68bb53edc3cab3057413ae46ae0796c400', 6, 1, 'Token', '[]', 0, '2021-12-18 13:56:06', '2021-12-18 13:56:06', '2021-12-19 20:56:06'),
('2c0ce2b87a3b9686b938c7311f38b73e48d91fc6af1e2f691899973e1a6ae95aff3aee08f65b7fef', 4, 1, 'Token', '[]', 0, '2021-12-15 12:19:52', '2021-12-15 12:19:52', '2021-12-16 19:19:52'),
('2c82e100d1ea5034070a2ef6d8d42f13341644786c946cd9444e0eb4f6b482462b3327f74c6aa156', 3, 1, 'Token', '[]', 0, '2021-12-08 07:41:04', '2021-12-08 07:41:04', '2021-12-09 14:41:04'),
('2eb21972bfc6301666937125392982d3909234d92ff677bce15fd796b874cdbcc4b9c2ef61c346a8', 6, 1, 'Token', '[]', 0, '2021-12-18 14:06:59', '2021-12-18 14:06:59', '2021-12-19 21:06:59'),
('30064e321b3034f23b3c10880ca9817db7380815ee4b6f27007b879b6e1128d85bb7cb638fccbca9', 3, 1, 'Token', '[]', 0, '2021-11-29 17:00:13', '2021-11-29 17:00:13', '2021-12-01 00:00:13'),
('333a59138837eff7b3693b78100e6faa10e88889733d2696949e60670444386464ca8604a71516ea', 6, 1, 'Token', '[]', 0, '2021-12-08 16:54:39', '2021-12-08 16:54:39', '2021-12-09 23:54:39'),
('33528513d1a8440cba3ca94ad622f943b396e3fa5ab5117b6027cc7bf4032b25adf64de3a704479a', 1, 1, 'Token', '[]', 0, '2021-12-13 14:04:00', '2021-12-13 14:04:00', '2021-12-14 21:04:00'),
('33c883f0544c5636acafd203ca5cdd0812da5a1bd6510d34cfaa6de58cc0ae6794e64b23e269c9bf', 6, 1, 'Token', '[]', 0, '2021-12-18 13:56:28', '2021-12-18 13:56:28', '2021-12-19 20:56:27'),
('3462daf682a5a4a9764afeb0938295d733c5db627836eb88a69acf1a6520bd0c5352de6d4a24891e', 3, 1, 'Token', '[]', 0, '2021-11-29 12:17:50', '2021-11-29 12:17:50', '2021-11-30 19:17:50'),
('37015823f0655b23f2635abbdfd1bc7d1cd7eca51dd1e8fdea7e8e05fcba1fab610f05d6cf6f472a', 1, 1, 'Token', '[]', 0, '2021-12-13 04:29:36', '2021-12-13 04:29:36', '2021-12-14 11:29:36'),
('376cd7c771a799365ad8f9040c1fa448b97b8654861a2f4656d816edad171fc02a50abb63c6612ca', 1, 1, 'Token', '[]', 0, '2021-12-25 10:48:42', '2021-12-25 10:48:42', '2021-12-26 17:48:42'),
('3838d8b770b393fad3d05e30fc65e45e7624a567a441162f98e4e9ca81347ca5898f8291c7fd9669', 6, 1, 'Token', '[]', 0, '2021-12-19 11:16:35', '2021-12-19 11:16:35', '2021-12-20 18:16:35'),
('39ea91c8ec2bab3011ffa0ab567edd778180dac1d28b3027ccb4e44b4c4998c9332e2df9f1fdd850', 3, 1, 'Token', '[]', 0, '2021-11-29 13:18:11', '2021-11-29 13:18:11', '2021-11-30 20:18:11'),
('3c941c3763d5e395a7745ed2974747f02cce5c0f74ae363d0b77264b0b571402a5ec081af433af1e', 25, 1, 'Token', '[]', 0, '2021-12-27 15:55:23', '2021-12-27 15:55:23', '2021-12-28 22:55:23'),
('3caed6f2f7d39085ff48c4ecc583a4918881c82a1e6fdb3b95be8209d3337d601b35cf93575f0cc7', 4, 1, 'Token', '[]', 0, '2021-12-17 12:49:24', '2021-12-17 12:49:24', '2021-12-18 19:49:24'),
('3dd68346fe748207c74263b730b456a99e12153f79ed2fa16a465584cb1e309c97e012683ab01360', 1, 1, 'Token', '[]', 0, '2021-12-25 09:58:04', '2021-12-25 09:58:04', '2021-12-26 16:58:04'),
('3f402867b66d73df4a1073ea836661792cfdeab0dcbd5643bc4e72917c18296fb88b0e9dd0586957', 6, 1, 'Token', '[]', 0, '2021-12-22 17:56:19', '2021-12-22 17:56:19', '2021-12-24 00:56:18'),
('3f8e2d3e5bdfc9ae37e1ec87c1a0f3190a536e9c4a393cd3f9b9a486a8dd102ea818f086b4300a6b', 7, 1, 'Token', '[]', 0, '2021-12-20 15:11:10', '2021-12-20 15:11:10', '2021-12-21 22:11:10'),
('400e9a8ffa448d7cada92979d1f3c2d6d326055333c8c5fdadbd39dbcfdee1bf7f7ee443076aac2d', 6, 1, 'Token', '[]', 0, '2021-12-23 18:18:05', '2021-12-23 18:18:05', '2021-12-25 01:18:04'),
('40249f24d6ea0fba6af877ace03119c9bd7e9e319597ec5a78de048c4e7958f042afdfe2a6d73679', 6, 1, 'Token', '[]', 0, '2021-12-22 17:42:56', '2021-12-22 17:42:56', '2021-12-24 00:42:56'),
('4287f46cc53df4b68c1ae4a09b5a66ac04ac8deb5424b0a4d71eead34c0667a3cc9b839f025a749f', 6, 1, 'Token', '[]', 0, '2021-12-08 11:38:44', '2021-12-08 11:38:44', '2021-12-09 18:38:44'),
('42ed3909ecb19df41f3be13e1dc5b38de350df6720c3fa1b44994109aa4262def8c5cb7d13261ea3', 1, 1, 'Token', '[]', 0, '2021-12-25 11:16:43', '2021-12-25 11:16:43', '2021-12-26 18:16:43'),
('4335f72ba14d29025c5af729dec9e9e87bb42c8aa82f711f8ab842181329e4ff0bb8adc55b4465b9', 25, 1, 'Token', '[]', 0, '2021-12-27 15:54:51', '2021-12-27 15:54:51', '2021-12-28 22:54:51'),
('449c700c7b96cd08db6f30056dfab8a56c142d85c31184c34d1e187ef21d7c988271ef50bd63cd07', 6, 1, 'Token', '[]', 0, '2021-12-08 16:59:27', '2021-12-08 16:59:27', '2021-12-09 23:59:27'),
('45ec9e763935aab31dcbe12cd92477104ed2165348ab4f346ef16855cc2699a035df9ee13056cb8f', 1, 1, 'Token', '[]', 0, '2021-12-20 05:43:50', '2021-12-20 05:43:50', '2021-12-21 12:43:50'),
('470002ab16aefea9e96fd12eaf297dbf0aa4a33e358a5a1a2c433f55bcc015af78d44d4c025ea839', 26, 1, 'Token', '[]', 0, '2021-12-27 16:28:45', '2021-12-27 16:28:45', '2021-12-28 23:28:45'),
('493ccadee79146622fabde0e7f13c56e7c4397f8cdbe8d1df901e0b6588c10c3994503c62fbf2aaa', 1, 1, 'Token', '[]', 0, '2021-12-20 05:43:15', '2021-12-20 05:43:15', '2021-12-21 12:43:15'),
('4af5a176aa0c9a0902528d5fa3ffbfc8ba68bf34bd00f0e116deec4b891d62808d0d41b9f36885ff', 6, 1, 'Token', '[]', 0, '2021-12-18 12:10:03', '2021-12-18 12:10:03', '2021-12-19 19:10:03'),
('4bb4030c17b9050b4095b7db765c51d8d28d1d6a4bb3aee14f2eb7df995166b8e6a18851bdee1099', 1, 1, 'Token', '[]', 0, '2021-12-14 04:01:01', '2021-12-14 04:01:01', '2021-12-15 11:01:00'),
('4be4a26db9e3be845011d97f5bf1eb949e2873baee7cd9129f1d0a6951c527b4c14bc3f0ebd7c9d3', 4, 1, 'Token', '[]', 0, '2021-12-13 15:05:32', '2021-12-13 15:05:32', '2021-12-14 22:05:32'),
('4eff7abd2c341324eba21eeee2c08ea11d683df33363342c5895f87baa9084985212ac5a11678076', 6, 1, 'Token', '[]', 0, '2021-12-19 08:26:12', '2021-12-19 08:26:12', '2021-12-20 15:26:11'),
('50bcfd0d4d9fa0f03fed075a581028961fb0d17b4e5902990b4a958878b43c87ba1bcfdea68d7070', 6, 1, 'Token', '[]', 0, '2021-12-14 04:39:18', '2021-12-14 04:39:18', '2021-12-15 11:39:18'),
('52cd6de221771626de66aa593d8243fd1da9bbaf4574884a7929f541161298b6e17e957650033bbb', 7, 1, 'Token', '[]', 0, '2021-12-27 15:45:43', '2021-12-27 15:45:43', '2021-12-28 22:45:43'),
('536b6ac2364f0deafd3a51f143973fac22df614102204b890014083146cfe9a623e6d157f3857d83', 4, 1, 'Token', '[]', 0, '2021-11-29 16:58:56', '2021-11-29 16:58:56', '2021-11-30 23:58:56'),
('53af38abc44925cc9992f01e8bf69fffbd5191e827908e470e1f11dd01971b41a3957c51955c9f67', 1, 1, 'Token', '[]', 0, '2021-12-20 11:05:36', '2021-12-20 11:05:36', '2021-12-21 18:05:36'),
('55c34d7bce54339c029c843293056217f359d8ad7261b4d6d0913935582231cadd27b3086a6e9256', 1, 1, 'Token', '[]', 0, '2021-12-23 05:28:16', '2021-12-23 05:28:16', '2021-12-24 12:28:16'),
('5677ca2ee9df7b0dcb3df0928dc128c53b5dbe765150e39946029c8468378f9920e56644a5f59a18', 6, 1, 'Token', '[]', 0, '2021-12-22 18:24:31', '2021-12-22 18:24:31', '2021-12-24 01:24:31'),
('57b1f10adf8d1917ced1d50f32da8f871e402660b62607d206b2b74c7467ffe3290893d799944971', 1, 1, 'Token', '[]', 0, '2021-12-21 11:04:53', '2021-12-21 11:04:53', '2021-12-22 18:04:53'),
('59313c5b8b8e2f3b7fbde48ebb656c0c608c8fd3aebf12ef4e665b777ef91a44a71811ac5afd2669', 1, 1, 'Token', '[]', 0, '2021-11-29 14:46:30', '2021-11-29 14:46:30', '2021-11-30 21:46:29'),
('5932ff92ca3335f3a8693993e927e7c9252e58444ad2be6d0d4fa49d8ff217fb91ba6d51655c7270', 4, 1, 'Token', '[]', 0, '2021-11-29 08:27:17', '2021-11-29 08:27:17', '2021-11-30 15:27:16'),
('59989981f1ec39c162100aad152e5478fa849046faa008d6403c86809dde409ad6867e3d07892dae', 6, 1, 'Token', '[]', 0, '2021-12-13 12:46:53', '2021-12-13 12:46:53', '2021-12-14 19:46:53'),
('5af1077004b969d16944426aa01fd9b123096ffc26152047b571e395241340619f7991b67cb26a29', 3, 1, 'Token', '[]', 0, '2021-12-08 07:41:47', '2021-12-08 07:41:47', '2021-12-09 14:41:46'),
('5b256f7c2852ca06f034470f030d3ccf0e3f0ab08af285dcd7e1f63ed0b34fdb2fe113adc722c5ae', 4, 1, 'Token', '[]', 0, '2021-12-18 12:45:42', '2021-12-18 12:45:42', '2021-12-19 19:45:42'),
('5c182f19569940c91f8873a558228c8c59ab21e361579841c493d99cb5282af54951b00d7cb24727', 3, 1, 'Token', '[]', 0, '2021-11-29 14:54:03', '2021-11-29 14:54:03', '2021-11-30 21:54:03'),
('5c8fa361cb8fc089a7bd6b6426150e7956a3c2a2eb45c1aa08d47c5cf05d9503ca8f089763b8b5ca', 6, 1, 'Token', '[]', 0, '2021-12-18 14:01:01', '2021-12-18 14:01:01', '2021-12-19 21:01:01'),
('5d44b36e75c10da519aefad7a670d03192a6226003da39bb51ee2f38833fce3960715a51a2043e2a', 7, 1, 'Token', '[]', 0, '2021-12-27 15:46:49', '2021-12-27 15:46:49', '2021-12-28 22:46:49'),
('5d85b816ba9047d3a22631d93bf0d9c43f8a9a3e931638a60d33a2fc2778145515d77c86e14d50ea', 1, 1, 'Token', '[]', 0, '2021-12-15 12:28:37', '2021-12-15 12:28:37', '2021-12-16 19:28:37'),
('5df20a4ab51bab3cc937530a2ce86c5052e6bf4bccf56b13bda59fe8aac23b3c30bc8b17a05dfce5', 6, 1, 'Token', '[]', 0, '2021-12-08 16:58:41', '2021-12-08 16:58:41', '2021-12-09 23:58:40'),
('5e580bcfdf80530b1f160658c415bc250cd868c1053c1cea19d995b8d3e320e02a394261d9d8c16b', 3, 1, 'Token', '[]', 0, '2021-12-13 14:21:25', '2021-12-13 14:21:25', '2021-12-14 21:21:25'),
('5ef7eda68124e55c0abdd1582ec4765a9c2fa8d5b7de8b03cb858c465a890740c4d0ad57abd84450', 25, 1, 'Token', '[]', 0, '2021-12-27 15:51:42', '2021-12-27 15:51:42', '2021-12-28 22:51:42'),
('6055500010a1f8c0b8a95398c2f0cbb8d28b84e08682c64155b8a5d1e75c38c663e372dcd0f79558', 6, 1, 'Token', '[]', 0, '2021-12-19 08:06:40', '2021-12-19 08:06:40', '2021-12-20 15:06:40'),
('608f953c8d7d4d0faa2706ae8adfcb77ebefc563702e25a75896fee4a4dc1c1c4b53c8f447a34132', 6, 1, 'Token', '[]', 0, '2021-12-17 04:24:07', '2021-12-17 04:24:07', '2021-12-18 11:24:06'),
('621bf044bed3c1e05ec4ac4a6be9d59d86ed47a628051150e19018cd9a7e5076a1091ea36c97ba8a', 6, 1, 'Token', '[]', 0, '2021-12-13 06:03:29', '2021-12-13 06:03:29', '2021-12-14 13:03:29'),
('6251e2497d2297c8e8936fbe2ad120cdbd1365014ab04dafc20a0bf7149745317ac5e2f80512507f', 6, 1, 'Token', '[]', 0, '2021-12-19 11:28:16', '2021-12-19 11:28:16', '2021-12-20 18:28:16'),
('6257de5209b662e7edff823a5814139cf693242b440125d75313b5dc184a31f7e3f498ca180a9ced', 3, 1, 'Token', '[]', 0, '2021-12-08 07:40:31', '2021-12-08 07:40:31', '2021-12-09 14:40:31'),
('6287e87c76f026806471f0ce07fd0f8b569d334cf905ebf18558174419507c3786051ffcce56f10e', 6, 1, 'Token', '[]', 0, '2021-12-13 04:18:01', '2021-12-13 04:18:01', '2021-12-14 11:18:01'),
('6504fa15a8751dfbc573b0504dbb5e34ea79782f1aefdfee9a86cb76dd627855da2836507d4da9e0', 1, 1, 'Token', '[]', 0, '2021-12-22 17:43:18', '2021-12-22 17:43:18', '2021-12-24 00:43:18'),
('672d62326e8859cd756480e349580caeb7ea45b9c32398c22491224fbe816dcc6628d38d20f40715', 1, 1, 'Token', '[]', 0, '2021-12-18 16:49:21', '2021-12-18 16:49:21', '2021-12-19 23:49:19'),
('677fd018357aa601b3bb6b802b083f511e3c57354f9e8662c274174ba06581cd789e639face6f87e', 7, 1, 'Token', '[]', 0, '2021-12-27 15:28:40', '2021-12-27 15:28:40', '2021-12-28 22:28:39'),
('68181d6aa47eb8c89d39ee6ed3aea314644b2fe96959f23899cfb08a5817fa8ff83fdbc3fd9c02f4', 7, 1, 'Token', '[]', 0, '2021-12-27 15:42:36', '2021-12-27 15:42:36', '2021-12-28 22:42:36'),
('69bea9ef4a441e0026151e249a4941f49b98f3074ea787a527ba00c9dbc38ec267773b8268cb3471', 6, 1, 'Token', '[]', 0, '2021-12-17 04:17:33', '2021-12-17 04:17:33', '2021-12-18 11:17:33'),
('6c8f6cb8c90e794761558a070550669d877d94bf8b91fe28de9a5e46d77509b2997969f6445a11a5', 6, 1, 'Token', '[]', 0, '2021-12-13 02:15:22', '2021-12-13 02:15:22', '2021-12-14 09:15:22'),
('6ce5acc05e04ffb177bfd259cd96222bec823c8fc8420d938add59a8b32c98bbe7f71d14aa875e0f', 6, 1, 'Token', '[]', 0, '2021-12-14 06:32:08', '2021-12-14 06:32:08', '2021-12-15 13:32:08'),
('6dd9e485e9d3483e1b55bb9c989a03a053dc164bb8241038736da3d2250110573003fec175cfa858', 4, 1, 'Token', '[]', 0, '2021-11-29 07:31:46', '2021-11-29 07:31:46', '2021-11-30 14:31:45'),
('6fffe90ee71ea7e7a8ee997cb8a619d56d709d28bfb0102c1442b42025ce09f6b19bdf0372751905', 3, 1, 'Token', '[]', 0, '2021-12-16 12:51:43', '2021-12-16 12:51:43', '2021-12-17 19:51:43'),
('75860a26a310b273123ded42844cccb78ca6b6681e30cfaeeba16907880df8eee29f43109f0910e3', 6, 1, 'Token', '[]', 0, '2021-12-14 04:12:00', '2021-12-14 04:12:00', '2021-12-15 11:12:00'),
('75990665c479a6b692fb1b7e6c1685267e79a32aec7b5101a2043bf0ae819f97ab268f1f9b1d333e', 1, 1, 'Token', '[]', 0, '2021-12-25 10:59:03', '2021-12-25 10:59:03', '2021-12-26 17:59:03'),
('75f5e29d2d4a724a8a354fc1dd888835639927723d3b92b4a9ab380a90a874accba6329dd657f281', 5, 1, 'Token', '[]', 0, '2021-12-20 15:10:08', '2021-12-20 15:10:08', '2021-12-21 22:10:08'),
('764750a8127b8a5f2970a8a7924ac5d521a065ff1b596b9a4de00ed0fed99255755a5ff28edb9b56', 6, 1, 'Token', '[]', 0, '2021-12-17 04:34:54', '2021-12-17 04:34:54', '2021-12-18 11:34:53'),
('780420b29222a096be00ac690b70fea4cc0cfe4548d67ab109c060954f066bf5735160ba558a0f0c', 6, 1, 'Token', '[]', 0, '2021-12-24 06:04:55', '2021-12-24 06:04:55', '2021-12-25 13:04:55'),
('7d18ec5b8d6d30dde692f4137067362503fff4531759d9c3b3eb4afdcb3b0a8947a59977b8370d24', 3, 1, 'Token', '[]', 0, '2021-11-29 07:32:00', '2021-11-29 07:32:00', '2021-11-30 14:31:59'),
('7d646f9160769d165283c5b8c7cc1e85642b3447d78d7160730e0d79377f4fd6b6cdaab05926cc5a', 6, 1, 'Token', '[]', 0, '2021-12-18 12:12:10', '2021-12-18 12:12:10', '2021-12-19 19:12:10'),
('80f9e13a4ef275afe0b5b7ba112df2e4d3cd0533a8107421d99606ac80c1e8414547936935b403f6', 6, 1, 'Token', '[]', 0, '2021-12-13 02:01:33', '2021-12-13 02:01:33', '2021-12-14 09:01:33'),
('81142d2fb629cafc6da071c0d9931d3f2c14076cfd6f3449d212daee7f2ba6dd065f619e3d5c30e3', 6, 1, 'Token', '[]', 0, '2021-12-18 14:06:48', '2021-12-18 14:06:48', '2021-12-19 21:06:47'),
('820449c6979e63007e8fa1a8f522b40fa93ee065af3cfa17b8f958d7b9753b75119c74bb8fd5dd12', 6, 1, 'Token', '[]', 0, '2021-12-21 12:28:57', '2021-12-21 12:28:57', '2021-12-22 19:28:57'),
('82cef455d029ed10697c6e000c6c237f785fba50888ec6eb3a6eb7aeb03034ff58c039929de3b1b3', 6, 1, 'Token', '[]', 0, '2021-12-14 04:28:53', '2021-12-14 04:28:53', '2021-12-15 11:28:53'),
('82f03b4ff75416c721ba941f396d37de9e851036f159aa03571446b46d2bada544f4f84fa8183cd1', 1, 1, 'Token', '[]', 0, '2021-12-20 13:01:09', '2021-12-20 13:01:09', '2021-12-21 20:01:08'),
('83608569ab13ab88700cbe5346a42f0437f2f967232068a6b2f87d3cb223d270749ac4d2a882c416', 6, 1, 'Token', '[]', 0, '2021-12-13 06:02:35', '2021-12-13 06:02:35', '2021-12-14 13:02:35'),
('836760165a8984d64df0c8faa4ac61f57899a7e6f2e70fc7de22d316cd1c7ded2eedbea8187681a3', 4, 1, 'Token', '[]', 0, '2021-12-14 06:31:02', '2021-12-14 06:31:02', '2021-12-15 13:31:02'),
('843b283510053d5a1bb8c7ebc61fb94419d14b988801749af106d8268ef3aede0a132afb78ba2f78', 7, 1, 'Token', '[]', 0, '2021-12-25 09:58:56', '2021-12-25 09:58:56', '2021-12-26 16:58:56'),
('85e897ce380e6cc10f0ce48a3511fb54fca4aacb579d4ca62c6ee391431abac61d0abcc29583e512', 6, 1, 'Token', '[]', 0, '2021-12-23 03:59:42', '2021-12-23 03:59:42', '2021-12-24 10:59:41'),
('85efe9b16d17adaf947040a57034039c23a29385f6adff777052526a5e2b33fc768b4e5653383ae1', 7, 1, 'Token', '[]', 0, '2021-12-27 15:56:52', '2021-12-27 15:56:52', '2021-12-28 22:56:52'),
('865d2ce4877ae3643273432128045bad9416e78f2c809f4a809dad7b7be4971fb74c5625d2547685', 6, 1, 'Token', '[]', 0, '2021-12-18 14:12:05', '2021-12-18 14:12:05', '2021-12-19 21:12:05'),
('8a6442c403734c2f6befec378cb4ed4a96bfa8d759485362abf87192f421ad6edff8e73f511591bf', 7, 1, 'Token', '[]', 0, '2021-12-25 10:49:47', '2021-12-25 10:49:47', '2021-12-26 17:49:47'),
('8a6d7bf4b095d0ee7f61ba587d603cf3c2fc8ae6aff84e2d285190d484a15efb8f03ac4012c1ff51', 6, 1, 'Token', '[]', 0, '2021-12-24 06:09:55', '2021-12-24 06:09:55', '2021-12-25 13:09:55'),
('8b12ea3b283a5d229313b63ed55bed2ad6b6996d87ad846a33fd0be4f3b2c6ab15092d357c01462c', 25, 1, 'Token', '[]', 0, '2021-12-27 16:18:53', '2021-12-27 16:18:53', '2021-12-28 23:18:53'),
('8bc2b2f58fbe1bae7efbd4c120a68dbeb9ba1d0be92e018c2640ec1f2a4fa191d672e8a58ad7c31a', 3, 1, 'Token', '[]', 0, '2021-12-13 12:56:06', '2021-12-13 12:56:06', '2021-12-14 19:56:06'),
('8be4aad27cb1eb2ca4254e2320f5feaeaa57562f861a4ff6276414948ea95cb97b5535bc9d629616', 1, 1, 'Token', '[]', 0, '2021-12-25 12:23:39', '2021-12-25 12:23:39', '2021-12-26 19:23:39'),
('8d31a033a383e341c6f49bb1f4f90cb0265f00080dc0232e3175d4f626485ddfca216ea9fb74e9c4', 6, 1, 'Token', '[]', 0, '2021-12-20 05:30:07', '2021-12-20 05:30:07', '2021-12-21 12:30:06'),
('8d60c15ac83fc2d08cb0b0439945c0afd85e3729c183e2f149d95d6526a9b168590d4b9e780f26b5', 6, 1, 'Token', '[]', 0, '2021-12-13 04:07:57', '2021-12-13 04:07:57', '2021-12-14 11:07:57'),
('8dd6724bff07953278884ae7e91ed4b298287ff8011efd6f6553e069d29cf6a127a28af4a27c02b2', 6, 1, 'Token', '[]', 0, '2021-12-17 04:22:24', '2021-12-17 04:22:24', '2021-12-18 11:22:24'),
('8dd8677dbb64c5b9a9eccb3c770a4e73ad94cfe9017da1bbce4fd0ab4ae608a9bef475e74a523eff', 1, 1, 'Token', '[]', 0, '2021-12-22 17:56:26', '2021-12-22 17:56:26', '2021-12-24 00:56:26'),
('8de7dc64deffeb6854bb6167f532335a68230878554b368257d67b32c9abf91791fa9d9bcfd7f12b', 25, 1, 'Token', '[]', 0, '2021-12-27 16:29:03', '2021-12-27 16:29:03', '2021-12-28 23:29:03'),
('90e08ca820a44d722a3adcd999edec43498fe781806ae6fcb35be8026b483136440843e714eec411', 4, 1, 'Token', '[]', 0, '2021-11-29 08:28:14', '2021-11-29 08:28:14', '2021-11-30 15:28:14'),
('928726e8dd4e7693adbd99803256837d3dd98813506af52650e3e8a87735bb9712b024a969c1f925', 6, 1, 'Token', '[]', 0, '2021-12-18 14:11:51', '2021-12-18 14:11:51', '2021-12-19 21:11:50'),
('93c828908e8b4e8eb3618958f528ead0f460f0c4463584d20e885d6f1669d836f1f8dabd63914b24', 26, 1, 'Token', '[]', 0, '2021-12-27 16:33:53', '2021-12-27 16:33:53', '2021-12-28 23:33:52'),
('94cecd3a0935466cab852d29e8c2f66b778902acaa32a4f2833b00ed951fd7e1e43941ecca0ef5e1', 1, 1, 'Token', '[]', 0, '2021-11-28 14:16:07', '2021-11-28 14:16:07', '2021-11-29 21:16:07'),
('959cc7c752e0f49444f74dbe40090be6dc6365895f6a0072c893b56d3beab7526345d3af2f09a4bc', 6, 1, 'Token', '[]', 0, '2021-12-20 09:27:45', '2021-12-20 09:27:45', '2021-12-21 16:27:44'),
('95eb194dda1976264a95c5d88c6129dc08fdc99c7c0002afe67b05d3da59b3c55ff1acdf696e6879', 6, 1, 'Token', '[]', 0, '2021-12-08 16:56:51', '2021-12-08 16:56:51', '2021-12-09 23:56:50'),
('9704cc24f5176f8b7ddced1b44985f672a2658808b921ab2da7bc841df2eeae5ed297dd94120efcf', 6, 1, 'Token', '[]', 0, '2021-12-13 02:00:48', '2021-12-13 02:00:48', '2021-12-14 09:00:48'),
('99469b9abb51cce1b1b3d8ad83497225658b15c23c900d9922ead2171e82b1627e16de765b87f098', 1, 1, 'Token', '[]', 0, '2021-12-21 04:16:26', '2021-12-21 04:16:26', '2021-12-22 11:16:26'),
('9a82454bf56df241deacf222c5daf6a9f2180406e4ea10e87f5cbe2f699230d0d55abd0ba2e3f549', 6, 1, 'Token', '[]', 0, '2021-12-13 01:59:07', '2021-12-13 01:59:07', '2021-12-14 08:59:06'),
('9aa0b39b3097121fbe40db833279e726bd132d3701b5aed9de1b8540dbb9e1a1caf789d56b921c2b', 6, 1, 'Token', '[]', 0, '2021-12-20 11:41:34', '2021-12-20 11:41:34', '2021-12-21 18:41:34'),
('9b669687a5e3bae97f53c4dbb1158cf1860e1d30d1d1938684b3775c8a3f1e5f77f36a531ec22e0c', 1, 1, 'Token', '[]', 0, '2021-12-26 02:57:20', '2021-12-26 02:57:20', '2021-12-27 09:57:19'),
('9feb217e2431dd43ea1ecff97f06bdec65f0ac8805ece609bfc1dfc5d663e147b36c78937b67b1b1', 6, 1, 'Token', '[]', 0, '2021-12-13 05:43:51', '2021-12-13 05:43:51', '2021-12-14 12:43:50'),
('a09c144f1fa1c9fe768b1dc2467bfb99c1adbad440119acf0825f9b84ad95d407c47fd6873ad1469', 5, 1, 'Token', '[]', 0, '2021-12-20 15:13:23', '2021-12-20 15:13:23', '2021-12-21 22:13:23'),
('a0b71ada76a9347c791a6d8a1edf6a69ff8c97d9b75281f89b4816a8d982b2eacd8f8edc809a7501', 1, 1, 'Token', '[]', 0, '2021-12-23 18:08:13', '2021-12-23 18:08:13', '2021-12-25 01:08:13'),
('a45f9d67eb9d35db31d648c8d2fce5dcd29f7c88cb757339b50ba51eee9d8be21c9efb8a2f3dc1ab', 3, 1, 'Token', '[]', 0, '2021-11-29 08:38:43', '2021-11-29 08:38:43', '2021-11-30 15:38:43'),
('a6e85358893dd085e360cd682c78fb1f46c396e44eb2f035598ae6301268369ff04f9ddd3d8f7e82', 25, 1, 'Token', '[]', 0, '2021-12-27 16:20:36', '2021-12-27 16:20:36', '2021-12-28 23:20:36'),
('a7098952f9738a67077dc9d947ddacf2234fa108818b6e6f2d2fed75428afab17ea13d3c62e649e0', 1, 1, 'Token', '[]', 0, '2021-12-18 14:10:57', '2021-12-18 14:10:57', '2021-12-19 21:10:57'),
('a7b793ea445dc10eea63ace099f79be1201bfdb8a7515bb0f9c84ec75f9d2dbb2095350452b320ec', 1, 1, 'Token', '[]', 0, '2021-12-18 13:50:25', '2021-12-18 13:50:25', '2021-12-19 20:50:25'),
('aa78e5ce90665510659289133efcea9eed9f088d4abe9c8ab8f42aed04d16be82165f79e8d1d2399', 1, 1, 'Token', '[]', 0, '2021-12-18 12:09:47', '2021-12-18 12:09:47', '2021-12-19 19:09:46'),
('abea2b544c2bcbd01efe6ae25dbc3f21cf29be815adbce26d3fd3c42c020c75a7d8e838674fbe3e8', 6, 1, 'Token', '[]', 0, '2021-12-19 11:41:04', '2021-12-19 11:41:04', '2021-12-20 18:41:03'),
('ad44c9cc37fe71ff2356efe562c9df64226f8d854358f8511b416df61efb5504ab6c6e6b3520125e', 26, 1, 'Token', '[]', 0, '2021-12-27 16:30:16', '2021-12-27 16:30:16', '2021-12-28 23:30:15'),
('af46ff5a18202a2d607e996f34d559cfe2ab605574610347ace038a5203e8b13d05a46d61512a6c8', 6, 1, 'Token', '[]', 0, '2021-12-14 04:04:43', '2021-12-14 04:04:43', '2021-12-15 11:04:43'),
('af93a6a46adcf9639434530887587619fbe1ac28f0a4b9bc58ec00dd98b227a9bf5c13d467ec16c7', 25, 1, 'Token', '[]', 0, '2021-12-27 15:49:31', '2021-12-27 15:49:31', '2021-12-28 22:49:30'),
('b1ece7964e20859c4a5e4ae43c3ea390ad63f2240e15033ff108624181ff93219037d3f9ea4729e0', 1, 1, 'Token', '[]', 0, '2021-12-13 17:51:34', '2021-12-13 17:51:34', '2021-12-15 00:51:33'),
('b5b6bfe9b616d0d035c41d930064c1b1994985c5df0fd09e578df68658081451633822f79254eb64', 6, 1, 'Token', '[]', 0, '2021-12-20 05:43:03', '2021-12-20 05:43:03', '2021-12-21 12:43:03'),
('b61520a65f9c7b5763cc91760535f17a5728cb09b01626319c0a7c8625531c5b3bed50a7432f173f', 26, 1, 'Token', '[]', 0, '2021-12-27 16:22:27', '2021-12-27 16:22:27', '2021-12-28 23:22:27'),
('b660ef1b78fac5773b81a223e91b555a72929ceb208305d6daa6e47a09f294a093a00a4fb9edb52c', 6, 1, 'Token', '[]', 0, '2021-12-24 06:32:16', '2021-12-24 06:32:16', '2021-12-25 13:32:16'),
('b9af1730e5b7db7977ecbe2aed9385adb5ee0cbd45a6b8cce24d716f303f86160c4b2c1e44b7bff2', 6, 1, 'Token', '[]', 0, '2021-12-17 04:02:38', '2021-12-17 04:02:38', '2021-12-18 11:02:34'),
('bba3f735c2ec0ee9110feadfd68d44d65f045fc45bd19670b870f106800c0b365fabb29d5da3edc1', 4, 1, 'Token', '[]', 0, '2021-12-20 05:43:41', '2021-12-20 05:43:41', '2021-12-21 12:43:41'),
('bcb9c000dd628c08c1b5f90d1ed4e616ca241308197054ed7f879e1abc4feaba511896fce275e9f2', 7, 1, 'Token', '[]', 0, '2021-12-27 15:46:19', '2021-12-27 15:46:19', '2021-12-28 22:46:19'),
('bf1bdcfd8e4a510c16c65489ede1dba3644dc2d5ef90504402899fa6fe8a739eecff7cc246b5a09f', 25, 1, 'Token', '[]', 0, '2021-12-27 15:45:48', '2021-12-27 15:45:48', '2021-12-28 22:45:48'),
('bfc6cec0daac55b0b845b2273e1052f6a3c98b52749e321470f0adcd529f442f2280cbd37b8bbeba', 1, 1, 'Token', '[]', 0, '2021-12-14 06:27:21', '2021-12-14 06:27:21', '2021-12-15 13:27:21'),
('c06e43b8b93e4ea0e009d6309323e99f97fa018ead7f7b8fb623ca02122b829db47061fec8335d23', 1, 1, 'Token', '[]', 0, '2021-12-14 04:38:40', '2021-12-14 04:38:40', '2021-12-15 11:38:40'),
('c174cbf82a51c3407bcda702056e247fa68403a44ae55f1c0e01597d5ab2f14efef05f92774a1118', 6, 1, 'Token', '[]', 0, '2021-12-13 06:02:53', '2021-12-13 06:02:53', '2021-12-14 13:02:53'),
('c340a93c39a7dbcb0a22a7664c992710ba435738b0b50850393b1e332a5aeba7ed78a6e83b7b6f84', 3, 1, 'Token', '[]', 0, '2021-12-13 12:48:24', '2021-12-13 12:48:24', '2021-12-14 19:48:24'),
('c38a3da0cc36134ec205b783424ab145fba95631d7e498b6b2ba84decffa65db66e5cd02b0f55b5c', 4, 1, 'Token', '[]', 0, '2021-12-18 12:46:27', '2021-12-18 12:46:27', '2021-12-19 19:46:27'),
('c5e682abc6da989fdcd2815a3989c57a301c05064d06b706d4aaa8819de9d75f517b47360debfd67', 1, 1, 'Token', '[]', 0, '2021-11-29 12:05:47', '2021-11-29 12:05:47', '2021-11-30 19:05:46'),
('c6660a2f76b516826059d20fe6239f2a9c908766bd2c7fc2b9db89226d70eb2ea1b190a9a5bb5558', 25, 1, 'Token', '[]', 0, '2021-12-27 15:55:01', '2021-12-27 15:55:01', '2021-12-28 22:55:00'),
('c74c2fef069f32c4bb71757382269d729ab0b6cdcd32227110288e2179698e06f0378f669b77907b', 1, 1, 'Token', '[]', 0, '2021-12-24 06:06:25', '2021-12-24 06:06:25', '2021-12-25 13:06:25'),
('ca77a9c302a91b845b805599c3cefd0bf18ea37dd8dec35076bcfdd59c9ba9b0c2df466cbf0daf28', 6, 1, 'Token', '[]', 0, '2021-12-23 03:42:35', '2021-12-23 03:42:35', '2021-12-24 10:42:32'),
('caae8a35f03669bf1179e752065cb67006c1081a25b4b12f64dd178472cfe02ea1c6a1965f245a9b', 4, 1, 'Token', '[]', 0, '2021-12-14 16:13:09', '2021-12-14 16:13:09', '2021-12-15 23:13:08'),
('cac2e7965cab597ae474472b2c9907638534e826b8a3f94707f9fc7049006ed4f534ca9c4a1b0ce3', 25, 1, 'Token', '[]', 0, '2021-12-27 15:48:24', '2021-12-27 15:48:24', '2021-12-28 22:48:24'),
('cb12df59a8c6703436f5ae216825d78ca74c91bb1e6de7202e251927629668586e7a1d6be90a7891', 7, 1, 'Token', '[]', 0, '2021-12-27 15:40:30', '2021-12-27 15:40:30', '2021-12-28 22:40:29'),
('cbbca3bcd5da02a9b9585381f34ac0c8b6350896d83a05d28a7f7c9eda26a2bf07756f1c1a0b70ed', 7, 1, 'Token', '[]', 0, '2021-12-27 15:56:18', '2021-12-27 15:56:18', '2021-12-28 22:56:18'),
('cc3b650fad7606e5b49e9922361ff897ef57092be42962c3dec1adf5272e7b9cd6514a628c916eef', 3, 1, 'Token', '[]', 0, '2021-11-29 07:25:46', '2021-11-29 07:25:46', '2021-11-30 14:25:46'),
('cc4eaaf3f5e20bb03dd002183b1a3076a13bca600260de4e1c0e4b54bc7e3c5839903cf19254b40b', 6, 1, 'Token', '[]', 0, '2021-12-27 08:02:06', '2021-12-27 08:02:06', '2021-12-28 15:02:05'),
('ccc5c38d8e846ad1e30d7d04ae636163990984268ff6b67cd427d8766ec9d97a6e29566df1a2d672', 1, 1, 'Token', '[]', 0, '2021-12-21 04:07:11', '2021-12-21 04:07:11', '2021-12-22 11:07:09'),
('ce02861396f6cb370a45140ac89a43a6c6d98c8789dbba42287d6d8e0d5d78d5b97ebf366a491ecd', 6, 1, 'Token', '[]', 0, '2021-12-19 05:38:46', '2021-12-19 05:38:46', '2021-12-20 12:38:46'),
('ce301c676aab78bb44f92197e5e5a7a99ead051bdcb74525caab54452c4567e38cd56733fd3dd816', 26, 1, 'Token', '[]', 0, '2021-12-27 16:33:23', '2021-12-27 16:33:23', '2021-12-28 23:33:23'),
('ce7ebfeb3c1796841aed775e7ec137d7a44c4ea37f3ba515dc99d238c2168e21ce898f50561acf12', 3, 1, 'Token', '[]', 0, '2021-11-29 07:11:20', '2021-11-29 07:11:20', '2021-11-30 14:11:20'),
('cf2c05556875f4b4c0c3246999ea94cf4f0d5b7f53cd6eeb086d2b9698e8ab1572df2a257f4914b8', 1, 1, 'Token', '[]', 0, '2021-11-29 14:02:15', '2021-11-29 14:02:15', '2021-11-30 21:02:14'),
('cfc07428fec71af1c514a69b8b9bf305b2f61a6636fa840e2a3c4263b5f2e075df6354461a8099a1', 26, 1, 'Token', '[]', 0, '2021-12-27 16:23:53', '2021-12-27 16:23:53', '2021-12-28 23:23:53'),
('d03b34cb3b26dc772a7ad8c1afe0c865e0ee2fd17010dcc3c1d06906617770fbd2c5fd257c0e5396', 6, 1, 'Token', '[]', 0, '2021-12-08 16:49:24', '2021-12-08 16:49:24', '2021-12-09 23:49:21'),
('d06da7e91c09e7a683e9416c9a678aaa9c8ca76a87dffe1d262e58aa6a03b690b983f7b9fbd71d04', 1, 1, 'Token', '[]', 0, '2021-12-14 06:31:29', '2021-12-14 06:31:29', '2021-12-15 13:31:28'),
('d0837e7fceb3c94f5308ae57a029c98be173edbaa8f6e3add1e10cb6724d27215c2d5b0e2ce7c421', 6, 1, 'Token', '[]', 0, '2021-12-23 05:31:56', '2021-12-23 05:31:56', '2021-12-24 12:31:56'),
('d0ead66d8b1d0944baaa480160be69ea3e2271db47e788ce415a7551d1f5fb9c56857618e3650187', 4, 1, 'Token', '[]', 0, '2021-11-29 07:00:13', '2021-11-29 07:00:13', '2021-11-30 14:00:12'),
('d25c88e51544e7ed3356ad4c40e2fb7fedd65bee930259618a606ae40aa5509732109e4ab49541d2', 25, 1, 'Token', '[]', 0, '2021-12-27 15:57:21', '2021-12-27 15:57:21', '2021-12-28 22:57:20'),
('d26acfd148ecb7143698c571190937f77eef51fc7b773d9907e8b536de8a58d871c7b83ec78e7430', 1, 1, 'Token', '[]', 0, '2021-12-13 14:21:48', '2021-12-13 14:21:48', '2021-12-14 21:21:48'),
('d405eaa02ea62eb667e7d24528b7054124daa8e3993bdc5804b7a259f205b6e5a232a3953125a08f', 1, 1, 'Token', '[]', 0, '2021-12-25 13:27:01', '2021-12-25 13:27:01', '2021-12-26 20:27:01'),
('d40fdb65e9915d98bc675c84a70a008ce4069f5c418da3f10aa1879c97cf22e639303f33aca4e7ae', 26, 1, 'Token', '[]', 0, '2021-12-27 15:57:41', '2021-12-27 15:57:41', '2021-12-28 22:57:40'),
('d54425b76dbde13bde2e95e08af2db42c108206cc8c9de1573cac106bd4e2259ed2b3a0ae0439ccc', 4, 1, 'Token', '[]', 0, '2021-11-29 08:21:47', '2021-11-29 08:21:47', '2021-11-30 15:21:47'),
('d5a1b914977d8c2dbeb4bf5c057af3187ac48df4114ffd6254a676db89de9c5c8049e3c71c58b99d', 6, 1, 'Token', '[]', 0, '2021-12-13 05:44:34', '2021-12-13 05:44:34', '2021-12-14 12:44:34'),
('d7b4bd70567af69c9348f1e1538cb7b7476893dd74583189d3648194e838cd19a8a2250e691b2dad', 6, 1, 'Token', '[]', 0, '2021-12-24 06:14:57', '2021-12-24 06:14:57', '2021-12-25 13:14:57'),
('d859f0b310ac11df0daa2e81b882c485cb2073b018cd2dcde93e5bbb39e8e9b681ac287cd71e1c58', 6, 1, 'Token', '[]', 0, '2021-12-19 12:05:27', '2021-12-19 12:05:27', '2021-12-20 19:05:27'),
('d8fdadd943bef100ab896d65a9afdcd6289f250fed567701b62094107b61da9021ec45b7ec825f51', 1, 1, 'Token', '[]', 0, '2021-12-14 15:55:34', '2021-12-14 15:55:34', '2021-12-15 22:55:33'),
('da009057ba805690a74653cd5060c5ab03f0d417321d301a7d9a8d9e1e811d87e92fbf68ac44638c', 6, 1, 'Token', '[]', 0, '2021-12-13 06:05:03', '2021-12-13 06:05:03', '2021-12-14 13:05:03'),
('db423a93721301dec9943003b7faab939de7c74c002e1f65dac0c841f82179cadf459d0a55c7b4e7', 7, 1, 'Token', '[]', 0, '2021-12-25 12:19:28', '2021-12-25 12:19:28', '2021-12-26 19:19:27'),
('dbdd0e50398c8c7b89c524aa3272226694a4d62499826d50d530d3314ad28d0c1fbffa4b46e1ac78', 4, 1, 'Token', '[]', 0, '2021-11-29 08:26:52', '2021-11-29 08:26:52', '2021-11-30 15:26:52'),
('dc046f70b5c00c21e8a523ec2977045f3ccc845c055a09b6b92ef1d7e986877b69bbda5824b6f01c', 25, 1, 'Token', '[]', 0, '2021-12-27 16:17:51', '2021-12-27 16:17:51', '2021-12-28 23:17:50'),
('de2b645b2d6dde63724e0f785713b3231e7d0e8510860853f222a049689ef02a6aa0d65a5803d97f', 7, 1, 'Token', '[]', 0, '2021-12-21 04:11:18', '2021-12-21 04:11:18', '2021-12-22 11:11:18'),
('de5873106f23dcb63dbbecbb8053a53e220efc81a60de4df8dbf11d09d338d23e395ece03f058a1a', 10, 1, 'Token', '[]', 0, '2021-12-20 15:11:32', '2021-12-20 15:11:32', '2021-12-21 22:11:32'),
('de84e53fcd469a837c1a39c3bd6ef96a2babbd877a98192776eaa6daa7fc93b6446c2d78b125bc7f', 1, 1, 'Token', '[]', 0, '2021-12-22 17:42:40', '2021-12-22 17:42:40', '2021-12-24 00:42:40'),
('dedf3f2765909b18f84b717a0433ea7d237c8c6a93d9890e4741d2b72eaa49771ea059c10070696f', 4, 1, 'Token', '[]', 0, '2021-11-29 08:27:55', '2021-11-29 08:27:55', '2021-11-30 15:27:55'),
('e004787afe9a20fe286f0aaae90c795d80c70b38c5855353d4d62ef4524e4f397cf5338336cb97ea', 6, 1, 'Token', '[]', 0, '2021-12-13 04:29:21', '2021-12-13 04:29:21', '2021-12-14 11:29:21'),
('e0154eda2b35ae2da522bbd93e686c9a62edb4edb3d675f2109cd122e380e3d63ff21f64d8317d9d', 1, 1, 'Token', '[]', 0, '2021-12-17 09:03:40', '2021-12-17 09:03:40', '2021-12-18 16:03:39'),
('e09df3dc68abed76a24784c498d8612902d50b388bc2ddc2b1f21d4923d7d52d6f9c9b6f5808868f', 6, 1, 'Token', '[]', 0, '2021-12-22 17:41:30', '2021-12-22 17:41:30', '2021-12-24 00:41:30'),
('e0fbb2452f2d0fefd0aab7ea312b186fb46b28f9f6c35a491fa0be3d5c12e7245230d431209a668d', 1, 1, 'Token', '[]', 0, '2021-12-17 04:16:19', '2021-12-17 04:16:19', '2021-12-18 11:16:19'),
('e141a0a3bdb82b621d2970f2547c51a76ba8cb4a7f27f04a5bde1bf9a91d2f547234788fdd18b0fb', 6, 1, 'Token', '[]', 0, '2021-12-08 11:42:09', '2021-12-08 11:42:09', '2021-12-09 18:42:09'),
('e1523a4b0a7a3c17e0cb4fed8b888704ed15cb1936fa0568337ddc5d329c391537e7c88318eb53f8', 6, 1, 'Token', '[]', 0, '2021-12-18 12:53:26', '2021-12-18 12:53:26', '2021-12-19 19:53:26'),
('e1d123c149d5e3ed0fb4071814796afa0fe564d8a7ccc30affa06c6a3cae4efa0882c3c05cdb6993', 4, 1, 'Token', '[]', 0, '2021-11-29 07:18:09', '2021-11-29 07:18:09', '2021-11-30 14:18:09'),
('e345ffe6f2da156ab83ba754af8554e7a92c88ccb918447973ba0af9911f80a2dd624a765d485efe', 1, 1, 'Token', '[]', 0, '2021-12-14 06:30:47', '2021-12-14 06:30:47', '2021-12-15 13:30:47'),
('e362e4537a18d1d06a7a2774c46073f3d8ba7fad067c49075b52a376b92433f3baad589c77248a63', 6, 1, 'Token', '[]', 0, '2021-12-22 17:55:16', '2021-12-22 17:55:16', '2021-12-24 00:55:16'),
('e3b988d7a79f69901400eaa8038de197507a0ac2cb6d8b49fd5db4ae63903ed0fd4e16b0d9540597', 7, 1, 'Token', '[]', 0, '2021-12-26 02:58:09', '2021-12-26 02:58:09', '2021-12-27 09:58:09'),
('e454eb37f88d8904e188fe256dd790583da292865ffaf903e58266b8bf29aecff10d3e495f871efa', 6, 1, 'Token', '[]', 0, '2021-12-23 03:48:33', '2021-12-23 03:48:33', '2021-12-24 10:48:32'),
('e5c0f78d2ab770aedbba0954f92c94854ba15c35ca2bcb84cad9d4e44949de3c68c47f946efdd556', 3, 1, 'Token', '[]', 0, '2021-11-28 13:36:34', '2021-11-28 13:36:34', '2021-11-29 20:36:34'),
('e6950983d538cccdc638ec143556d80a7754ebc04003b170a47949d89ad0f003ee32254fe6df6a9c', 1, 1, 'Token', '[]', 0, '2021-11-29 17:32:25', '2021-11-29 17:32:25', '2021-12-01 00:32:24'),
('e79b5f2504534b7f5bb065d64f4721d785da259da1e4cbb57c906c40ea1312bbe6a47a3bd367d9f0', 3, 1, 'Token', '[]', 0, '2021-11-29 08:40:02', '2021-11-29 08:40:02', '2021-11-30 15:40:01'),
('e863a76caee1a26dad1b581b9df5a3538e2dc3d70f064cd388f3b93bba24cedf7ef19491d0ca42be', 6, 1, 'Token', '[]', 0, '2021-12-13 03:28:45', '2021-12-13 03:28:45', '2021-12-14 10:28:45'),
('eb5b8c40a636e7673a785f794baff1805b4e24b7379f9fb44f748773d666fbf36c2a2cc971c72c36', 6, 1, 'Token', '[]', 0, '2021-12-25 03:04:53', '2021-12-25 03:04:53', '2021-12-26 10:04:52'),
('eb896269051e4d2092ec13d3a4178f2e6223ea909e9ad9e0460a53c6d1a9b266f6eeeb0f5a0ab98d', 6, 1, 'Token', '[]', 0, '2021-12-17 04:24:30', '2021-12-17 04:24:30', '2021-12-18 11:24:30'),
('ed1bfb1aebc5dd75b63549a0a50deeff0560a12f176b71b8d80fdf082113b89d0912a3000b80b1a4', 1, 1, 'Token', '[]', 0, '2021-12-27 15:45:31', '2021-12-27 15:45:31', '2021-12-28 22:45:31'),
('edce0f40ce37b332e2380359aacd7a2f85f468b424f5a9a2a0ac9db5d0f947a4ec7e4f99158ed02d', 7, 1, 'Token', '[]', 0, '2021-12-25 13:47:51', '2021-12-25 13:47:51', '2021-12-26 20:47:51'),
('ee26180a71e4fad0e975dfa7844c1f9e53e6b8c31eeef8924c23cfffca495106bc574b2584c07ff2', 6, 1, 'Token', '[]', 0, '2021-12-21 09:52:25', '2021-12-21 09:52:25', '2021-12-22 16:52:25'),
('eea9b7e66558f22153a8be1bb2dd3b44302e9e6bd25b962319ee2f72dde9612acc664f1bce867da6', 6, 1, 'Token', '[]', 0, '2021-12-16 12:52:07', '2021-12-16 12:52:07', '2021-12-17 19:52:07'),
('ef6dfadba95962c7f44f51675af135af345aeaa02ff8a67e57da8d5ee37fe88a2d3be22d6fe21920', 6, 1, 'Token', '[]', 0, '2021-12-18 16:52:46', '2021-12-18 16:52:46', '2021-12-19 23:52:46'),
('f20bd74fc68f4c549aff03d0398ab907e7cccaf6398f764430ba6280dbc17d0ee08b42e7f9eb620d', 1, 1, 'Token', '[]', 0, '2021-12-19 11:50:19', '2021-12-19 11:50:19', '2021-12-20 18:50:19'),
('f2486971863d04c48522da2a99ecf660a7c2303f66290a917b4d0f12cc18f7c0cdf55340f94cd51b', 1, 1, 'Token', '[]', 0, '2021-12-18 17:04:29', '2021-12-18 17:04:29', '2021-12-20 00:04:29'),
('f27685bc419c51abc22fe11b3c72a21d734475bfa36e501e867346bd66ffd79ce14a56bc3e522168', 6, 1, 'Token', '[]', 0, '2021-12-19 11:48:35', '2021-12-19 11:48:35', '2021-12-20 18:48:35'),
('f28bbfc2825460c1886714a996ed545f7699c0381e61602ece12114d765da395f661376d38310c2b', 6, 1, 'Token', '[]', 0, '2021-12-18 14:04:31', '2021-12-18 14:04:31', '2021-12-19 21:04:31'),
('f2b2026627b1a4e50a696a6a0bca8a0b695032a554308d5d5850ce4d3f1ed3901d00825c81b6c985', 6, 1, 'Token', '[]', 0, '2021-12-24 06:06:44', '2021-12-24 06:06:44', '2021-12-25 13:06:44'),
('f37b0c920d358961783b98689720066d4229baa47140fd3748ce2c2f9aef8eb0a8cc8ae4d44c3f87', 6, 1, 'Token', '[]', 0, '2021-12-22 18:25:33', '2021-12-22 18:25:33', '2021-12-24 01:25:33'),
('f46897f0d86df142fcef35024b15e83e28e74d3a0f0bf85a4587de64e529167d25a6b4ab3da2f97f', 6, 1, 'Token', '[]', 0, '2021-12-19 11:26:50', '2021-12-19 11:26:50', '2021-12-20 18:26:50'),
('f47666edad70b25ef8fc698f08e569842d94c3ae87171a85a9dca8b4a53c7df365d985a6336306fe', 7, 1, 'Token', '[]', 0, '2021-12-25 11:44:56', '2021-12-25 11:44:56', '2021-12-26 18:44:56'),
('f60037759662c936dbfcbcfcc2b6b63567a14f28cd936adff740f057f494dc7af8d06e3dc26ca8f5', 1, 1, 'Token', '[]', 0, '2021-12-20 16:14:47', '2021-12-20 16:14:47', '2021-12-21 23:14:47'),
('fade0023a35270605fc96376aa13b12ab0c2d2caa02e42ce32247370391f7f25086daf074610e483', 6, 1, 'Token', '[]', 0, '2021-12-17 04:16:06', '2021-12-17 04:16:06', '2021-12-18 11:16:06'),
('fd1acd9cbb6ccb5cafa38f5b53f2a0ed3b3b73245d05a13e1d13a0b827a8b42b7d564e98c2d11704', 6, 1, 'Token', '[]', 0, '2021-12-23 18:05:20', '2021-12-23 18:05:20', '2021-12-25 01:05:19'),
('fd643746f66e16707a1832b894c85195f7ba3bf5e7eb1c2a1cb7d9a222fef61405174b837b909e2d', 4, 1, 'Token', '[]', 0, '2021-11-29 08:27:37', '2021-11-29 08:27:37', '2021-11-30 15:27:37'),
('fe0e128088734e18bd5e29f8f62a09689305c8367e9f189ad6737c7184a0db38228b3ef6b422db82', 6, 1, 'Token', '[]', 0, '2021-12-22 18:39:15', '2021-12-22 18:39:15', '2021-12-24 01:39:15'),
('ff2c31bb28ee2255d6c6c1db58a9f55d3b0561a8520cff46186c5f0e87f6b12381cf87a6269292ab', 6, 1, 'Token', '[]', 0, '2021-12-08 16:57:43', '2021-12-08 16:57:43', '2021-12-09 23:57:43');

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
(1, 1, 'Diskomsantik', 'diskomsantik', 'diskomsantik@gmail.com', '$2y$10$Hilzk89TvqFtQkgjo1ia.eGLmYL3kQHkMcGLHuytNoetj056sBj6a', 'Admin', '2021-11-26 14:54:45', '2021-12-21 04:06:53'),
(2, 2, 'Sekretariat Daerah', 'sekda', 'sekda@gmail.com', '$2y$10$144mKgPxFX6FS33Ux8RRa.W4qTakgVgiBmDWmy8ozKCxrgblFT.je', 'Admin', '2021-11-26 14:54:45', NULL),
(25, 7, 'Angsana', 'angsanakec', 'angsana@gmail.com', '$2y$10$Nxd0vTGnjsT8ZZNsI3bHmO3ZgfqkedhngpkH4xgjdqDmuGjeyHSW.', 'User', '2021-12-25 07:05:11', '2021-12-25 07:05:11'),
(26, 6, 'Angsa', 'camatangsa', 'meila@gmail.com', '$2y$10$PkBiXwawzpFNKBQpGON3teCfmfNa2Xk4IlDcffSZDVBafdumxaUMO', 'User', '2021-12-25 10:52:24', '2021-12-27 16:33:09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `db_bencana_alam`
--
ALTER TABLE `db_bencana_alam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_informasi`
--
ALTER TABLE `db_informasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_kegiatan_camat`
--
ALTER TABLE `db_kegiatan_camat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_kependudukan`
--
ALTER TABLE `db_kependudukan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_realisasi_pbb`
--
ALTER TABLE `db_realisasi_pbb`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_rekapitulasi_paten`
--
ALTER TABLE `db_rekapitulasi_paten`
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
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `db_bencana_alam`
--
ALTER TABLE `db_bencana_alam`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `db_informasi`
--
ALTER TABLE `db_informasi`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `db_kegiatan_camat`
--
ALTER TABLE `db_kegiatan_camat`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `db_kependudukan`
--
ALTER TABLE `db_kependudukan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `db_realisasi_pbb`
--
ALTER TABLE `db_realisasi_pbb`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `db_rekapitulasi_paten`
--
ALTER TABLE `db_rekapitulasi_paten`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=340;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

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
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
