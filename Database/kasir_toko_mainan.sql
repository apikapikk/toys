-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 04 Bulan Mei 2025 pada 12.37
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kasir_toko_mainan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_bulan_tahun`
--

CREATE TABLE `tb_bulan_tahun` (
  `id` int(11) UNSIGNED NOT NULL,
  `bulan` varchar(10) NOT NULL,
  `tahun` year(4) NOT NULL,
  `bln_thn` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_bulan_tahun`
--

INSERT INTO `tb_bulan_tahun` (`id`, `bulan`, `tahun`, `bln_thn`) VALUES
(1, 'Jan', 2020, '01-2020'),
(2, 'Feb', 2020, '02-2020'),
(3, 'Mar', 2020, '03-2020'),
(4, 'Apr', 2020, '04-2020'),
(5, 'Mei', 2020, '05-2020'),
(6, 'Jun', 2020, '06-2020'),
(7, 'Jul', 2020, '07-2020'),
(8, 'Agu', 2020, '08-2020'),
(9, 'Sep', 2020, '09-2020'),
(10, 'Okt', 2020, '10-2020'),
(11, 'Nov', 2020, '11-2020'),
(12, 'Des', 2020, '12-2020'),
(13, 'Jan', 2021, '01-2021'),
(14, 'Feb', 2021, '02-2021'),
(15, 'Mar', 2021, '03-2021'),
(16, 'Apr', 2021, '04-2021'),
(17, 'Mei', 2021, '05-2021'),
(18, 'Jun', 2021, '06-2021'),
(19, 'Jul', 2021, '07-2021'),
(20, 'Agu', 2021, '08-2021'),
(21, 'Sep', 2021, '09-2021'),
(22, 'Okt', 2021, '10-2021'),
(23, 'Nov', 2021, '11-2021'),
(24, 'Des', 2021, '12-2021'),
(25, 'Jan', 2022, '01-2022'),
(26, 'Feb', 2022, '02-2022'),
(27, 'Mar', 2022, '03-2022'),
(28, 'Apr', 2022, '04-2022'),
(29, 'Mei', 2022, '05-2022'),
(30, 'Jun', 2022, '06-2022'),
(31, 'Jul', 2022, '07-2022'),
(32, 'Agu', 2022, '08-2022'),
(33, 'Sep', 2022, '09-2022'),
(34, 'Okt', 2022, '10-2022'),
(35, 'Nov', 2022, '11-2022'),
(36, 'Des', 2022, '12-2022'),
(37, 'Jan', 2023, '01-2023'),
(38, 'Feb', 2023, '02-2023'),
(39, 'Mar', 2023, '03-2023'),
(40, 'Apr', 2023, '04-2023'),
(41, 'Mei', 2023, '05-2023'),
(42, 'Jun', 2023, '06-2023'),
(43, 'Jul', 2023, '07-2023'),
(44, 'Agu', 2023, '08-2023'),
(45, 'Sep', 2023, '09-2023'),
(46, 'Okt', 2023, '10-2023'),
(47, 'Nov', 2023, '11-2023'),
(48, 'Des', 2023, '12-2023'),
(49, 'Jan', 2024, '01-2024'),
(50, 'Feb', 2024, '02-2024'),
(51, 'Mar', 2024, '03-2024'),
(52, 'Apr', 2024, '04-2024'),
(53, 'Mei', 2024, '05-2024'),
(54, 'Jun', 2024, '06-2024'),
(55, 'Jul', 2024, '07-2024'),
(56, 'Agu', 2024, '08-2024'),
(57, 'Sep', 2024, '09-2024'),
(58, 'Okt', 2024, '10-2024'),
(59, 'Nov', 2024, '11-2024'),
(60, 'Des', 2024, '12-2024'),
(61, 'Jan', 2025, '01-2025'),
(62, 'Feb', 2025, '02-2025'),
(63, 'Mar', 2025, '03-2025'),
(64, 'Apr', 2025, '04-2025'),
(65, 'Mei', 2025, '05-2025'),
(66, 'Jun', 2025, '06-2025'),
(67, 'Jul', 2025, '07-2025'),
(68, 'Agu', 2025, '08-2025'),
(69, 'Sep', 2025, '09-2025'),
(70, 'Okt', 2025, '10-2025'),
(71, 'Nov', 2025, '11-2025'),
(72, 'Des', 2025, '12-2025'),
(73, 'Jan', 2026, '01-2026'),
(74, 'Feb', 2026, '02-2026'),
(75, 'Mar', 2026, '03-2026'),
(76, 'Apr', 2026, '04-2026'),
(77, 'Mei', 2026, '05-2026'),
(78, 'Jun', 2026, '06-2026'),
(79, 'Jul', 2026, '07-2026'),
(80, 'Agu', 2026, '08-2026'),
(81, 'Sep', 2026, '09-2026'),
(82, 'Okt', 2026, '10-2026'),
(83, 'Nov', 2026, '11-2026'),
(84, 'Des', 2026, '12-2026'),
(85, 'Jan', 2027, '01-2027'),
(86, 'Feb', 2027, '02-2027'),
(87, 'Mar', 2027, '03-2027'),
(88, 'Apr', 2027, '04-2027'),
(89, 'Mei', 2027, '05-2027'),
(90, 'Jun', 2027, '06-2027'),
(91, 'Jul', 2027, '07-2027'),
(92, 'Agu', 2027, '08-2027'),
(93, 'Sep', 2027, '09-2027'),
(94, 'Okt', 2027, '10-2027'),
(95, 'Nov', 2027, '11-2027'),
(96, 'Des', 2027, '12-2027'),
(97, 'Jan', 2028, '01-2028'),
(98, 'Feb', 2028, '02-2028'),
(99, 'Mar', 2028, '03-2028'),
(100, 'Apr', 2028, '04-2028'),
(101, 'Mei', 2028, '05-2028'),
(102, 'Jun', 2028, '06-2028'),
(103, 'Jul', 2028, '07-2028'),
(104, 'Agu', 2028, '08-2028'),
(105, 'Sep', 2028, '09-2028'),
(106, 'Okt', 2028, '10-2028'),
(107, 'Nov', 2028, '11-2028'),
(108, 'Des', 2028, '12-2028'),
(109, 'Jan', 2029, '01-2029'),
(110, 'Feb', 2029, '02-2029'),
(111, 'Mar', 2029, '03-2029'),
(112, 'Apr', 2029, '04-2029'),
(113, 'Mei', 2029, '05-2029'),
(114, 'Jun', 2029, '06-2029'),
(115, 'Jul', 2029, '07-2029'),
(116, 'Agu', 2029, '08-2029'),
(117, 'Sep', 2029, '09-2029'),
(118, 'Okt', 2029, '10-2029'),
(119, 'Nov', 2029, '11-2029'),
(120, 'Des', 2029, '12-2029'),
(121, 'Jan', 2030, '01-2030'),
(122, 'Feb', 2030, '02-2030'),
(123, 'Mar', 2030, '03-2030'),
(124, 'Apr', 2030, '04-2030'),
(125, 'Mei', 2030, '05-2030'),
(126, 'Jun', 2030, '06-2030'),
(127, 'Jul', 2030, '07-2030'),
(128, 'Agu', 2030, '08-2030'),
(129, 'Sep', 2030, '09-2030'),
(130, 'Okt', 2030, '10-2030'),
(131, 'Nov', 2030, '11-2030'),
(132, 'Des', 2030, '12-2030');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_item`
--

CREATE TABLE `tb_item` (
  `id` int(11) UNSIGNED NOT NULL,
  `barcode` varchar(50) NOT NULL,
  `nama_item` varchar(100) NOT NULL,
  `id_kategori` int(11) UNSIGNED NOT NULL,
  `id_unit` int(11) UNSIGNED NOT NULL,
  `id_pemasok` int(11) UNSIGNED NOT NULL,
  `harga` int(11) UNSIGNED NOT NULL,
  `stok` int(11) UNSIGNED NOT NULL,
  `gambar` varchar(100) NOT NULL DEFAULT 'gambar.jpg',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_item`
--

INSERT INTO `tb_item` (`id`, `barcode`, `nama_item`, `id_kategori`, `id_unit`, `id_pemasok`, `harga`, `stok`, `gambar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'A0001', 'Ular Tangga', 3, 3, 2, 15000, 40, '1745682815_7f1e87e28b6c3b4a234e.png', '2021-10-12 18:32:35', '2025-05-03 22:22:01', '0000-00-00 00:00:00'),
(2, 'A0002', 'Egrang Bathok', 4, 19, 2, 30000, 51, '1745735851_4df1baa353caf3f740d1.png', '2021-10-19 22:33:38', '2025-04-27 13:37:31', '0000-00-00 00:00:00'),
(3, 'A0003', 'Gasing Bambu', 2, 1, 1, 16000, 59, '1745736084_fe40c7f8b2ff701b1748.png', '2021-10-19 22:33:55', '2025-05-03 22:22:01', '0000-00-00 00:00:00'),
(4, 'A0004', 'Yoyo', 2, 1, 1, 12000, 43, '1745736219_8523336ca73196bdba48.png', '2021-10-19 22:34:42', '2025-04-29 12:08:08', '0000-00-00 00:00:00'),
(5, 'A0005', 'Kelereng', 4, 1, 1, 30000, 40, '1745736411_cd37d73e8a6a2aece0f9.png', '2021-10-20 21:26:17', '2025-05-03 21:20:15', '0000-00-00 00:00:00'),
(6, 'A0006', 'Kapal Otok-Otok', 7, 1, 1, 10000, 35, '1745736576_74ef779afe126b8958e1.png', '2021-10-20 22:31:17', '2025-04-27 13:49:36', '0000-00-00 00:00:00'),
(7, 'A0007', 'Congklak', 3, 3, 3, 20000, 15, '1745736776_df056bba4ecf920833a6.png', '2022-01-21 18:57:34', '2025-05-03 22:18:29', '0000-00-00 00:00:00'),
(8, 'A0008', 'Egrang Bambu', 4, 1, 2, 25000, 5, '1745737067_7c5ec7adbb25fe8e54e7.png', '2025-04-27 13:55:13', '2025-04-27 13:57:47', '0000-00-00 00:00:00'),
(9, 'A0009', 'Ketapel Kayu', 5, 1, 3, 11000, 7, '1745737342_3bb7da5f2c0351d79f76.png', '2025-04-27 14:02:22', '2025-05-03 11:16:59', '0000-00-00 00:00:00'),
(10, 'A0010', 'Wayang Kulit', 6, 1, 1, 110000, 97, '1745737612_f4afcefdb63fc4a4e667.png', '2025-04-27 14:06:52', '2025-05-03 21:14:41', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kategori`
--

CREATE TABLE `tb_kategori` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_kategori`
--

INSERT INTO `tb_kategori` (`id`, `nama_kategori`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Tidak Berkategori', '2021-10-12 18:31:03', '2021-10-12 18:31:03', '0000-00-00 00:00:00'),
(2, 'Mainan Putar Tradisional', '2021-10-12 18:31:07', '2025-04-27 00:59:54', '0000-00-00 00:00:00'),
(3, 'Permainan Papan Tradisional', '2021-10-19 21:55:08', '2025-04-27 01:00:46', '0000-00-00 00:00:00'),
(4, 'Permainan Fisik Tradisional', '2021-10-20 21:25:19', '2025-04-27 01:01:40', '0000-00-00 00:00:00'),
(5, 'Mainan Senjata Tradisional', '2022-05-02 21:51:21', '2025-04-27 01:02:11', '0000-00-00 00:00:00'),
(6, 'Boneka Dan Miniatur Tradisional', '2022-05-02 22:06:02', '2025-04-27 01:02:39', '0000-00-00 00:00:00'),
(7, 'Mainan Kreatif Tradisional', '2025-04-26 22:54:59', '2025-04-27 01:03:09', '0000-00-00 00:00:00'),
(8, 'Mainan Musik Tradisional', '2025-04-27 01:05:08', '2025-04-27 01:05:08', '0000-00-00 00:00:00'),
(9, 'Mainan Role Play Tradisional', '2025-04-27 01:05:18', '2025-04-27 01:09:32', '0000-00-00 00:00:00'),
(10, 'Mainan Elektronik Dan RC', '2025-04-27 01:06:30', '2025-04-27 01:06:30', '0000-00-00 00:00:00'),
(11, 'Mainan Konstruksi', '2025-04-27 01:06:55', '2025-04-27 01:06:55', '0000-00-00 00:00:00'),
(12, 'Mainan Karakter Dan Koleksi', '2025-04-27 01:07:26', '2025-04-27 01:07:26', '0000-00-00 00:00:00'),
(13, 'Mainan Edukasi', '2025-04-27 01:07:39', '2025-04-27 01:07:39', '0000-00-00 00:00:00'),
(14, 'Permainan Luar Ruangan Modern', '2025-04-27 01:08:29', '2025-04-27 01:08:29', '0000-00-00 00:00:00'),
(15, 'Mainan Role Play Modern', '2025-04-27 01:09:56', '2025-04-27 01:09:56', '0000-00-00 00:00:00'),
(16, 'Mainan Edukasi Elektronik', '2025-04-27 01:10:17', '2025-04-27 01:10:17', '0000-00-00 00:00:00'),
(17, 'Mainan Seni Dan Kerajinan', '2025-04-27 01:10:38', '2025-04-27 01:10:38', '0000-00-00 00:00:00'),
(18, 'Mainan Musik Elektronik', '2025-04-27 01:10:59', '2025-04-27 01:10:59', '0000-00-00 00:00:00'),
(19, 'Mainan Air', '2025-04-27 01:11:17', '2025-04-27 01:11:17', '0000-00-00 00:00:00'),
(20, 'Mainan Kendaraan Modern', '2025-04-27 01:11:43', '2025-04-27 01:12:59', '0000-00-00 00:00:00'),
(21, 'Mainan Kreatif Modern', '2025-04-27 01:13:46', '2025-04-27 01:13:46', '0000-00-00 00:00:00'),
(22, 'Mainan Pesta', '2025-04-27 01:14:10', '2025-04-27 01:14:10', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pelanggan`
--

CREATE TABLE `tb_pelanggan` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama_pelanggan` varchar(100) NOT NULL,
  `jenkel` varchar(1) NOT NULL,
  `telp_pelanggan` varchar(20) NOT NULL,
  `alamat_pelanggan` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_pelanggan`
--

INSERT INTO `tb_pelanggan` (`id`, `nama_pelanggan`, `jenkel`, `telp_pelanggan`, `alamat_pelanggan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Umum', '', '-', '-', '2021-10-12 00:00:00', '2022-05-02 21:52:31', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pemasok`
--

CREATE TABLE `tb_pemasok` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama_pemasok` varchar(100) NOT NULL,
  `telp_pemasok` varchar(20) NOT NULL,
  `alamat_pemasok` varchar(100) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_pemasok`
--

INSERT INTO `tb_pemasok` (`id`, `nama_pemasok`, `telp_pemasok`, `alamat_pemasok`, `keterangan`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'PT Planet Mainan Indonesia', '082323343434', 'Jl. Pergudangan Suri Mulia Blok OO 20-22, Asem Rowo, Kec. Asem Rowo, Surabaya, Jawa Timur 60182', 'Diskon Terbaik', '2021-10-19 20:44:45', '2025-04-21 18:22:16', '0000-00-00 00:00:00'),
(2, 'Produsen Playmate Sidoarjo', '081282008082', 'Perum Pesona Permata Ungu,Jl Merak Blok I No. 16, Tempel, Kec. Krian, Kabupaten Sidoarjo, Jawa Timur', 'Produsen Mainan Edukatif Termurah dan Kualitas Ter', '2021-10-19 21:17:05', '2025-04-21 18:20:55', '0000-00-00 00:00:00'),
(3, 'PT Bintang Inovasi Nusantara', '085749213099', ' Jl. Margomuylo 44 (Komplek Suri Mulia) Blok D-13, Surabaya, Jawa Timur 60183', 'Distributor Mainan Terlengkap dan Termurah', '2021-10-20 21:24:37', '2025-04-21 18:19:34', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pengaturan`
--

CREATE TABLE `tb_pengaturan` (
  `id` int(11) NOT NULL,
  `nama_toko` varchar(20) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `alamat` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tb_pengaturan`
--

INSERT INTO `tb_pengaturan` (`id`, `nama_toko`, `no_telp`, `alamat`) VALUES
(1, 'Toko Mainan Cahaya', '082334343435', 'Jl. Blauran Surabaya Pusat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_penjualan`
--

CREATE TABLE `tb_penjualan` (
  `id` int(11) UNSIGNED NOT NULL,
  `invoice` varchar(50) NOT NULL,
  `id_pelanggan` int(11) UNSIGNED NOT NULL,
  `total_harga` int(11) UNSIGNED NOT NULL,
  `diskon` int(11) UNSIGNED NOT NULL,
  `total_akhir` int(11) UNSIGNED NOT NULL,
  `tunai` int(11) UNSIGNED NOT NULL,
  `kembalian` int(11) UNSIGNED NOT NULL,
  `catatan` text NOT NULL,
  `tanggal` date NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_penjualan`
--

INSERT INTO `tb_penjualan` (`id`, `invoice`, `id_pelanggan`, `total_harga`, `diskon`, `total_akhir`, `tunai`, `kembalian`, `catatan`, `tanggal`, `id_user`, `ip_address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'INV2504220001', 1, 20000, 5, 19000, 20000, 1000, 'Thank you', '2025-04-22', 2, '::1', '2025-04-22 11:01:04', '2025-04-22 11:01:04', '0000-00-00 00:00:00'),
(3, 'INV2504290001', 1, 68000, 0, 68000, 70000, 2000, 'Thankyou!', '2025-04-29', 1, '::1', '2025-04-29 12:08:08', '2025-04-29 12:08:08', '0000-00-00 00:00:00'),
(4, 'INV2505010001', 1, 44000, 0, 44000, 50000, 6000, 'Terima kasih', '2025-05-01', 1, '::1', '2025-05-01 13:13:41', '2025-05-01 13:13:41', '0000-00-00 00:00:00'),
(5, 'INV2505030001', 1, 246000, 5, 233700, 300000, 66300, 'Jangan lupa datang kembali!:)', '2025-05-03', 1, '::1', '2025-05-03 11:16:59', '2025-05-03 11:16:59', '0000-00-00 00:00:00'),
(6, 'INV2505030002', 1, 330000, 0, 330000, 350000, 0, 'Happy Shop', '2025-05-03', 1, '::1', '2025-05-03 21:14:41', '2025-05-03 21:14:41', '0000-00-00 00:00:00'),
(7, 'INV2505030003', 1, 150000, 0, 150000, 160000, 10000, 'coba', '2025-05-03', 1, '::1', '2025-05-03 21:20:15', '2025-05-03 21:20:15', '0000-00-00 00:00:00'),
(8, 'INV2505030004', 1, 100000, 5, 95000, 100000, 5000, 'coba', '2025-05-03', 2, '::1', '2025-05-03 22:18:29', '2025-05-03 22:18:29', '0000-00-00 00:00:00'),
(9, 'INV2505030005', 1, 62000, 0, 62000, 65000, 3000, '-', '2025-05-03', 3, '::1', '2025-05-03 22:22:01', '2025-05-03 22:22:01', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_roles`
--

CREATE TABLE `tb_roles` (
  `id` int(11) NOT NULL,
  `keterangan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_roles`
--

INSERT INTO `tb_roles` (`id`, `keterangan`) VALUES
(1, 'Super Admin'),
(2, 'Administrator'),
(3, 'Kasir');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_stok`
--

CREATE TABLE `tb_stok` (
  `id_stok` int(11) UNSIGNED NOT NULL,
  `tipe` enum('masuk','keluar') DEFAULT NULL,
  `id_item` int(11) UNSIGNED NOT NULL,
  `id_pemasok` int(11) UNSIGNED NOT NULL,
  `jumlah` int(11) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `id_user` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_stok`
--

INSERT INTO `tb_stok` (`id_stok`, `tipe`, `id_item`, `id_pemasok`, `jumlah`, `keterangan`, `id_user`, `ip_address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'masuk', 1, 2, 50, 'belanja', 1, '::1', '2022-05-02 22:09:31', '2022-05-02 22:09:31', '0000-00-00 00:00:00'),
(2, 'masuk', 6, 1, 30, 'belanja', 1, '::1', '2022-05-02 22:09:47', '2022-05-02 22:09:47', '0000-00-00 00:00:00'),
(3, 'masuk', 7, 3, 20, 'belanja', 1, '::1', '2022-05-02 22:10:06', '2022-05-02 22:10:06', '0000-00-00 00:00:00'),
(4, 'keluar', 5, 1, 5, 'rusak', 1, '::1', '2022-05-02 22:10:42', '2022-05-02 22:10:42', '0000-00-00 00:00:00'),
(5, 'masuk', 4, 1, 30, '-', 1, '::1', '2025-04-27 14:10:25', '2025-04-27 14:10:25', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_transaksi`
--

CREATE TABLE `tb_transaksi` (
  `id_transaksi` int(11) UNSIGNED NOT NULL,
  `id_penjualan` int(11) UNSIGNED NOT NULL,
  `id_item` int(11) UNSIGNED NOT NULL,
  `harga_item` int(11) UNSIGNED NOT NULL,
  `jumlah_item` int(11) UNSIGNED NOT NULL,
  `diskon_item` int(11) UNSIGNED NOT NULL,
  `subtotal` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_transaksi`
--

INSERT INTO `tb_transaksi` (`id_transaksi`, `id_penjualan`, `id_item`, `harga_item`, `jumlah_item`, `diskon_item`, `subtotal`, `ip_address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 2, 3, 20000, 1, 0, 20000, '::1', '2025-04-22 11:01:04', '2025-04-22 11:01:04', '0000-00-00 00:00:00'),
(4, 3, 3, 16000, 2, 0, 32000, '::1', '2025-04-29 12:08:08', '2025-04-29 12:08:08', '0000-00-00 00:00:00'),
(5, 3, 4, 12000, 3, 0, 36000, '::1', '2025-04-29 12:08:08', '2025-04-29 12:08:08', '0000-00-00 00:00:00'),
(6, 4, 9, 11000, 4, 0, 44000, '::1', '2025-05-01 13:13:41', '2025-05-01 13:13:41', '0000-00-00 00:00:00'),
(7, 5, 3, 16000, 3, 0, 48000, '::1', '2025-05-03 11:16:59', '2025-05-03 11:16:59', '0000-00-00 00:00:00'),
(8, 5, 9, 11000, 1, 0, 198000, '::1', '2025-05-03 11:16:59', '2025-05-03 11:16:59', '0000-00-00 00:00:00'),
(9, 6, 10, 110000, 3, 0, 330000, '::1', '2025-05-03 21:14:41', '2025-05-03 21:14:41', '0000-00-00 00:00:00'),
(10, 7, 5, 30000, 5, 0, 150000, '::1', '2025-05-03 21:20:15', '2025-05-03 21:20:15', '0000-00-00 00:00:00'),
(11, 8, 7, 20000, 5, 0, 100000, '::1', '2025-05-03 22:18:29', '2025-05-03 22:18:29', '0000-00-00 00:00:00'),
(12, 9, 3, 16000, 2, 0, 32000, '::1', '2025-05-03 22:22:01', '2025-05-03 22:22:01', '0000-00-00 00:00:00'),
(13, 9, 1, 15000, 2, 0, 30000, '::1', '2025-05-03 22:22:01', '2025-05-03 22:22:01', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_unit`
--

CREATE TABLE `tb_unit` (
  `id` int(11) UNSIGNED NOT NULL,
  `nama_unit` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_unit`
--

INSERT INTO `tb_unit` (`id`, `nama_unit`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Pcs', '2021-10-12 18:31:20', '2025-04-26 23:47:58', '0000-00-00 00:00:00'),
(2, 'Lembar', '2021-10-12 18:31:25', '2025-04-26 23:48:20', '0000-00-00 00:00:00'),
(3, 'Set', '2021-10-12 18:31:29', '2025-04-26 23:48:32', '0000-00-00 00:00:00'),
(4, 'Pack', '2021-10-19 22:26:05', '2025-04-26 23:48:43', '0000-00-00 00:00:00'),
(5, 'Box', '2021-10-20 21:25:42', '2025-04-26 23:48:54', '0000-00-00 00:00:00'),
(6, 'Dus', '2022-05-02 22:06:13', '2025-04-26 23:49:11', '0000-00-00 00:00:00'),
(7, 'Kg', '2025-04-26 22:55:09', '2025-04-26 23:49:19', '0000-00-00 00:00:00'),
(8, 'Gram', '2025-04-26 23:49:33', '2025-04-26 23:49:33', '0000-00-00 00:00:00'),
(9, 'Roll', '2025-04-26 23:49:43', '2025-04-26 23:49:43', '0000-00-00 00:00:00'),
(10, 'Meter', '2025-04-26 23:49:50', '2025-04-26 23:49:50', '0000-00-00 00:00:00'),
(11, 'Bundle', '2025-04-26 23:49:59', '2025-04-26 23:49:59', '0000-00-00 00:00:00'),
(12, 'Paket', '2025-04-26 23:50:18', '2025-04-26 23:50:18', '0000-00-00 00:00:00'),
(13, 'Unit', '2025-04-26 23:50:34', '2025-04-26 23:50:34', '0000-00-00 00:00:00'),
(14, 'Botol', '2025-04-26 23:50:53', '2025-04-26 23:50:53', '0000-00-00 00:00:00'),
(15, 'Kaleng', '2025-04-26 23:51:01', '2025-04-26 23:51:01', '0000-00-00 00:00:00'),
(16, 'Kotak', '2025-04-26 23:51:08', '2025-04-26 23:51:08', '0000-00-00 00:00:00'),
(17, 'Tabung', '2025-04-26 23:51:15', '2025-04-26 23:51:15', '0000-00-00 00:00:00'),
(18, 'Tube', '2025-04-26 23:51:26', '2025-04-26 23:51:26', '0000-00-00 00:00:00'),
(19, 'Pasang', '2025-04-26 23:51:40', '2025-04-26 23:51:40', '0000-00-00 00:00:00'),
(20, 'Keping', '2025-04-26 23:51:54', '2025-04-26 23:51:54', '0000-00-00 00:00:00'),
(21, 'Carik', '2025-04-26 23:52:07', '2025-04-26 23:52:07', '0000-00-00 00:00:00'),
(22, 'Slop', '2025-04-26 23:52:15', '2025-04-26 23:52:15', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_users`
--

CREATE TABLE `tb_users` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `id_role` int(11) NOT NULL,
  `avatar` varchar(255) NOT NULL DEFAULT 'avatar.jpg',
  `status` int(1) NOT NULL DEFAULT 0,
  `token` varchar(255) DEFAULT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tb_users`
--

INSERT INTO `tb_users` (`id`, `email`, `username`, `password`, `nama`, `alamat`, `id_role`, `avatar`, `status`, `token`, `ip_address`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'superadmin1@gmail.com', 'superadmin', '$2y$10$9klb/fFRUOFuxduO0HpgieZIHy8Znc5wWhJwS7oc/DAaZUk5ofE.y', 'Super Admin', 'Surabaya Pusat', 1, '1737353736_cfe46c950b5d290e591d.jpg', 1, '7b9abf00d73a783b2f1559517823fd60331f9b0ae065f68b732be0a364ab7347', '0.0.0.0', '2021-10-12 18:29:41', '2025-05-03 22:10:36', NULL),
(2, 'vannvaniarzy@gmail.com', 'admin', '$2y$10$uqsIuhBTp8yzblVpGloPPuNHtydjfJqJDev1UhYx.jGAP2Rd7wh0G', 'Admin Vania', 'Jl. Simorejo Sari A', 2, '1737427617_96d6ce76c61661ae4519.png', 1, 'bdbc976f1212965d03dcce1fecbcc811d3c817b7efd1aa61c090b5d7913b895f', '0.0.0.0', '2021-10-12 18:29:41', '2025-05-03 22:19:54', NULL),
(3, 'jihanadisti@gmail.com', 'kasir', '$2y$10$eZidcQdtAZYnAqnfsaOvHeDZGSPG9p6XvyOl3t3jAWmk8UlpA5xmG', 'Kasir Jihan', 'Jl. Asemrowo 2', 3, '1737427175_e1d360bee18dfe89b94a.png', 1, '2250b9ff18cadc6236b9d7134e2d5aa35203d263cf9d34521f66b97a6ae06be6', '0.0.0.0', '2021-10-12 18:29:41', '2025-05-03 22:21:08', NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_bulan_tahun`
--
ALTER TABLE `tb_bulan_tahun`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_item`
--
ALTER TABLE `tb_item`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `barcode` (`barcode`),
  ADD KEY `tb_item_id_unit_foreign` (`id_unit`),
  ADD KEY `id_kategori_id_unit` (`id_kategori`,`id_unit`),
  ADD KEY `id_pemasok` (`id_pemasok`);

--
-- Indeks untuk tabel `tb_kategori`
--
ALTER TABLE `tb_kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_pemasok`
--
ALTER TABLE `tb_pemasok`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_pengaturan`
--
ALTER TABLE `tb_pengaturan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tb_penjualan_id_user_foreign` (`id_user`),
  ADD KEY `id_pelanggan_id_user` (`id_pelanggan`,`id_user`);

--
-- Indeks untuk tabel `tb_roles`
--
ALTER TABLE `tb_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_stok`
--
ALTER TABLE `tb_stok`
  ADD PRIMARY KEY (`id_stok`),
  ADD KEY `tb_stok_id_pemasok_foreign` (`id_pemasok`),
  ADD KEY `tb_stok_id_user_foreign` (`id_user`),
  ADD KEY `id_item_id_pemasok_id_user` (`id_item`,`id_pemasok`,`id_user`);

--
-- Indeks untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `tb_transaksi_id_item_foreign` (`id_item`),
  ADD KEY `id_penjualan_id_item` (`id_penjualan`,`id_item`);

--
-- Indeks untuk tabel `tb_unit`
--
ALTER TABLE `tb_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_users`
--
ALTER TABLE `tb_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_username` (`email`,`username`),
  ADD KEY `id_role` (`id_role`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_bulan_tahun`
--
ALTER TABLE `tb_bulan_tahun`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT untuk tabel `tb_item`
--
ALTER TABLE `tb_item`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `tb_kategori`
--
ALTER TABLE `tb_kategori`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `tb_pelanggan`
--
ALTER TABLE `tb_pelanggan`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `tb_pemasok`
--
ALTER TABLE `tb_pemasok`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tb_pengaturan`
--
ALTER TABLE `tb_pengaturan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tb_roles`
--
ALTER TABLE `tb_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `tb_stok`
--
ALTER TABLE `tb_stok`
  MODIFY `id_stok` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  MODIFY `id_transaksi` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `tb_unit`
--
ALTER TABLE `tb_unit`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `tb_users`
--
ALTER TABLE `tb_users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_item`
--
ALTER TABLE `tb_item`
  ADD CONSTRAINT `tb_item_id_kategori_foreign` FOREIGN KEY (`id_kategori`) REFERENCES `tb_kategori` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_item_id_pemasok_foreign` FOREIGN KEY (`id_pemasok`) REFERENCES `tb_pemasok` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_item_id_unit_foreign` FOREIGN KEY (`id_unit`) REFERENCES `tb_unit` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_penjualan`
--
ALTER TABLE `tb_penjualan`
  ADD CONSTRAINT `tb_penjualan_id_pelanggan_foreign` FOREIGN KEY (`id_pelanggan`) REFERENCES `tb_pelanggan` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_penjualan_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `tb_users` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_stok`
--
ALTER TABLE `tb_stok`
  ADD CONSTRAINT `tb_stok_id_item_foreign` FOREIGN KEY (`id_item`) REFERENCES `tb_item` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_stok_id_pemasok_foreign` FOREIGN KEY (`id_pemasok`) REFERENCES `tb_pemasok` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_stok_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `tb_users` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_transaksi`
--
ALTER TABLE `tb_transaksi`
  ADD CONSTRAINT `tb_transaksi_id_item_foreign` FOREIGN KEY (`id_item`) REFERENCES `tb_item` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_transaksi_id_penjualan_foreign` FOREIGN KEY (`id_penjualan`) REFERENCES `tb_penjualan` (`id`) ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_users`
--
ALTER TABLE `tb_users`
  ADD CONSTRAINT `tb_users_id_role_foreign` FOREIGN KEY (`id_role`) REFERENCES `tb_roles` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
