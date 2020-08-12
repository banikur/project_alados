-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2020 at 10:53 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_absen`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id_empl` varchar(255) DEFAULT NULL,
  `nama_empl` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `telp` decimal(15,0) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  `divisi` bigint(255) DEFAULT NULL,
  `nip` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id_empl`, `nama_empl`, `gender`, `telp`, `alamat`, `email`, `pass`, `divisi`, `nip`) VALUES
('EMP-0001', 'Ucok', 'Laki-Laki', '837712831', 'Depok', 'ucok@gmail.com', 'admin', 3, '9939120390321'),
('EMP-0002', 'HRD', 'Laki-Laki', '3103123123', 'Jakarta', 'hrd@gmail.com', 'saniya21', 1, '900231230'),
('EMP-0003', 'BANI', 'Laki-Laki', '3213213213', 'dummy', 'dumy@ga.com', 'saniya21', 3, '9090032139');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_absensi`
--

CREATE TABLE `tbl_absensi` (
  `id_absensi` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_pegawai` varchar(255) DEFAULT NULL,
  `jam_masuk` time(6) DEFAULT NULL,
  `jam_keluar` time(6) DEFAULT NULL,
  `status_keterlambatan` bigint(2) DEFAULT NULL,
  `tgl_absen` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_absensi`
--

INSERT INTO `tbl_absensi` (`id_absensi`, `created_at`, `id_pegawai`, `jam_masuk`, `jam_keluar`, `status_keterlambatan`, `tgl_absen`) VALUES
(2, '2020-08-11 19:13:39', 'EMP-0001', '23:01:36.000000', '23:12:30.000000', 2, '2020-08-11 16:12:30.000000'),
(3, '2020-08-11 19:13:42', 'EMP-0001', '01:04:35.000000', NULL, 1, '2020-08-11 18:04:35.000000');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_master_divisi`
--

CREATE TABLE `tbl_master_divisi` (
  `id_divisi` int(11) NOT NULL,
  `divisi_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_master_divisi`
--

INSERT INTO `tbl_master_divisi` (`id_divisi`, `divisi_name`, `created_at`, `updated_at`) VALUES
(1, 'HRD', NULL, NULL),
(2, 'Senior Programmer', NULL, NULL),
(3, 'Junior Programmer', NULL, NULL),
(4, 'Technical Writer', NULL, NULL),
(5, 'Junior Programmer (Probation)', NULL, NULL),
(6, 'UI / UX Designer', '2020-08-08 14:36:02.000000', '2020-08-08 14:37:30.000000');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_master_sub_penilaian`
--

CREATE TABLE `tbl_master_sub_penilaian` (
  `id_sub_penilaian` int(11) NOT NULL,
  `kategori_penilaian` varchar(255) NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_master_sub_penilaian`
--

INSERT INTO `tbl_master_sub_penilaian` (`id_sub_penilaian`, `kategori_penilaian`, `created_at`, `updated_at`) VALUES
(1, 'Kedisiplinan', '2020-08-08 21:41:47.000000', NULL),
(2, 'Kreatifitas', '2020-08-08 21:42:03.000000', NULL),
(3, 'Etos Kerja', '2020-08-08 21:42:08.000000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_parameter_penilaian`
--

CREATE TABLE `tbl_parameter_penilaian` (
  `id_penilaian` int(11) NOT NULL,
  `parameter_penilaian` varchar(255) DEFAULT NULL,
  `sub_penilaian` int(2) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_parameter_penilaian`
--

INSERT INTO `tbl_parameter_penilaian` (`id_penilaian`, `parameter_penilaian`, `sub_penilaian`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Kehadiran', 1, 1, '2020-08-08 15:15:17.000000', NULL),
(2, 'Bekerja sama', 2, 1, '2020-08-08 15:58:25.000000', NULL),
(3, 'Tepat Waktu dalam task', 3, 1, '2020-08-08 15:58:45.000000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_parameter_upah`
--

CREATE TABLE `tbl_parameter_upah` (
  `id` int(11) NOT NULL,
  `jenis_parameter` varchar(255) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_parameter_upah`
--

INSERT INTO `tbl_parameter_upah` (`id`, `jenis_parameter`, `created_at`, `updated_at`) VALUES
(1, 'Gaji Pokok', '2020-08-11 19:26:38.000000', '2020-08-11 13:13:10.000000'),
(2, 'Lembur', '2020-08-11 19:26:48.000000', NULL),
(3, 'Dinas Luar', '2020-08-11 19:26:57.000000', NULL),
(4, 'Uang Makan', '2020-08-11 19:27:04.000000', NULL),
(5, 'Transport', '2020-08-11 19:27:12.000000', NULL),
(6, 'Bonus Tahunan', '2020-08-11 13:12:55.000000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payroll`
--

CREATE TABLE `tbl_payroll` (
  `id_payroll` int(11) NOT NULL,
  `id_pegawai` varchar(255) DEFAULT NULL,
  `payroll` decimal(24,2) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_payroll`
--

INSERT INTO `tbl_payroll` (`id_payroll`, `id_pegawai`, `payroll`, `created_at`, `updated_at`) VALUES
(5, 'EMP-0002', '6400000.00', '2020-08-11 12:43:44.000000', '2020-08-11 13:02:20.000000');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payroll_detail`
--

CREATE TABLE `tbl_payroll_detail` (
  `id` int(11) NOT NULL,
  `id_parameter` int(11) DEFAULT NULL,
  `id_pegawai` varchar(255) DEFAULT NULL,
  `payroll_detail` decimal(36,2) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_payroll_detail`
--

INSERT INTO `tbl_payroll_detail` (`id`, `id_parameter`, `id_pegawai`, `payroll_detail`, `created_at`, `updated_at`) VALUES
(1, 1, 'EMP-0002', '500000.00', '2020-08-11 12:43:44.000000', '2020-08-11 13:02:20.000000'),
(2, 2, 'EMP-0002', '1300000.00', '2020-08-11 12:43:44.000000', '2020-08-11 13:02:20.000000'),
(3, 3, 'EMP-0002', '2200000.00', '2020-08-11 12:43:44.000000', '2020-08-11 13:02:20.000000'),
(4, 4, 'EMP-0002', '1400000.00', '2020-08-11 12:43:44.000000', '2020-08-11 13:02:20.000000'),
(5, 5, 'EMP-0002', '1000000.00', '2020-08-11 12:43:44.000000', '2020-08-11 13:02:20.000000');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_penilaian_pegawai`
--

CREATE TABLE `tbl_penilaian_pegawai` (
  `id_record` int(11) NOT NULL,
  `id_parameter_penilaian` int(11) DEFAULT NULL,
  `id_pegawai` varchar(255) DEFAULT NULL,
  `value` decimal(36,2) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_penilaian_pegawai`
--

INSERT INTO `tbl_penilaian_pegawai` (`id_record`, `id_parameter_penilaian`, `id_pegawai`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'EMP-0001', '3.30', '2020-08-08 22:35:44.000000', '2020-08-08 23:25:03.000000'),
(3, 3, 'EMP-0001', '3.20', '2020-08-09 00:13:45.000000', NULL),
(4, 1, 'EMP-0002', '3.30', '2020-08-09 00:13:45.000000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_pegawai` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `status`, `id_pegawai`) VALUES
(1, 'bani', 'user@gmail.com', NULL, '$2y$10$GCTgAMJ./MNX9G5YnWjvduq9aXXEc8bI1udV/Jdwt8Q3xRGzbUrbi', NULL, NULL, NULL, '1', 'EMP-0001'),
(2, 'Alados HR', 'hrd@gmail.com', NULL, '$2y$10$GCTgAMJ./MNX9G5YnWjvduq9aXXEc8bI1udV/Jdwt8Q3xRGzbUrbi', NULL, NULL, NULL, '2', 'EMP-0002'),
(4, 'manager', 'manager@gmail.com', NULL, '$2y$10$GCTgAMJ./MNX9G5YnWjvduq9aXXEc8bI1udV/Jdwt8Q3xRGzbUrbi', NULL, NULL, NULL, '4', NULL),
(5, 'bani', 'bani@hahha.com', NULL, '$2y$10$8VioO66Yy7xNEgKmtH5rwudSWw5TUGcrR8UmyB26HcwPOUVujT5WW', NULL, '2020-08-08 08:58:21', NULL, '1', NULL),
(6, 'dsad', 'bsandi@gassmo..co', NULL, '$2y$10$XxrZpWwcKARLM/f/MKc4wuAzhJ3miZ77gmzjAl/4P1sqnUTISSd7u', NULL, '2020-08-08 09:00:18', NULL, '2', NULL),
(7, 'BANI', 'dumy@ga.com', NULL, '$2y$10$hZv.jIF557IxXqQaHO.hkOwlz6fyO5z201ZL0pBcHzbXTaBmyTGLS', NULL, '2020-08-08 09:03:58', NULL, '3', 'EMP-0003');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `tbl_absensi`
--
ALTER TABLE `tbl_absensi`
  ADD PRIMARY KEY (`id_absensi`);

--
-- Indexes for table `tbl_master_divisi`
--
ALTER TABLE `tbl_master_divisi`
  ADD PRIMARY KEY (`id_divisi`);

--
-- Indexes for table `tbl_master_sub_penilaian`
--
ALTER TABLE `tbl_master_sub_penilaian`
  ADD PRIMARY KEY (`id_sub_penilaian`);

--
-- Indexes for table `tbl_parameter_penilaian`
--
ALTER TABLE `tbl_parameter_penilaian`
  ADD PRIMARY KEY (`id_penilaian`);

--
-- Indexes for table `tbl_parameter_upah`
--
ALTER TABLE `tbl_parameter_upah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_payroll`
--
ALTER TABLE `tbl_payroll`
  ADD PRIMARY KEY (`id_payroll`);

--
-- Indexes for table `tbl_payroll_detail`
--
ALTER TABLE `tbl_payroll_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_penilaian_pegawai`
--
ALTER TABLE `tbl_penilaian_pegawai`
  ADD PRIMARY KEY (`id_record`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_absensi`
--
ALTER TABLE `tbl_absensi`
  MODIFY `id_absensi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_master_divisi`
--
ALTER TABLE `tbl_master_divisi`
  MODIFY `id_divisi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_master_sub_penilaian`
--
ALTER TABLE `tbl_master_sub_penilaian`
  MODIFY `id_sub_penilaian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_parameter_penilaian`
--
ALTER TABLE `tbl_parameter_penilaian`
  MODIFY `id_penilaian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_parameter_upah`
--
ALTER TABLE `tbl_parameter_upah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_payroll`
--
ALTER TABLE `tbl_payroll`
  MODIFY `id_payroll` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_payroll_detail`
--
ALTER TABLE `tbl_payroll_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_penilaian_pegawai`
--
ALTER TABLE `tbl_penilaian_pegawai`
  MODIFY `id_record` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
